% compute two conditional probability distributions from a joint
% probability distribution
function [Pxgy, Pygx] = conditionals(P)
  [Px, Py] = marginals(P);
  Pxgy = conditional(P, Py);
  Pygx = transpose(conditional(transpose(P), transpose(Px)));
end

function Pxgy = conditional(Pxy, Py)
  [nrows, ncols] = size(Pxy);
  Pxgy = Pxy ./ (ones(nrows, 1) * Py);
  Pxgy(isnan(Pxgy)) = 1/nrows; % replace NAs (from dividing by zero)
end