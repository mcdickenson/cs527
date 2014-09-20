% Homework 2

% Problem 1

% a
x = linspace(-0.1, 2.1, 201);
y = linspace(0, 1, 101);
P = pXYa(x, y)

dx = 0.1
dy = 0.01

integrate(x, dx)

j = integrate(P, dx)
k = integrate(P, [], [dy])
l = integrate(P, dx, dy)