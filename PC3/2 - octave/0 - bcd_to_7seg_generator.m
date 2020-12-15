clear all;
close all;
clc;

############### INTEGER DECODER ###############
int_decod = fopen('bcd_to_7seg_int_decod.txt', 'w');

fprintf(int_decod, 'CASE int IS\n');

for i=0:31
  int = dec2bin(i);
  
  while (length(int) < 5)
    int = strcat("0", int);
  endwhile
  
  fprintf(int_decod, '\twhen "%s" =>\t--%d\n', int, i);
  
  if (i < 10)
      fprintf(int_decod, '\t\tdisp3 <= "%s";\n', dec_to_7seg(10));
      fprintf(int_decod, '\t\tdisp2 <= "%s";\n', dec_to_7seg(i));
  else
      x = fix(i / 10);
      y = i - (x * 10);
      fprintf(int_decod, '\t\tdisp3 <= "%s";\n', dec_to_7seg(x));
      fprintf(int_decod, '\t\tdisp2 <= "%s";\n', dec_to_7seg(y));
  endif
end

fprintf(int_decod, '\twhen others =>\n');
fprintf(int_decod, '\t\tdisp3 <= "%s";\n', dec_to_7seg(10));
fprintf(int_decod, '\t\tdisp2 <= "%s";\n', dec_to_7seg(10));
fprintf(int_decod, 'end CASE;');

fclose(int_decod);

############### DECIMAL DECODER ###############
dec_decod = fopen('bcd_to_7seg_dec_decod.txt', 'w');

fprintf(dec_decod, 'CASE dec IS\n');

for i=0:3
  int = dec2bin(i);
  
  while (length(int) < 2)
    int = strcat("0", int);
  endwhile
  
  fprintf(dec_decod, '\twhen "%s" =>\t--%d\n', int, i);
  
  if (i == 0)
    fprintf(dec_decod, '\t\tdisp1 <= "%s";\n', dec_to_7seg(0));
    fprintf(dec_decod, '\t\tdisp0 <= "%s";\n', dec_to_7seg(0));
  elseif (i == 1)
    fprintf(dec_decod, '\t\tdisp1 <= "%s";\n', dec_to_7seg(2));
    fprintf(dec_decod, '\t\tdisp0 <= "%s";\n', dec_to_7seg(5));
  elseif (i == 2)
    fprintf(dec_decod, '\t\tdisp1 <= "%s";\n', dec_to_7seg(5));
    fprintf(dec_decod, '\t\tdisp0 <= "%s";\n', dec_to_7seg(0));
  elseif (i == 3)
    fprintf(dec_decod, '\t\tdisp1 <= "%s";\n', dec_to_7seg(7));
    fprintf(dec_decod, '\t\tdisp0 <= "%s";\n', dec_to_7seg(5));
  endif
end

fprintf(dec_decod, '\twhen others =>\n');
fprintf(dec_decod, '\t\tdisp1 <= "%s";\n', dec_to_7seg(10));
fprintf(dec_decod, '\t\tdisp0 <= "%s";\n', dec_to_7seg(10));
fprintf(dec_decod, 'end CASE;');

fclose(dec_decod);