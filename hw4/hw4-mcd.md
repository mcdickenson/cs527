## Homework 3
\
Matt Dickenson \
CS 527 \
Fall 2014

### Problem 1


#### (a)





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