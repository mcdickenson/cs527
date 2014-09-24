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


% c
[like, pri] = normalModel(cimg, train.label)

% d
[sample, slabel] = drawRandom(like, pri, [28 28 64])
for i = 1:64
  subplot(8, 8, i);
  img = sample(:, :, i);
  image(uint8(255) - img);
  text(5, 5, num2str(slabel(1, i)), 'FontSize', 20);
  colormap('gray');
end

% e
[v, delta] = normalValue(cimg, like.M(:, 1), like.S(:, 1))

% f
D = distances(like)
roundn(D, -2)
GTHTMLtable(roundn(D, -2))

% g
computedLabel = classify(test.image, like, pri)

% h
[E, errorRate, pCgT] = errorStats(computedLabel, test.label)

