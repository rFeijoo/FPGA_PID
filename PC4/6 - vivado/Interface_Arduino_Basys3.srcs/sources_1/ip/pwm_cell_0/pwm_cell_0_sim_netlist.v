// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Tue Dec 15 06:12:34 2020
// Host        : RAFAELFEIJL2C3E running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Mac/Home/Documents/Windows/Vivado/Projects/Interface_Arduino_Basys3/Interface_Arduino_Basys3.srcs/sources_1/ip/pwm_cell_0/pwm_cell_0_sim_netlist.v
// Design      : pwm_cell_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "pwm_cell_0,pwm_cell,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "package_project" *) 
(* x_core_info = "pwm_cell,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module pwm_cell_0
   (clk,
    rst,
    duty,
    pwm);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 rst RST" *) (* x_interface_parameter = "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst;
  input [2:0]duty;
  output pwm;

  wire clk;
  wire [2:0]duty;
  wire pwm;
  wire rst;

  pwm_cell_0_pwm_cell U0
       (.clk(clk),
        .duty(duty),
        .pwm(pwm),
        .rst(rst));
endmodule

(* ORIG_REF_NAME = "pwm_cell" *) 
module pwm_cell_0_pwm_cell
   (pwm,
    clk,
    duty,
    rst);
  output pwm;
  input clk;
  input [2:0]duty;
  input rst;

  wire clk;
  wire [31:1]data0;
  wire [2:0]duty;
  wire pwm;
  wire rst;
  wire [31:0]s_clk_counter;
  wire [31:0]s_clk_counter_0;
  wire \s_clk_counter_reg[12]_i_2_n_0 ;
  wire \s_clk_counter_reg[12]_i_2_n_1 ;
  wire \s_clk_counter_reg[12]_i_2_n_2 ;
  wire \s_clk_counter_reg[12]_i_2_n_3 ;
  wire \s_clk_counter_reg[16]_i_2_n_0 ;
  wire \s_clk_counter_reg[16]_i_2_n_1 ;
  wire \s_clk_counter_reg[16]_i_2_n_2 ;
  wire \s_clk_counter_reg[16]_i_2_n_3 ;
  wire \s_clk_counter_reg[20]_i_2_n_0 ;
  wire \s_clk_counter_reg[20]_i_2_n_1 ;
  wire \s_clk_counter_reg[20]_i_2_n_2 ;
  wire \s_clk_counter_reg[20]_i_2_n_3 ;
  wire \s_clk_counter_reg[24]_i_2_n_0 ;
  wire \s_clk_counter_reg[24]_i_2_n_1 ;
  wire \s_clk_counter_reg[24]_i_2_n_2 ;
  wire \s_clk_counter_reg[24]_i_2_n_3 ;
  wire \s_clk_counter_reg[28]_i_2_n_0 ;
  wire \s_clk_counter_reg[28]_i_2_n_1 ;
  wire \s_clk_counter_reg[28]_i_2_n_2 ;
  wire \s_clk_counter_reg[28]_i_2_n_3 ;
  wire \s_clk_counter_reg[31]_i_2_n_2 ;
  wire \s_clk_counter_reg[31]_i_2_n_3 ;
  wire \s_clk_counter_reg[4]_i_2_n_0 ;
  wire \s_clk_counter_reg[4]_i_2_n_1 ;
  wire \s_clk_counter_reg[4]_i_2_n_2 ;
  wire \s_clk_counter_reg[4]_i_2_n_3 ;
  wire \s_clk_counter_reg[8]_i_2_n_0 ;
  wire \s_clk_counter_reg[8]_i_2_n_1 ;
  wire \s_clk_counter_reg[8]_i_2_n_2 ;
  wire \s_clk_counter_reg[8]_i_2_n_3 ;
  wire s_pwm0_carry__0_n_0;
  wire s_pwm0_carry__0_n_1;
  wire s_pwm0_carry__0_n_2;
  wire s_pwm0_carry__0_n_3;
  wire s_pwm0_carry__1_n_1;
  wire s_pwm0_carry__1_n_2;
  wire s_pwm0_carry__1_n_3;
  wire s_pwm0_carry_i_1__0_n_0;
  wire s_pwm0_carry_i_1__1_n_0;
  wire s_pwm0_carry_i_1_n_0;
  wire s_pwm0_carry_i_2__0_n_0;
  wire s_pwm0_carry_i_2__1_n_0;
  wire s_pwm0_carry_i_2_n_0;
  wire s_pwm0_carry_i_3__0_n_0;
  wire s_pwm0_carry_i_3__1_n_0;
  wire s_pwm0_carry_i_3_n_0;
  wire s_pwm0_carry_i_4__0_n_0;
  wire s_pwm0_carry_i_4_n_0;
  wire s_pwm0_carry_n_0;
  wire s_pwm0_carry_n_1;
  wire s_pwm0_carry_n_2;
  wire s_pwm0_carry_n_3;
  wire s_pwm_i_1_n_0;
  wire s_pwm_i_2_n_0;
  wire s_pwm_i_3_n_0;
  wire s_pwm_i_4_n_0;
  wire s_pwm_i_5_n_0;
  wire s_pwm_i_6_n_0;
  wire s_pwm_i_7_n_0;
  wire s_pwm_i_8_n_0;
  wire s_pwm_i_9_n_0;
  wire [3:2]\NLW_s_clk_counter_reg[31]_i_2_CO_UNCONNECTED ;
  wire [3:3]\NLW_s_clk_counter_reg[31]_i_2_O_UNCONNECTED ;
  wire [3:0]NLW_s_pwm0_carry_O_UNCONNECTED;
  wire [3:0]NLW_s_pwm0_carry__0_O_UNCONNECTED;
  wire [3:3]NLW_s_pwm0_carry__1_CO_UNCONNECTED;
  wire [3:0]NLW_s_pwm0_carry__1_O_UNCONNECTED;

  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \s_clk_counter[0]_i_1 
       (.I0(s_clk_counter[0]),
        .O(s_clk_counter_0[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_clk_counter[10]_i_1 
       (.I0(s_pwm_i_3_n_0),
        .I1(data0[10]),
        .O(s_clk_counter_0[10]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_clk_counter[11]_i_1 
       (.I0(s_pwm_i_3_n_0),
        .I1(data0[11]),
        .O(s_clk_counter_0[11]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_clk_counter[12]_i_1 
       (.I0(s_pwm_i_3_n_0),
        .I1(data0[12]),
        .O(s_clk_counter_0[12]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_clk_counter[13]_i_1 
       (.I0(s_pwm_i_3_n_0),
        .I1(data0[13]),
        .O(s_clk_counter_0[13]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_clk_counter[14]_i_1 
       (.I0(s_pwm_i_3_n_0),
        .I1(data0[14]),
        .O(s_clk_counter_0[14]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_clk_counter[15]_i_1 
       (.I0(s_pwm_i_3_n_0),
        .I1(data0[15]),
        .O(s_clk_counter_0[15]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_clk_counter[16]_i_1 
       (.I0(s_pwm_i_3_n_0),
        .I1(data0[16]),
        .O(s_clk_counter_0[16]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_clk_counter[17]_i_1 
       (.I0(s_pwm_i_3_n_0),
        .I1(data0[17]),
        .O(s_clk_counter_0[17]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_clk_counter[18]_i_1 
       (.I0(s_pwm_i_3_n_0),
        .I1(data0[18]),
        .O(s_clk_counter_0[18]));
  LUT2 #(
    .INIT(4'h8)) 
    \s_clk_counter[19]_i_1 
       (.I0(s_pwm_i_3_n_0),
        .I1(data0[19]),
        .O(s_clk_counter_0[19]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_clk_counter[1]_i_1 
       (.I0(s_pwm_i_3_n_0),
        .I1(data0[1]),
        .O(s_clk_counter_0[1]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_clk_counter[20]_i_1 
       (.I0(s_pwm_i_3_n_0),
        .I1(data0[20]),
        .O(s_clk_counter_0[20]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_clk_counter[21]_i_1 
       (.I0(s_pwm_i_3_n_0),
        .I1(data0[21]),
        .O(s_clk_counter_0[21]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_clk_counter[22]_i_1 
       (.I0(s_pwm_i_3_n_0),
        .I1(data0[22]),
        .O(s_clk_counter_0[22]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_clk_counter[23]_i_1 
       (.I0(s_pwm_i_3_n_0),
        .I1(data0[23]),
        .O(s_clk_counter_0[23]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_clk_counter[24]_i_1 
       (.I0(s_pwm_i_3_n_0),
        .I1(data0[24]),
        .O(s_clk_counter_0[24]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_clk_counter[25]_i_1 
       (.I0(s_pwm_i_3_n_0),
        .I1(data0[25]),
        .O(s_clk_counter_0[25]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_clk_counter[26]_i_1 
       (.I0(s_pwm_i_3_n_0),
        .I1(data0[26]),
        .O(s_clk_counter_0[26]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_clk_counter[27]_i_1 
       (.I0(s_pwm_i_3_n_0),
        .I1(data0[27]),
        .O(s_clk_counter_0[27]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_clk_counter[28]_i_1 
       (.I0(s_pwm_i_3_n_0),
        .I1(data0[28]),
        .O(s_clk_counter_0[28]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_clk_counter[29]_i_1 
       (.I0(s_pwm_i_3_n_0),
        .I1(data0[29]),
        .O(s_clk_counter_0[29]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_clk_counter[2]_i_1 
       (.I0(s_pwm_i_3_n_0),
        .I1(data0[2]),
        .O(s_clk_counter_0[2]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_clk_counter[30]_i_1 
       (.I0(s_pwm_i_3_n_0),
        .I1(data0[30]),
        .O(s_clk_counter_0[30]));
  LUT2 #(
    .INIT(4'h8)) 
    \s_clk_counter[31]_i_1 
       (.I0(s_pwm_i_3_n_0),
        .I1(data0[31]),
        .O(s_clk_counter_0[31]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_clk_counter[3]_i_1 
       (.I0(s_pwm_i_3_n_0),
        .I1(data0[3]),
        .O(s_clk_counter_0[3]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_clk_counter[4]_i_1 
       (.I0(s_pwm_i_3_n_0),
        .I1(data0[4]),
        .O(s_clk_counter_0[4]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_clk_counter[5]_i_1 
       (.I0(s_pwm_i_3_n_0),
        .I1(data0[5]),
        .O(s_clk_counter_0[5]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_clk_counter[6]_i_1 
       (.I0(s_pwm_i_3_n_0),
        .I1(data0[6]),
        .O(s_clk_counter_0[6]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_clk_counter[7]_i_1 
       (.I0(s_pwm_i_3_n_0),
        .I1(data0[7]),
        .O(s_clk_counter_0[7]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_clk_counter[8]_i_1 
       (.I0(s_pwm_i_3_n_0),
        .I1(data0[8]),
        .O(s_clk_counter_0[8]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_clk_counter[9]_i_1 
       (.I0(s_pwm_i_3_n_0),
        .I1(data0[9]),
        .O(s_clk_counter_0[9]));
  FDPE #(
    .INIT(1'b1)) 
    \s_clk_counter_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(s_clk_counter_0[0]),
        .PRE(s_pwm_i_2_n_0),
        .Q(s_clk_counter[0]));
  FDPE #(
    .INIT(1'b1)) 
    \s_clk_counter_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(s_clk_counter_0[10]),
        .PRE(s_pwm_i_2_n_0),
        .Q(s_clk_counter[10]));
  FDCE #(
    .INIT(1'b0)) 
    \s_clk_counter_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .CLR(s_pwm_i_2_n_0),
        .D(s_clk_counter_0[11]),
        .Q(s_clk_counter[11]));
  FDPE #(
    .INIT(1'b1)) 
    \s_clk_counter_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(s_clk_counter_0[12]),
        .PRE(s_pwm_i_2_n_0),
        .Q(s_clk_counter[12]));
  CARRY4 \s_clk_counter_reg[12]_i_2 
       (.CI(\s_clk_counter_reg[8]_i_2_n_0 ),
        .CO({\s_clk_counter_reg[12]_i_2_n_0 ,\s_clk_counter_reg[12]_i_2_n_1 ,\s_clk_counter_reg[12]_i_2_n_2 ,\s_clk_counter_reg[12]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[12:9]),
        .S(s_clk_counter[12:9]));
  FDPE #(
    .INIT(1'b1)) 
    \s_clk_counter_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(s_clk_counter_0[13]),
        .PRE(s_pwm_i_2_n_0),
        .Q(s_clk_counter[13]));
  FDCE #(
    .INIT(1'b0)) 
    \s_clk_counter_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .CLR(s_pwm_i_2_n_0),
        .D(s_clk_counter_0[14]),
        .Q(s_clk_counter[14]));
  FDPE #(
    .INIT(1'b1)) 
    \s_clk_counter_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(s_clk_counter_0[15]),
        .PRE(s_pwm_i_2_n_0),
        .Q(s_clk_counter[15]));
  FDCE #(
    .INIT(1'b0)) 
    \s_clk_counter_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .CLR(s_pwm_i_2_n_0),
        .D(s_clk_counter_0[16]),
        .Q(s_clk_counter[16]));
  CARRY4 \s_clk_counter_reg[16]_i_2 
       (.CI(\s_clk_counter_reg[12]_i_2_n_0 ),
        .CO({\s_clk_counter_reg[16]_i_2_n_0 ,\s_clk_counter_reg[16]_i_2_n_1 ,\s_clk_counter_reg[16]_i_2_n_2 ,\s_clk_counter_reg[16]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[16:13]),
        .S(s_clk_counter[16:13]));
  FDCE #(
    .INIT(1'b0)) 
    \s_clk_counter_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .CLR(s_pwm_i_2_n_0),
        .D(s_clk_counter_0[17]),
        .Q(s_clk_counter[17]));
  FDPE #(
    .INIT(1'b1)) 
    \s_clk_counter_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(s_clk_counter_0[18]),
        .PRE(s_pwm_i_2_n_0),
        .Q(s_clk_counter[18]));
  FDPE #(
    .INIT(1'b1)) 
    \s_clk_counter_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(s_clk_counter_0[19]),
        .PRE(s_pwm_i_2_n_0),
        .Q(s_clk_counter[19]));
  FDCE #(
    .INIT(1'b0)) 
    \s_clk_counter_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(s_pwm_i_2_n_0),
        .D(s_clk_counter_0[1]),
        .Q(s_clk_counter[1]));
  FDCE #(
    .INIT(1'b0)) 
    \s_clk_counter_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .CLR(s_pwm_i_2_n_0),
        .D(s_clk_counter_0[20]),
        .Q(s_clk_counter[20]));
  CARRY4 \s_clk_counter_reg[20]_i_2 
       (.CI(\s_clk_counter_reg[16]_i_2_n_0 ),
        .CO({\s_clk_counter_reg[20]_i_2_n_0 ,\s_clk_counter_reg[20]_i_2_n_1 ,\s_clk_counter_reg[20]_i_2_n_2 ,\s_clk_counter_reg[20]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[20:17]),
        .S(s_clk_counter[20:17]));
  FDCE #(
    .INIT(1'b0)) 
    \s_clk_counter_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .CLR(s_pwm_i_2_n_0),
        .D(s_clk_counter_0[21]),
        .Q(s_clk_counter[21]));
  FDCE #(
    .INIT(1'b0)) 
    \s_clk_counter_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .CLR(s_pwm_i_2_n_0),
        .D(s_clk_counter_0[22]),
        .Q(s_clk_counter[22]));
  FDCE #(
    .INIT(1'b0)) 
    \s_clk_counter_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .CLR(s_pwm_i_2_n_0),
        .D(s_clk_counter_0[23]),
        .Q(s_clk_counter[23]));
  FDCE #(
    .INIT(1'b0)) 
    \s_clk_counter_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .CLR(s_pwm_i_2_n_0),
        .D(s_clk_counter_0[24]),
        .Q(s_clk_counter[24]));
  CARRY4 \s_clk_counter_reg[24]_i_2 
       (.CI(\s_clk_counter_reg[20]_i_2_n_0 ),
        .CO({\s_clk_counter_reg[24]_i_2_n_0 ,\s_clk_counter_reg[24]_i_2_n_1 ,\s_clk_counter_reg[24]_i_2_n_2 ,\s_clk_counter_reg[24]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[24:21]),
        .S(s_clk_counter[24:21]));
  FDCE #(
    .INIT(1'b0)) 
    \s_clk_counter_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .CLR(s_pwm_i_2_n_0),
        .D(s_clk_counter_0[25]),
        .Q(s_clk_counter[25]));
  FDCE #(
    .INIT(1'b0)) 
    \s_clk_counter_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .CLR(s_pwm_i_2_n_0),
        .D(s_clk_counter_0[26]),
        .Q(s_clk_counter[26]));
  FDCE #(
    .INIT(1'b0)) 
    \s_clk_counter_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .CLR(s_pwm_i_2_n_0),
        .D(s_clk_counter_0[27]),
        .Q(s_clk_counter[27]));
  FDCE #(
    .INIT(1'b0)) 
    \s_clk_counter_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .CLR(s_pwm_i_2_n_0),
        .D(s_clk_counter_0[28]),
        .Q(s_clk_counter[28]));
  CARRY4 \s_clk_counter_reg[28]_i_2 
       (.CI(\s_clk_counter_reg[24]_i_2_n_0 ),
        .CO({\s_clk_counter_reg[28]_i_2_n_0 ,\s_clk_counter_reg[28]_i_2_n_1 ,\s_clk_counter_reg[28]_i_2_n_2 ,\s_clk_counter_reg[28]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[28:25]),
        .S(s_clk_counter[28:25]));
  FDCE #(
    .INIT(1'b0)) 
    \s_clk_counter_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .CLR(s_pwm_i_2_n_0),
        .D(s_clk_counter_0[29]),
        .Q(s_clk_counter[29]));
  FDPE #(
    .INIT(1'b1)) 
    \s_clk_counter_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(s_clk_counter_0[2]),
        .PRE(s_pwm_i_2_n_0),
        .Q(s_clk_counter[2]));
  FDCE #(
    .INIT(1'b0)) 
    \s_clk_counter_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .CLR(s_pwm_i_2_n_0),
        .D(s_clk_counter_0[30]),
        .Q(s_clk_counter[30]));
  FDCE #(
    .INIT(1'b0)) 
    \s_clk_counter_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .CLR(s_pwm_i_2_n_0),
        .D(s_clk_counter_0[31]),
        .Q(s_clk_counter[31]));
  CARRY4 \s_clk_counter_reg[31]_i_2 
       (.CI(\s_clk_counter_reg[28]_i_2_n_0 ),
        .CO({\NLW_s_clk_counter_reg[31]_i_2_CO_UNCONNECTED [3:2],\s_clk_counter_reg[31]_i_2_n_2 ,\s_clk_counter_reg[31]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_s_clk_counter_reg[31]_i_2_O_UNCONNECTED [3],data0[31:29]}),
        .S({1'b0,s_clk_counter[31:29]}));
  FDCE #(
    .INIT(1'b0)) 
    \s_clk_counter_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(s_pwm_i_2_n_0),
        .D(s_clk_counter_0[3]),
        .Q(s_clk_counter[3]));
  FDPE #(
    .INIT(1'b1)) 
    \s_clk_counter_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(s_clk_counter_0[4]),
        .PRE(s_pwm_i_2_n_0),
        .Q(s_clk_counter[4]));
  CARRY4 \s_clk_counter_reg[4]_i_2 
       (.CI(1'b0),
        .CO({\s_clk_counter_reg[4]_i_2_n_0 ,\s_clk_counter_reg[4]_i_2_n_1 ,\s_clk_counter_reg[4]_i_2_n_2 ,\s_clk_counter_reg[4]_i_2_n_3 }),
        .CYINIT(s_clk_counter[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[4:1]),
        .S(s_clk_counter[4:1]));
  FDPE #(
    .INIT(1'b1)) 
    \s_clk_counter_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(s_clk_counter_0[5]),
        .PRE(s_pwm_i_2_n_0),
        .Q(s_clk_counter[5]));
  FDCE #(
    .INIT(1'b0)) 
    \s_clk_counter_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .CLR(s_pwm_i_2_n_0),
        .D(s_clk_counter_0[6]),
        .Q(s_clk_counter[6]));
  FDCE #(
    .INIT(1'b0)) 
    \s_clk_counter_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .CLR(s_pwm_i_2_n_0),
        .D(s_clk_counter_0[7]),
        .Q(s_clk_counter[7]));
  FDPE #(
    .INIT(1'b1)) 
    \s_clk_counter_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(s_clk_counter_0[8]),
        .PRE(s_pwm_i_2_n_0),
        .Q(s_clk_counter[8]));
  CARRY4 \s_clk_counter_reg[8]_i_2 
       (.CI(\s_clk_counter_reg[4]_i_2_n_0 ),
        .CO({\s_clk_counter_reg[8]_i_2_n_0 ,\s_clk_counter_reg[8]_i_2_n_1 ,\s_clk_counter_reg[8]_i_2_n_2 ,\s_clk_counter_reg[8]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:5]),
        .S(s_clk_counter[8:5]));
  FDPE #(
    .INIT(1'b1)) 
    \s_clk_counter_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(s_clk_counter_0[9]),
        .PRE(s_pwm_i_2_n_0),
        .Q(s_clk_counter[9]));
  CARRY4 s_pwm0_carry
       (.CI(1'b0),
        .CO({s_pwm0_carry_n_0,s_pwm0_carry_n_1,s_pwm0_carry_n_2,s_pwm0_carry_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_s_pwm0_carry_O_UNCONNECTED[3:0]),
        .S({s_pwm0_carry_i_1_n_0,s_pwm0_carry_i_2_n_0,s_pwm0_carry_i_3__0_n_0,s_pwm0_carry_i_4__0_n_0}));
  CARRY4 s_pwm0_carry__0
       (.CI(s_pwm0_carry_n_0),
        .CO({s_pwm0_carry__0_n_0,s_pwm0_carry__0_n_1,s_pwm0_carry__0_n_2,s_pwm0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_s_pwm0_carry__0_O_UNCONNECTED[3:0]),
        .S({s_pwm0_carry_i_1__0_n_0,s_pwm0_carry_i_2__0_n_0,s_pwm0_carry_i_3_n_0,s_pwm0_carry_i_4_n_0}));
  CARRY4 s_pwm0_carry__1
       (.CI(s_pwm0_carry__0_n_0),
        .CO({NLW_s_pwm0_carry__1_CO_UNCONNECTED[3],s_pwm0_carry__1_n_1,s_pwm0_carry__1_n_2,s_pwm0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_s_pwm0_carry__1_O_UNCONNECTED[3:0]),
        .S({1'b0,s_pwm0_carry_i_1__1_n_0,s_pwm0_carry_i_2__1_n_0,s_pwm0_carry_i_3__1_n_0}));
  LUT6 #(
    .INIT(64'h0C00006000062001)) 
    s_pwm0_carry_i_1
       (.I0(duty[2]),
        .I1(s_clk_counter[10]),
        .I2(s_clk_counter[11]),
        .I3(s_clk_counter[9]),
        .I4(duty[0]),
        .I5(duty[1]),
        .O(s_pwm0_carry_i_1_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    s_pwm0_carry_i_1__0
       (.I0(s_clk_counter[21]),
        .I1(s_clk_counter[22]),
        .I2(s_clk_counter[23]),
        .O(s_pwm0_carry_i_1__0_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    s_pwm0_carry_i_1__1
       (.I0(s_clk_counter[31]),
        .I1(s_clk_counter[30]),
        .O(s_pwm0_carry_i_1__1_n_0));
  LUT6 #(
    .INIT(64'h0404084001408001)) 
    s_pwm0_carry_i_2
       (.I0(s_clk_counter[6]),
        .I1(s_clk_counter[8]),
        .I2(s_clk_counter[7]),
        .I3(duty[1]),
        .I4(duty[0]),
        .I5(duty[2]),
        .O(s_pwm0_carry_i_2_n_0));
  LUT6 #(
    .INIT(64'h2002020110010201)) 
    s_pwm0_carry_i_2__0
       (.I0(s_clk_counter[18]),
        .I1(s_clk_counter[20]),
        .I2(s_clk_counter[19]),
        .I3(duty[2]),
        .I4(duty[1]),
        .I5(duty[0]),
        .O(s_pwm0_carry_i_2__0_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    s_pwm0_carry_i_2__1
       (.I0(s_clk_counter[27]),
        .I1(s_clk_counter[28]),
        .I2(s_clk_counter[29]),
        .O(s_pwm0_carry_i_2__1_n_0));
  LUT6 #(
    .INIT(64'h0204800408401001)) 
    s_pwm0_carry_i_3
       (.I0(s_clk_counter[15]),
        .I1(s_clk_counter[16]),
        .I2(s_clk_counter[17]),
        .I3(duty[2]),
        .I4(duty[1]),
        .I5(duty[0]),
        .O(s_pwm0_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h2010400102044001)) 
    s_pwm0_carry_i_3__0
       (.I0(s_clk_counter[5]),
        .I1(s_clk_counter[3]),
        .I2(s_clk_counter[4]),
        .I3(duty[2]),
        .I4(duty[1]),
        .I5(duty[0]),
        .O(s_pwm0_carry_i_3__0_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    s_pwm0_carry_i_3__1
       (.I0(s_clk_counter[24]),
        .I1(s_clk_counter[25]),
        .I2(s_clk_counter[26]),
        .O(s_pwm0_carry_i_3__1_n_0));
  LUT6 #(
    .INIT(64'h2010020401024001)) 
    s_pwm0_carry_i_4
       (.I0(s_clk_counter[13]),
        .I1(s_clk_counter[14]),
        .I2(s_clk_counter[12]),
        .I3(duty[2]),
        .I4(duty[1]),
        .I5(duty[0]),
        .O(s_pwm0_carry_i_4_n_0));
  LUT6 #(
    .INIT(64'h2400201000820201)) 
    s_pwm0_carry_i_4__0
       (.I0(s_clk_counter[2]),
        .I1(s_clk_counter[1]),
        .I2(duty[2]),
        .I3(duty[0]),
        .I4(duty[1]),
        .I5(s_clk_counter[0]),
        .O(s_pwm0_carry_i_4__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h73)) 
    s_pwm_i_1
       (.I0(s_pwm0_carry__1_n_1),
        .I1(s_pwm_i_3_n_0),
        .I2(pwm),
        .O(s_pwm_i_1_n_0));
  LUT4 #(
    .INIT(16'hFF01)) 
    s_pwm_i_2
       (.I0(duty[2]),
        .I1(duty[0]),
        .I2(duty[1]),
        .I3(rst),
        .O(s_pwm_i_2_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    s_pwm_i_3
       (.I0(s_pwm_i_4_n_0),
        .I1(s_pwm_i_5_n_0),
        .I2(s_pwm_i_6_n_0),
        .I3(s_pwm_i_7_n_0),
        .I4(s_pwm_i_8_n_0),
        .I5(s_pwm_i_9_n_0),
        .O(s_pwm_i_3_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    s_pwm_i_4
       (.I0(s_clk_counter[27]),
        .I1(s_clk_counter[28]),
        .I2(s_clk_counter[29]),
        .I3(s_clk_counter[31]),
        .I4(s_clk_counter[30]),
        .O(s_pwm_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    s_pwm_i_5
       (.I0(s_clk_counter[2]),
        .I1(s_clk_counter[1]),
        .I2(s_clk_counter[0]),
        .O(s_pwm_i_5_n_0));
  LUT6 #(
    .INIT(64'hFFFFFDFFFFFFFFFF)) 
    s_pwm_i_6
       (.I0(s_clk_counter[15]),
        .I1(s_clk_counter[16]),
        .I2(s_clk_counter[17]),
        .I3(s_clk_counter[19]),
        .I4(s_clk_counter[20]),
        .I5(s_clk_counter[18]),
        .O(s_pwm_i_6_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    s_pwm_i_7
       (.I0(s_clk_counter[21]),
        .I1(s_clk_counter[22]),
        .I2(s_clk_counter[23]),
        .I3(s_clk_counter[24]),
        .I4(s_clk_counter[25]),
        .I5(s_clk_counter[26]),
        .O(s_pwm_i_7_n_0));
  LUT6 #(
    .INIT(64'hFFFFDFFFFFFFFFFF)) 
    s_pwm_i_8
       (.I0(s_clk_counter[9]),
        .I1(s_clk_counter[11]),
        .I2(s_clk_counter[10]),
        .I3(s_clk_counter[12]),
        .I4(s_clk_counter[14]),
        .I5(s_clk_counter[13]),
        .O(s_pwm_i_8_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFDFFFFFFFFF)) 
    s_pwm_i_9
       (.I0(s_clk_counter[4]),
        .I1(s_clk_counter[3]),
        .I2(s_clk_counter[5]),
        .I3(s_clk_counter[7]),
        .I4(s_clk_counter[6]),
        .I5(s_clk_counter[8]),
        .O(s_pwm_i_9_n_0));
  FDCE #(
    .INIT(1'b0)) 
    s_pwm_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(s_pwm_i_2_n_0),
        .D(s_pwm_i_1_n_0),
        .Q(pwm));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
