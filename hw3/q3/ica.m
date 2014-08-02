%% ICA
A = load('ica.dat')
S = fastica(A');

figure
subplot(2,2,1)
scatter(S(1, :), S(2, :))
title('1-2 pair')

subplot(2,2,2)
scatter(S(1, :), S(3, :))
title('1-3 pair')

subplot(2,2,3)
scatter(S(2, :), S(3, :))
title('2-3 pair')

purity_score(A, S')