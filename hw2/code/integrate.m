function i = integrate(p, dx, dy)
  % Leaving both dx and dy unspecified should cause an error.
  if nargin < 2
    error('dx and/or dy must be specified')
  end
  

  if isvector(p)
    % approximate over p by dx
    if (nargin == 3 && ~isempty(dy))
      error('dy is specified but p is one-dimensional')
    end
    m = size(p);
    a = p(1);
    b = p(end);
    total = (a + b) + sum(p(2:end-1));
    i = dx * total;
    return
  else
    
  end
  
  % produces a column vector
  if ~isvector(p) && (nargin == 2 || isempty(dy))
    % todo: don't use an explicit loop
    [nrows, ncols] = size(p)
    cols = zeros(nrows, 1)
    for row=1:nrows
      cols(row, 1) = integrate(p(row, :), dx);
    end
%     cols = integrate(p(, :), repmat(dx, nrows, 1))
    i = cols
    return
  end
  
  % returns a row vector
  if isempty(dx) && ~isempty(dy)
    i = transpose(integrate(transpose(p), dy))
    return
  end
  
  % returns a scalar
  if nargin==3 % && size(size(p))==3
    % use Fubini's thm
    
    i = integrate( integrate(p, dx),  dy)
    return
  end

end