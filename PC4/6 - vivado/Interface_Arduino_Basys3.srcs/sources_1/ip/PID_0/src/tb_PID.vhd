----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Rafael Feijo Leonardo
-- 
-- Create Date: 11/30/2020 06:19:42 PM
-- Design Name: 
-- Module Name: tb_PID - Behavioral
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
use STD.TEXTIO.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;

entity tb_PID is
--  Port ( );
end tb_PID;

architecture Behavioral of tb_PID is

    COMPONENT top_module
        Port ( clk, rst :  in STD_LOGIC;
               start    :  in STD_LOGIC;
               temp_in  :  in STD_LOGIC_VECTOR (7 downto 0);
               setpoint :  in STD_LOGIC_VECTOR (31 downto 0);
               kP,kI,kD :  in STD_LOGIC_VECTOR (31 downto 0);
               PID      : out STD_LOGIC_VECTOR (31 downto 0);
               ready    : out STD_LOGIC);
    end COMPONENT;
    
    SIGNAL clock, reset     : STD_LOGIC := '0';
    SIGNAL start            : STD_LOGIC := '0';
    SIGNAL temp_fixed       : STD_LOGIC_VECTOR (7 downto 0)  := (others=>'0');
    SIGNAL temp_setpoint    : STD_LOGIC_VECTOR (31 downto 0) := (others=>'0');
    
    CONSTANT setPoint       : STD_LOGIC_VECTOR (31 downto 0) := "01000001110010000000000000000000"; -- setpoint = 25 Celsius
    CONSTANT kP             : STD_LOGIC_VECTOR (31 downto 0) := "01000000001000000000000000000000"; -- kP = 2.5
    CONSTANT kI             : STD_LOGIC_VECTOR (31 downto 0) := "00111111010011001100110011001100"; -- kP = 0.8
    CONSTANT kD             : STD_LOGIC_VECTOR (31 downto 0) := "00111111100110011001100110011001"; -- kP = 1.2
    
    SIGNAL PID_output       : STD_LOGIC_VECTOR (31 downto 0) := (others=>'0');
    SIGNAL ready            : STD_LOGIC := '0';
    
    SIGNAL first_start      : STD_LOGIC := '0';
    SIGNAL WOMenable        : STD_LOGIC := '0';

begin

    uut: top_module PORT MAP ( clk      => clock,
                               rst      => reset,
                               start    => start,
                               temp_in  => temp_fixed,
                               setpoint => setpoint,
                               kP       => kP,
                               kI       => kI,
                               kD       => kD,
                               PID      => PID_output,
                               ready    => ready);
                               
    clock <= NOT clock after 5 ns;
    reset <= '0', '1' after 15 ns, '0' after 30 ns;
    first_start <= '0', '1' after 40 ns, '0' after 50 ns;
    
    input: process (clock)
        file     infile : text is in "temp_fixed_point_bin.txt";
        variable inline : line;
        variable dataf  : STD_LOGIC_VECTOR (7 downto 0);
    begin
        if rising_edge(clock) then
            start <= '0';
            if NOT endfile(infile) then
                if first_start = '1' OR ready = '1' then
                    readline(infile, inline);
                    read(inline, dataf);
                    temp_fixed <= dataf;
                    start <= '1';
                end if;
            elsif endfile(infile) then
                report "END OF READING" severity note;
            end if;
        end if;
    end process;

end Behavioral;
