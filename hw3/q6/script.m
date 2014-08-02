clear;clc
%% signal
y = load('y.txt');
Fs = size(y, 1);
plot(1:Fs, y);

%% spectrum using DFT
Y = fft(y);
t = 1:50;
stem(t - 1, abs(Y(t)));
title('spectrum')
xlabel('frequency');
ylabel('amplitude');
y_abs = abs(y(2:end));
disp('standout:')
standout = find(y_abs > 5 * y_abs);

%% wavelet transform
level = 12;
%[c, l] = wavedec(y, level, 'haar');
wavelet_scaleogram(y', level)

%%
x = y(1024:1024+128);
Y1 = fft(x);
t = 1:50;
stem(t - 1, abs(Y1(t)))
x_abs = abs(x(2:end));
disp('standout:')
standout = find(x_abs > 5 * x_abs);