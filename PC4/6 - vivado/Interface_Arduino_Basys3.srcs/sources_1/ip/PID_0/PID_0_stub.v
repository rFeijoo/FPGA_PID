// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Tue Dec 15 04:09:08 2020
// Host        : RAFAELFEIJL2C3E running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Mac/Home/Documents/Windows/Vivado/Projects/Interface_Arduino_Basys3/Interface_Arduino_Basys3.srcs/sources_1/ip/PID_0/PID_0_stub.v
// Design      : PID_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "top_module,Vivado 2018.3" *)
module PID_0(clk, rst, start, temp_in, setpoint, kP, kI, kD, PID, ready)
/* synthesis syn_black_box black_box_pad_pin="clk,rst,start,temp_in[7:0],setpoint[31:0],kP[31:0],kI[31:0],kD[31:0],PID[31:0],ready" */;
  input clk;
  input rst;
  input start;
  input [7:0]temp_in;
  input [31:0]setpoint;
  input [31:0]kP;
  input [31:0]kI;
  input [31:0]kD;
  output [31:0]PID;
  output ready;
endmodule
