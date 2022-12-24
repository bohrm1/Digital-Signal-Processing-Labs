close all
clear

n = 0:1:18;

padding = [0, 0, 0, 0, 0, 0];

x = [0, 1, 2, 3, 4, 0, 0];
h = [0, 5, 5, 5, 0, 0, 0];
h_flip = flip(h, 2);

x_padded = cat(2, x, padding);
x_padded = cat(2, padding, x_padded);

h_padded = cat(2, h, padding);
h_padded = cat(2, padding, h_padded);

h_flip_padded = cat(2, h_flip, padding);
h_flip_padded = cat(2, h_flip_padded, padding);


subplot(6,2,1)
stem(n,x_padded);
title('Original Signals')
hold on;
stem(n,h_padded);
hold off
legend('Input Signal', 'System Reponse');

subplot(6,2,2)
stem(n,x_padded);
title('Flipping and Time Reversing Impulse Response')
hold on;
stem(n,h_flip_padded);
hold off;
legend('Input Signal', 'System Reponse');

for i = 1:1:9  
    h_flip_padded = cat(2, zeros(1), h_flip_padded);
    h_flip_padded_cut = h_flip_padded(1:19);
    subplot(6,2,i+2);
    stem(n,x_padded);
    title('Shift Iteration:', i);
    hold on;
    stem(n,h_flip_padded_cut);
    hold off;
    legend('Input Signal', 'System Reponse');
end

output_sequence = [0, 5, 15, 30, 45, 35, 20];
y_padded = cat(2, output_sequence, padding);
y_padded = cat(2, padding, y_padded);

subplot(6, 2, 12);
stem(n, y_padded);
title('Output Sequence');

