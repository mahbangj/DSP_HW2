clear;
close all;
clc;
%% Question 4a
h0=[1 2 3 4 5 6];
h1=[6 -5 4 -3 2 -1];
w=0:(2*pi/511):pi;
H0=abs(fft(h0,512));
H1=abs(fft(h1,512));
figure(1)
plot(w,H0(1:256));
hold on;
plot(w,H1(1:256));
axis([0 pi 0 22]);
title('Frequency Resposes (magnitude)');
xlabel('w');
%% Question 4c
h0=[1 3 1 4 1 3 1];
h1=[1 -3 1 -4 1 -3 1];
H0=abs(fft(h0,512));
H1=abs(fft(h1,512));
figure(2)
plot(w,H0(1:256));
hold on;
plot(w,H1(1:256));
axis([0 pi 0 16]);
title('Frequency responses (magnitude)');
xlabel('w');
