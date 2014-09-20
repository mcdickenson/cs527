function p = pXYa(x, y)

[X, Y] = meshgrid(x, y);

B = 8 * Y ./ (2 - Y);
AX = B .* X ./ (2 - Y);

Ynz = (0 <= Y) & (Y <= 1);
R1 = (0 <= X) & (X <= (2 - Y) / 2) & Ynz;
R2 = ((2 - Y) / 2 < X) & (X <= (2 - Y)) & Ynz;

p = zeros(size(X));
p(R1) = AX(R1);
p(R2) = B(R2) - AX(R2);