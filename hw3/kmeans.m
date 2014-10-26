function [M, R] = kmeans(Z, M)
  % dim(Z) = d x I
  % dim(M) = d x K
  % dim(R) = K x I
  % R(k, i) = true if z_i \in S_k
  K = size(M, 2)
  I = size(Z, 2)
  
  % initialize the means
  mu = M
  
  % current value of f(S)
  f_p = intmax
  f_c = f_p - 1
    
  while f_p > f_c + sqrt(eps)
    R = closest_cluster(Z, M)
    M = Z * transpose(R)
%     for k=1:K
% %       want = find(assignments == k)
% %       mu( : , k) = mean(Z(: , want), 2) % result length = d 
%       mu(:, k) = 
%     end
    f_p = f_c
    f_S = sum(sum(dists(Z, M) .* R, 1), 2)
    f_c = f_S
  end
end

function [assignments] = closest_cluster(Z, mu)
%   size(all_dists)
%   size(min(all_dists, [], 2))
  K = size(mu, 2)
  all_dists = dists(Z, mu)
  min_dists = ones(K, 1) * min(all_dists, [], 1)
  assignments = all_dists == min_dists
end

function [all_dists] = dists(Z, mu)
  K = size(mu, 2)
  I = size(Z, 2)
  all_dists = zeros(K, I)
  for k=1:K
    means = mu(:, k) * ones(1, I)
    dists = euclid(means, Z)
    all_dists( k , :) = dists
  end
end

function [dists] = euclid(means, Z)
  diff = Z - means
  dists = sqrt(sum(diff.^2, 1))
end


