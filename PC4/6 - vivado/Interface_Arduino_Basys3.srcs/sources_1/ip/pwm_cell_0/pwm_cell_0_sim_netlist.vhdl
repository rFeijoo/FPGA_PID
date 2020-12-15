-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Tue Dec 15 06:12:34 2020
-- Host        : RAFAELFEIJL2C3E running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Mac/Home/Documents/Windows/Vivado/Projects/Interface_Arduino_Basys3/Interface_Arduino_Basys3.srcs/sources_1/ip/pwm_cell_0/pwm_cell_0_sim_netlist.vhdl
-- Design      : pwm_cell_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm_cell_0_pwm_cell is
  port (
    pwm : out STD_LOGIC;
    clk : in STD_LOGIC;
    duty : in STD_LOGIC_VECTOR ( 2 downto 0 );
    rst : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of pwm_cell_0_pwm_cell : entity is "pwm_cell";
end pwm_cell_0_pwm_cell;

architecture STRUCTURE of pwm_cell_0_pwm_cell is
  signal data0 : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal \^pwm\ : STD_LOGIC;
  signal s_clk_counter : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s_clk_counter_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \s_clk_counter_reg[12]_i_2_n_0\ : STD_LOGIC;
  signal \s_clk_counter_reg[12]_i_2_n_1\ : STD_LOGIC;
  signal \s_clk_counter_reg[12]_i_2_n_2\ : STD_LOGIC;
  signal \s_clk_counter_reg[12]_i_2_n_3\ : STD_LOGIC;
  signal \s_clk_counter_reg[16]_i_2_n_0\ : STD_LOGIC;
  signal \s_clk_counter_reg[16]_i_2_n_1\ : STD_LOGIC;
  signal \s_clk_counter_reg[16]_i_2_n_2\ : STD_LOGIC;
  signal \s_clk_counter_reg[16]_i_2_n_3\ : STD_LOGIC;
  signal \s_clk_counter_reg[20]_i_2_n_0\ : STD_LOGIC;
  signal \s_clk_counter_reg[20]_i_2_n_1\ : STD_LOGIC;
  signal \s_clk_counter_reg[20]_i_2_n_2\ : STD_LOGIC;
  signal \s_clk_counter_reg[20]_i_2_n_3\ : STD_LOGIC;
  signal \s_clk_counter_reg[24]_i_2_n_0\ : STD_LOGIC;
  signal \s_clk_counter_reg[24]_i_2_n_1\ : STD_LOGIC;
  signal \s_clk_counter_reg[24]_i_2_n_2\ : STD_LOGIC;
  signal \s_clk_counter_reg[24]_i_2_n_3\ : STD_LOGIC;
  signal \s_clk_counter_reg[28]_i_2_n_0\ : STD_LOGIC;
  signal \s_clk_counter_reg[28]_i_2_n_1\ : STD_LOGIC;
  signal \s_clk_counter_reg[28]_i_2_n_2\ : STD_LOGIC;
  signal \s_clk_counter_reg[28]_i_2_n_3\ : STD_LOGIC;
  signal \s_clk_counter_reg[31]_i_2_n_2\ : STD_LOGIC;
  signal \s_clk_counter_reg[31]_i_2_n_3\ : STD_LOGIC;
  signal \s_clk_counter_reg[4]_i_2_n_0\ : STD_LOGIC;
  signal \s_clk_counter_reg[4]_i_2_n_1\ : STD_LOGIC;
  signal \s_clk_counter_reg[4]_i_2_n_2\ : STD_LOGIC;
  signal \s_clk_counter_reg[4]_i_2_n_3\ : STD_LOGIC;
  signal \s_clk_counter_reg[8]_i_2_n_0\ : STD_LOGIC;
  signal \s_clk_counter_reg[8]_i_2_n_1\ : STD_LOGIC;
  signal \s_clk_counter_reg[8]_i_2_n_2\ : STD_LOGIC;
  signal \s_clk_counter_reg[8]_i_2_n_3\ : STD_LOGIC;
  signal \s_pwm0_carry__0_n_0\ : STD_LOGIC;
  signal \s_pwm0_carry__0_n_1\ : STD_LOGIC;
  signal \s_pwm0_carry__0_n_2\ : STD_LOGIC;
  signal \s_pwm0_carry__0_n_3\ : STD_LOGIC;
  signal \s_pwm0_carry__1_n_1\ : STD_LOGIC;
  signal \s_pwm0_carry__1_n_2\ : STD_LOGIC;
  signal \s_pwm0_carry__1_n_3\ : STD_LOGIC;
  signal \s_pwm0_carry_i_1__0_n_0\ : STD_LOGIC;
  signal \s_pwm0_carry_i_1__1_n_0\ : STD_LOGIC;
  signal s_pwm0_carry_i_1_n_0 : STD_LOGIC;
  signal \s_pwm0_carry_i_2__0_n_0\ : STD_LOGIC;
  signal \s_pwm0_carry_i_2__1_n_0\ : STD_LOGIC;
  signal s_pwm0_carry_i_2_n_0 : STD_LOGIC;
  signal \s_pwm0_carry_i_3__0_n_0\ : STD_LOGIC;
  signal \s_pwm0_carry_i_3__1_n_0\ : STD_LOGIC;
  signal s_pwm0_carry_i_3_n_0 : STD_LOGIC;
  signal \s_pwm0_carry_i_4__0_n_0\ : STD_LOGIC;
  signal s_pwm0_carry_i_4_n_0 : STD_LOGIC;
  signal s_pwm0_carry_n_0 : STD_LOGIC;
  signal s_pwm0_carry_n_1 : STD_LOGIC;
  signal s_pwm0_carry_n_2 : STD_LOGIC;
  signal s_pwm0_carry_n_3 : STD_LOGIC;
  signal s_pwm_i_1_n_0 : STD_LOGIC;
  signal s_pwm_i_2_n_0 : STD_LOGIC;
  signal s_pwm_i_3_n_0 : STD_LOGIC;
  signal s_pwm_i_4_n_0 : STD_LOGIC;
  signal s_pwm_i_5_n_0 : STD_LOGIC;
  signal s_pwm_i_6_n_0 : STD_LOGIC;
  signal s_pwm_i_7_n_0 : STD_LOGIC;
  signal s_pwm_i_8_n_0 : STD_LOGIC;
  signal s_pwm_i_9_n_0 : STD_LOGIC;
  signal \NLW_s_clk_counter_reg[31]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_s_clk_counter_reg[31]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_s_pwm0_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_s_pwm0_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_s_pwm0_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_s_pwm0_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \s_clk_counter[0]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \s_clk_counter[10]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \s_clk_counter[11]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \s_clk_counter[12]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \s_clk_counter[13]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \s_clk_counter[14]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \s_clk_counter[15]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \s_clk_counter[16]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \s_clk_counter[17]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \s_clk_counter[18]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \s_clk_counter[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \s_clk_counter[20]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \s_clk_counter[21]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \s_clk_counter[22]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \s_clk_counter[23]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \s_clk_counter[24]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \s_clk_counter[25]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \s_clk_counter[26]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \s_clk_counter[27]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \s_clk_counter[28]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \s_clk_counter[29]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \s_clk_counter[2]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \s_clk_counter[30]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \s_clk_counter[3]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \s_clk_counter[4]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \s_clk_counter[5]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \s_clk_counter[6]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \s_clk_counter[7]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \s_clk_counter[8]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \s_clk_counter[9]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of s_pwm_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of s_pwm_i_5 : label is "soft_lutpair1";
begin
  pwm <= \^pwm\;
\s_clk_counter[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_clk_counter(0),
      O => s_clk_counter_0(0)
    );
\s_clk_counter[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_pwm_i_3_n_0,
      I1 => data0(10),
      O => s_clk_counter_0(10)
    );
\s_clk_counter[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_pwm_i_3_n_0,
      I1 => data0(11),
      O => s_clk_counter_0(11)
    );
\s_clk_counter[12]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_pwm_i_3_n_0,
      I1 => data0(12),
      O => s_clk_counter_0(12)
    );
\s_clk_counter[13]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_pwm_i_3_n_0,
      I1 => data0(13),
      O => s_clk_counter_0(13)
    );
\s_clk_counter[14]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_pwm_i_3_n_0,
      I1 => data0(14),
      O => s_clk_counter_0(14)
    );
\s_clk_counter[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_pwm_i_3_n_0,
      I1 => data0(15),
      O => s_clk_counter_0(15)
    );
\s_clk_counter[16]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_pwm_i_3_n_0,
      I1 => data0(16),
      O => s_clk_counter_0(16)
    );
\s_clk_counter[17]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_pwm_i_3_n_0,
      I1 => data0(17),
      O => s_clk_counter_0(17)
    );
\s_clk_counter[18]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_pwm_i_3_n_0,
      I1 => data0(18),
      O => s_clk_counter_0(18)
    );
\s_clk_counter[19]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_pwm_i_3_n_0,
      I1 => data0(19),
      O => s_clk_counter_0(19)
    );
\s_clk_counter[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_pwm_i_3_n_0,
      I1 => data0(1),
      O => s_clk_counter_0(1)
    );
\s_clk_counter[20]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_pwm_i_3_n_0,
      I1 => data0(20),
      O => s_clk_counter_0(20)
    );
\s_clk_counter[21]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_pwm_i_3_n_0,
      I1 => data0(21),
      O => s_clk_counter_0(21)
    );
\s_clk_counter[22]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_pwm_i_3_n_0,
      I1 => data0(22),
      O => s_clk_counter_0(22)
    );
\s_clk_counter[23]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_pwm_i_3_n_0,
      I1 => data0(23),
      O => s_clk_counter_0(23)
    );
\s_clk_counter[24]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_pwm_i_3_n_0,
      I1 => data0(24),
      O => s_clk_counter_0(24)
    );
\s_clk_counter[25]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_pwm_i_3_n_0,
      I1 => data0(25),
      O => s_clk_counter_0(25)
    );
\s_clk_counter[26]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_pwm_i_3_n_0,
      I1 => data0(26),
      O => s_clk_counter_0(26)
    );
\s_clk_counter[27]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_pwm_i_3_n_0,
      I1 => data0(27),
      O => s_clk_counter_0(27)
    );
\s_clk_counter[28]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_pwm_i_3_n_0,
      I1 => data0(28),
      O => s_clk_counter_0(28)
    );
\s_clk_counter[29]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_pwm_i_3_n_0,
      I1 => data0(29),
      O => s_clk_counter_0(29)
    );
\s_clk_counter[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_pwm_i_3_n_0,
      I1 => data0(2),
      O => s_clk_counter_0(2)
    );
\s_clk_counter[30]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_pwm_i_3_n_0,
      I1 => data0(30),
      O => s_clk_counter_0(30)
    );
\s_clk_counter[31]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_pwm_i_3_n_0,
      I1 => data0(31),
      O => s_clk_counter_0(31)
    );
\s_clk_counter[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_pwm_i_3_n_0,
      I1 => data0(3),
      O => s_clk_counter_0(3)
    );
\s_clk_counter[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_pwm_i_3_n_0,
      I1 => data0(4),
      O => s_clk_counter_0(4)
    );
\s_clk_counter[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_pwm_i_3_n_0,
      I1 => data0(5),
      O => s_clk_counter_0(5)
    );
\s_clk_counter[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_pwm_i_3_n_0,
      I1 => data0(6),
      O => s_clk_counter_0(6)
    );
\s_clk_counter[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_pwm_i_3_n_0,
      I1 => data0(7),
      O => s_clk_counter_0(7)
    );
\s_clk_counter[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_pwm_i_3_n_0,
      I1 => data0(8),
      O => s_clk_counter_0(8)
    );
\s_clk_counter[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_pwm_i_3_n_0,
      I1 => data0(9),
      O => s_clk_counter_0(9)
    );
\s_clk_counter_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => s_clk_counter_0(0),
      PRE => s_pwm_i_2_n_0,
      Q => s_clk_counter(0)
    );
\s_clk_counter_reg[10]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => s_clk_counter_0(10),
      PRE => s_pwm_i_2_n_0,
      Q => s_clk_counter(10)
    );
\s_clk_counter_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => s_pwm_i_2_n_0,
      D => s_clk_counter_0(11),
      Q => s_clk_counter(11)
    );
\s_clk_counter_reg[12]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => s_clk_counter_0(12),
      PRE => s_pwm_i_2_n_0,
      Q => s_clk_counter(12)
    );
\s_clk_counter_reg[12]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \s_clk_counter_reg[8]_i_2_n_0\,
      CO(3) => \s_clk_counter_reg[12]_i_2_n_0\,
      CO(2) => \s_clk_counter_reg[12]_i_2_n_1\,
      CO(1) => \s_clk_counter_reg[12]_i_2_n_2\,
      CO(0) => \s_clk_counter_reg[12]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(12 downto 9),
      S(3 downto 0) => s_clk_counter(12 downto 9)
    );
\s_clk_counter_reg[13]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => s_clk_counter_0(13),
      PRE => s_pwm_i_2_n_0,
      Q => s_clk_counter(13)
    );
\s_clk_counter_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => s_pwm_i_2_n_0,
      D => s_clk_counter_0(14),
      Q => s_clk_counter(14)
    );
\s_clk_counter_reg[15]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => s_clk_counter_0(15),
      PRE => s_pwm_i_2_n_0,
      Q => s_clk_counter(15)
    );
\s_clk_counter_reg[16]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => s_pwm_i_2_n_0,
      D => s_clk_counter_0(16),
      Q => s_clk_counter(16)
    );
\s_clk_counter_reg[16]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \s_clk_counter_reg[12]_i_2_n_0\,
      CO(3) => \s_clk_counter_reg[16]_i_2_n_0\,
      CO(2) => \s_clk_counter_reg[16]_i_2_n_1\,
      CO(1) => \s_clk_counter_reg[16]_i_2_n_2\,
      CO(0) => \s_clk_counter_reg[16]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(16 downto 13),
      S(3 downto 0) => s_clk_counter(16 downto 13)
    );
\s_clk_counter_reg[17]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => s_pwm_i_2_n_0,
      D => s_clk_counter_0(17),
      Q => s_clk_counter(17)
    );
\s_clk_counter_reg[18]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => s_clk_counter_0(18),
      PRE => s_pwm_i_2_n_0,
      Q => s_clk_counter(18)
    );
\s_clk_counter_reg[19]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => s_clk_counter_0(19),
      PRE => s_pwm_i_2_n_0,
      Q => s_clk_counter(19)
    );
\s_clk_counter_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => s_pwm_i_2_n_0,
      D => s_clk_counter_0(1),
      Q => s_clk_counter(1)
    );
\s_clk_counter_reg[20]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => s_pwm_i_2_n_0,
      D => s_clk_counter_0(20),
      Q => s_clk_counter(20)
    );
\s_clk_counter_reg[20]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \s_clk_counter_reg[16]_i_2_n_0\,
      CO(3) => \s_clk_counter_reg[20]_i_2_n_0\,
      CO(2) => \s_clk_counter_reg[20]_i_2_n_1\,
      CO(1) => \s_clk_counter_reg[20]_i_2_n_2\,
      CO(0) => \s_clk_counter_reg[20]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(20 downto 17),
      S(3 downto 0) => s_clk_counter(20 downto 17)
    );
\s_clk_counter_reg[21]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => s_pwm_i_2_n_0,
      D => s_clk_counter_0(21),
      Q => s_clk_counter(21)
    );
\s_clk_counter_reg[22]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => s_pwm_i_2_n_0,
      D => s_clk_counter_0(22),
      Q => s_clk_counter(22)
    );
\s_clk_counter_reg[23]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => s_pwm_i_2_n_0,
      D => s_clk_counter_0(23),
      Q => s_clk_counter(23)
    );
\s_clk_counter_reg[24]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => s_pwm_i_2_n_0,
      D => s_clk_counter_0(24),
      Q => s_clk_counter(24)
    );
\s_clk_counter_reg[24]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \s_clk_counter_reg[20]_i_2_n_0\,
      CO(3) => \s_clk_counter_reg[24]_i_2_n_0\,
      CO(2) => \s_clk_counter_reg[24]_i_2_n_1\,
      CO(1) => \s_clk_counter_reg[24]_i_2_n_2\,
      CO(0) => \s_clk_counter_reg[24]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(24 downto 21),
      S(3 downto 0) => s_clk_counter(24 downto 21)
    );
\s_clk_counter_reg[25]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => s_pwm_i_2_n_0,
      D => s_clk_counter_0(25),
      Q => s_clk_counter(25)
    );
\s_clk_counter_reg[26]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => s_pwm_i_2_n_0,
      D => s_clk_counter_0(26),
      Q => s_clk_counter(26)
    );
\s_clk_counter_reg[27]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => s_pwm_i_2_n_0,
      D => s_clk_counter_0(27),
      Q => s_clk_counter(27)
    );
\s_clk_counter_reg[28]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => s_pwm_i_2_n_0,
      D => s_clk_counter_0(28),
      Q => s_clk_counter(28)
    );
\s_clk_counter_reg[28]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \s_clk_counter_reg[24]_i_2_n_0\,
      CO(3) => \s_clk_counter_reg[28]_i_2_n_0\,
      CO(2) => \s_clk_counter_reg[28]_i_2_n_1\,
      CO(1) => \s_clk_counter_reg[28]_i_2_n_2\,
      CO(0) => \s_clk_counter_reg[28]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(28 downto 25),
      S(3 downto 0) => s_clk_counter(28 downto 25)
    );
\s_clk_counter_reg[29]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => s_pwm_i_2_n_0,
      D => s_clk_counter_0(29),
      Q => s_clk_counter(29)
    );
\s_clk_counter_reg[2]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => s_clk_counter_0(2),
      PRE => s_pwm_i_2_n_0,
      Q => s_clk_counter(2)
    );
\s_clk_counter_reg[30]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => s_pwm_i_2_n_0,
      D => s_clk_counter_0(30),
      Q => s_clk_counter(30)
    );
\s_clk_counter_reg[31]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => s_pwm_i_2_n_0,
      D => s_clk_counter_0(31),
      Q => s_clk_counter(31)
    );
\s_clk_counter_reg[31]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \s_clk_counter_reg[28]_i_2_n_0\,
      CO(3 downto 2) => \NLW_s_clk_counter_reg[31]_i_2_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \s_clk_counter_reg[31]_i_2_n_2\,
      CO(0) => \s_clk_counter_reg[31]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_s_clk_counter_reg[31]_i_2_O_UNCONNECTED\(3),
      O(2 downto 0) => data0(31 downto 29),
      S(3) => '0',
      S(2 downto 0) => s_clk_counter(31 downto 29)
    );
\s_clk_counter_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => s_pwm_i_2_n_0,
      D => s_clk_counter_0(3),
      Q => s_clk_counter(3)
    );
\s_clk_counter_reg[4]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => s_clk_counter_0(4),
      PRE => s_pwm_i_2_n_0,
      Q => s_clk_counter(4)
    );
\s_clk_counter_reg[4]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \s_clk_counter_reg[4]_i_2_n_0\,
      CO(2) => \s_clk_counter_reg[4]_i_2_n_1\,
      CO(1) => \s_clk_counter_reg[4]_i_2_n_2\,
      CO(0) => \s_clk_counter_reg[4]_i_2_n_3\,
      CYINIT => s_clk_counter(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(4 downto 1),
      S(3 downto 0) => s_clk_counter(4 downto 1)
    );
\s_clk_counter_reg[5]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => s_clk_counter_0(5),
      PRE => s_pwm_i_2_n_0,
      Q => s_clk_counter(5)
    );
\s_clk_counter_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => s_pwm_i_2_n_0,
      D => s_clk_counter_0(6),
      Q => s_clk_counter(6)
    );
\s_clk_counter_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => s_pwm_i_2_n_0,
      D => s_clk_counter_0(7),
      Q => s_clk_counter(7)
    );
\s_clk_counter_reg[8]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => s_clk_counter_0(8),
      PRE => s_pwm_i_2_n_0,
      Q => s_clk_counter(8)
    );
\s_clk_counter_reg[8]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \s_clk_counter_reg[4]_i_2_n_0\,
      CO(3) => \s_clk_counter_reg[8]_i_2_n_0\,
      CO(2) => \s_clk_counter_reg[8]_i_2_n_1\,
      CO(1) => \s_clk_counter_reg[8]_i_2_n_2\,
      CO(0) => \s_clk_counter_reg[8]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(8 downto 5),
      S(3 downto 0) => s_clk_counter(8 downto 5)
    );
\s_clk_counter_reg[9]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => s_clk_counter_0(9),
      PRE => s_pwm_i_2_n_0,
      Q => s_clk_counter(9)
    );
s_pwm0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => s_pwm0_carry_n_0,
      CO(2) => s_pwm0_carry_n_1,
      CO(1) => s_pwm0_carry_n_2,
      CO(0) => s_pwm0_carry_n_3,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_s_pwm0_carry_O_UNCONNECTED(3 downto 0),
      S(3) => s_pwm0_carry_i_1_n_0,
      S(2) => s_pwm0_carry_i_2_n_0,
      S(1) => \s_pwm0_carry_i_3__0_n_0\,
      S(0) => \s_pwm0_carry_i_4__0_n_0\
    );
\s_pwm0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => s_pwm0_carry_n_0,
      CO(3) => \s_pwm0_carry__0_n_0\,
      CO(2) => \s_pwm0_carry__0_n_1\,
      CO(1) => \s_pwm0_carry__0_n_2\,
      CO(0) => \s_pwm0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_s_pwm0_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \s_pwm0_carry_i_1__0_n_0\,
      S(2) => \s_pwm0_carry_i_2__0_n_0\,
      S(1) => s_pwm0_carry_i_3_n_0,
      S(0) => s_pwm0_carry_i_4_n_0
    );
\s_pwm0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \s_pwm0_carry__0_n_0\,
      CO(3) => \NLW_s_pwm0_carry__1_CO_UNCONNECTED\(3),
      CO(2) => \s_pwm0_carry__1_n_1\,
      CO(1) => \s_pwm0_carry__1_n_2\,
      CO(0) => \s_pwm0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_s_pwm0_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => '0',
      S(2) => \s_pwm0_carry_i_1__1_n_0\,
      S(1) => \s_pwm0_carry_i_2__1_n_0\,
      S(0) => \s_pwm0_carry_i_3__1_n_0\
    );
s_pwm0_carry_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0C00006000062001"
    )
        port map (
      I0 => duty(2),
      I1 => s_clk_counter(10),
      I2 => s_clk_counter(11),
      I3 => s_clk_counter(9),
      I4 => duty(0),
      I5 => duty(1),
      O => s_pwm0_carry_i_1_n_0
    );
\s_pwm0_carry_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => s_clk_counter(21),
      I1 => s_clk_counter(22),
      I2 => s_clk_counter(23),
      O => \s_pwm0_carry_i_1__0_n_0\
    );
\s_pwm0_carry_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_clk_counter(31),
      I1 => s_clk_counter(30),
      O => \s_pwm0_carry_i_1__1_n_0\
    );
s_pwm0_carry_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0404084001408001"
    )
        port map (
      I0 => s_clk_counter(6),
      I1 => s_clk_counter(8),
      I2 => s_clk_counter(7),
      I3 => duty(1),
      I4 => duty(0),
      I5 => duty(2),
      O => s_pwm0_carry_i_2_n_0
    );
\s_pwm0_carry_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2002020110010201"
    )
        port map (
      I0 => s_clk_counter(18),
      I1 => s_clk_counter(20),
      I2 => s_clk_counter(19),
      I3 => duty(2),
      I4 => duty(1),
      I5 => duty(0),
      O => \s_pwm0_carry_i_2__0_n_0\
    );
\s_pwm0_carry_i_2__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => s_clk_counter(27),
      I1 => s_clk_counter(28),
      I2 => s_clk_counter(29),
      O => \s_pwm0_carry_i_2__1_n_0\
    );
s_pwm0_carry_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0204800408401001"
    )
        port map (
      I0 => s_clk_counter(15),
      I1 => s_clk_counter(16),
      I2 => s_clk_counter(17),
      I3 => duty(2),
      I4 => duty(1),
      I5 => duty(0),
      O => s_pwm0_carry_i_3_n_0
    );
\s_pwm0_carry_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2010400102044001"
    )
        port map (
      I0 => s_clk_counter(5),
      I1 => s_clk_counter(3),
      I2 => s_clk_counter(4),
      I3 => duty(2),
      I4 => duty(1),
      I5 => duty(0),
      O => \s_pwm0_carry_i_3__0_n_0\
    );
\s_pwm0_carry_i_3__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => s_clk_counter(24),
      I1 => s_clk_counter(25),
      I2 => s_clk_counter(26),
      O => \s_pwm0_carry_i_3__1_n_0\
    );
s_pwm0_carry_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2010020401024001"
    )
        port map (
      I0 => s_clk_counter(13),
      I1 => s_clk_counter(14),
      I2 => s_clk_counter(12),
      I3 => duty(2),
      I4 => duty(1),
      I5 => duty(0),
      O => s_pwm0_carry_i_4_n_0
    );
\s_pwm0_carry_i_4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2400201000820201"
    )
        port map (
      I0 => s_clk_counter(2),
      I1 => s_clk_counter(1),
      I2 => duty(2),
      I3 => duty(0),
      I4 => duty(1),
      I5 => s_clk_counter(0),
      O => \s_pwm0_carry_i_4__0_n_0\
    );
s_pwm_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"73"
    )
        port map (
      I0 => \s_pwm0_carry__1_n_1\,
      I1 => s_pwm_i_3_n_0,
      I2 => \^pwm\,
      O => s_pwm_i_1_n_0
    );
s_pwm_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF01"
    )
        port map (
      I0 => duty(2),
      I1 => duty(0),
      I2 => duty(1),
      I3 => rst,
      O => s_pwm_i_2_n_0
    );
s_pwm_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => s_pwm_i_4_n_0,
      I1 => s_pwm_i_5_n_0,
      I2 => s_pwm_i_6_n_0,
      I3 => s_pwm_i_7_n_0,
      I4 => s_pwm_i_8_n_0,
      I5 => s_pwm_i_9_n_0,
      O => s_pwm_i_3_n_0
    );
s_pwm_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => s_clk_counter(27),
      I1 => s_clk_counter(28),
      I2 => s_clk_counter(29),
      I3 => s_clk_counter(31),
      I4 => s_clk_counter(30),
      O => s_pwm_i_4_n_0
    );
s_pwm_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => s_clk_counter(2),
      I1 => s_clk_counter(1),
      I2 => s_clk_counter(0),
      O => s_pwm_i_5_n_0
    );
s_pwm_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFDFFFFFFFFFF"
    )
        port map (
      I0 => s_clk_counter(15),
      I1 => s_clk_counter(16),
      I2 => s_clk_counter(17),
      I3 => s_clk_counter(19),
      I4 => s_clk_counter(20),
      I5 => s_clk_counter(18),
      O => s_pwm_i_6_n_0
    );
s_pwm_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => s_clk_counter(21),
      I1 => s_clk_counter(22),
      I2 => s_clk_counter(23),
      I3 => s_clk_counter(24),
      I4 => s_clk_counter(25),
      I5 => s_clk_counter(26),
      O => s_pwm_i_7_n_0
    );
s_pwm_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFDFFFFFFFFFFF"
    )
        port map (
      I0 => s_clk_counter(9),
      I1 => s_clk_counter(11),
      I2 => s_clk_counter(10),
      I3 => s_clk_counter(12),
      I4 => s_clk_counter(14),
      I5 => s_clk_counter(13),
      O => s_pwm_i_8_n_0
    );
s_pwm_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFDFFFFFFFFF"
    )
        port map (
      I0 => s_clk_counter(4),
      I1 => s_clk_counter(3),
      I2 => s_clk_counter(5),
      I3 => s_clk_counter(7),
      I4 => s_clk_counter(6),
      I5 => s_clk_counter(8),
      O => s_pwm_i_9_n_0
    );
s_pwm_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => s_pwm_i_2_n_0,
      D => s_pwm_i_1_n_0,
      Q => \^pwm\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm_cell_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    duty : in STD_LOGIC_VECTOR ( 2 downto 0 );
    pwm : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of pwm_cell_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of pwm_cell_0 : entity is "pwm_cell_0,pwm_cell,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of pwm_cell_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of pwm_cell_0 : entity is "package_project";
  attribute x_core_info : string;
  attribute x_core_info of pwm_cell_0 : entity is "pwm_cell,Vivado 2018.3";
end pwm_cell_0;

architecture STRUCTURE of pwm_cell_0 is
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0";
  attribute x_interface_info of rst : signal is "xilinx.com:signal:reset:1.0 rst RST";
  attribute x_interface_parameter of rst : signal is "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
U0: entity work.pwm_cell_0_pwm_cell
     port map (
      clk => clk,
      duty(2 downto 0) => duty(2 downto 0),
      pwm => pwm,
      rst => rst
    );
end STRUCTURE;
