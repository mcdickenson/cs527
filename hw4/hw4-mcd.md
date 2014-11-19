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
  % todo: error message if x or y is too near boundary
  I = double(I);
  [w1, u] = gauss(sigma);
  h = ceil(size(u, 2)/2);
  w = w1 * w1'; % todo: see if I can do this in a linearly separable way
  D = 0; 
  for i=u % todo: vectorize
    for j=u
      z = [i j]';
      wz =  w(i+h, j+h)  ;
      tmp = (I(z + y) - I(z + x))' * (I(z + y) - I(z + x))  ;
      D = D + ( tmp);
    end
  end
end
```

![Meshplot of `dissimilarity` output for $i=1$](1b1.png)

![Meshplot of `dissimilarity` output for $i=2$](1b2.png)

![Meshplot of `dissimilarity` output for $i=3$](1b3.png)

<!-->

InwhatwaydothethreefunctionsD(x(i),x(i)+d)differfromeachotherqualitatively? Morespecifically,thefunctionD(x,x+ d) is nonnegative and is zero for d = 0, so in some sense it is supposed to look like a bowl (a convex paraboloid) in the vicinity of d = 0. How well-defined is the bottom of the bowl in each of the three different situations? In answering this question, pay attention also to the actual values of D (the values on the vertical axis of your plots), and keep in mind that the image is noisy. Because of this, small fluctuations in the value of D are not significant.
<-->

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

The image produced by running this function on `shadow.jpg` is:

![Interesting windows in `shadow.jpg` identified by `smallEigenvalue`](3a.png)


#### (b)

The interesting windows in `shadow.jpg` correspond to high values of `lambdaMin` in the image above. Many of the interesting windows identified above corresponed to the joints of the marionette in `shadow.jpg`. Looking at the original image, these are areas with noticeable light-dark differences in both the horizontal and vertical directions.

The shadow of the marionette does not contain interesting windows (as identified by this algorithm), likely because the shadow has much more gradual color changes and the joints are less identifiable. A few other minor interesting windows appear where the base of the lamp overlaps the edge of the paper and where the background behind the strings suspending the marionette transitions from dark (table) to light (paper).