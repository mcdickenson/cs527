function [img, label] = drawRandom(likelihood, prior, s)

n = s(3);

% Draw from the prior (a categorical distribution)
cp = cumsum(prior);
r = rand(1, n);
label = uint8(zeros(1, n));
for k = 2:length(cp)
    label((cp(k-1) < r) & (r <= cp(k))) = k-1;
end

% Draw from the likelihoods (diagonal normal distributions)
[d, ell] = size(likelihood.M);
X = zeros(d, n);
for k = 1:ell
    % Find entries that have label k-1
    pos = label == k - 1;
    nk = sum(pos);
    
    % Draw from Norm(0, eye(d))
    r = randn(d, nk);
    % Stretch to Norm(0, Sigma) with diagonal Sigma
    r = r .* (sqrt(likelihood.S(:, k)) * ones(1, nk));
    % Add in the mean m to obtain a sample from Norm(m, Sigma)
    r = r + likelihood.M(:, k) * ones(1, nk);
    
    % Store the feature
    X(:, pos) = r;
end

% Decode features into images
img = code(X, s);