function Pygx = bayes(Pxgy, Py)
  [nrow, ncol] = size(Pxgy)
  
  % check validity
  if ~(isProbability(Py) & isProbability(Pxgy/ncol))
      error('Input must be a valid probability matrix')
  end
  
  numer = Pxgy * diag(Py)
  denom = Pxgy * transpose(Py)
  Pygx = numer ./ (denom * ones(1, ncol))
    
  Pygx(isnan(Pygx)) = 1/ncol; % replace NaNs from divide-by-zero
end