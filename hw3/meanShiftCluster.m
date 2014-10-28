function [U, R] = meanShiftCluster(Z, h)
  [d, I] = size(Z)
  % size(U) = d x K with K modes
  % size(R) = K x I matrix of cluster memberships
  
  M = zeros(d, I);   
  for i=1:I
    i
    M(:, i) = meanShiftFaster(Z(:, i), Z, h);
  end

  U = nearUniqueCols(M, h/100);
  K = size(U, 2);
  K
  R = zeros(K, I);
  for k=1:K
    for i=1:I
%       R(k, i) = (all(M(:, i) == U(:, k)));
      if euclid(M(:, i) - U(:, k)) < h/100
        R(k, i) = 1;
      else
        R(k, i) = 0;
      end
    end
  end
end

function [z, zh] = meanShiftFaster(zstart, Z, h)
  idx = rangesearch(zstart', Z', h/100);
  keep = cellfun(@isempty, idx);
  Z = Z(:, keep);
  [d, I] = size(Z);
  z_prime = zstart;
  zh = z_prime;
  terminate = false;
  while ~terminate
    z = z_prime;
    numer = zeros(d, I);
    for i=1:I
      numer(:, i) = Z(:, i) * kernel(z-Z(:, i), h);
    end
    z_prime = sum(numer, 2) ./ sum(numer ./ Z, 2);
    zh = [zh'; z_prime']';
    terminate = mynorm(z-z_prime) <= h/1000;
  end
end

function [d] = mynorm(x)
  d = sqrt(sum(x.^2));
end

function [k] = kernel(x, h)
  k = exp(-((mynorm(x)/h)^2));
end

function [u] = nearUniqueCols(mx, tau)
  keep = mx(:, 1);
  for j=2:size(mx, 2)
    col = mx(:, j);
    keep = unique(keep, col, tau);
  end
  u = keep;
end

function [u] = unique(mx, x, tau)
  for l=1:size(mx,2)
    col = mx( :, l);
    dist = euclid(col-x);
    if dist < tau
      u = mx;
      return
    end
  end
  u = [mx'; x']';
end

function [d] = euclid(x)
  d = sqrt(sum(x.^2));
end

