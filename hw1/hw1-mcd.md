## Homework 1
\
Matt Dickenson \
CS 527 \
Fall 2014

### Problem 1

### Problem 2

By Bayes' Theorem, we can compute the posterior probability that coin 2 was chosen by:

\begin{eqnarray*}
P(c=2 | h=1) &=& {P(h=1 | c=2) P(c=2) \over P(h=1)} \\
&=& {P(h=1 | c=2) P(c=2)} \over {P(h=1 | c=2) P(c=2) + {P(h=1 | c=1) P(c=1)}} \\
&=& {0.8 \times 0.5} \over {0.8 \times 0.5 + 0.5 \times 0.5} \\
&=& 0.4 \over 0.65 \\
&\approx& 0.615
\end{eqnarray*}
