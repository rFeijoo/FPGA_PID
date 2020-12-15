// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Tue Dec 15 06:12:33 2020
// Host        : RAFAELFEIJL2C3E running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Mac/Home/Documents/Windows/Vivado/Projects/Interface_Arduino_Basys3/Interface_Arduino_Basys3.srcs/sources_1/ip/pwm_cell_0/pwm_cell_0_stub.v
// Design      : pwm_cell_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "pwm_cell,Vivado 2018.3" *)
module pwm_cell_0(clk, rst, duty, pwm)
/* synthesis syn_black_box black_box_pad_pin="clk,rst,duty[2:0],pwm" */;
  input clk;
  input rst;
  input [2:0]duty;
  output pwm;
endmodule
