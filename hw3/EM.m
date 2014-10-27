function [lambda, M, Sigma, R] = EM(Z, M, sigma2)
  [d, I] = size(Z);
  K = size(M, 2);
  
  % Initialize uninformative prior
  lambda = repmat(1/K, K, 1);
  Sigma = zeros(d, d, K);
  for k=1:K
    Sigma(:, :, k) = sigma2(k)*eye(d);
  end
  R = zeros(K, I);
  
  % initialize f(theta) values for iteration
  f_p = intmax;
  f_c = f_p - 1;
    
  while f_p > f_c + sqrt(eps)
    % E-step
    for k=1:K
      R(k, :) = lambda(k) * mvnpdf(Z', M(:, k)', Sigma(:, :, k));
    end
    R = R ./ (ones(K, 1) * sum(R));
    
    % M-step
    for k=1:K
      lambda(k) = mean(R(k, :));
      r_d = ones(d, 1) *R(k, :);
      M(:, k) = sum( r_d .* Z, 2 )  / sum(R(k, :));
      diff = Z - (M(:, k) * ones(1, I));
      Sigma(:, :, k) = ((r_d .* diff) * diff') / sum(R(k, :));
    end
    
    f_p = f_c;
    f_c = -sum(log(sum(R, 2)));
  end
end