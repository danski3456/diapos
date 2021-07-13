---
title: Price Recommendation
date: 2 de Agosto 2021
---


## Introduction


* Definir el precio de objectos es fundamental en muchas industrias
* Muchas veces el precio es una variable compleja de determinar.
* No siempre podemos contar con un MSRP (Manufacturer's Suggested Retail Price).

### Examplo: Bienes raices

```{=html}
<div class="mermaid">
graph LR
   A(Metros cuadrados) --> B(Precio Final Casa $)
   C(Barrio) --> B
   D(Año de construcción) --> B
   E(Calidad) --> B
   F(Oferta y Demanda) --> B
</div>
```

## Automatización vs Recomendación


::: columns
:::: column

**Automatización**

* Objectivo: remover al humano del loop. 
* El precio es aprendible y la escala es muy grande. 
* Potencial de ahorro muy grande.

::::
:::: column

**Recomendación**

* El precio es una variable dificil de determinar
* Un humano va a estar a cargo, pero necesita sugerencias.
* Estas sugerencias no deberían ser una caja negra

::::
:::

## Explicabilidad

Hay varias herramientas que podemos usar para mejorar la explicabilidad de una predicción

* Podemos retornar un intervalo de confianza
* Podemos retornar elementos similares y sus respectivos precios.
* Podemos dar información sobre como nuestro modelo uso las distintas variables.

### Ejemplo

::: columns
:::: column

```table
Variable, Valor
Cuartos, 4
Barrio, Centro
Calidad, Buena
Area, 100m2
Demanda, Alta
```

::::
:::: column

* El precio predicho es: 100k
* El rango possible es en realidad: [80k, 110k]
* Otra casa de 90m2 en el mismo barrio cuesta: 95k
* Las variables que más influyeron en orden son: 
    - Barrio
    - Demanda
    - Cuartos
    - Area
    - Calida

::::
:::

## Regresión por quantiles

### Repaso: quantiles (muestra par)

```txt
3, 6, 7, 8, 8, 10, 13, 15, 16, 20
```


* Ordenamos todos los datos para calcular el quantil $q \in [0,1]$
* $q = 0.25$: $q * 10 = 2.5$, redondeamos a 3. Entonces $Q_{.25} = 7$
* $q = 0.5$ (mediana): $q * 10 = 5$, $Q_{.5} = \frac{8 + 10}{2} = 9$
* $q = 0.75$: $q * 10 = 7.5$, redondeamos a 8. $Q_{.75} = 15$



### Repaso: quantiles (muestra impar)


```txt
3, 6, 7, 8, 8, 9, 10, 13, 15, 16, 20
```

* Ordenamos todos los datos para calcular el quantil $q \in [0,1]$
* $q = 0.25$: $q * 11 = 2.75$, redondeamos a 3. Entonces $Q_{.25} = 7$
* $q = 0.5$ (mediana): $q * 11 = 5.5$, redondeamos a 6. $Q_{.5} = 9$
* $q = 0.75$: $q * 11 = 8.25$, redondeamos a 9. $Q_{.75} = 15$


### Repaso: regressión 

::: columns
:::: column

$$ MSE = \min_u \sum_{i=1}^{N \times K} (y_i - u)^2 $$

::::
:::: column

* Métrica de error por defecto
* Usada en la regresión lineal.
* El mínimo $u^* = \frac 1 N \sum y_i$
* Concluimos que es un estimador del promedio.

::::
:::

### Otras métricas: MAE

::: columns
:::: column

$$ MAE = \min_u \sum_{i=1}^{N} | y_i - u | $$

::::
:::: column

* También comunmente usada ya que es robusta a outliers
* Es robusta ya que no tiene terminos al cuadrado.
* El mínimo $u^*$ es la mediana de los $y_i$.

::::
:::

### Más métricas: Pinball

::: columns
:::: column
$$ PINBALL_{\tau} = \min_u \sum_{i=1}^{N \times K} \varrho_{\tau}(y_i - u) $$
$$ \varrho_{\tau}(z) = z \times (\tau - \mathbb{1}_{\{ y < 0 \}}) $$
::::
:::: column

* Métrica menos conocida
* Depende del $\tau \in [0, 1]$
* El mínimo $u^*$ coincide con el quantil $\tau$ de $y_i$.

::::
:::

### Ejemplo de tres métricas

![](../img/quantile_regression_metrics.png){ width="40%" height="10%" }

### Ejemplpo de regresión por quantiles

La idea es simple: usar pinball como objectivo a minimizar.

* Tomamos 100 valores para cada entero en $\{0, 1, \dots, 10\}$
* Para cada $x_i$ generamos $y_i \sim x \times \mathcal{U}[0.5, 1.5]$
* Asumimos un modelo linear: $y_i = ax_i + b$
* Tenemos que encontrar $a, b$ para minimizar la métrica pinball 70.

### Resultados

::: columns
:::: column
![](../img/regression_lines.png){ width="70%" height="40%" }
::::
:::: column
![](../img/quantile_hist_70.png){ width="90%" height="70%" }
::::
:::

### Conclusión

* Podemos cambiar la función objectivo para aprender los quantiles y no el promedio.
* Si resolvemos el problema 3 veces, por ejemplo con quantiles: 0.1, 0.5, y 0.9.
* Para cada clase en nuestro dataset podemos obtener una predicción ($Q_{0.5}) y un rango: $[Q_{0.1}, Q_{0.9}]$.


## Shapley Value


