----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/15/2020 06:47:48 AM
-- Design Name: 
-- Module Name: tb_decoder - Behavioral
-- Project Name: 
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

entity tb_decoder is
--  Port ( );
end tb_decoder;

architecture Behavioral of tb_decoder is

    COMPONENT PID_decoder is
        Port ( clk, rst :  in STD_LOGIC;
               start    :  in STD_LOGIC;
               PID_in   :  in STD_LOGIC_VECTOR (31 downto 0);
               DutyCycle: out STD_LOGIC_VECTOR (2 downto 0);
               ready    : out STD_LOGIC);
    end COMPONENT;
    
    signal s_clk, s_rst : std_logic := '0';
    signal s_start, s_ready : std_logic := '0';
    signal s_pid_in : std_logic_vector (31 downto 0) := "00111111100001100110011001100110";
    signal s_duty : std_logic_vector (2 downto 0);

begin

    uut: PID_decoder Port Map (s_clk, s_rst, s_start, s_pid_in, s_duty, s_ready);
    
    process
    begin
        s_clk <= '0';
        wait for 5 ns;
        s_clk <= '1';
        wait for 5 ns;
    end process;
    
    process
    begin
        s_rst <= '1';
        wait for 15 ns;
        s_rst <= '0';
        wait for 15 ns;
        s_start <= '1';
        wait for 10 ns;
        s_start <= '0';
        wait for 200 ns;
        s_pid_in <= "11000001001010110011001100110011";
        s_start <= '1';
        wait for 10 ns;
        s_start <= '0';
        wait;
    end process;

end Behavioral;
