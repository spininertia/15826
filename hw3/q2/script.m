A = load('svd.dat');
[U,S,V] = svd(A, 0);
basis = V(:, 1:2);
A_projected = A * basis;
scatter(A_projected(:, 1), A_projected(:, 2));
outliers = [-1.399, 18.91; -18.33, -7.7];
out_original = outliers * basis';