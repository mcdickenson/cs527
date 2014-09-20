function i = integrate(p, dx, dy)
  % Leaving both dx and dy unspecified should cause an error.
%   dx
  if nargin < 2
    error('dx and/or dy must be specified')
  end
  

  if isvector(p)
    % approximate over p by dx
    if (nargin == 3 && ~isEmpty(dy))
      error('dy is specified by p is one-dimensional')
    end
    m = size(p);
    a = p(1);
    b = p(end);
    total = (a + b)/2 + sum(p(2:end-1));
    i = dx * total;
    return
  else
    
  end
  
  
  if ~isvector(p) && (nargin == 2 || isEmpty(dy))
    [nrows, ncols] = size(p)
    size(p)
    % integrate uses the trapezoidal rule to integrate each row of p 
    % (as you would when computing a marginal distribution) 
    % to produce a column vector of results.
    
    cols = zeros(nrows, 1)
    for row=1:nrows
      cols(row, 1) = integrate(p(row, :), dx);
    end
    i = cols
    return
  end
  
  if isEmpty(dx) && ~isEmpty(dy)
    % uses the trapezoidal rule to integrate each column of p to produce a row vector of results.
  end
  
  if nargin==3 % && size(size(p))==3
    % use Fubini's thm
    % result is a single number
  end

end