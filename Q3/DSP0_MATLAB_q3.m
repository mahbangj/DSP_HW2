clear;
close all;
clc;
%% Question 3,1,a
a1 = conv([1,-0.4*exp(pi*1i/6)], [1,-0.4*exp(-pi*1i/6)]);
a2 = conv([1,-1.5*exp(2*pi*1i/3)], [1,-1.5*exp(-2*pi*1i/3)]);
a = conv(a1, a2);
figure(1)
zplane(a)
title('Original system')

c1 = conv([1,(-2/3)*exp(2*pi*1i/3)],[1,(-2/3)*exp(-2*pi*1i/3)]);
c2 = conv([1,-0.4*exp(pi*1i/6)], [1, -0.4*exp(-pi*1i/6)]);
c = conv(c1,c2);
mina = (1.5)^2 * conv(c,1);

allb = conv([(-2/3)*exp(2*pi*1i/3),1],[(-2/3)*exp(-2*pi*1i/3),1]);
alla = conv([1, (-2/3)*exp(2*pi*1i/3)], [1,(-2/3)*exp(-2*pi*1i/3)]);

figure(2)
zplane(alla,allb)
title('All-Pass')
figure(3)
zplane(mina)
title('Min-Phase')
%% Question 3,1,b
figure(4)
w=linspace(0,pi,1024);
grpdelay(a,1,w)
title('Original grpdelay')
figure(5)
grpdelay(allb,alla,w)
title('All-Pass grpdelay')
figure(6)
grpdelay(mina,1,w)
title('Min-Phase grpdelay')
%% Question 3,2,b & c
d=conv([1,-1],[1,1]);
bb1=conv(a1,a2);
firglp=conv(d,bb1);
figure(7)
zplane(firglp,1)
title('FIR-GLP Zplane')
figure(8)
zplane(firglp,mina)
title('Amplitude Distortion zplane')
w=-pi:pi/10:pi;
figure(9)
freqz(firglp,mina,w)
title('Compensated Amplitude Distortion')

