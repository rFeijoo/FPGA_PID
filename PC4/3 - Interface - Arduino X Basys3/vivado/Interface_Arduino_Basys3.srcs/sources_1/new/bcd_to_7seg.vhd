----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Rafael Feijo Leonardo
-- 
-- Create Date: 11/14/2020 02:09:37 PM
-- Design Name: 
-- Module Name: bcd_to_7seg - Behavioral
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

entity bcd_to_7seg is
    Port ( clk, rst :  in STD_LOGIC;
           ascii    :  in STD_LOGIC_VECTOR (7 downto 0);
           disp3    : out STD_LOGIC_VECTOR (0 to 6);
           disp2    : out STD_LOGIC_VECTOR (0 to 6);
           disp1    : out STD_LOGIC_VECTOR (0 to 6);
           disp0    : out STD_LOGIC_VECTOR (0 to 6));
end bcd_to_7seg;

architecture Behavioral of bcd_to_7seg is

    SIGNAL int : STD_LOGIC_VECTOR (4 downto 0) := (others=>'0');
    SIGNAL dec : STD_LOGIC_VECTOR (1 downto 0) := (others=>'0');

begin

    process (int)
    begin
        CASE int IS
            when "00000" =>	--0
                disp3 <= "1111111";
                disp2 <= "0000001";
            when "00001" =>	--1
                disp3 <= "1111111";
                disp2 <= "1001111";
            when "00010" =>	--2
                disp3 <= "1111111";
                disp2 <= "0010010";
            when "00011" =>	--3
                disp3 <= "1111111";
                disp2 <= "0000110";
            when "00100" =>	--4
                disp3 <= "1111111";
                disp2 <= "1001100";
            when "00101" =>	--5
                disp3 <= "1111111";
                disp2 <= "0100100";
            when "00110" =>	--6
                disp3 <= "1111111";
                disp2 <= "1100000";
            when "00111" =>	--7
                disp3 <= "1111111";
                disp2 <= "0001111";
            when "01000" =>	--8
                disp3 <= "1111111";
                disp2 <= "0000000";
            when "01001" =>	--9
                disp3 <= "1111111";
                disp2 <= "0000100";
            when "01010" =>	--10
                disp3 <= "1001111";
                disp2 <= "0000001";
            when "01011" =>	--11
                disp3 <= "1001111";
                disp2 <= "1001111";
            when "01100" =>	--12
                disp3 <= "1001111";
                disp2 <= "0010010";
            when "01101" =>	--13
                disp3 <= "1001111";
                disp2 <= "0000110";
            when "01110" =>	--14
                disp3 <= "1001111";
                disp2 <= "1001100";
            when "01111" =>	--15
                disp3 <= "1001111";
                disp2 <= "0100100";
            when "10000" =>	--16
                disp3 <= "1001111";
                disp2 <= "1100000";
            when "10001" =>	--17
                disp3 <= "1001111";
                disp2 <= "0001111";
            when "10010" =>	--18
                disp3 <= "1001111";
                disp2 <= "0000000";
            when "10011" =>	--19
                disp3 <= "1001111";
                disp2 <= "0000100";
            when "10100" =>	--20
                disp3 <= "0010010";
                disp2 <= "0000001";
            when "10101" =>	--21
                disp3 <= "0010010";
                disp2 <= "1001111";
            when "10110" =>	--22
                disp3 <= "0010010";
                disp2 <= "0010010";
            when "10111" =>	--23
                disp3 <= "0010010";
                disp2 <= "0000110";
            when "11000" =>	--24
                disp3 <= "0010010";
                disp2 <= "1001100";
            when "11001" =>	--25
                disp3 <= "0010010";
                disp2 <= "0100100";
            when "11010" =>	--26
                disp3 <= "0010010";
                disp2 <= "1100000";
            when "11011" =>	--27
                disp3 <= "0010010";
                disp2 <= "0001111";
            when "11100" =>	--28
                disp3 <= "0010010";
                disp2 <= "0000000";
            when "11101" =>	--29
                disp3 <= "0010010";
                disp2 <= "0000100";
            when "11110" =>	--30
                disp3 <= "0000110";
                disp2 <= "0000001";
            when "11111" =>	--31
                disp3 <= "0000110";
                disp2 <= "1001111";
            when others =>
                disp3 <= "1111111";
                disp2 <= "1111111";
        end CASE;
    end process;
    
    process (dec)
    begin
        CASE dec IS
            when "00" =>	--0
                disp1 <= "0000001";
                disp0 <= "0000001";
            when "01" =>	--1
                disp1 <= "0010010";
                disp0 <= "0100100";
            when "10" =>	--2
                disp1 <= "0100100";
                disp0 <= "0000001";
            when "11" =>	--3
                disp1 <= "0001111";
                disp0 <= "0100100";
            when others =>
                disp1 <= "1111111";
                disp0 <= "1111111";
        end CASE;
    end process;

    int <= NOT ascii(6 downto 2);
    dec <= NOT ascii(1 downto 0);

end Behavioral;
