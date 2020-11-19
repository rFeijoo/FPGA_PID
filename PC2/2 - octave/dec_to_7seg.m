% Authors: Rafael Feijó Leonardo
% Date: 09 nov 2020

% This function receives a decimal number (0 to 9)
% and converts it to its 7seg representation.

function [f] = dec_to_7seg(num)

switch (num)
  case 0
    f = "0000001";
  case 1
    f = "1001111";
  case 2
    f = "0010010";
  case 3
    f = "0000110";
  case 4
    f = "1001100";
  case 5
    f = "0100100";
  case 6
    f = "1100000";
  case 7
    f = "0001111";
  case 8
    f = "0000000";
  case 9
    f = "0000100";    
  otherwise
    f = "1111111";
endswitch