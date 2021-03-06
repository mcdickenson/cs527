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



% 3a
zstart = [0 1.5]';
[z1, zh1] = meanShift(zstart, blobs, 0.2);
[z2, zh2] = meanShift(zstart, blobs, 2);
showPaths({zh1, zh2}, blobs, 1, 'paths')

[z2, zh2] = meanShift(zstart, blobs, 2);
[z3, zh3] = meanShift(zstart, blobs, 3);
[z4, zh4] = meanShift(zstart, blobs, 4);
showPaths({zh2, zh3, zh4}, blobs, 1, 'paths3')


% 4a
% f = @() meanShiftCluster(bananas, 0.8);
% t = timeit(f) % 14.91 seconds
[U, R] = meanShiftCluster(bananas, 0.8);
showClusters(bananas, U, R, [], 1, 'bananasMS');

% save('U.mat', 'U')
% save('R.mat', 'R')


