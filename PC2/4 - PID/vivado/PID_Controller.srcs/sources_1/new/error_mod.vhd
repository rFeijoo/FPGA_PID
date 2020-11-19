----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Rafael Feijo Leonardo
-- 
-- Create Date: 11/12/2020 06:04:02 PM
-- Design Name: 
-- Module Name: error_mod - Behavioral
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

entity error_mod is
    Port ( clk, rst :  in STD_LOGIC;
           start    :  in STD_LOGIC;
           setPoint :  in STD_LOGIC_VECTOR (31 downto 0);
           temp_in  :  in STD_LOGIC_VECTOR (31 downto 0);
           ready    : out STD_LOGIC;
           error    : out STD_LOGIC_VECTOR (31 downto 0));
end error_mod;

architecture Behavioral of error_mod is

    COMPONENT fp_subtract
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
    
    SIGNAL a_tready, b_tready, r_tvalid : STD_LOGIC := '0';
    SIGNAL s_error : STD_LOGIC_VECTOR (31 downto 0) := (others=>'0');

begin

    fp_error_mod: fp_subtract Port Map ( aclk => clk,
                                         -- Op A (setPoint)
                                         s_axis_a_tvalid => '1',
                                         s_axis_a_tready => a_tready,
                                         s_axis_a_tdata  => setPoint,
                                         -- Op B (temperature)
                                         s_axis_b_tvalid => start,
                                         s_axis_b_tready => b_tready,
                                         s_axis_b_tdata  => temp_in,
                                         -- Result
                                         m_axis_result_tvalid => r_tvalid,
                                         m_axis_result_tready => '1',
                                         m_axis_result_tdata  => s_error);
    
    process (clk, rst, r_tvalid)
    begin
        if rst = '1' then
            error <= (others=>'0');
        elsif rising_edge(clk) then
            if r_tvalid = '1' then
                error <= s_error;
            end if;
        end if;
    end process;
    
    ready <= r_tvalid;

end Behavioral;
