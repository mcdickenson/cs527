## Homework 3
\
Matt Dickenson \
CS 527 \
Fall 2014


### Problem 1


#### (a)

**gauss.m**:

```
function [w1, u] = gauss(sigma)
  h = ceil(2.5 * sigma);
  u = [-h:h];
  w1 = exp(- (u.^2) / (2*sigma^2) );
  w1 = (w1/sum(w1))';
end
```

![`w1` versus `u` for $\sigma=3$](1a.png)


#### (b)

**dissimilarity.m**:

```
function D = dissimilarity(I, x, y, sigma)
  I = double(I);
  [w1, u] = gauss(sigma);
  h = ceil(size(u, 2)/2);
  if any((x-h) < 0)  | any((x+h) > size(I)') | any((y-h) < 0) | any((y+h) > size(I)')
    error('Coordinates given are too close to the image boundary')
  end
  w = w1 * w1';
  D = 0; 
  for i=u
    for j=u
      z = [i j]';
      D = D + (w(i+h, j+h) * (I(z + y) - I(z + x))' * (I(z + y) - I(z + x)));
    end
  end
end
```

![Meshplot of `dissimilarity` output for $i=1$](1b1.png)

![Meshplot of `dissimilarity` output for $i=2$](1b2.png)

![Meshplot of `dissimilarity` output for $i=3$](1b3.png)

#### (c)

The dissimilarity output for $i=1$ is relatively flat, especially compared to the other two plots. Given the magnitude of the values, the variation is likely due to image noise.

In the second window ($i=2$), the dissimilarity values are flat in the $d_2$ direction and $u$-shaped in the $d_1$ direction. The corresponds to an edge in the image, which is qualitatively more interesting than the flat window when $i=1$ but not as interesting as the bowl shape ($i=3$).

The third window is the most interesting of the three: although its maximum $D$ values are slightly lower than the maxima in the second window, the bowl shape is much more apparent. This tells us that points slightly away from $x$ in each direction are very different, and identifies $x$ as an interesting point in the image.



### Problem 2

#### (a)

\begin{eqnarray*}
q(x, d) &=& \frac{1}{2} {\partial Q(x, x+d) \over \partial d} \\
&=& \frac{1}{2} \Big[ {\partial Q(x, x+d) \over \partial d_1}~~~~~{\partial Q(x, x+d) \over \partial d_2}  \Big]^T \\
&=& \frac{1}{2} \Big[ 2 \sum_{z \in \mathbb{Z}^2} w(z) \{ \nabla I(z+x) \}^T d_1 ~~~~~ 2 \sum_{z \in \mathbb{Z}^2}w(z) \{ \nabla I(z+x) \}^T d_2 \Big]^T \\
&=& \Big[ \sum_{z \in \mathbb{Z}^2} w(z) \{ \nabla I(z+x) \}^T d_1 ~~~~~ \sum_{z \in \mathbb{Z}^2}w(z) \{ \nabla I(z+x) \}^T d_2 \Big]^T \\
\end{eqnarray*}

#### (b)
\begin{eqnarray*}
A(x)d &=& q(x, d) \\
A(X) d d^{-1} &=& q(x, d) d^{-1} \\
A(X) &=& q(x, d) d^{-1} \\
&=& \Big[ \sum_{z \in \mathbb{Z}^2} w(z) \{ \nabla I(z+x) \}^T d_1 ~~~~~ \sum_{z \in \mathbb{Z}^2}w(z) \{ \nabla I(z+x) \}^T d_2 \Big]^T d^{-1} \\
&=& \Big[ \sum_{z \in \mathbb{Z}^2} w(z) \{ \nabla I(z+x) \}^T  ~~~~~ \sum_{z \in \mathbb{Z}^2}w(z) \{ \nabla I(z+x) \}^T  \Big]^T \\
\end{eqnarray*}

#### (b)
\begin{eqnarray*}
A(x)d &=& q(x, d) \\
 { \partial A(x)d \over \partial d^T } &=& { \partial q(x, d) \over \partial d^T } \\
&=& [({\partial q_1 \over \partial d_1 }~~~~~{\partial q_2 \over \partial d_1})^T ({\partial q_1 \over \partial d_2 }~~~~~{\partial q_2 \over \partial d_2})^T ]^T \\
&=& \frac{1}{2} H
\end{eqnarray*}


### Problem 3

#### (a)

**smallEigenvalue.m**:

```
function lambdaMin = smallEigenvalue(I, sigma)
  g = grad(I);
  w1 = gauss(sigma);
  a = g{1}.^2;
  b = g{2}.^2;
  d = g{1} .* g{2};
  p = conv2(w1, w1, a);
  q = conv2(w1, w1, b);
  r = conv2(w1, w1, d);
  lambdaMin = p + q - ((p - q).^2 + 4 * r.^2).^0.5;
end
```

The image produced by running this function on `shadow.jpg` is shown below.

![Interesting windows in `shadow.jpg` identified by `smallEigenvalue`](3a.png)


#### (b)

The interesting windows in `shadow.jpg` correspond to high values of `lambdaMin` in the image above. Many of the interesting windows identified above corresponed to the joints of the marionette in `shadow.jpg`. Looking at the original image, these are areas with noticeable light-dark differences in both the horizontal and vertical directions.

The shadow of the marionette does not contain interesting windows (as identified by this algorithm), likely because the shadow has much more gradual color changes and the joints are less identifiable. A few other minor interesting windows appear where the base of the lamp overlaps the edge of the paper and where the background behind the strings suspending the marionette transitions from dark (table) to light (paper).