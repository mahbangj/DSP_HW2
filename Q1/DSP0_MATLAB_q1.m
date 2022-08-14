clear ;
close all;
clc
%% Question one,A, 1
f=10;
t=linspace(0,0.2,512);
y1=sin(2*pi*10*t);
figure(1)
plot(t,y1)
grid on

y2 = sawtooth(2*pi*f*t);
figure(2)
plot(t,y2)
grid on
%% Question one,A,2
T=1/f;
fs=100;
t2=0:1/fs:0.2;

y3=sin(2*pi*f*t2);
figure(3)
plot(t2,y3)
grid on

y4=sawtooth(2*pi*f*t2);
figure(4)
plot(t2,y4)
grid on
%% Question one,B,1
figure(5)
xq = 0:1/200:0.2;
vq1 = interp1(t,y1,xq,'linear');
plot(t,y1,'r')
hold on
plot(xq,vq1,'-o')
