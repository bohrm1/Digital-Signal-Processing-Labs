%get lowpass filt coeffs in Num
load('filt_3300_48000_coeffs.mat')

x = 1;

%convolving impulse with LPF
yf = conv(x, Num, 'full');
yf = yf / max(yf);

subplot(3,1,1)
plot((yf(1:99)))
title('Convolving Approx. Sinc with Impulse');

subplot(3,1,2)
y_fft = fft(y);
plot(abs(y_fft))
title('Magnitude of FFT of Sinc');

subplot(3,1,3)
phase = angle(y_fft);
plot(phase(1:99))
title('Phase of FFT of Sinc')