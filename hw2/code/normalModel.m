function [likelihood, prior] = normalModel(X, L)
  X = double(X);
  [d, n] = size(X)
  labels = unique(L);
  l = size(labels, 2)
  m = zeros(d, l);
  s = zeros(d, l);
  prior = zeros(l, 1);
  size(prior)
  for i=1:l
    x = X(:, L==labels(i));
    k = size(x, 2);
    m(:, i) = mean(transpose(x));
    s(:, i) = std(transpose(x)).^2; % sum((x - (m(:, l) * ones(l, k)))^2)/k
    prior(i, :) = k/n
  end
  prior
  likelihood = struct('M', m, 'S', s)
end