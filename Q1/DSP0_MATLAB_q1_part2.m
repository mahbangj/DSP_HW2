close all;
clear;
clc;
%% Question one,B,2,part I, sin
t=linspace(0,0.2,512);
F = 10;     % frequency of signal [Hz]
Fs = 100;   % sampling rate [Hz]
Ts = 1/Fs;  % sampling period [sec]


tc = t;                 % CT axis

xc = sin(2*pi*F*tc);    % CT signal
td = 0:Ts:0.2;          % DT axis

xd = sin(2*pi*F*td);    % DT signal
N = length(td);         % number of samples

xr = zeros(size(tc)); %initialization
sinc_train = zeros(N,length(tc)); %initialization
for n = 0:N-1
   sinc_train(n+1,:) = sinc((tc-n*Ts)/Ts); %sinc train
   current_sinc=xd(n+1)*sinc_train(n+1,:); %a sinc scaled by the sample value
   xr = xr + current_sinc; %generation of the reconstructed signal summing the sinc scaled
end


figure()
hold on
grid on
plot(tc,xc,'b','linewidth',1)
stem(td,xd,'k','linewidth',1)
plot(tc,xr,'r','linewidth',1.5)
legend('Continuos Signal','Sampled Signal','Reconstructed Signal')
xlabel('Time [sec]')
ylabel('Amplitude')
    
figure()

xr_progress=zeros(size(tc)); %initialization
for n = 0:N-1
  clf;hold on;grid on;
  current_sinc=xd(n+1)*sinc_train(n+1,:);
  stem(td(1:n+1),xd(1:n+1),'k','linewidth',1)
  plot(tc,xd(1:n+1)'.*sinc_train(1:n+1,:))
  xr_progress=xr_progress+current_sinc;
  plot(tc,xr_progress,'r','linewidth',1.5)
  xlabel('Time [sec]')
  ylabel('Amplitude')
  title(['Step ',num2str(n+1),' (Having ',num2str(n+1),' Sincs)'])
  pause(1)
end
%% Question one,B,2,part IV, sawtooth

F = 10;     % frequency of signal [Hz]
Fs = 100;   % sampling rate [Hz]
Ts = 1/Fs;  % sampling period [sec]


tc = t;                 % CT axis
xc=sawtooth(2*pi*F*tc);
%xc = sin(2*pi*F*tc);    % CT signal
td = 0:Ts:0.2;          % DT axis
xd=sawtooth(2*pi*F*td);
%xd = sin(2*pi*F*td);    % DT signal
N = length(td);         % number of samples

xr = zeros(size(tc)); %initialization
sinc_train = zeros(N,length(tc)); %initialization
for n = 0:N-1
   sinc_train(n+1,:) = sinc((tc-n*Ts)/Ts); %sinc train
   current_sinc=xd(n+1)*sinc_train(n+1,:); %a sinc scaled by the sample value
   xr = xr + current_sinc; %generation of the reconstructed signal summing the sinc scaled
end


figure()
hold on
grid on
plot(tc,xc,'b','linewidth',1)
stem(td,xd,'k','linewidth',1)
plot(tc,xr,'r','linewidth',1.5)
legend('Continuos Signal','Sampled Signal','Reconstructed Signal')
xlabel('Time [sec]')
ylabel('Amplitude')
    
figure()

xr_progress=zeros(size(tc)); %initialization
for n = 0:N-1
  clf;hold on;grid on;
  current_sinc=xd(n+1)*sinc_train(n+1,:);
  stem(td(1:n+1),xd(1:n+1),'k','linewidth',1)
  plot(tc,xd(1:n+1)'.*sinc_train(1:n+1,:))
  xr_progress=xr_progress+current_sinc;
  plot(tc,xr_progress,'r','linewidth',1.5)
  xlabel('Time [sec]')
  ylabel('Amplitude')
  title(['Step ',num2str(n+1),' (Having ',num2str(n+1),' Sincs)'])
  pause(1)
end
