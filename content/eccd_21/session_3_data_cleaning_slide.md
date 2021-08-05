---
title: Lidiando con datasets reales 
date: 2nd August 2021
---

## Como nacen los datasets reales 

::: columns
:::: column
* Rellena un formulario
* La forma es ambigua
* El formulario permite la entrada de texto libre
* Originalmente diseñado solo para humanos.
* Posibles confusiones:
    * ¿El apellido incluye uno o dos apellidos?
    * Si no tiene teléfono, ¿celular en celular? (Es obligatorio)

::::
:::: column

![](img/devoto_form.png)

::::
:::

### Form cont.

Imagínese si tuviésemos que trabajar con el nombre completo.

* Ana María Gonzales (2 nombres, 1 apellido)
* Lincoln Lincoln Smith (1 nombre, 2 apellidos)
* Dwayne "The Rock" Johnson (1 nombre, 1 apodo, 1 apellido)
* Dr. Md. Golam Mostafa Khan (1 o 2 títulos?, 1 o 2 nombres?)
* **Explicito es mejor que implícito**

## Validación UI/UX
En un proyecto exitoso:

* Ayudamos al cliente a entender cómo limpiar sus datos.
* Les proporcionamos herramientas para desinfectar su base de datos
* Les ayudamos a mejorar su sistema de entrada de datos
* Repetimos hasta que el flujo de trabajo alcanza un estado deseable.

## Técnicas básicas de limpieza de cuerdas

Considere las siguientes cadenas **DIFERENTES**:

* "¡Hola Mundo!"
* "Hola Mundo"
* "Hola Mundo"
* "  Hola Mundo "
* "  hello World "

### Strip y minúscula 

```python
>>> s = "  hello World "
>>> print(s)
  hello World
>>> s.strip()
'hello World'
>>> s.strip().lower()
'hello world'
```

### Separando por carácter

Una herramienta muy poderosa es poder dividir un string en un carácter.

```python
>>> s  = "green - red - orange - black"
>>> s
'green - red - orange - black'
>>> s.split("-")
['green ', ' red ', ' orange ', ' black']
>>> [x.strip() for x in s.split("-")]
['green', 'red', 'orange', 'black']
```

### Remplazando caracteres 

```python
>>> s = "10,005.32"
'10,005.32'
>>> s.replace(",", "x")
'10x005.32'
>>> s.replace(",", "x").replace(".", ",")
'10x005,32'
>>> s.replace(",", "x").replace(".", ",").replace("x", ".")
'10.005,32'
```

## Expresiones Regulares 

* Herramienta muy poderosa para hacer coincidir patrones en texto
* RE puede ser complicado y, a menudo, causa más problemas de los que produce.
* Buena herramienta para tener a tu disposición.


### Expresiones regulares básicas en Python 

```python
>>> import re
>>> s = "En en el mundo hay 123111943, mi cel es 091321456,
el de mi sis 095012012 y ayer fue 04/05/2032"
>>> reg = re.compile("(09\d{7})")
>>> reg.findall(s)
['091321456', '095012012']
```

### Obtener los teléfonos de un solo proveedor 

```python
>>> import re
>>> s = "En en el mundo hay 123111943, mi cel es 091321456, 
el de mi sis 095012012 y ayer fue 04/05/2032"
>>> reg = re.compile("(09[4-5]\d{6})")
>>> reg.findall(s)
['095012012']
```

### Obtener el día de una fecha 

```python
>>> import re
>>> s
'En en el mundo hay 123111943, mi cel es 091321456,
el de mi sis 095012012 y ayer fue 04/05/2032'
>>> reg = re.compile("(\d{1,2})/\d{1,2}/\d{4}")
>>> reg.findall(s)
['04']
```

## Distancia entre strings 

* Sabemos la distancia entre vectores: $d([0, 1], [2, 3]) = \sqrt{8}$
* También podemos definir distancia entre strings: Levenshtein o edición.
$$
\displaystyle \qquad \operatorname {lev} (a,b)={
\begin{cases}|a|&{\text{ if }}|b|=0,\\
|b|&{\text{ if }}|a|=0, \\
\operatorname {lev} (\operatorname {tail} (a),\operatorname {tail} (b))&{\text{ if }}a[0]=b[0]\\
1+\min {\begin{cases}
    \operatorname {lev} (\operatorname {tail} (a),b)\\
    \operatorname {lev} (a,\operatorname {tail} (b))\\
    \operatorname {lev} (\operatorname {tail} (a),\operatorname {tail} (b))\\
    \end{cases}}&{\text{ otherwise.}}
\end{cases}}
$$


### Ejemplo

Ejemplo de distancia entre `kitten` y `sitting` es 3.

* **K**itten -> **S**itten (cambiando k por s)
* Sitten -> Sitten**g** (insertando g al final)
* Sitt**e**ng -> Sitt**i**ng (cambiando e por i)

### Posible aplicación

Tenemos que `LabelEncode` los siguientes strings:

* "red aple"
* "apple, shiny"
* "ecuatorian banana"
* "ripe anana"
* "green apple"

### 

* Nos gustaría agruparlos por fruta antes de codificar.
* Algunas frutas están mal escritas y tienen adjetivos adicionales
* Idea: aplicar un mecanismo de agrupamiento con una buena métrica (no euclidiana)
* Distancia Levenshtein podría funcionar, pero podría tener dificultades con `banana / anana`


## OpenRefine

* La limpieza de datos nunca es fácil
* Incluso en Python puede volverse engorroso rápidamente
* Dependiendo de la aplicación, el uso de una herramienta específica puede ayudar
* OpenRefine ayuda con ese problema
* [Link](https://openrefine.org)
