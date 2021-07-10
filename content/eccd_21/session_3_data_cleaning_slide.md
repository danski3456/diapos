---
title: Dealing with real datasets
date: 2nd August 2021
---

## How real datasets are born

::: columns
:::: column

* Fill a form
* Form is ambiguous
* Form allows for free-text input
* Originally intented only for humans.
* Possible confusions:
	* Lastname includes one or two lastnames?
	* If no phone, cellphone in phone cell? (Is mandatory)
	* Are we complaining about personnel? a specific product?
::::
:::: column

![](../img/devoto_form.png)

::::
:::

### Form cont.

Imagine what we need to work with someone's full name.

* Ana María Gonzales (2 names, 1 lastname)
* Lincoln Lincoln Smith (1 name, 2 lastnames)
* Dwayne "The Rock" Johnson (1 name, 1 nickname, 1 lastname)
* Dr. Md. Golam Mostafa Khan (1 or 2 titles?, 1 or 2 names?)
* **Explicit is better than implicit**

### UI/UX validation

In a sucucessfull project:

* We help the client understand how to clean their data
* We provide them with tools to sanitize their database
* We help them improve their data input system
* We iterate until the workflow reaches a desirable state.

## Basic string cleaning techniques

Consider the following **DIFFERENT** strings:

* "Hello World!"
* "hello world"
* "Hello world"
* "  hello World "

### Strip and lowercase

```python
>>> s = "  hello World "
>>> print(s)
  hello World
>>> s.strip()
'hello World'
>>> s.strip().lower()
'hello world'
```

### Splitting by character

A very powerful feature is to split a string in a given character

```python
>>> s  = "green - red - orange - black"
>>> s
'green - red - orange - black'
>>> s.split("-")
['green ', ' red ', ' orange ', ' black']
>>> [x.strip() for x in s.split("-")]
['green', 'red', 'orange', 'black']
```

### Switching characters

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

## Regular Expressions

* Very powerful tool for pattern matching in text
* RE can be tricky, and often cause more problems than they produce.
* Nice tool to have at your disposal.

### Regex Basics in Python

```python
>>> import re
>>> s = "En en el mundo hay 123111943, mi cel es 091321456,
el de mi sis 095012012 y ayer fue 04/05/2032"
>>> reg = re.compile("(09\d{7})")
>>> reg.findall(s)
['091321456', '095012012']
```

### Getting a single cellphone carrier numbers

```python
>>> import re
>>> s = "En en el mundo hay 123111943, mi cel es 091321456, 
el de mi sis 095012012 y ayer fue 04/05/2032"
>>> reg = re.compile("(09[4-5]\d{6})")
>>> reg.findall(s)
['095012012']
```

### Getting the day of a date

```python
>>> import re
>>> s
'En en el mundo hay 123111943, mi cel es 091321456,
el de mi sis 095012012 y ayer fue 04/05/2032'
>>> reg = re.compile("(\d{1,2})/\d{1,2}/\d{4}")
>>> reg.findall(s)
['04']
```

## Distance between strings

* We know of distance between vectors: $d([0, 1], [2, 3]) = \sqrt{8}$
* We also define distance between strings: Levenshtein or edit.
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


### Example

The distance between  `kitten` and `sitting` is 3.

* **K**itten -> **S**itten (changing k for s)
* Sitten -> Sitten**g** (inserting g at the end)
* Sitt**e**ng -> Sitt**i**ng (changing e for i)

### Possible application

We need to `LabelEncode` the following strings:

* "red aple"
* "apple, shiny"
* "ecuatorian banana"
* "ripe anana"
* "green apple"

### 

* We would like to group them by fruit before encoding.
* Some fruits are misspelled and have additional adjectives
* Idea: apply a clustering mechanisms with a good metrics (not euclidean)
* Edit distance might work, might have a hard time with `banana/anana`
* Maybe edit distance on each token?


## OpenRefine

* Data cleaning is never easy
* Even in python can get cumbersome fast
* Depending on the application, using a specific tool might help
* OpenRefine helps with that problem
* DEMO
