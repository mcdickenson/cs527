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