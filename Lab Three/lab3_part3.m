clear 
close all

%sampling frequency
Fs = 8000;

%frequnecy of two sine waves
f0 = 500;
f1 = 250;

%two seconds worth of samples
N = 2 * Fs;
n = 0:N-1;

%storing two sin waves with freq f0 and f1 in x0 and x1

x0 = cos(2*pi*(f0/Fs)*n);
x1 = cos(2*pi*(f1/Fs)*n);
x2 = 0.95.^n;

%takking the FFT signals
x0_fft = fft(x0);
x1_fft = fft(x1);
x2_fft = fft(x2);

%finding product of signals
x_prod0 = x0 .* x1;
x_prod1 = x0 .* x2;

%taking FFT of x_product
x_prod0_FFT = fft(x_prod0, N);
x_prod0_FFT = x_prod0_FFT / max(x_prod0_FFT);

x_prod1_FFT = fft(x_prod1, N);
x_prod1_FFT = x_prod1_FFT / max(x_prod1_FFT);

%circular convolution of FFTs of signals
cconv0 = cconv(x0_fft, x1_fft, N);
cconv0 = cconv0 / max(cconv0);

cconv1 = cconv(x0_fft, x2_fft, N);
cconv1 = cconv1 / max(cconv1);

PLOTS_ROWS = 3;
PLOTS_COLS = 2;

%-------------------------plotting------------------------%
subplot(PLOTS_ROWS,PLOTS_COLS,1);
plot(n,x0);
hold on;
plot(n,x1);
hold
xlim([0 100])
title('x_0 = sin(2\pi(500/Fs)n) and x_1 = sin(2\pi(250/Fs)n)');
xlabel('Sample');
ylabel('Magnitude');

subplot(PLOTS_ROWS,PLOTS_COLS,3);
%plot(n,abs(x_sum_FFT));
plot(n,x_prod0_FFT);
xlim([0 2000])
ylim([-1.5 1.5])
title('FFT of Product of x_0 and x_1');
xlabel('Frequency Bin');
ylabel('Magnitude');

subplot(PLOTS_ROWS,PLOTS_COLS,5);
%plot(n,abs(sines_cconv));
plot(n,cconv0);
xlim([0 2000])
ylim([-1.5 1.5])
title('Circular Convolution of the FFT of x0 and FFT of x1');
xlabel('Frequency Bin');
ylabel('Magnitude');

subplot(PLOTS_ROWS,PLOTS_COLS,2);
plot(n,x0);
hold on;
plot(n,x2);
hold off;
xlim([0 100]);
title('x_0 = sin(2\pi(500/Fs)n) and x_1 = 0.95^n');
xlabel('Sample');
ylabel('Magnitude');

subplot(PLOTS_ROWS,PLOTS_COLS,4);
%plot(n,abs(x_sum_FFT));
plot(n,x_prod1_FFT);
xlim([0 2000])
ylim([-1.5 1.5]);
title('FFT of Product of x_0 and x_1');
xlabel('Frequency Bin');
ylabel('Magnitude');

subplot(PLOTS_ROWS,PLOTS_COLS,6);
%plot(n,abs(sines_cconv));
plot(n,cconv1);
xlim([0 2000]);
ylim([-1.5 1.5]);
title('Circular Convolution of the FFT of x0 and FFT of x1');
xlabel('Frequency Bin');
ylabel('Magnitude');