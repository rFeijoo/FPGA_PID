----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Rafael Feijo Leonardo
-- 
-- Create Date: 11/12/2020 05:20:27 PM
-- Design Name: 
-- Module Name: top_module - Behavioral
-- Project Name: PID Controller
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_module is
    Port ( clk, rst :  in STD_LOGIC;
           start    :  in STD_LOGIC;
           temp_in  :  in STD_LOGIC_VECTOR (7 downto 0);
           error    : out STD_LOGIC_VECTOR (31 downto 0);
           P        : out STD_LOGIC_VECTOR (31 downto 0);
           I        : out STD_LOGIC_VECTOR (31 downto 0);
           ready    : out STD_LOGIC);
end top_module;

architecture Behavioral of top_module is

    COMPONENT fp_fixed2float
        Port ( aclk                 :  in STD_LOGIC;
               s_axis_a_tvalid      :  in STD_LOGIC;
               s_axis_a_tready      : out STD_LOGIC;
               s_axis_a_tdata       :  in STD_LOGIC_VECTOR (7 DOWNTO 0);
               m_axis_result_tvalid : out STD_LOGIC;
               m_axis_result_tready :  in STD_LOGIC;
               m_axis_result_tdata  : out STD_LOGIC_VECTOR (31 DOWNTO 0));
    end COMPONENT;
    
    COMPONENT error_mod
        Port ( clk, rst :  in STD_LOGIC;
               start    :  in STD_LOGIC;
               setPoint :  in STD_LOGIC_VECTOR (31 downto 0);
               temp_in  :  in STD_LOGIC_VECTOR (31 downto 0);
               ready    : out STD_LOGIC;
               error    : out STD_LOGIC_VECTOR (31 downto 0));
    end COMPONENT;
    
    COMPONENT proportional_mod is
        Port ( clk, rst :  in STD_LOGIC;
               start    :  in STD_LOGIC;
               error, kP:  in STD_LOGIC_VECTOR (31 downto 0);
               ready    : out STD_LOGIC;
               P        : out STD_LOGIC_VECTOR (31 downto 0));
    end COMPONENT;
    
    COMPONENT integrative_mod is
        Port ( clk, rst :  in STD_LOGIC;
               start    :  in STD_LOGIC;
               error, kI:  in STD_LOGIC_VECTOR (31 downto 0);
               ready    : out STD_LOGIC;
               I        : out STD_LOGIC_VECTOR (31 downto 0));
    end COMPONENT;
    
    CONSTANT setPoint : STD_LOGIC_VECTOR (31 downto 0) := "01000001110010000000000000000000"; -- 25 Celsius
    CONSTANT kP       : STD_LOGIC_VECTOR (31 downto 0) := "00111111100000000000000000000000"; -- 1.0
    CONSTANT kI       : STD_LOGIC_VECTOR (31 downto 0) := "00111111100000000000000000000000"; -- 1.0
    
    SIGNAL conv_rd         : STD_LOGIC := '0';
    SIGNAL last_temp       : STD_LOGIC_VECTOR (7 downto 0)  := (others=>'0');
    SIGNAL s_temp, s_error : STD_LOGIC_VECTOR (31 downto 0) := (others=>'0');
    SIGNAL s_P, s_I        : STD_LOGIC_VECTOR (31 downto 0) := (others=>'0');
    SIGNAL conv_tready     : STD_LOGIC;
    SIGNAL s_ready_error   : STD_LOGIC;
    SIGNAL s_ready_p       : STD_LOGIC;
    SIGNAL s_ready_i       : STD_LOGIC;

begin

    fixed2float: fp_fixed2float Port Map (clk, start, conv_tready, temp_in, conv_rd, '1', s_temp);
    error_module: error_mod Port Map (clk, rst, conv_rd, setPoint, s_temp, s_ready_error, s_error);
    prop_module: proportional_mod Port Map (clk, rst, s_ready_error, s_error, kP, s_ready_p, s_P);
    int_module: integrative_mod Port Map (clk, rst, s_ready_error, s_error, kI, s_ready_i, s_I);
    
    process (clk, rst, s_ready_p, s_ready_i)
        variable flag_p, flag_i : STD_LOGIC := '0';
    begin
        if rst = '1' then
            ready  <= '0';
            flag_p := '0';
            flag_i := '0';
        elsif rising_edge(clk) then
            if s_ready_p = '1' then
                ready  <= '0';
                flag_p := '1';
            elsif s_ready_i = '1' then
                ready  <= '0';
                flag_i := '1';
            elsif flag_p = '1' AND flag_i = '1' then
                ready  <= '1';
                flag_p := '0';
                flag_i := '0';
            else
                ready <= '0';
            end if;
        end if;
    end process;

    error <= s_error;
    P <= s_P;
    I <= s_I;
 
end Behavioral;
