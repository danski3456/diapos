---
title: Predicción de la demanda 
date: 2 de Agosto 2021
---


## Introduction

* El problema de predicción en series temporales es clasico.
* Generalemente se resuelve con métodos especializados.
* Fuerte componente estadística que garantiza cotas.
* Nuevos métodos puramente basados en ML pueden alcanzar mejores resultados.


## Examplo: Predecir Ocupación en Parking


```{.python .cb.run jupyter_kernel=python3}
%matplotlib inline
import datetime
import matplotlib.pyplot as plt # basic plotting library
import pandas as pd # ~ SQL
import numpy as np # Vectors
import xgboost as xgb # Model
import seaborn as sns 
from matplotlib.dates import DateFormatter, DayLocator
from sklearn.metrics import mean_absolute_error 
```

### Un subconjunto de los datos 

```{.python .cb.run}
dates = pd.date_range(start='2021-04-01', end='2021-04-14', freq='D')
df = pd.DataFrame(dates, columns=["Fecha"]).set_index("Fecha")
df["Ocupación"] = np.tile([0.1, 0.4, 0.6, 0.4], 10)[:dates.shape[0]]
df["Nevo?"] = False
days_with_snow = ['2021-04-02', '2021-04-04', '2021-04-07', '2021-04-12']
df.loc[days_with_snow, "Nevo?"] = True
df.loc[days_with_snow, "Ocupación"] += 0.4

print(df.head().to_html())
```


### Visualización como serie temporal

```{.python .cb.run}
fig, ax = plt.subplots(figsize=(16, 8))
for i, row in df.iterrows():
  marker = "*" if row["Nevo?"] else "o"
  color = "b" if row["Nevo?"] else "g"
  label = "Snow" if row["Nevo?"] else "No Snow"
  ax.scatter(row.name, row["Ocupación"], marker=marker, s=200, color=color, label=label)
ax.plot(df.index, df["Ocupación"], c="k")
ax.set_xlabel("Fecha")
ax.set_ylabel("Ocupación")
ax.axvline(x=datetime.datetime(2021, 4, 10, 12, 0, 0), c='r', label="Divisón entre train y test")

handles, labels = fig.gca().get_legend_handles_labels()
by_label = dict(zip(labels, handles))
ax.legend(by_label.values(), by_label.keys())


ax.xaxis.set_major_locator(DayLocator(interval=1))
date_form = DateFormatter("%a, %d %b")
ax.xaxis.set_major_formatter(date_form)
ax.tick_params(axis='x', labelrotation=30)
```

## De serie temporal a dato tabular 

### Como podemos codificar una fecha?

::: columns
:::: column

```table
Fecha,Encoding A,Encoding B
25 de Agosto 16:05, 0, 0
25 de Agosto 16:11, 1, 6
26 de Agosto 16:06, 2, 86401
```

::::
:::: column

* Encoding A: fechas diferentes a números diferentes.
* Encoding B: calculamos frecuencia mínima.
    * La fecha más antigua tiene valor 0
    * Fechas siguientes tienen valor $(f_i - f_0) * \text{freq}$
* Ambas no calculan particularidades de la fecha. 

::::
:::

### Separando la fecha en atributos

::: columns
:::: column
> 25 de Agosto 2021, 16:05
::::
:::: column
* Atributo Día: 25 ($[1, 31]$)
* Atributo Mes: 08 ($[1, 12]$)
* Atributo Año: 2021
* Atributo Hora: 16 ($[0, 23]$)
* Atributo Minuto: 05 ($[0, 59]$)
::::
:::


### Independencia de filas

```table
Día, Mes, Año, Hora, Minuto, Ocupación
25, 08, 2021, 16, 05, 0.6
23, 08, 2021, 16, 10, 0.5
30, 10, 2020, 16, 05, 0.56
```

* Algoritmos tabulares tratan filas como independientes.
* No se aprenden relaciones con el pasado.


## Lags

* Como vimos, las filas son independientes.
* El actual modelo tabular no puede relacionar datos historicos.
* Idea: agregar features con información del pasado en cada fila.
* Cuidado de no revelar información del futuro.


### Lags

::: columns
:::: column
```table
Id, Fecha, Valor
1, 2021-08-02, 5
2, 2021-08-03, 3
3, 2021-08-04, 7
4, 2021-08-05, 0
5, 2021-08-06, 1
6, 2021-08-07, 2
7, 2021-08-08, 1
8, 2021-08-09, 10
```
::::
:::: column

* La notación $L(x, s)$, denota el lag $s$ de la fila con indice $x$.
* $L(3, 2) = (1, 2021-08-02, 5)$.
* $L(7, 1) = (6, 2021-08-07, 7)$
* $L(4, -2) = (6, 2021-08-07, 7)$ (revela información del futuro!)
* Aplicar lags produce missing values que deben ser completados.

::::
:::

### Agregando lags al dataset


```table
Id, Fecha, Valor, Lag 1, Lag 3,
1, 2021-08-02, 6, x, x
2, 2021-08-03, 3, 6, x 
3, 2021-08-04, 7, 3, x
4, 2021-08-05, 0, 7, 6 
5, 2021-08-06, 1, 0, 3 
6, 2021-08-07, 2, 1, 7 
7, 2021-08-08, 1, 2, 0 
8, 2021-08-09, 10 , 1, 1 
```                   

### Extras

* Podemos agregar lags con la frecuencia que se desee.
* El lag no tiene que ser simplemente el valor historico.
* Se pueden crear "lags" basados en combinaciones de los lags anteriores.

## Codificaciones que preservan periodicidad

```table
Día, Mes, Año, Hora, Minuto, Ocupación
25, 08, 2021, 16, 05, 0.6
23, 08, 2021, 16, 10, 0.5
30, 10, 2020, 16, 05, 0.56
```

* El modelo no sabe que luego de un domingo hay un lunes.
* El modelo no sabe que luego del 31 viene el primero.

### Codificación usando funciones trigonométricas.

::: columns
:::: column
![](img/trig_circle.png){ width="50%" }
::::
:::: column
* Dividimos el circulo trigonométrico en $N$ partes iguales.
* El 0 se corresponde con $(1, 0)$
* Para un intervalo $[0, n]$ tenemos que: $k \rightarrow (\cos(\frac{k2\pi}{n}), \sin(\frac{k2\pi}{n}))$
* Por cada attributo periódico creamos dos nuevos feautres: $f_{cos}, f_{sin}$.
::::
:::

## Preguntas?
                     
                    
