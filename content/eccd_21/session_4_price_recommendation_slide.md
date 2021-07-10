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

### Repaso, regressión 
