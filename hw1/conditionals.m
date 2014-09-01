% compute two conditional probability distributions from a joint
% probability distribution
function [Pxgy, Pygx] = conditionals(P)
  [Px, Py] = marginals(P);
  Pxgy = conditional(P, Py);
  Pygx = transpose(conditional(transpose(P), Px)); % will need to transpose P I think
end

function Pxgy = conditional(Pxy, Py)
  Pxgy = Pxy; % create matrix of same size as P
  
  % iterate over the rows of Pxy
  [nrows, ncols] = size(Pxy);
  % for each row, the corresponding row of Pxgy = Pxy[i] / Py
  for i = 1:nrows;
    for j = 1:ncols;
      if Py(j) == 0 % if any columns of y are zero
        Pxgy(i, j) = 1/nrows; % that col of Pxgy should be uniform
      else
        Pxgy(i, j) = Pxy(i, j) / Py(j);
      end
    end
  end
end