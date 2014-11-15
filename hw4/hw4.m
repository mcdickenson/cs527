%1a
sigma = 3
[w1, u] = gauss(sigma);

% make plot
plot(u, w1)
xlabel({'U'});
ylabel({'w1'});
title({'Output for gauss(3)'});

w = w1 * w1';
sum(sum(w))
