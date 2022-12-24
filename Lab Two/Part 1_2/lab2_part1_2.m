close all
clear

%defining sampling frequency and constant for exponential signal 
fs = 1000;
Ts = 1/fs;
alpha = 0.95;

%defining samples and output sequence 
n = 0:1:199;
x = alpha.^(n);

%plotting
stem(n, x)
title('First 200 Samples of x[n]')
xlabel('Sample')
ylabel('x[n]')

%if we want 2 seconds, sampled at 1000 Hz, we need 2000 samples.

%so, if we have 200 samples and 1000 Hz, we 
