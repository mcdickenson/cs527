function [lambda, M, Sigma, R] = EM(Z, M, sigma2)
  % dim(Z) = d x I
  % dim(M) = d x K
  % size(lambda) = K
  
  % size(Sigma) = d x d x K
  
  d = size(Z, 1)
  I = size(Z, 2)
  K = size(M, 2)
  
  % Initialize uninformative prior
  lambda = repmat(1/K, K, 1)
  mu = M
  Sigma = zeros(d, d, K)
  for k=1:K
    Sigma(:, :, k) = sigma2(k)*eye(d)
  end
  
  % initialize f(theta) values for iteration
  f_p = intmax;
  f_c = f_p - 1;
    
  while f_p > f_c + sqrt(eps)
    % E-step
    R = E(lambda, mu, Sigma, Z)
    
    % M-step
    for k=1:K
      lambda(k) = mean(R(k, :))
      mu(:, k) = sum( (ones(d, 1) *R(k, :)) .* Z, 2 )  / sum(R(k, :))
      diff = Z - (mu(:, k) * ones(1, I))
      Sigma(:, :, k) = (((ones(d, 1) *R(k, :)) .* diff) * diff') / sum(R(k, :))
    end
    f_p = f_c;
    f_c = -sum(log(sum(R, 2)))
  end
  M = mu
end

function [R] = E(lambda, mu, Sigma, Z)
  K = size(mu, 2)
  I = size(Z, 2)
  R = zeros(K, I)
  for k=1:K
    R(k, :) = lambda(k) * mvnpdf(transpose(Z), transpose(mu(:, k)), Sigma(:, :, k))
  end
  R = R ./ (ones(K, 1) * sum(R))
end
