---
title: Default Slide
date: 9th July 2021
---

## HI

```{.python .cb.run jupyter_kernel=python3}
%matplotlib inline
import numpy as np
from matplotlib import pyplot as plt
```
```{.python .cb.run}
x = np.linspace(0, 2*np.pi)
for n in range(-1, 2):
    plt.plot(x, np.sin(x + n*np.pi/4))
plt.grid()
```

## List

* One
* Two
* Three

## Two cols

::: columns

:::: column
Column 1
::::

:::: column

::::
Column 2
:::

## Good Bye!

$$ e^{x} = \int_{1}^{2} dx$$

![Uy Flag](img/uy_flag.png)
