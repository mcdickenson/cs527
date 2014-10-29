function [z, zh] = meanShift(zstart, Z, h)
  [d, I] = size(Z);
  z_prime = zstart;
  zh = z_prime;
  terminate = false;
  while ~terminate
    z = z_prime;
    diff = z * ones(1, I) - Z;
    norms = sqrt(sum(diff .^ 2, 1));
    kernel = exp(-((norms/h).^2)) ;
    z_prime = (Z * kernel') ./ sum(kernel, 2);
    zh = [zh'; z_prime']';
    terminate = sqrt(sum((z-z_prime) .^ 2, 1)) <= h/1000;
  end
end

