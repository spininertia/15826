%%
clear;clc
%% part 1 - plot time series
data = dlmread('spot_num.txt' ,'', 1, 0);
time = data(:, 1);
ssn = data(:, 3);
L = size(data, 1); %length of signal
plot(1:L, ssn);

%% part 2 - fourier transformation and plot
Y = fft(ssn);
t = 50;
stem((0:t-1), abs(Y(1:t,:)))
xlabel('frequency')
ylabel('amplitude')

%% part - 4.a signal 1
clear;clc
y = load('y.txt');
L = size(y, 1); 
plot(1:L, y);

%% 4.b
Y = fft(y);
t = 100;
stem((0:t-1), abs(Y(1:t,:)));
title('spectrum')
xlabel('frequency')
ylabel('amplitude')
disp('frequency that stand out')
Y = abs(Y(2:end,:));

%% 4.c
find(Y > 5 * mean(Y))



%% part - 5.a signal 2
clear;clc
y = load('y_mix.txt');
L = size(y, 1); 
plot(1:L, y);

%% 5.b
Y = fft(y);
t = 100;
stem((0:t-1), abs(Y(1:t,:)));
title('spectrum')
xlabel('frequency')
ylabel('amplitude')
disp('frequency that stand out')
Y = abs(Y(2:end,:));

%% 5.c
standout = find(Y > 5 * mean(Y))

%% 6
x = 1:100;
y_inj = sin(2 * pi * standout(1) / L * x);
plot(x, y_inj);
xlabel('time')