function [z, zh] = meanShift(zstart, Z, h)
  I = size(Z, 2)
  zh = zstart
  z = zh * 100
  while mynorm(z-zh) > sqrt(eps)
    z = zh
    denom = 0
    for i=1:I
      denom = denom + kernel(z-Z(:, i), h)
    end
    zh = sum(z .* denom) / sum(denom)
  end
end

function [d] = mynorm(x)
  d = sqrt(sum(x.^2))
end

function [k] = kernel(x, h)
  k = exp(-(mynorm(x)/h)^2)
end

