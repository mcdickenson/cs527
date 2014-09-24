function D = distances(L)
  [l, d] = size(L.M);
  D = zeros(l);
  for i = 1:l
    for j = 1:l
      s = diag( L.S(j, :) );
      D(i, j) = mahal( L.M(i, :), L.M(j, :),  s) ;
    end
  end
end

function m = mahal(mu1, mu2, s2)
  m = sqrt( sum(( (mu1-mu2).^2 ) / s2 ));
end