function printToPdf(filename)

axis equal
axis tight
axis off

margin = 0.05;

loosen('XLim', margin)
loosen('YLim', margin)

set(gca, 'Position', [margin margin 1-2*margin 1-2*margin])

xlim = get(gca, 'XLim');
ylim = get(gca, 'YLim');
aspect = (ylim(2) - ylim(1)) / (xlim(2) - xlim(1));
p = get(gcf, 'Position');
p(4) = round(p(3) * aspect);
set(gcf, 'Position', p)

scale = 15;
xy = scale * [1 aspect];
margin = 0.5;
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [margin margin xy])
set(gcf, 'PaperSize', xy + 2 * margin)
set(gcf, 'Color', [1 1 1], 'InvertHardcopy', 'off')

print('-dpdf', sprintf('%s.pdf', filename));

    function loosen(ax, mr)
        lim = get(gca, ax);
        range = lim(2) - lim(1);
        delta = range * mr;
        lim = lim + delta * [-1 1];
        set(gca, ax, lim);
    end

end