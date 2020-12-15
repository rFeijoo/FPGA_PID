// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Tue Dec 15 05:30:55 2020
// Host        : RAFAELFEIJL2C3E running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Mac/Home/Documents/Windows/Vivado/Projects/Interface_Arduino_Basys3/Interface_Arduino_Basys3.srcs/sources_1/ip/VIO_0/VIO_0_stub.v
// Design      : VIO_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "vio,Vivado 2018.3" *)
module VIO_0(clk, probe_in0, probe_in1, probe_in2, probe_out0, 
  probe_out1, probe_out2, probe_out3, probe_out4)
/* synthesis syn_black_box black_box_pad_pin="clk,probe_in0[31:0],probe_in1[0:0],probe_in2[7:0],probe_out0[0:0],probe_out1[31:0],probe_out2[31:0],probe_out3[31:0],probe_out4[31:0]" */;
  input clk;
  input [31:0]probe_in0;
  input [0:0]probe_in1;
  input [7:0]probe_in2;
  output [0:0]probe_out0;
  output [31:0]probe_out1;
  output [31:0]probe_out2;
  output [31:0]probe_out3;
  output [31:0]probe_out4;
endmodule
