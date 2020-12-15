----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Rafael Feijo Leonardo
-- 
-- Create Date: 10/08/2020 19:35:58 PM
-- Design Name: 
-- Module Name: pwm_controller - Behavioral
-- Project Name: Simple PWM Cell
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

entity pwm_cell is
    Generic ( f :  integer := 120);
    Port ( clk  :  in std_logic;
           rst  :  in std_logic;
           duty :  in std_logic_vector (2 downto 0);
           pwm  : out std_logic);
end pwm_cell;

architecture Behavioral of pwm_cell is

    constant period : integer := 100000000 / f;
    constant half_period : integer := period / 2;
    
    signal duty_cycle : integer := 0;
    signal s_pwm : std_logic := '0';
    signal s_clk_counter : integer := period;

begin

    process (clk, rst, duty_cycle)
    begin
        if rst = '1' OR duty_cycle = 0 then
            s_pwm <= '0';
            s_clk_counter <= period;
        else
            if rising_edge(clk) then
                if s_clk_counter = period then
                    s_pwm <= '1';
                    s_clk_counter <= 0;
                elsif s_clk_counter = duty_cycle then
                    s_pwm <= '0';
                    s_clk_counter <= s_clk_counter + 1;
                else
                    s_clk_counter <= s_clk_counter + 1;
                end if;
            end if;
        end if;
    end process;

    process (duty)
    begin
        case duty is
            when "000"  => duty_cycle <= 0;                       -- 0%
            when "001"  => duty_cycle <= (period / 10) - 1;       -- 10%
            when "010"  => duty_cycle <= (period / 4)  - 1;       -- 25%
            when "011"  => duty_cycle <= ((period / 10) * 4) - 1; -- 40%
            when "100"  => duty_cycle <= half_period - 1;         -- 50%
            when "101"  => duty_cycle <= ((period / 10) * 6) - 1; -- 60%
            when "110"  => duty_cycle <= ((period / 4) * 3) - 1;  -- 75%
            when others => duty_cycle <= period;              -- 100% 
        end case;
    end process;
    
    pwm <= s_pwm;

end Behavioral;
