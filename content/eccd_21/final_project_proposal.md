---
title: Descripción del Proyecto
date: 4 de Agosto, 2021
---

## Resumen

* Un supermercado quiere mejorar la experiencia de sus clientes.
* Actualmente los clientes pesan su propia fruta y verdura.
* Clientes se han quejado de que cuesta encontrar el item correcto en la lista.
* Objetivo: instalar una cámara que reconozca automáticamente el producto.

## Objetivo

* Entrenar un modelo que prediga la categoría de una fruta o verdura a partir de fotos.
* El modelo va a usarse para automáticamente asignar el precio al item, sin chequeo por parte del usuario.

## Restricciones

* Para mejorar la experiencia de usuario, no va a haber chequeos manuales de la etiqueta.
* Es importante poder calcular que tan seguido el modelo le va a errar.

## Algunas preocupaciones del cliente

* Si la etiqueta es correcta, la consumidora va a estar satisfecha.
* Si la etiqueta es incorrecta:
    * Y el producto es más caro: la consumidora se va a quejar de que le estamos robando.
    * Y el producto es más barato: la consumidora estará contenta, pero el cliente pierde dinero.


## Tarea

* Entrenar un modelo para clasificar fruta y verdura usando el dataset que vamos a proporcionar.
* Usar la tabla de costos (a continuación) para calcular el costo/riesgo para el cliente en función de la accuracy del modelo entrenado.
* Sugerir posibles pasos a seguir en función de los resultados encontrados.
* No se espera que el modelo sea super preciso, sino que el énfasis va a estar en el end-to-end de la propuesta.
* La tarea es en grupos de 4 a 5 estudiantes.

### Resultado del proyecto

* Código usando para la implementación en Github.
* "Pitch" de 10 minutos (slides + presentación) donde se describe:
    * Generalidades de la implementación (para un público no técnico).
    * Accuracy del modelo y costos asociados en función de la tabla de costos (ver abajo).
    * Posibles mejoras y pasos a seguir.
* Fecha de entrega a definir. Posiblemente solo entrega de video, pero quizas presentación por Teams, a definir.


## Tablas de costos

### Costos Generales

* El costo para el cliente de cobrarle a un consumidor X en lugar de Y:
    * Si $(X >= Y)$ será $5(X - Y)$.
    * Si $(X < Y)$ será $Y - X$.

### Precio de los distintos productos por kilo

```table
Producto, Precio
Apple,74
Asparagus, 600
Aubergine, 158
Avocado, 500
Banana, 115
Cabbage, 54
Carrots, 89
Cucumber, 94
```

###

```table
Producto, Precio
Garlic, 42 ut
Ginger, 272
Juice, 150
Kiwi, 178
Leek, 50
Lemon, 52
Lime, 119
```

###

```table
Producto, Precio
Mango, 268
Melon, 109
Milk, 33
Mushroom, 1000
Nectarine, 194
Oat-Milk, 207
Oatghurt, 500
Onion, 46
```

###

```table
Producto, Precio
Orange, 35
Papaya, 700
Passion-Fruit, 1000
Peach, 194
Pear, 89
Pepper, 158
Pineapple, 400
```

###

```table
Producto, Precio
Plum, 199
Pomegranate, 700
Potato, 89
Red-Beet, 89
Red-Grapefruit, 74
Satsumas, 44 
Sour-Cream, 300
```

### 

```table
Producto, Precio
Soy-Milk, 190
Soyghurt, 300
Tomato, 109
Yoghurt, 67
Zucchini, 145
```

## Dynamic Pricing Competition

### Alguien quiere crédito extra?

![](img/dpc.png){ width="800px" }
[Link](https://dynamic-pricing-competition.com)
