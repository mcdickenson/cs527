function p = pXa(x)

R1 = 0 <= x & x <= 2;
R2 = 1/2 < x & x <= 1;
R3 = 1 < x & x <= 2;

p = zeros(size(x));

p(R1) = 8 * x(R1) * (1 - log(2));
p(R2) = 8 * (2 * (x(R2) + 1) .* log(2 * x(R2)) - x(R2) * (5 + log(2)) + 3);
p(R3) = 8 * ((2 + log(2)) * x(R3) - (x(R3) + 2) .* log(x(R3)) ...
    + 2 * (log(2) - 2));