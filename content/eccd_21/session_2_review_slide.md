---
title: Repaso ML y herramientas
date: 1 Agosto, 2021	
---

##  Supervised Learning

* Let $x^i \in \mathbb{R}^N$ and $y^i \in \mathbb{R}$
* $\mathcal{D} = (x^i, y^i)_{i=0, \dots, M-1}$ defines our dataset
* $f\colon \mathbb{R}^N \times \mathbb{R}^P \to \mathbb{R}$ predicts $y$ from $x$ with params $p$
* $\hat{y^i} = f(x^i, p)$
* Loss function $\mathcal{L}(y^i, \hat{y^i})$
* $$
\min_{p} \mathcal{L}(f(x^i, p), y^i)
$$

### Example

```table
x_0, x_1, y
0, 1,  2
2, 2,  4
4, 3,  6
```
* $N = 2, M=3$
* $f(x) = ax_0 + bx_1 + c$, $p = (a, b, c)$, $P = 3$
* $\mathcal{L} = \frac{1}{2}\sum_{i=0}^{2} (\hat{y^i} - y^i)^2$

## Inputs to an ML algorithm

* In most cases have to be real numbers
* Depending on the algorithm, we need to take care of different hyptotheis

### Normalization

* If algorithm is based on a notion of distance: LR, SVM, NN
* We need to normalize all inputs
* Failing to do so, is amist of giving more importance to a feature.
* Noralization types: Standard Scaling, MaxMinScaling, etc.
* Regression trees don't care about distance: only order.

### Ordinal order

* Some features have an implicit order: "bad, average, good"
* They will have to be transformed as numbers.
* Preserving their order is important:
	* bad=2, average=0, good=1
	* bad = 0, average = 1, good = 2

### Categories without order

* Consider types of cloth: shirt, pants, sweater
* Enconding as numbers asumes implicit order:
	* shirt = 0, pants = 1, sweater = 2
* Option 1: One-Hot Encoding transform into three new features.
	* $x_{shirt} = 1, x_{pants} = 1, x_{swaater} = 1$
* Option 2: Target encoding
	* shirt = 42.1, pants = -3, sweater = 26

### Periodic Data

* Similar to Ordinal Data
* Monday = 0, Tuesday = 1, ..., Sunday = 6
* Difference Monday - Tueday != Monday - Sunday
* Circle encoding fixes this problem (more in next class)


## Training and Scoring

### Basic Approach

* Split dataset in two: one for training and one for testing
* Usually 80% / 20%
* Prone to overfitting

### Slightly more advanced

* Split dataset into three: training, validation, test.
* Usually 80% / 10% 10%
* Use training for training and validation for assesing performance.
* Select hypterparamters based on validation dataset.
* Fit train + validation on best parameters and evaluate on test at the end.

### Best practice

* Split into train and test.
* Usually 80% / 20%
* Split train dataset in $X=3, 5, 10$ and perform cross-validaton.
	* Train on $X-1$ splits and validate on the remaining one.
	* Average score across all splits.
	* Chose hypterparameters with highest average score.
* Fit train dataset with best hypterparameters and evaluate on test set.

### Observations

* Ideally, each enconder/transformation/etc should be re-trained on each split.
* They are re-trained once at the end for evaluating the test set.

## Managing code


### Desired qualities

When writing code, as with any other collaborative document we would like to:

* Have a copy in the cloud, so that progress is not lost (backup).
* Have a tool that fixes problems when people modify the same file (conflicts).
* Have a way to go back to a previous version (history).

### Git

* Small program developed by Linus Torvalds (creator of linux) in 2005.
* It is independent of the editor (TextPad, VSCode, Word, etc).
* Saves all requested changes to a remote server.
* Changes can be:
	* Added (locally)
	* Commited (creating a checkpoint)
	* Pushed (uploaded to the server)
	* Pulled (downloaded from the server)

### Github

![](../img/github.jpg)

### Github

* Github is a service that hosts git servers.
* It provides a nice interface to look at code
* It is used by almost every code developer
* Alternatives exists: gitlab, bitbucket, etc.

## API

* Once a Machine Learning model is trained, it needs to be deployed to be used.
* To deploy ML models, we often use an Application Programming Interface (API).
* An API is a program that exposes a custom URL: it might accept parameters and returns a response.

### Example API

* URL: "https://example.com/sum/"
* When called with specific parameters, it returns the sum of "a" and "b"
* We can send paramters in the url "sum/?a=10&b=5"
* We get the response: 15.

### Types of API

* APIs use HTTP / HTTPS.
* Normally, we send "GET" or "POST" message types.
* Each message contains a HEADER:
	* URL is here
	* Information about the sender (type of browser, etc)
	* Authentication information if required.
* Messages might contain a BODY:
	* For large messages, the content can be here.

### Example HTTP GET

![](../img/http_get.png)

### Example HTTP POST

![](../img/http_post_1.png)

### 

![](../img/http_post_2.png)

## Running Environment 

* A virtual machine is a "copy of a computer" running inside a computer".
* Example: running a linux computer inside a window in a Windows computer.
* It is very useful to guarantee that a program runs inside the same computer everywhere.
* Quite heavyweight to share and not very comfortable to use.

### Docker

::: columns

:::: column

* Same idea of virtual machine, but only core funcionality.
* Described using a single file, which can be shared via Github.
* Widely used, can be easily depoloyed in the cloud

::::

:::: column

```Dockerfille
FROM ubuntu:lastest

RUN pip install -y matplotlib pandas seaborn jupyter

CMD ["jupyter-notebook"]
```

::::

:::

