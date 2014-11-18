function D = dissimilarity(I, x, y, sigma)
  % todo: error message if x or y is too near boundary
  I = double(I);
  [w1, u] = gauss(sigma);
  h = ceil(size(u, 2)/2);
  w = w1 * w1'; % todo: see if I can do this in a linearly separable way
  D = 0; 
  for i=u % todo: vectorize
    for j=u
      z = [i j]'
      wz =  w(i+h, j+h)  
      tmp = (I(z + y) - I(z + x)).^2
      size(tmp)
      D = D + ( tmp);
    end
  end
end