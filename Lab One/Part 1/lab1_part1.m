close all
clear

%sampling frequency 
Fs = 8000;
%tone frequency 
f0 = 440;
%2 second signal duration,need twice as many samples as Fs
n = 0:Fs*2 - 1;
%vector for approximated square wave
x = 0;

%sampling frequency for "continous" sine wave
Fs_dense = Fs*10;
%2 second signal duration,need twice as many samples as Fs_dense
n_dense = 0:Fs_dense*2 - 1;
%vector for "continous" square wave 
x_dense = 0;

%used for incrementing harmonics and plot number
plot_num = 1;
HARMONIC_FINAL = 13;

%using a for loop to add additional harmonics
for HARMONIC = 1:2:HARMONIC_FINAL
    %adding additional harmonics to sampled sqaure wave 
    x = x + sin(2*pi*HARMONIC*(f0/Fs)*n)/HARMONIC;
    %adding additional harmonics to continous square wave 
    x_dense = x_dense + sin(2*pi*HARMONIC*(f0/Fs_dense)*n_dense)/HARMONIC;
    %only adding harmonic if it odd or smaller than HARMONIC_FINAL = 13
    if HARMONIC == 1 ||HARMONIC == 5 || HARMONIC == 9 || HARMONIC == 13
        subplot(4, 1, plot_num)
        stem(n, x)
        hold on
        plot(n_dense/10, x_dense)
        xlabel('Sample')
        ylabel('Amplitude')
        legend('Sampled', 'Continous')
        xlim([0 200])
        %using if statment for helping put title on graphs
        if HARMONIC == 1
            title('Square Wave: 1st Harmonic')
        elseif HARMONIC == 5 
            title('Square Wave: Adding 3rd and 5th Harmonic')
        elseif HARMONIC == 9 
            title('Square Wave: Adding 7th and 9th Harmonic')
        elseif HARMONIC == 13
            title('Square Wave: Adding 11th and 13th Harmonic')
        end
        plot_num = plot_num + 1;
    end
    %playing each tone for 2 seconds
    sound(x, Fs);
    pause(2);
end


