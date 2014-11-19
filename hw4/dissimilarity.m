function D = dissimilarity(I, x, y, sigma)
  I = double(I);
  [w1, u] = gauss(sigma);
  h = ceil(size(u, 2)/2);
  if any((x-h) < 0)  | any((x+h) > size(I)') | any((y-h) < 0) | any((y+h) > size(I)')
    error('Coordinates given are too close to the image boundary')
  end
  w = w1 * w1';
  D = 0; 
  for i=u
    for j=u
      z = [i j]';
      D = D + (w(i+h, j+h) * (I(z + y) - I(z + x))' * (I(z + y) - I(z + x)));
    end
  end
end