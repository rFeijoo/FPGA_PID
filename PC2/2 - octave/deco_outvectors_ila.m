close all
clc
clear all

EW = 8;                       % tamanho do expoente
FW = 18;                      % tamanho da mantissa

lookup = textread('fx_bin.txt', '%s');
result = csvread('iladata.csv');

out_hw      = result(:,4);
out_rdy_ila = result(:,5);
out_rdy     = find(out_rdy_ila==1);

result_hw_bin = out_hw(out_rdy);

A  = length(result_hw_bin);   % quantidade de amostras

result_hw = zeros(A, 1);
result_sw = zeros(A, 1);

for i=1:A
  result_hw(i, 1) = bin2float(EW, FW, dec2bin(result_hw_bin(i), 27));
  result_sw(i, 1) = bin2float(EW, FW, cell2mat(lookup(i)));
  erro(i) = sum((result_hw(i,:) - result_sw(i,:)).^2);
end

MSE = sum(erro)/A

plot(erro)
xlabel ("Amostras");
ylabel ("Erro");
title ("Comparacao Hw Vs. Sw [27 bits Vs. 64 bits] - ILA");
print('Hardware_VS_Software - ILA.png','-dpng');