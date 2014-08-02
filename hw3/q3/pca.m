%% PCA
A = load('ica.dat');
[~, ~, V] = svd(A, 0);
basis = V(:, 1:3);
A_project = A * basis;

figure
subplot(2,2,1)
scatter(A_project(:,1), A_project(:,2));
title('1-2 pair')

subplot(2,2,2)
scatter(A_project(:,1), A_project(:,3));
title('1-3 pair')

subplot(2,2,3)
scatter(A_project(:,2), A_project(:,3));
title('2-3 pair')

purity_score(A, A_project)