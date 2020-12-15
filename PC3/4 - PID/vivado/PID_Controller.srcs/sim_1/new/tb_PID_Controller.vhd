----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Rafael Feijo Leonardo
-- 
-- Create Date: 11/12/2020 05:41:59 PM
-- Design Name: 
-- Module Name: tb_PID_Controller - Behavioral
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

entity tb_PID_Controller is
--  Port ( );
end tb_PID_Controller;

architecture Behavioral of tb_PID_Controller is

    COMPONENT top_module
        Port ( clk, rst :  in STD_LOGIC;
               start    :  in STD_LOGIC;
               temp_in  :  in STD_LOGIC_VECTOR (7 downto 0);
               error    : out STD_LOGIC_VECTOR (31 downto 0);
               P        : out STD_LOGIC_VECTOR (31 downto 0);
               I        : out STD_LOGIC_VECTOR (31 downto 0);
               ready    : out STD_LOGIC);
    end COMPONENT;
    
    SIGNAL clock, reset     : STD_LOGIC := '0';
    SIGNAL s_error, s_P     : STD_LOGIC_VECTOR (31 downto 0);
    SIGNAL s_I              : STD_LOGIC_VECTOR (31 downto 0);
    SIGNAL data_in          : STD_LOGIC_VECTOR (7 downto 0) := (others=>'0');
    SIGNAL first_start      : STD_LOGIC := '0';
    SIGNAL s_start, s_ready : STD_LOGIC := '0';
    SIGNAL WOMenable        : STD_LOGIC := '0';

begin

    uut: top_module PORT MAP ( clk      => clock,
                               rst      => reset,
                               start    => s_start,
                               temp_in  => data_in,
                               error    => s_error,
                               P        => s_P,
                               I        => s_I,
                               ready    => s_ready);
                               
    clock <= NOT clock after 5 ns;
    reset <= '0', '1' after 15 ns, '0' after 30 ns;
    first_start <= '0', '1' after 40 ns, '0' after 50 ns;
    
    input: process (clock)
        file     infile : text is in "temp_fixed_point_bin.txt";
        variable inline : line;
        variable dataf  : STD_LOGIC_VECTOR (7 downto 0);
    begin
        if rising_edge(clock) then
            s_start <= '0';
            if NOT endfile(infile) then
                if first_start = '1' OR s_ready = '1' then
                    readline(infile, inline);
                    read(inline, dataf);
                    data_in <= dataf;
                    s_start <= '1';
                end if;
            elsif endfile(infile) then
                report "END OF READING" severity note;
            end if;
        end if;
    end process;
    
    delay_proc: process (clock, reset)
    begin
        if reset = '1' then
            WOMenable <= '0';
        elsif rising_edge(clock) then
            WOMenable <= s_ready;
        end if;
    end process;
    
    output: process (clock)
        variable outline_error, outline_P, outline_I: line;
        file     outfile_error : text is out "out_vector_error.txt";
        file     outfile_P     : text is out "out_vector_p.txt";
        file     outfile_I     : text is out "out_vector_i.txt";
    begin
        if rising_edge(clock) then
            if WOMenable = '1' then
                -- Error
                write(outline_error, s_error);
                writeline(outfile_error, outline_error);
                -- Proportional
                write(outline_P, s_P);
                writeline(outfile_P, outline_P);
                -- Integrativ
                write(outline_I, s_I);
                writeline(outfile_I, outline_I);
            end if;
        end if;
    end process;
    
end Behavioral;
