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


%plotting first 255 samples of FFT
subplot(4,1,1)
stem(n, abs(yf));
xlim([0 255])
title('FFT of y = y1 + y2 + y3 + y4 (255 samples)')
xlabel('Sample')
ylabel('X[k]')

%plotting first 128 samples of FFT
subplot(4,1,2)
stem(n, abs(yf));
xlim([0 128])
title('FFT of y = y1 + y2 + y3 + y4 (128 samples)')
xlabel('Sample')
ylabel('X[k]')

%plotting FFT applied to real component of sequence 
subplot(4,1,3)
stem(n, abs(yf_real));
xlim([0 128])
title('FFT of y = y1 + y2 + y3 + y4 (Real)')
xlabel('Sample')
ylabel('X[k] (real)')

%plotting FFT applied to imaginary component of sequence 
subplot(4,1,4)
stem(n, abs(yf_imag));
xlim([0 128])
title('FFT of y = y1 + y2 + y3 + y4 (Imaginary)')
xlabel('Sample')
ylabel('X[k] (Imaginary)')

