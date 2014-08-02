%%load data
original_data = dlmread('tensor.dat', '\t');
sp_tensor = sptensor(original_data(:, 1:3), original_data(:, 4));

%% tensor decomposition
P = cp_als(sp_tensor, 2);

sizes = size(sp_tensor);
num_users = sizes(1);
num_pages = sizes(2);
num_days = sizes(3);

figure
%% user - concept
subplot(3, 2, 1)
scatter(1:num_users, P.U{1}(:, 1))
title('user - 1st concept')
xlabel('user id')
ylabel('value')

subplot(3, 2, 2)
scatter(1:num_users, P.U{1}(:, 2))
title('user - 2nd concept')
xlabel('user id')
ylabel('value')

%% page - concept
subplot(3, 2, 3)
scatter(1:num_pages, P.U{2}(:, 1))
title('page - 1st concept')
xlabel('page id')
ylabel('value')

subplot(3, 2, 4)
scatter(1:num_pages, P.U{2}(:, 2))
title('page - 2nd concept')
xlabel('page id')
ylabel('value')

%% date - concept
subplot(3, 2, 5)
scatter(1:num_days, P.U{3}(:, 1))
title('user - 1st concept')
xlabel('date')
ylabel('value')

subplot(3, 2, 6)
scatter(1:num_days, P.U{3}(:, 2))
title('user - 2nd concept')
xlabel('date')
ylabel('value')
