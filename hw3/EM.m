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
      mu(:, k) = sum(sum( (ones(d, 1) *R(k, :)) .* Z ) ) / sum(R(k, :))
      diff = Z - (mu(:, k) * ones(1, I))
      tmp = (ones(d, 1) *R(k, :))
% %       size(diff)
% %       size(tmp)
% %       return
%       tmp2 = sum(sum( tmp * (diff' * diff) ) / sum(R(k, :)))
%       size(tmp2)
%       size(sum(R(k, :)))
%       return
%       size(R(k, :))
%       tmp3 = sum( tmp .* (diff .^2)) / sum(R(k, :))
      s_k = 0
      for i = 1:I
        s_k = s_k + R(k, i) * (Z(:, i) - mu(:, k)) * transpose(Z(:, i) - mu(:, k))
      end
      Sigma(:, :, k) = s_k / sum(R(k, :))
    end
%     R = closest_cluster(Z, M);
%     M = (Z * transpose(R)) ./ (transpose(sum(R, 2) * ones(1, 2)));
    f_p = f_c;
    neg_log_like = -sum(log(sum(R, 2)))
    f_c = neg_log_like
  end
  M = mu
end

function [R] = E(lambda, mu, Sigma, Z)
  K = size(mu, 2)
  I = size(Z, 2)
  R = zeros(K, I)
  for k=1:K
%     for i=1:I
%       R(k, i) = lambda(k) * mvnpdf(Z(: , i), 
%     end
    R(k, :) = lambda(k) * mvnpdf(transpose(Z), transpose(mu(:, k)), Sigma(:, :, k))
  end
  R = R ./ (ones(K, 1) * sum(R))
end

% function [f] = neg_log_like(lambda, mu, Sigma, Z)
% end