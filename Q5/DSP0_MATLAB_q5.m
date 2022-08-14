clear;
close all;
clc;
%% Question 5,a
t = 0: 1/2/pi: 60;
x1 = cos(2*pi/16*pi*t);
x2 = cos(2*5*pi/16*pi*t);
x3 = cos(2*9*pi/16*pi*t);
x4 = cos(2*13*pi/16*pi*t);

x = x1 + x2 + x3 + x4;

n = 512;
fs = 2*pi;
freq = linspace(-fs/2, fs/2, n);

xft=fft(x,n);
xft=fftshift(xft);
figure(1)

plot(freq,abs(xft))
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude (dB)')
title('frequency response of x(t)')
%% Question 5,b & c
data = importdata('filters.xls');
data1=data.Sheet1;
data2=data.Sheet2;
pu=[2 0 1 0.5];
for i=1:4
    o1=filter(data1(i,:),1,x);
    o2=downsample(o1,4);
    o3=pu(i)*o2;
    o4=upsample(o3,4);
    o5=filter(data2(i,:),1,o4);
    y(i,:)=o5;
end
y=sum(y);
yft=fft(y,n);
yft=fftshift(yft);
figure(2)
plot(freq,abs(yft))
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude (dB)')
title('frequency response of the filtered inputs')

