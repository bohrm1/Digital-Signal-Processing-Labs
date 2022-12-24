clear 
close all 

%parameters for tuning IIR filter coeffs
alpha1 = 0.95;
alpha2 = 0.98;

%center frequency 
w0 = pi / 20;

x_struct  = load('filter_test_segments.mat');     %filter_test_segments placed in struct x_struct
x_extracted = x_struct.x;                         %extracting member x from struct which holds chirp signal coeffs

%matrix to hold filter coefficients
a1 = [1     -1*2*alpha1*cos(w0)     alpha1^2];    %using alpha1
a2 = [1     -1*2*alpha2*cos(w0)     alpha2^2];    %using alpha2
b =  [1           0                  -1    ];

%----------------implementing 2nd order difference equation-----------------
%variables to hold sequence values and their delays
%instantiated to zero since any member from x and y before n = 0 should be 0
y = 0; 
y_n1 = 0;
y_n2 = 0;
x_n1 = 0;
x_n2 = 0;

%loop to populate output sequence using difference equation describing 
%IIR filter
for n = 0:1799
    y(n+1)= -a1(2)*y_n1 - a1(3)*y_n2 + b(1)*x_extracted(n+1) + b(2)*x_n1 + b(3)*x_n2;
    
    y_n2 = y_n1;
    y_n1 = y(n+1);
    x_n2 = x_n1;
    x_n1 = x_extracted(n+1);
end

%plotting frequency response of filter using freqz function
figure(1);
freqz(b, a1);
hold on
freqz(b, a2);
legend('alpha = 0.95','alpha = 0.98')
hold off
lines = findall(gcf,'type','line');
set(lines(1),'Color','blue')
set(lines(2),'Color','red')
title('Frequency Ressponse of FIR Filter');

%plotting chirp signal and output chirp after filtered
k = 0:1799;
figure(2);
subplot(2,1,1);
plot(k,x_extracted);
title('Chirp Signal')
subplot(2,1,2);
plot(k, y);
title('Applying BPF to Chirp Signal')