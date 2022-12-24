close all
clear

%defining sampling frequency and constant for exponential signal 
fs = 1000;
Ts = 1/fs;
alpha = 0.95;

%defining samples and sequence
n = 0:1:199;
x = alpha.^n;

%computing the DFT using the FFT
Xf = fft(x, 1024);

%sampling the DTFT of the exponential signal 
w = 0:2*pi/1024:2*pi;
h = 1 ./ sqrt( (1-alpha*cos(w)).^2 + (alpha*sin(w)).^2 );

%plotting DTFT when sampled every 1/1024 of its period
subplot(2,1,1)
plot(w , h)
title('X(e^{j\omega})')  
xlabel('Sample')
ylabel('Amplitude')
xticks([-3*pi -2*pi -pi 0 pi 2*pi 3*pi])        % set ticks to be pi-ish 
xticklabels({'-3\pi','-2\pi','-\pi','0','\pi','2\pi','3\pi'}) % pi-ish labels 
ylim([0 20])                                    % set vertical axis limits 
xlim([0 (2*pi)])                                % set horizontal axis limits

%plotting the DFT using the FFT algorithm 
subplot(2,1,2)
plot((0:1:1023)*2*pi/1024, abs(Xf))
xticks([-3*pi -2*pi -pi 0 pi 2*pi 3*pi])        % set ticks to be pi-ish 
xticklabels({'-3\pi','-2\pi','-\pi','0','\pi','2\pi','3\pi'}) % pi-ish labels 
title('Xf(e^{j\omega})')                        % set title 
xlabel('Sample')
ylabel('Amplitude')
ylim([0 20])                                    % set vertical axis limits 
xlim([0 (2*pi)])                                % set horizontal axis limits