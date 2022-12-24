close all
clear

%sampling frequency of 48000 Hz
Fs = 48000;
%tone frequency of 1000 Hz
f0 = 1000;
%2 second signal duration, need twice as many samples as Fs
n = 0:Fs*2 - 1;

%sampling frequency for "continuous" sine wave
Fs_dense = Fs*10;
%2 second signal duration, need twice as many samples as Fs_dense
n_dense = 0:Fs_dense*2 - 1;

%creating vectors to hold value of sine waves at different indexes
x = sin(2*pi*(f0/Fs)*n);
x_dense = sin(2*pi*(f0/Fs_dense)*n_dense);

%plotting sine wave sampled at base frequency
subplot(7,1,1);
stem(n,x);
hold on;
plot(n_dense/10, x_dense);
hold off;
title('Sampling Frequency (Hz) =', Fs);
xlabel('Samples')
ylabel('Amplitude')
legend('Sampled', 'Continous')
xlim([0 200]);

%playing first tone out loud. 
sound(x, Fs);
pause(2)

%int for incrementing plots 
num = 1;    
for sample_div = 6:5:31
    %dividing sampling frequency by some divisor. 
    Fs_sample_slow = Fs/sample_div;
    %vector to hold indexes under new slow sampling rate
    n_sample_slow = 0:Fs_sample_slow*2 - 1;
    %vector to hold value of sine wave using slow sampling rate
    x_sample_slow = sin(2*pi*(f0/Fs_sample_slow)*n_sample_slow);
    
    %incrementing plot number
    num = num + 1;
    %converting freq to int16 to help with naming titles
    sampling_freq = int16(Fs/sample_div);
    %plotting the slowly sampled wave
    subplot(7,1,num)
    stem(n_sample_slow*sample_div,x_sample_slow)
    hold on
    %plotting dense sine wave
    plot(n_dense/10, x_dense)
    hold off 
    title('Sampling frequency (Hz) = ', sampling_freq)
    xlabel('Samples')
    ylabel('Amplitude')
    legend('Sampled', 'Continous')
    xlim([0 200])
    
    %playing slowly sampled sine wave aloud. 
    sound(x_sample_slow, Fs)
    pause(2)
end
