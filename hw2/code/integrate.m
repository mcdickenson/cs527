function i = integrate(p, dx, dy)
  if nargin < 2
    error('dx and/or dy must be specified')
  end
  
  if isvector(p)
    if (nargin == 3 && ~isempty(dy))
      error('dy is specified but p is one-dimensional')
    end
    total = p(1) + p(end) + sum(p(2:end-1))*2;
    i = dx/2 * total;
    return
  end
  
  if ~isvector(p) && (nargin == 2 || isempty(dy))
    total = p(: , 1) + p(:, end) + sum(p(:, 1:end), 2)*2;
    i = dx/2 * total;
    return % returns a column vector
  end
  
  if isempty(dx) && ~isempty(dy)
    i = transpose(integrate(transpose(p), dy));
    return % returns a row vector
  end
  
  if nargin==3 
    % use Fubini's thm
    i = integrate( integrate(p, dx),  dy);
    return % returns a scalar
  end

end