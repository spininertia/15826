clear;clc
%% 1. original sum
x = load('y.txt');
disp('original sum:')
original_sum = sum(x(512:1024))

%% 2. approximate sum
level = 7;
[c, l] = wavedec(x, level, 'haar');
sorted_c = sort(abs(c), 1, 'descend');
sorted_c = sorted_c(1:100);
index = ismember(abs(c), sorted_c);
c_approximate = c;
c_approximate(~index) = 0;

x_rec = waverec(c_approximate, l, 'haar');

disp('approximate sum')
approximate_sum = sum(x_rec(512:1024))

disp('error')
approximate_sum - original_sum

%% 3. further approximation, subset searching
num_point = length(x);
start = num_point / 2^level;
new_index = zeros(size(index));
new_index(1:start) = 1;
for lev = linspace(7,1,7)
    interval = 2^lev;
    interval_start = start + 512 / interval;
    interval_end = start + 1024 / interval;
    new_index(interval_start:interval_end) = 1;
    start = start + num_point / interval;
end
c_further_app = c_approximate;
c_further_app(~new_index) = 0;
x_rec2 = waverec(c_further_app, l, 'haar');
disp('further approximate sum')
approximate_sum = sum(x_rec2(512:1024))