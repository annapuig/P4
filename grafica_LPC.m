fileLPC = fopen('lp_2_3.txt', 'r');
coefLPC = fscanf(fileLPC, '%f');

figure;
xlabel('C2');
ylabel('C3');
grid on;
title('LPC Coeficients');
hold on;
for i=1:(size(coefLPC,1)-1)
    plot(coefLPC(i), coefLPC(i+1), 'x', 'Color','g');
end 
hold off;

 