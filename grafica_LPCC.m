fileLPCC = fopen('lpcc_2_3.txt', 'r');
coefLPCC = fscanf(fileLPCC, '%f');

figure;
xlabel('C2');
ylabel('C3');
grid on;
title('LPCC Coeficients');
hold on;
for i=1:(size(coefLPCC,1)-1)
    plot(coefLPCC(i), coefLPCC(i+1), 'x', 'Color','g');
end 
hold off;