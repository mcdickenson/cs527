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

pxa = pXa(x)
pxn = integrate(P, [], dy)

subplot(1,2,1)
h1 = stairs(pxn)
xlabel('X')
ylabel('p(x)')
title('Numerical Calculation')
subplot(1,2,2)
h2 = stairs(pxa)
xlabel('X')
ylabel('p(x)')
title('Analytical Calculation')

% b
sqrt(mean((pxn - pxa).^2))

% c

% x = linspace(-0.1, 2.1, 201);
% y = linspace(0, 1, 101);
% P = pXYa(x, y)
% dy = 0.01
% pxn = integrate(P, [], dy)

[nrows, ncols] = size(P)
pygxn = P ./ (ones(nrows, 1) * pxn) 
pygxn(isnan(pygxn)) = 0
contour(x, y, pygxn, 20, 'Color', 'k')
xlabel('x')
ylabel('y')
title('Conditional Distribution p(y|x)')

% d
pxya = P

pxn = integrate(pxya, [], dy)
pyn = integrate(pxya, dx)
pxy_indep = pyn * pxn

ppygx = pxy_indep ./ (ones(nrows, 1) * pxn)
ppygx(isnan(ppygx)) = 0
contour(x, y, ppygx, 20, 'Color', 'k')
xlabel('x')
ylabel('y')
title('Conditional Distribution p(y|x) When Independent')



% Problem 2

% make sure working directory is properly set to /hw2/code
[train, test] = readMNISTDatabase('../data');

% a
cimg = code(train.image);

% b
[~, k] = unique(train.label);
rimg = code(cimg, size(train.image));

for i = 1:10
  subplot(10,2,(i*2-1))
  img = train.image(:, :, k(i))
  image(uint8(255) - img)
  colormap('gray')
  subplot(10,2,(i*2))
  img = rimg(:, :, k(i));
  image(uint8(255) - img)
  colormap('gray')
end

subplot(1, 2, 1)
plot

% c
[like, pri] = normalModel(cimg, train.label)