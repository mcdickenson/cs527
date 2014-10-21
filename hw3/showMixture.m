function showMixture(Z, lambda, M, Sigma, R, M0, fig, filename)

figure(fig)
clf
hold on

gray = 0.85 * [1 1 1];
black = [0 0 0];

palette = [1 0 0; 0 1 0; 0 0 1; 1 0 1; 0 1 1; 1 1 0]';
palette(:, 4:6) = palette(:, 4:6) / 2;

K = max([size(M, 2), size(M0, 2)]);

I = size(Z, 2);

side = 0.08;
x = side * ([0 1 1 0]' - 1/2);
y = side * ([0 0 1 1]' - 1/2);
X = repmat(Z(1, :), 4, 1) + repmat(x, 1, I) ;
Y = repmat(Z(2, :), 4, 1) + repmat(y, 1, I) ;
color = zeros(3, I);
for k = 1:K
    color = color + repmat(palette(:, k), 1, I) .* repmat(R(k, :), 3, 1);
end
C = zeros(I, 1, 3);
C(:, 1, :) = color';

P = patch(X, Y, 'b');
set(P, 'EdgeColor', 'none', 'FaceColor', 'flat', 'CData', C, ...
    'CDataMapping', 'direct');

if ~isempty(M0)
    plotMeans(M0, 'o', gray, black);
end

if ~isempty(M)
    for k = 1:K
        plotMeans(M(:, k), 'v', palette(:, k), black);

        % Eigen-ellipse
        [U, S, ~] = svd(Sigma(:, :, k));
        
        % Angle of major axis with the x axis
        phi = atan2(U(2, 1), U(1, 1));
        if (phi < 0)
            phi = phi + 2*pi;
        end
        
        % Ellipse rotation
        c = cos(phi);
        s = sin(phi);
        R = [c -s; s c];
        
        % 95 percent confidence ellipse
        chi2 = 2.4477;
        theta = linspace(0, 2*pi, 100);

        % Axis lengths
        a=chi2*sqrt(S(1, 1));
        b=chi2*sqrt(S(2, 2));
        
        % Ellipse
        e  = R * [a * cos(theta); b * sin(theta)];
        
        % Draw the error ellipse
        width = lambda(k) * 8;
        plot(e(1, :) + M(1, k), e(2, :) + M(2, k), '-', ...
            'Color', palette(:, k), 'LineWidth', width)
    end
end

printToPdf(filename);