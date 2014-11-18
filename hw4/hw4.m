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
disp1 = zeros(size(R, 2), size(R, 2))
disp2 = zeros(size(R, 2), size(R, 2))
disp3 = zeros(size(R, 2), size(R, 2))
offset = ceil(size(R, 2)/2)
for d1=R
  for d2=R
    disp1(d1+offset, d2+offset) = dissimilarity(img, X(:, 1), X(:, 1)+[d1 d2]', sigma)
    disp2(d1+offset, d2+offset) = dissimilarity(img, X(:, 2), X(:, 2)+[d1 d2]', sigma);
    disp3(d1+offset, d2+offset) = dissimilarity(img, X(:, 3), X(:, 3)+[d1 d2]', sigma);
  end
end

dissimilarity(img, X(:, 1), X(:, 1), sigma)
img(1, 1)

