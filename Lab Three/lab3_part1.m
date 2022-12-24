clear 
close all 

%reading audio file in x, audioread returns Fs
[x Fs] = audioread('la_la_land.mp4');

%storing x in row vector
x_col = x(:,1);
x_col = x_col / max(x_col);

%finding number of samples
N = 100000;

%creating variables to populate x
n = 0:1:N-1;

%plotting first 200,000 samples, as well as a segment from index 20k-25k
figure(1);
subplot(2, 1, 1);
plot(1:200000, x_col(1:200000));
title('First 200,000 Samples of Audio Signal');
xlabel('Sample');
ylabel('Normalized Amplitude');
subplot(2,1,2);
plot((20000:25000),x_col(20000:25000));
title('Sample 20,000 to 25,000 of Audio Signal');
xlabel('Sample');
ylabel('Normalized Amplitude');

%computing the FFT
xf = fft(x_col, N);
xf = xf / max(xf);

%plotting entire FFT and FFT from index 2300-2550
figure(2);
subplot(2,1,1);
plot(n, abs(xf(1:N)));
title('FFT');
xlabel('Frequency Bin');
ylabel('Normalized Amplitude');
xlim([0 N]);
subplot(2,1,2);
stem(1:1750, abs(xf(1:1750)));
title('Segment of FFT');
xlabel('Frequency Bin');
ylabel('Normalized Amplitude');

%playing the audio signal aloud
sound(x, Fs);

%computing short short time fourier transform
SEGMENT_LENGTH = 1024;
OFFSET_PER_SEGMENT = 0.5*SEGMENT_LENGTH;
fft_LENGTH = 4096;

%creating a matrix to store coeffs from STFT
coeffs = zeros(4096,267); 

%loop that computes one FFT segment and assembles array of coeffs
for i = 0:512:130000
    data = (x(i+1:1:i+SEGMENT_LENGTH));
    data_fft = abs(fft(data, fft_LENGTH));
    coeffs(:,i/512+1) = data_fft;
end

%using inbuilt spectrogram MATLAB function display STFT
figure(3)
segment = 20000:100000;
spectrogram(x_col(segment), SEGMENT_LENGTH, 0, fft_LENGTH, Fs);
title('Spectrogram');
xlabel('Frequency Bin');
ylabel('Segment #');


figure(4);
surf(coeffs)
xlim([1 250])
ylim([1 150])
xlabel('Segment #')
ylabel(sprintf('Frequency Bin, Total %d Bins, Sampling Rate = %d KHz', fft_LENGTH, Fs));
title('Short-Time Fourier Transform');