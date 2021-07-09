---
title: Estrategias comerciales con datos
date: Julio - Agosto, 2021
---

## Docentes

### Diego Kiedanski

* Ingeniero en Comptuación, Udelar
* Doctor en Ingeniería, Institut Polytechnique de Paris
* ML Engineer - Tryolabs


## Motivación

* Tienen sentido para un pequeño negocio usar estrategias comerciales basadas en datos (ECBD)?
* Si la respuesta es sí, cuales?
* Cuál es la mejor estrategia para llevar a la práctica ECBDs?


### Motivación cont.

* El supermercado de barrio SUPERMERK2 quiere mejorar su eficiencia y abrazar la "trasformación digitial". Ya cuenta con un sistema informático que le permite acceder a todas sus ventas, pero fuera de eso, sus procesos siguen siendo manuales.

* Su mayor compentencia es la cadena de supermercados MALVADO, cuyo local se encuentra a 1 cuadra y a fuerza de volumen, puede ofrecer mejores precios.

* Hasta ahora SUPERMERK2 ha sobrevivido gracias a la comunidad de vecinos que lo rodea, pero lentamente esto está dejando de funcionar..


## Posibles areas a mejorar

### Mejorar el proceso de precificación:

* Muchos productos sin precio sugerido (el vecino deja medialunas caseras para vender)

###  Mejorar la predicción de la demanda: 

* Mejor manejo del stock
* Mejor uso del personal (?)

###  Optimización de precios:

* Para maximizar ventas: menores precios
* Para maximizar "customer lifetime value": menores precios en algunos productos
* Para maximizar profit: mayores precios en productos con demanda in elástica.

###  Mejorar la experiencia de los clientes:

* Reconocimiento automático de productos
* Sugerencias en base a compras previas.

## Consideraciones al ofrecer servicios de ML 

### Mejoras en eficiencia de un proceso

* Hay un proceso existente y es manual o semi-automático.
* El proceso tiene un costo asociado: dinero o tiempo.
* El cliente estará dispuesto a pagar no más que lo que se ahorra.
* Valor del proyecto "fácil de justificar"
* Ejemplo: asignación automática de precios 

### Creación de un nuevo servicio

* Oportunidad de aumentar la oferta de servicios
* La ganancia es potencial: nuevos clientes, posibilidades de expansión, etc.
* El objetivo es diferenciarse de la competencia
* Ejemplo: carrito inteligente que hace de caja registradora.

### Buenas prácticas

* Ante un nuevo cliente, empezar con "lowest hanging fruit"
* Validar la calidad de los datos antes de comenzar:
	* Si la calidad no es buena, considerar rechazar el proyecto.
	* Costo asociado a limpiar los datos no es menor.
* Definir métrica de evaluación:
	* Métricas técnicas son poco útiles para el cliente: AUC, RMSE, etc.
	* Mejores: cantidad de clientes en la tienda, tiempo para hacer X, etc.
	* Validar que la métrica del lado del cliente es medible.


## Cronograma: Clase 1 (31 / 07)

### Sesión 1:

* Introdución
* Cronograma
* Metodología y Evaluación

### Sesión 2:
* Repaso de herramientas
* Repaso de conceptos de ML

### Sesión 3:
* Trabajo sobre datasets "sucios"
* Demo OpenRefine

## Cronograma: Clase 2 (02 / 08)

### Sesión 4: Automatización de Precios
* Motivación (alternativas a ML)
* Descripción formal del problema
* Resolución sin ML
* XGBoost y aplicaciones
###  Sesión 5: Predicción de la demanda
* Métodos tradicionales: AR, MA, ARIMA
* Métodos para demanda esporádica
* Series univariadas como datos tabulares (extración de atributos)
* Aplicación de XGBoost al problema de demand forecasting.


## Cronograma: Clase 3 (04 / 08)


### Sesión 6: Optimización de Preciosdan
* Motivación 
* Descripción formal del problema
* Diferencias entre predicción de la demanda y precificación.
* Optimización sobre modelos de ML
* Evaluación de resultados

### Sesión 7: Presentación del Proyecto Final
* Descripción del caso de estudio.
* Explicación de la propuesta
* Creación de groups


## Cronograma: Clase 4 (07 / 08)

### Sesión 8: Clasificación de Imagenes (Parte I)

* Descripción del problema
* Arquitecturas tradicionales (CNN)
* GPUs: qué y por qué

###  Sesión 9: Clasificación de Imagenes (Parte II)
* Transferencia de Conocimiento (Transfer Learning)
* Resnets e ImageNets
* Pytorch

### Sesión 10: Cierre del curso y preguntas
* Dudas sobre proyecto final
* Dudas concretas sobre código
* Dudas concretas sobre temas presentados


## Evaluación 

* Deberes: 40% 
	* Problemas de código sobre los temas trabajados en clase
	* Tiempo hasta antes de la siguiente clase para entregarlos.
	* Individual o grupal
* Proyecto final: 60%
	* Resolución de una pre-venta usando ML
	* Código + presentación "al cliente"
	* Grupal
	* Entrega 1 semana luego de terminadas las clases.


<!-- ## Conocimentos Asumidos -->

<!-- * Cálculo y Algebra Lineal: Diferenciación, Manipulación de Matrices -->
<!-- * Conceptos básicos de optimización -->
<!-- * Conocimientos intermedios de programación en Python: pandas, matplotlib, sklearn -->
<!-- * Conceptos básicos de ML: train/test, cross validation, encodings, normalización. -->
