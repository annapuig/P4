close all;

%  Obrim els fitxers
fileMFCC = fopen('mfcc_2_3.txt', 'r');

%  Obtenim els coeficients
coefMFCC = fscanf(fileMFCC, '%f');

%  Tanquem els fitxers
fclose(fileMFCC);

%%%%%%%%%% CONFIGURACIÃ“ DE LES GRÃ€FIQUES %%%%%%%%%%%

figure;
xlabel('C2');
ylabel('C3');
grid on;
title('LPCC Coeficients')
hold on;
for i=1:(size(coefMFCC,1)-1)
    plot(coefMFCC(i), coefMFCC(i+1), 'x');
end
hold off;
