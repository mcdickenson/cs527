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
disp1 = struct('vals', { zs zs })
disp2 = struct('vals', { zs zs })
disp3 = struct('vals', { zs zs })
offset = ceil(size(R, 2)/2)
for d1=R
  for d2=R
    tmp1 = dissimilarity(img, X(:, 1), X(:, 1)+[d1 d2]', sigma);
    tmp2 = dissimilarity(img, X(:, 2), X(:, 2)+[d1 d2]', sigma);
    tmp3 = dissimilarity(img, X(:, 3), X(:, 3)+[d1 d2]', sigma);
    for i = 1:2
      disp1(i).vals(d1+offset, d2+offset) = tmp1(i);
      disp2(i).vals(d1+offset, d2+offset) = tmp2(i);
      disp3(i).vals(d1+offset, d2+offset) = tmp3(i);
    end
  end
end

dissimilarity(img, X(:, 1), X(:, 1), sigma)
dissimilarity(img, X(:, 1), X(:, 2), sigma)

img(1, 1)

