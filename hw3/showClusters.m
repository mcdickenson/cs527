function showClusters(Z, M, R, M0, fig, filename)

figure(fig)
clf
hold on

psym = 'ox.v';
sz = [4 4 10 4];
gray = 0.85 * [1 1 1];
white = [1 1 1];
black = [0 0 0];

K = size(R, 1);

for k = 1:K
    ks = mod(k-1, length(psym)) + 1;
    plot(Z(1, R(k, :)), Z(2, R(k, :)), sprintf('%ck', psym(ks)), 'MarkerSize', sz(ks));
end

if ~isempty(M0)
    plotMeans(M0, 'o', gray, black);
end

if ~isempty(M)
    plotMeans(M, 'v', white, black);
end

printToPdf(filename);

end