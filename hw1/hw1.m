
x = [0 1; 1 0]
isProbability(x)

isProbability([0 -0.2; 0.7 0.5])

isProbability([1 2 1; 3 0 1] / 8)

P = [0 0.2 0.3; 0 0.4 0.1]
[Px,  Py] = marginals(P)