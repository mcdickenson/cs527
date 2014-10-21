function showPaths(h, Z, fig, filename)

style = {'-b', '--r', ':g', '-.k'};
msize = 10;
lwidth = 2;

figure(fig)
clf
plot(Z(1, :), Z(2, :), '.k', 'MarkerSize', 7)
hold on
for i = 1:length(h)
    si = mod(i - 1, length(style)) + 1;
    color = style{si}(end);
    plot(h{i}(1, 1), h{i}(2, 1), sprintf('x%c', color), ...
        'MarkerSize', msize, 'LineWidth', lwidth);
    plot(h{i}(1, :), h{i}(2, :), style{si}, 'LineWidth', lwidth);
    plot(h{i}(1, end), h{i}(2, end), sprintf('o%c', color), ...
        'MarkerSize', msize, 'LineWidth', lwidth);
end

printToPdf(filename)
