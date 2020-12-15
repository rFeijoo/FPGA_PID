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
           setpoint :  in STD_LOGIC_VECTOR (31 downto 0);
           kP,kI,kD :  in STD_LOGIC_VECTOR (31 downto 0);
           PID      : out STD_LOGIC_VECTOR (31 downto 0);
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
    
    COMPONENT derivative_mod is
        Port ( clk, rst :  in STD_LOGIC;
               start    :  in STD_LOGIC;
               error, kD:  in STD_LOGIC_VECTOR (31 downto 0);
               ready    : out STD_LOGIC;
               D        : out STD_LOGIC_VECTOR (31 downto 0));
    end COMPONENT;
    
    COMPONENT pid_mod is
        Port ( clk, rst :  in STD_LOGIC;
               P, I, D  :  in STD_LOGIC_VECTOR (31 downto 0);
               start    :  in STD_LOGIC;
               ready    : out STD_LOGIC;
               PID      : out STD_LOGIC_VECTOR (31 downto 0));
    end COMPONENT;
   
    SIGNAL s_temp, s_error : STD_LOGIC_VECTOR (31 downto 0) := (others=>'0');
    SIGNAL s_P, s_I, s_D   : STD_LOGIC_VECTOR (31 downto 0) := (others=>'0');
    
    SIGNAL s_start_aux, conv_rd, s_start_pid : STD_LOGIC := '0';
    SIGNAL conv_tready, s_ready_error        : STD_LOGIC;
    SIGNAL s_ready_p, s_ready_i, s_ready_d   : STD_LOGIC;

begin

    fixed2float:  fp_fixed2float   Port Map (clk, s_start_aux, conv_tready, temp_in, conv_rd, '1', s_temp);
    error_module: error_mod        Port Map (clk, rst, conv_rd, setPoint, s_temp, s_ready_error, s_error);
    prop_module:  proportional_mod Port Map (clk, rst, s_ready_error, s_error, kP, s_ready_p, s_P);
    int_module:   integrative_mod  Port Map (clk, rst, s_ready_error, s_error, kI, s_ready_i, s_I);
    der_module:   derivative_mod   Port Map (clk, rst, s_ready_error, s_error, kD, s_ready_d, s_D);
    pid_module:   pid_mod          Port Map (clk, rst, s_P, s_I, s_D, s_start_pid, ready, PID);
    
    process (clk, rst, start)
        variable lock : std_logic := '0';
    begin
        if rst = '1' then
            s_start_aux <= '0';
        elsif rising_edge(clk) then
            s_start_aux <= '0';
            if lock = '1' AND start = '0' then
                lock := '0';
            elsif start = '1' AND lock = '0' then
                s_start_aux <= '1';
                lock := '1';
            end if;
        end if;
    end process;
    
    process (clk, rst, s_ready_p, s_ready_i)
        variable flag_p, flag_i, flag_d : STD_LOGIC := '0';
    begin
        if rst = '1' then
            s_start_pid  <= '0';
            flag_p := '0';
            flag_i := '0';
            flag_d := '0';
        elsif rising_edge(clk) then
            if s_ready_p = '1' then
                s_start_pid  <= '0';
                flag_p := '1';
            elsif s_ready_i = '1' then
                s_start_pid  <= '0';
                flag_i := '1';
            elsif s_ready_d = '1' then
                s_start_pid  <= '0';
                flag_d := '1';
            elsif flag_p = '1' AND flag_i = '1' AND flag_d = '1' then
                s_start_pid  <= '1';
                flag_p := '0';
                flag_i := '0';
                flag_d := '0';
            else
                s_start_pid <= '0';
            end if;
        end if;
    end process;
 
end Behavioral;
