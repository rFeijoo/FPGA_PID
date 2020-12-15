-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Tue Dec 15 04:09:08 2020
-- Host        : RAFAELFEIJL2C3E running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Mac/Home/Documents/Windows/Vivado/Projects/Interface_Arduino_Basys3/Interface_Arduino_Basys3.srcs/sources_1/ip/PID_0/PID_0_stub.vhdl
-- Design      : PID_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PID_0 is
  Port ( 
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    start : in STD_LOGIC;
    temp_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    setpoint : in STD_LOGIC_VECTOR ( 31 downto 0 );
    kP : in STD_LOGIC_VECTOR ( 31 downto 0 );
    kI : in STD_LOGIC_VECTOR ( 31 downto 0 );
    kD : in STD_LOGIC_VECTOR ( 31 downto 0 );
    PID : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ready : out STD_LOGIC
  );

end PID_0;

architecture stub of PID_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,rst,start,temp_in[7:0],setpoint[31:0],kP[31:0],kI[31:0],kD[31:0],PID[31:0],ready";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "top_module,Vivado 2018.3";
begin
end;
