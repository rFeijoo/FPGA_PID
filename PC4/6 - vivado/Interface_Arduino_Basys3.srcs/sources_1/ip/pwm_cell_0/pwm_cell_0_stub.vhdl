-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Tue Dec 15 06:12:34 2020
-- Host        : RAFAELFEIJL2C3E running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Mac/Home/Documents/Windows/Vivado/Projects/Interface_Arduino_Basys3/Interface_Arduino_Basys3.srcs/sources_1/ip/pwm_cell_0/pwm_cell_0_stub.vhdl
-- Design      : pwm_cell_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pwm_cell_0 is
  Port ( 
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    duty : in STD_LOGIC_VECTOR ( 2 downto 0 );
    pwm : out STD_LOGIC
  );

end pwm_cell_0;

architecture stub of pwm_cell_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,rst,duty[2:0],pwm";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "pwm_cell,Vivado 2018.3";
begin
end;
