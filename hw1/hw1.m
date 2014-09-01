
% isProbability
x = [0 1; 1 0]
isProbability(x)

isProbability([0 -0.2; 0.7 0.5])

isProbability([1 2 1; 3 0 1] / 8)

%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 6 

% marginals
P = [0 0.2 0.3; 0 0.4 0.1]
[Px,  Py] = marginals(P)

% conditionals
[Pxgy, Pygx] = conditionals(P)

Pxgy = [0.5 0.3333 0.75; 0.5 0.6667 0.25]
Pygx = [0 0.4 0.6; 0 0.8 0.2]

% bayes
bayes(Pxgy, Py) % this works (=Py)

transpose(bayes(transpose(Pygx), transpose(Px))) % this works too

%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 7

load hw1

% a 
pc = 58299 / (1024 ^ 2)
pb = 1 - pc

% b
h1 = stairs(pxgb)
hold on
h2 = stairs(pxgc, 'r')
hold off
leg1 = legend([h1 h2], 'p(x | b)', 'p(x | c)', 'Location', 'NorthEast')
xlabel('Pixel value')
ylabel('Conditional probability')


% c
Pxgy = transpose([transpose(pxgb); transpose(pxgc)])
Py = [pb pc];
Pygx = bayes(Pxgy, Py)

y1 = stairs(Pygx(:, 1))
stairs(Pygx(:, 2))

h1 = stairs(Pygx(:, 1))
hold on
h2 = stairs(Pygx(:, 2), 'r')
hold off
leg1 = legend([h1 h2], 'p(b | x)', 'p(c | x)', 'Location', 'NorthEast')
xlabel('Pixel value')
ylabel('Conditional probability')

% f
img = imread('/Users/mcdickenson/github/cs527/hw1/yeast.png');
pcgx = Pygx(:, 2);

% supplied code:
tau = 0.5;
bayesCell = pcgx(img) > tau;
imagesc(bayesCell)
colormap gray
axis image
axis off

bayesCell
