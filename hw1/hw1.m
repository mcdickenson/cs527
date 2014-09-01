
% isProbability
x = [0 1; 1 0]
isProbability(x)

isProbability([0 -0.2; 0.7 0.5])

isProbability([1 2 1; 3 0 1] / 8)

% marginals
P = [0 0.2 0.3; 0 0.4 0.1]
[Px,  Py] = marginals(P)

% conditionals
[Pxgy, Pygx] = conditionals(P)

Pxgy = [0.5 0.3333 0.75; 0.5 0.6667 0.25]
Pygx = [0 0.4 0.6; 0 0.8 0.2] % todo: fix isProbability or Bayes so this is valid

% bayes
bayes(Pxgy, Py) % this works (=Py)

transpose(bayes(transpose(Pygx), transpose(Px))) % this works too


