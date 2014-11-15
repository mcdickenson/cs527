function [w1, u] = gauss(sigma)
  h = ceil(2.5 * sigma);
  u = [-h:h];
  w1 = exp(- (u.^2) / (2*sigma^2) );
  w1 = (w1/sum(w1))';
end