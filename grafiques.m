close all;

%  Obrim els fitxers
fileLPCC = fopen('lpcc_2_3.txt', 'r');

%  Obtenim els coeficients
coefLPCC = fscanf(fileLPCC, '%f');

%  Tanquem els fitxers
fclose(fileLPCC);

%%%%%%%%%% CONFIGURACIÓ DE LES GRÀFIQUES %%%%%%%%%%%

figure;
xlabel('C2');
ylabel('C3');
grid on;
title('LPCC Coeficients')
hold on;
for i=1:(size(coefLPCC,1)-1)
    plot(coefLPCC(i), coefLPCC(i+1), 'x');
end
hold off;
