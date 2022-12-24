clear
close all

%defining number of samples 
N = 256;
n = 0:1:255;

%defining each sinusoidal sequence
y1 = sin((2*pi*n)./N);
y2 = cos((4*pi*n)./N);
y3 = cos((22*pi*n)./N);
y4 = cos((202*pi*n)./N);
y5 = cos((23*pi*n)./N);

%superimposing sinusoids y1, y2, y3, and y4
y = y1 + y2 + y3 + y4;

%computing the FFT of the signal , as well as the FFT of the real and
%imaginary componenets
yf = fft(y, 256);
yf_real = fft(y2+y3+y4, 256);
yf_imag = fft(y1, 256)

%plotting FFT og the single sinusoid. 
Fy = fft(y5);
subplot(3,1,1);
stem(0: (N/2-1), abs(Fy(1:N/2)), 'filled', 'MarkerSize', 2)
title('DFT of y5')
xlim([0 128])
xlabel('Sample')
ylabel('X[k]')

%increasing the sampling rate of FFT applied to y5 by 16
Fy_16 = fft(y5, N*16);
subplot(3,1,2);
plot(0: (16*N/2-1), abs(Fy_16(1:16*N/2)))
title('FFT of y5')
xlim([0 N*16/2])
xlabel('Sample')
ylabel('X[k]')

%overlaying previous two graphs
subplot(3,1,3);
stem(0:16:(16*N/2-1), abs(Fy(1:N/2)), 'filled', 'MarkerSize', 2)
hold on
plot(0: (16*N/2-1), abs(Fy_16(1:16*N/2)))
hold off
title('Overlapping DFT and FFT')
xlim([0 N*16/2])
xlabel('Sample')
ylabel('X[k]')
