close all
clc
clear all

FW = 23; % Mantissa length
EW = 8;  % Expoent length

lookup = textread('p_bin.txt', '%s');
result = textread('out_vector_p.txt', '%s');

A  = length(lookup);

result_hw = zeros(A, 1);
result_sw = zeros(A, 1);

for i=1:A
  result_hw(i, 1) = bin2float(EW, FW, cell2mat(result(i)));
  result_sw(i, 1) = bin2float(EW, FW, cell2mat(lookup(i)));

  erro(i) = sum((result_hw(i,:) - result_sw(i,:)).^2);
end

MSE = sum(erro)/A;

mySTR = strcat ("MSE=", num2str(MSE));

figure;
plot(erro)
xlabel("Amostras");
ylabel("Erro");
title("Comparacao Hw Vs. Sw [32 bits Vs. 64 bits] - Simulacao Proporcional PID");
annotation ("textbox", [.25 .75 .5 .09], "string", mySTR, "horizontalalignment", "center", "fitboxtotext", "off");
hold on;
print('Hardware_VS_Software - Proportional Simulation.png','-dpng');