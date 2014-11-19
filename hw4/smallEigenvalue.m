function lambdaMin = smallEigenvalue(I, sigma)
  g = grad(I);
  w1 = gauss(sigma);
  a = g{1}.^2;
  b = g{2}.^2;
  d = g{1} .* g{2};
  p = conv2(w1, w1, a);
  q = conv2(w1, w1, b);
  r = conv2(w1, w1, d);
  lambdaMin = p + q - ((p - q).^2 + 4 * r.^2).^0.5;
end