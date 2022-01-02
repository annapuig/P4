close all;

fileLPC = fopen('lp_2_3.txt', 'r');
coefLPC = fscanf(fileLPC, '%f');

figure;
xlabel('C2');
ylabel('C3');
grid on;
title('LPC Coeficients')
hold on;
for i=1:(size(coefLPC,1)-1)
    plot(coefLPC(i), coefLPC(i+1), 'x', 'Color', 'g');
end
hold off;

fileLPCC = fopen('lpc2c_2_3.txt', 'r');
coefLPCC = fscanf(fileLPCC, '%f');


figure;
xlabel('C2');
ylabel('C3');
grid on;
title('LPCC Coeficients')
hold on;
for i=1:(size(coefLPCC,1)-1)
    plot(coefLPCC(i), coefLPCC(i+1), 'x', 'Color', 'g');
end
hold off;


fileMFCC = fopen('mfcc_2_3.txt', 'r');
coefMFCC = fscanf(fileMFCC, '%f');

figure;
xlabel('C2');
ylabel('C3');
grid on;
title('MFCC Coeficients')
hold on;
for i=1:(size(coefMFCC,1)-1)
    plot(coefMFCC(i), coefMFCC(i+1), 'x', 'Color', 'g');
end
hold off;


