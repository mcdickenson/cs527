% compute two conditional probability distributions from a joint
% probability distribution
function [Pxgy, Pygx] = conditionals(P)
  [Px, Py] = marginals(P);
  Pxgy = conditional(P, Py);
  Pygx = conditional(P, Px); % will need to transpose P I think
end

function Pxgy = conditional(Pxy, Py)
  % if any columns of y are zero
  % those columns of Pxgy should be uniform (1/nrow(P))
  
  % iterate over the rows of Pxy
  % for each row, the corresponding row of Pxgy = Pxy[i] / Py
  
  Pxgy = Pxy / Py;
  % todo: handle divide-by-zero erros
end