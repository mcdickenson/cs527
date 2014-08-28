## Homework 1
\
Matt Dickenson \
CS 527 \
Fall 2014

### Problem 1

\begin{eqnarray*}
X &\sim& Unif(0,1) \\
m &=& \mathbb{E}(X) = 0.5 \\
\mathbb{E}(|X-m|) &=& \mathbb{E}(|X-0.5|) \\
&=& -E(X_{x \leq 0.5}-0.5) + E(X_{x > 0.5}-0.5) \\
&=& -(-0.25) + 0.25 \\
&=& 0.5
\end{eqnarray*}

### Problem 2

By Bayes' Theorem, we can compute the posterior probability that coin 2 was chosen by:

\begin{eqnarray*}
P(c=2 | h=1) &=& {P(h=1 | c=2) P(c=2) \over P(h=1)} \\
&=& {P(h=1 | c=2) P(c=2)} \over {P(h=1 | c=2) P(c=2) + {P(h=1 | c=1) P(c=1)}} \\
&=& {0.8 \times 0.5} \over {0.8 \times 0.5 + 0.5 \times 0.5} \\
&=& 0.4 \over 0.65 \\
&\approx& 0.615
\end{eqnarray*}

### Problem 3

Given Equation 2.3 and the fact that $x$ and $y$ are independent, we can show that $Pr(x|y=y^*)=Pr(x)$ by:

\begin{eqnarray*}
Pr(x|y=y^*) &=& {Pr(x,y=y^*) \over \int Pr(x,y=y^**dx)} \\
&=& {Pr(x,y=y^*) \over Pr(y=y^*)} \\
&=& {Pr(x) \cdot Pr(y=y^*) } \over Pr(y=y^*) \\
&=& Pr(x)
\end{eqnarray*}

### Problem 4

The expected value of one roll of this biased die, $x$, is:

\begin{eqnarray*}
\mathbb{E}(x) &=& 1 \cdot \frac{1}{12} + 2 \cdot \frac{1}{12} 
                + 3 \cdot \frac{1}{12} + 4 \cdot \frac{1}{12} 
                + 5 \cdot \frac{1}{6} + 6 \cdot \frac{1}{12} \\
            &=& \frac{10}{12} + \frac{5}{6} + \frac{6}{2} \\
            &=& \frac{56}{12} \\
            &=& \frac{14}{3} \\
            &\approx& 4.67
\end{eqnarray*}

The expected value of the sum of two rolls is:

\begin{eqnarray*}
\mathbb{E}(2x) &=& 2 \mathbb{E}(x) \\
            &=& 2 (\frac{14}{3}) \\
            &=& \frac{28}{3} \\
            &\approx& 9.34
\end{eqnarray*}

### Problem 5

Using the relations given in Exercise 2.9, we can show that $\mathbb{E}[(x-\mu)^2] = \mathbb{E}[x^2]-E[x]E[x]$ by:

\begin{eqnarray*}
\mathbb{E}[(x-\mu)^2] &=& \mathbb{E}[x^2 - 2x \mu + \mu^2 ] \\
    &=& \mathbb{E}[x^2] - \mathbb{E}[2x \mu] + \mathbb{E}[\mu^2] \\
    &=& \mathbb{E}[x^2] - 2\mathbb{E}[x \mu] + \mathbb{E}[x]\mathbb{E}[x] \\
    &=& \mathbb{E}[x^2] - 2\mathbb{E}[x]\mathbb{E}[x] + \mathbb{E}[x]\mathbb{E}[x] \\
\mathbb{E}[(x-\mu)^2] &=& \mathbb{E}[x^2]-E[x]E[x] \\
\end{eqnarray*}
