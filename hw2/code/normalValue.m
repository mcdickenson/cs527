function [v, delta]  = normalValue(X, m, s)
  [d, n] = size(X)
  mu = m * ones(1, n);
  diffsq = (X - mu).^2;
  quot = diffsq./(s * ones(1,n));
  [t1, t2] = size(quot)
  delta = sqrt(sum(quot, 1));
  Sigma = diag(s);
  v = mvnpdf(transpose(X), transpose(m), Sigma);
end