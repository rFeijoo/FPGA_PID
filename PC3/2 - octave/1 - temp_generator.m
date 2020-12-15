clear all;
close all;
clc;

FW = 23; % Mantissa length
EW = 8;  % Expoent length

t_min  = 22.25;
t_max  = 31.00;
v_size = 100;
temp_in = t_min + rand(1, v_size) * (t_max - t_min);

temp_in_float        = fopen('temp_in_float.txt', 'w');
temp_fixed_point_bin = fopen('temp_fixed_point_bin.txt', 'w');
temp_floating_bin    = fopen('temp_floating_bin.txt', 'w');

for cnt=1:length(temp_in)
    mag = fix(temp_in(cnt));
  dec = (temp_in(cnt) - mag) * 100;
  
  if (dec == 0 || dec < 13)
    dec = 0;
  elseif (dec > 12 && dec < 37)
    dec = 1;
  elseif (dec > 36 && dec < 63)
    dec = 2;
  elseif (dec > 62 && dec < 87)
    dec = 3;
  else {
    dec = 0;
    mag += 1;
  };
  endif

  bin = dec2bin(bitshift(mag, 2) + dec);
  p = bitget(bin2dec(bin), 2:-1:1);
  d = p(1) * 2^(-1) + p(2) * 2^(-2);
  f   = bitshift(bin2dec(bin), -2) + d;
  
  fprintf(temp_in_float, '%d:\t%f,\n', cnt, f);
  fprintf(temp_fixed_point_bin, '0%s\n', bin);
  fprintf(temp_floating_bin, '%s\n', float2bin(EW, FW, f));
end

fclose(temp_in_float);
fclose(temp_fixed_point_bin);
fclose(temp_floating_bin);