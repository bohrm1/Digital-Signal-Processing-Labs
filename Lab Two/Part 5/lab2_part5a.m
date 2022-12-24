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

%plotting original sequence
stem(n, y)
xlim([0 255])
title('Original Sequence y = y1 + y2 + y3 + y4')
xlabel('Sample')
ylabel('Amplitude')