----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Rafael Feijo Leonardo
-- 
-- Create Date: 11/12/2020 11:45:32 PM
-- Design Name: 
-- Module Name: proportional_mod - Behavioral
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

entity proportional_mod is
    Port ( clk, rst :  in STD_LOGIC;
           start    :  in STD_LOGIC;
           error, kP:  in STD_LOGIC_VECTOR (31 downto 0);
           ready    : out STD_LOGIC;
           P        : out STD_LOGIC_VECTOR (31 downto 0));
end proportional_mod;

architecture Behavioral of proportional_mod is

    COMPONENT fp_multiply
        Port ( aclk                 :  in STD_LOGIC;
               s_axis_a_tvalid      :  in STD_LOGIC;
               s_axis_a_tready      : out STD_LOGIC;
               s_axis_a_tdata       :  in STD_LOGIC_VECTOR (31 downto 0);
               s_axis_b_tvalid      :  in STD_LOGIC;
               s_axis_b_tready      : out STD_LOGIC;
               s_axis_b_tdata       :  in STD_LOGIC_VECTOR (31 downto 0);
               m_axis_result_tvalid : out STD_LOGIC;
               m_axis_result_tready :  in STD_LOGIC;
               m_axis_result_tdata  : out STD_LOGIC_VECTOR (31 downto 0));
    end COMPONENT;
    
    SIGNAL a_tready, b_tready, r_tvalid, s_start : STD_LOGIC := '0';
    SIGNAL s_P : STD_LOGIC_VECTOR (31 downto 0) := (others=>'0');

begin

    fp_proportional_mod: fp_multiply Port Map ( aclk => clk,
                                                -- Op A (kP)
                                                s_axis_a_tvalid => '1',
                                                s_axis_a_tready => a_tready,
                                                s_axis_a_tdata  => kP,
                                                -- Op B (error)
                                                s_axis_b_tvalid => s_start,
                                                s_axis_b_tready => b_tready,
                                                s_axis_b_tdata  => error,
                                                -- Result
                                                m_axis_result_tvalid   => r_tvalid,
                                                m_axis_result_tready   => '1',
                                                m_axis_result_tdata    => s_P);

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

    process (clk, rst, r_tvalid)
    begin
        if rst = '1' then
            P <= (others=>'0');
        elsif rising_edge(clk) then
            if r_tvalid = '1' then
                P <= s_P;
            end if;
        end if;
    end process;
    
    ready <= r_tvalid;

end Behavioral;
