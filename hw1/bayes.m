function Pygx = bayes(Pxgy, Py)
%   todo: check argument validity

  % Py should be a row vector
  Pygx = Pxgy; % default size m _x_ n
  
  [nrow, ncol] = size(Pxgy);
  for i = 1:nrow;
    for j = 1:ncol;
      numer = Pxgy(i, j) * Py(j);
      denom = Pxgy(i, :) * transpose(Py);
      if denom == 0
        Pygx(i, j) = 1 / ncol;
      else
        Pygx(i, j) = numer / denom;
      end
    end
  end
end