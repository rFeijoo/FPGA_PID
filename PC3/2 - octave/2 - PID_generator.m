clear all;
close all;
clc;

FW = 23; % Mantissa length
EW = 8;  % Expoent length

setPoint = 25.00;
kP = 2.5;
kI = 0.8;
kD = 1.2;

temp_file = textread('temp_floating_bin.txt', '%s');

error_float = fopen('error_float.txt', 'w');
error_bin   = fopen('error_bin.txt', 'w');

p_float = fopen('p_float.txt','w');
p_bin   = fopen('p_bin.txt', 'w');

i_float = fopen('i_float.txt','w');
i_bin   = fopen('i_bin.txt', 'w');

d_float = fopen('d_float.txt','w');
d_bin   = fopen('d_bin.txt', 'w');

pid_float = fopen('pid_float.txt','w');
pid_bin   = fopen('pid_bin.txt', 'w');

temp_in = zeros(100, 1);
error   = zeros(length(temp_in), 1);
P       = zeros(length(temp_in), 1);
I       = zeros(length(temp_in), 1);
D       = zeros(length(temp_in), 1);

for cnt=1:length(temp_in)
  temp_in(cnt) = bin2float(EW, FW, cell2mat(temp_file(cnt)));
  
  error(cnt) = setPoint - temp_in(cnt);
  
  fprintf(error_float, '%d:\t%f,\n', cnt, error(cnt));
  fprintf(error_bin, '%s\n', float2bin(EW, FW, error(cnt)));
  
  P(cnt) = error(cnt) * kP;
  
  fprintf(p_float, '%d:\t%f,\n', cnt, P(cnt));
  fprintf(p_bin, '%s\n', float2bin(EW, FW, P(cnt)));
  
  if (cnt > 1)
    I(cnt) = I(cnt - 1) + (error(cnt) * kI);
    D(cnt) = (D(cnt - 1) - error(cnt)) * kD;
  else
    I(cnt) = 0 + (error(cnt) * kI);
    D(cnt) = (0 - error(cnt)) * kD;
  endif
    
  fprintf(i_float, '%d:\t%f,\n', cnt, I(cnt));
  fprintf(i_bin, '%s\n', float2bin(EW, FW, I(cnt)));
  
  fprintf(d_float, '%d:\t%f,\n', cnt, D(cnt));
  fprintf(d_bin, '%s\n', float2bin(EW, FW, D(cnt)));
  
  fprintf(pid_float, '%d:\t%f,\n', cnt, P(cnt) + I(cnt) + D(cnt));
  fprintf(pid_bin, '%s\n', float2bin(EW, FW, P(cnt) + I(cnt) + D(cnt)));
end

fclose(error_float);
fclose(error_bin);

fclose(p_float);
fclose(p_bin);

fclose(i_float);
fclose(i_bin);

fclose(d_float);
fclose(d_bin);

fclose(pid_float);
fclose(pid_bin);