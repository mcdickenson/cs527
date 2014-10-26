function [M, R] = kmeans(Z, M)
  % dim(Z) = d x I
  % dim(M) = d x K
  % dim(R) = K x I
  
  % initialize f(S) values for iteration
  f_p = intmax;
  f_c = f_p - 1;
  iters = 0
    
  while f_p > f_c + sqrt(eps)
    iters = iters + 1
    R = closest_cluster(Z, M);
    M = (Z * transpose(R)) ./ (transpose(sum(R, 2) * ones(1, 2)));
    f_p = f_c;
    f_c = sum(sum(dists(Z, M) .* R, 1), 2);
  end
end

function [assignments] = closest_cluster(Z, mu)
  % partition the points in Z by their closest mean
  K = size(mu, 2);
  all_dists = dists(Z, mu);
  min_dists = ones(K, 1) * min(all_dists, [], 1);
  assignments = all_dists == min_dists;
end

function [all_dists] = dists(Z, mu)
  % compute distance of each point in Z from each centroid
  K = size(mu, 2);
  I = size(Z, 2);
  all_dists = zeros(K, I);
  for k=1:K
    means = mu(:, k) * ones(1, I);
    dists = sqrt(sum((Z - means).^2, 1));
    all_dists( k , :) = dists;
  end
end

