% 1a
load data
[M, R] = kmeans(blobs, M0)
showClusters(blobs, M, R, M0, 1, 'blobsKmeans')
% produces a pdf
% turn in values in M
