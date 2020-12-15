----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Rafael Feijo Leonardo
-- 
-- Create Date: 11/30/2020 05:21:40 PM
-- Design Name: 
-- Module Name: pid_mod - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity pid_mod is
    Port ( clk, rst :  in STD_LOGIC;
           P, I, D  :  in STD_LOGIC_VECTOR (31 downto 0);
           start    :  in STD_LOGIC;
           ready    : out STD_LOGIC;
           PID      : out STD_LOGIC_VECTOR (31 downto 0));
end pid_mod;

architecture Behavioral of pid_mod is

    COMPONENT fp_add
        Port ( aclk                 :  in STD_LOGIC;
               s_axis_a_tvalid      :  in STD_LOGIC;
               s_axis_a_tready      : out STD_LOGIC;
               s_axis_a_tdata       :  in STD_LOGIC_VECTOR (31 DOWNTO 0);
               s_axis_b_tvalid      :  in STD_LOGIC;
               s_axis_b_tready      : out STD_LOGIC;
               s_axis_b_tdata       :  in STD_LOGIC_VECTOR (31 DOWNTO 0);
               m_axis_result_tvalid : out STD_LOGIC;
               m_axis_result_tready :  in STD_LOGIC;
               m_axis_result_tdata  : out STD_LOGIC_VECTOR (31 DOWNTO 0));
    end COMPONENT;
   
    SIGNAL a_tready_op1, b_tready_op1, r_tvalid_op1 : STD_LOGIC := '0';
    SIGNAL a_tready_op2, b_tready_op2, r_tvalid_op2 : STD_LOGIC := '0';
    SIGNAL s_start : STD_LOGIC := '0';
    SIGNAL aux, s_PID : STD_LOGIC_VECTOR (31 downto 0) := (others=>'0');

begin

    mod_pi :  fp_add Port Map ( aclk => clk,
                                -- Op A (P)
                                s_axis_a_tvalid => '1',
                                s_axis_a_tready => a_tready_op1,
                                s_axis_a_tdata  => P,
                                -- Op B (I)
                                s_axis_b_tvalid => s_start,
                                s_axis_b_tready => b_tready_op1,
                                s_axis_b_tdata  => I,
                                -- Result
                                m_axis_result_tvalid   => r_tvalid_op1,
                                m_axis_result_tready   => '1',
                                m_axis_result_tdata    => aux);
                               
    mod_pid : fp_add Port Map ( aclk => clk,
                                -- Op A (aux)
                                s_axis_a_tvalid => r_tvalid_op1,
                                s_axis_a_tready => a_tready_op2,
                                s_axis_a_tdata  => aux,
                                -- Op B (D)
                                s_axis_b_tvalid => '1',
                                s_axis_b_tready => b_tready_op2,
                                s_axis_b_tdata  => D,
                                -- Result
                                m_axis_result_tvalid   => r_tvalid_op2,
                                m_axis_result_tready   => '1',
                                m_axis_result_tdata    => s_PID);
                                
    process (clk, rst, start)
    begin
        if rst = '1' then
            s_start <= '0';
        elsif rising_edge(clk) then
            if start = '1' then
                s_start <= '1';
            else
                s_start <= '0';
            end if;
        end if;
    end process;
    
    process (clk, rst, r_tvalid_op2)
        variable lock : std_logic := '0';
    begin
        if rst = '1' then
            PID  <= (others=>'0');
            lock := '0';
        elsif rising_edge(clk) then
            if r_tvalid_op2 = '1' then
                lock := '1';
            elsif lock = '1' then
                lock := '0';
                PID  <= s_PID;
            end if;
        end if;
    end process;
    
    process (clk, rst, r_tvalid_op2)
    begin
        if rst = '1' then
            ready <= '0';
        elsif rising_edge(clk) then
            if r_tvalid_op2 = '1' then
                ready <= '1';
            else
                ready <= '0';
            end if;
        end if;
    end process;

end Behavioral;
