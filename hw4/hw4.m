load data;

% 1a
sigma = 3
[w1, u] = gauss(sigma);

% make plot
plot(u, w1)
xlabel({'U'});
ylabel({'w1'});
title({'Output for gauss(3)'});

w = w1 * w1';
sum(sum(w))

% 1b
sigma = 3
img = imread('/Users/mcdickenson/github/cs527/hw4/shadow.jpg');
R = -4:4
zs = zeros(size(R, 2), size(R, 2))
disp1 = zs
disp2 = zs
disp3 = zs
offset = ceil(size(R, 2)/2)
for d1=R
  for d2=R
    disp1(d1+offset, d2+offset) = dissimilarity(img, X(:, 1), X(:, 1)+[d1 d2]', sigma);
    disp2(d1+offset, d2+offset) = dissimilarity(img, X(:, 2), X(:, 2)+[d1 d2]', sigma);
    disp3(d1+offset, d2+offset) = dissimilarity(img, X(:, 3), X(:, 3)+[d1 d2]', sigma);
  end
end

dissimilarity(img, X(:, 1), X(:, 1), sigma)
dissimilarity(img, X(:, 1), X(:, 2), sigma)

mesh(disp1)

figure1 = figure;
axes1 = axes('Parent',figure1);
view(axes1,[74.5 54]);
grid(axes1,'on');
hold(axes1,'all');
mesh(disp1)
xlabel({'d2'},'HorizontalAlignment','right');
ylabel({'d1'},'HorizontalAlignment','left');
title({'Dissimilarity for i=1'});

figure1 = figure;
axes1 = axes('Parent',figure1);
view(axes1,[74.5 54]);
grid(axes1,'on');
hold(axes1,'all');
mesh(disp2)
xlabel({'d2'},'HorizontalAlignment','right');
ylabel({'d1'},'HorizontalAlignment','left');
title({'Dissimilarity for i=2'});

figure1 = figure;
axes1 = axes('Parent',figure1);
view(axes1,[74.5 54]);
grid(axes1,'on');
hold(axes1,'all');
mesh(disp3)
xlabel({'d2'},'HorizontalAlignment','right');
ylabel({'d1'},'HorizontalAlignment','left');
title({'Dissimilarity for i=3'});

% 3a
lambdaMin = smallEigenvalue(img, sigma);
clf
imagesc(lambdaMin)
colormap gray
cmap = 1 - colormap;
colormap(cmap);
axis image
axis off
