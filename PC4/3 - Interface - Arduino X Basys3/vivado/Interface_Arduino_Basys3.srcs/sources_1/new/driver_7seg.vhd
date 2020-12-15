----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Rafael Feijo Leonardo
-- 
-- Create Date: 11/14/2020 04:14:41 PM
-- Design Name: 
-- Module Name: driver_7seg - Behavioral
-- Project Name: Interface Arduino X Basys 3
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

entity driver_7seg is
    Port ( clk, rst :  in STD_LOGIC;
           disp3    :  in STD_LOGIC_VECTOR (0 to 6);
           disp2    :  in STD_LOGIC_VECTOR (0 to 6);
           disp1    :  in STD_LOGIC_VECTOR (0 to 6);
           disp0    :  in STD_LOGIC_VECTOR (0 to 6);
           seg      : out STD_LOGIC_VECTOR (0 to 6);
           dp       : out STD_LOGIC;
           an       : out STD_LOGIC_VECTOR (3 downto 0));
end driver_7seg;

architecture Behavioral of driver_7seg is

    SIGNAL counter   : integer range 0 to 249999 := 0;
    SIGNAL clk_200hz : STD_LOGIC := '0';

begin

    process (clk, rst)
    begin
        if rst = '1' then
            counter   <= 0;
            clk_200hz <= '0';
        elsif rising_edge(clk) then
            if counter = 249999 then
                counter   <= 0;
                clk_200hz <= NOT clk_200hz;
            else
                counter   <= counter + 1;
            end if;
        end if;
    end process;
    
    process (clk_200hz, rst)
        variable multiplex : integer range 0 to 3 := 0;
    begin
        if rst = '1' then
            seg <= (others=>'1');
            dp  <= '1';
            an  <= (others=>'1');
            multiplex := 0;
        elsif rising_edge(clk_200hz) then
            if multiplex = 0 then
                seg <= disp3;
                dp  <= '1';
                an  <= "0111";
                multiplex := multiplex + 1;
            elsif multiplex = 1 then
                seg <= disp2;
                dp  <= '0';
                an  <= "1011";
                multiplex := multiplex + 1;
            elsif multiplex = 2 then
                seg <= disp1;
                dp  <= '1';
                an  <= "1101";
                multiplex := multiplex + 1;
            else
                seg <= disp0;
                dp  <= '1';
                an  <= "1110";
                multiplex := 0;
            end if;
        end if;
    end process;

end Behavioral;
