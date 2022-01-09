fileMFCC = fopen('mfcc_2_3.txt', 'r');
coefMFCC = fscanf(fileMFCC, '%f');

figure;
xlabel('C2');
ylabel('C3');
grid on;
title('MFCC Coeficients');
hold on;
for i=1:(size(coefMFCC,1)-1)
    plot(coefMFCC(i), coefMFCC(i+1), 'x', 'Color','g');
end 
hold off;