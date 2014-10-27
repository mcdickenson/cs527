% 1a
load data
[M, R] = kmeans(blobs, M0)
showClusters(blobs, M, R, M0, 1, 'blobsKmeans')

% 1b
[M, R] = kmeans(cigars, M0(:, 1:2))
showClusters(cigars, M, R, M0(:, 1:2), 1, 'cigarsKmeans')

% 1c
[M, R] = kmeans(cigars, M1)
showClusters(cigars, M, R, M1, 1, 'cigarsKmeansM1')


% 1e

Z  = transpose([ 
    0+eps  1;  0-eps  1;  0  1+eps;  0  1-eps; 
    1+eps  0;  1-eps  0;  1  0+eps;  1  0-eps; 
    0+eps -1;  0-eps -1;  0 -1-eps;  0 -1+eps; 
   -1-eps  0; -1+eps  0; -1  0+eps; -1  0-eps ])
m = transpose([0 0; 0 0; 0 0; 0 0])
[M, R] = kmeans(Z, m)
showClusters(Z, M, R, m, 1, 'customKmeans')




% 2a
[lambda, M, Sigma, R] = EM(blobs, M0, ones(1, 3));
showMixture(blobs, lambda, M, Sigma, R, M0, 1, 'blobsEM')

% 2b
[lambda, M, Sigma, R] = EM(cigars, M0(:, 1:2), ones(1, 2));
showMixture(cigars, lambda, M, Sigma, R, M0(:, 1:2), 1, 'cigarsEM')

% 2d
[lambda, M, Sigma, R] = EM(blobs, M0(:, 1:2), ones(1, 2));
showMixture(blobs, lambda, M, Sigma, R, M0(:, 1:2), 1, 'blobsEMk2')

[lambda, M, Sigma, R] = EM(blobs, M04, ones(1, 4));
showMixture(blobs, lambda, M, Sigma, R, M04, 1, 'blobsEMk4')

% 2e
[lambda, M, Sigma, R] = EM(bananas, M0(:, 1:2), ones(1, 2));
showMixture(bananas, lambda, M, Sigma, R, M0(:, 1:2), 1, 'bananasEM')
