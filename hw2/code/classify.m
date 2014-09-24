function label = classify(img, likelihood, prior)
  compressed = code(img);
  n = size(compressed, 2);
  d = size(likelihood.M, 2);
  post = zeros(d, n);
  for i=1:d
    [v, delta] = normalValue(compressed, likelihood.M(:, i), likelihood.S(:, i));
    post(i, :) = v * prior(i);
  end
  label = zeros(1, n);
  for j=1:n
    col = post(:, j);
    argmax = find( col == max(col));
    label(j) = argmax-1;
  end
end