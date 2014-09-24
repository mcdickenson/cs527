function [E, errorRate, pCgT] = errorStats(computedLabel, trueLabel)
  labels = unique(computedLabel);
  n = size(computedLabel, 2);
  l = size(labels, 2);
  E = zeros(l, l);
  pCgT = zeros(l, l);
  for i=1:l
    for j=1:l
      E(i, j) = sum( (trueLabel == i-1) & (computedLabel == j-1) );
      pCgT(i, j) = sum( (computedLabel == i-1) & (trueLabel == j-1) ) / sum(trueLabel == j-1);
    end
  end
  errorRate = 1 - (sum(diag(E))/n);
end