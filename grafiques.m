close all;

%  Obrim els fitxers
fileLPC = fopen('lp_2_3.txt', 'r');
%fileLPCC = fopen('lpcc_2_3.txt', 'r');
%fileMFCC = fopen('mfcc_2_3.txt', 'r');

%  Obtenim els coeficients
coefLPC = fscanf(fileLPC, '%f');
%coefLPCC = fscanf(fileLPCC, '%f');
%coefMFCC = fscanf(fileMFCC, '%f');

%  Tanquem els fitxers
fclose(fileLPC);
%fclose(fileLPCC);
%fclose(fileMFCC);

figure;
xlabel('C2');
ylabel('C3');
grid on;
title('LPC Coeficients')
hold on;
for i=1:(size(coefLPC,1)-1)
    plot(coefLPC(i), coefLPC(i+1), 'x');
end
hold off;