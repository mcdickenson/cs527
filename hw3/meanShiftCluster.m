function [U, R] = meanShiftCluster(Z, h)
  [d, I] = size(Z);
  M = zeros(d, I);   
  for i=1:I
    zstart = Z(:, i);
    idx = rangesearch(zstart', Z', h/100);
    keep = cellfun(@isempty, idx);
    tmpZ = Z(:, keep);
    [d, I] = size(tmpZ);
    z_prime = zstart;
    terminate = false;
    while ~terminate
      z = z_prime;
      diff = z * ones(1, I) - tmpZ;
      norms = sqrt(sum(diff .^ 2, 1));
      kernel = exp(-((norms/h).^2));
      z_prime = (tmpZ * kernel') ./ sum(kernel, 2);
      terminate = sqrt(sum((z-z_prime) .^ 2, 1)) <= h/1000;
    end
    M(:, i) = z;
  end

  U = nearUniqueCols(M, h/100);
  K = size(U, 2);
  R = false(K, I);
  for k=1:K
    for i=1:I
      if sqrt(sum((M(:, i) - U(:, k)).^2)) < h/100
        R(k, i) = 1;
      else
        R(k, i) = 0;
      end
    end
  end
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
    dist = sqrt(sum((col-x).^2));
    if dist < tau
      u = mx;
      return
    end
  end
  u = [mx'; x']';
end

