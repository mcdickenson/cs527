function y = code(x, s)

persistent Dec Ctr;

if isempty(Dec)
    load decoder
    Dec = Decoder;
    Ctr = Centroid;
end

x = double(x);

if nargin < 2 || isempty(s)  % Encode
    sz = size(x);
    if ndims(x) == 3
        x = reshape(x, sz(1) * sz(2), sz(3));
    elseif ndims(x) <= 2
        x = x(:);
    else
        error('Cannot deal with arrays with more than 3 dimensions')
    end
    y = Dec' * (x - Ctr * ones(1, size(x, 2)));
else   % Decode
    y = Dec * x;
    y = y + Ctr * ones(1, size(y, 2));
    y = uint8(reshape(y, s));
end