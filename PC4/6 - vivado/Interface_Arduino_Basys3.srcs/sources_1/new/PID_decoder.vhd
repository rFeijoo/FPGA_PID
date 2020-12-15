----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Rafael Feijo Leonardo
-- 
-- Create Date: 12/14/2020 03:35:18 PM
-- Design Name: 
-- Module Name: PID_decoder - Behavioral
-- Project Name: Temperature PID Controller
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

entity PID_decoder is
    Port ( clk, rst :  in STD_LOGIC;
           start    :  in STD_LOGIC;
           PID_in   :  in STD_LOGIC_VECTOR (31 downto 0);
           DutyCycle: out STD_LOGIC_VECTOR (2 downto 0);
           ready    : out STD_LOGIC);
end PID_decoder;

architecture Behavioral of PID_decoder is

    COMPONENT floating_point_0
        Port ( aclk                 :  in STD_LOGIC;
               s_axis_a_tvalid      :  in STD_LOGIC;
               s_axis_a_tready      : out STD_LOGIC;
               s_axis_a_tdata       :  in STD_LOGIC_VECTOR (31 downto 0);
               m_axis_result_tvalid : out STD_LOGIC;
               m_axis_result_tready :  in STD_LOGIC;
               m_axis_result_tdata  : out STD_LOGIC_VECTOR (31 downto 0));
    end COMPONENT;
    
    SIGNAL s_axis_a_tready, s_start, s_ready : STD_LOGIC := '0';
    SIGNAL s_PID_decoded, PID_out : STD_LOGIC_VECTOR (31 downto 0) := (others=>'0');

begin

    converter: floating_point_0 Port Map (clk, s_start, s_axis_a_tready, PID_in, s_ready, s_start, s_PID_decoded);
    
    -- Decoder driver
    process (clk, rst, start, s_ready)
        variable lock : std_logic := '1';
        variable delay: integer range 0 to 5 := 0;
    begin
        if rst = '1' then
            lock    := '1';
            delay   := 0;
            s_start <= '0';
            PID_out <= (others=>'0');
            ready   <= '0';
        elsif rising_edge(clk) then
            if lock = '1' AND start = '1' then
                lock    := '0';
                s_start <= '1';
            elsif delay = 5 AND lock = '0' AND s_ready = '1' then
                lock    := '1';
                delay   := 0;
                s_start <= '0';
                PID_out <= s_PID_decoded;
                ready   <= '1';
            elsif lock = '0' AND delay < 5 then
                delay   := delay + 1;
                s_start <= '0';
                ready   <= '0';
            else
                s_start <= '0';
                ready   <= '0';
            end if;
        end if;
    end process;
    
    -- Output driver
    process (clk, rst, PID_out)
    begin
        if rst = '1' then
            DutyCycle <= (others=>'0');
        elsif rising_edge(clk) then
            if signed(PID_out) < 1 then
                DutyCycle <= (others=>'0');
            elsif signed(PID_out) > 6 then
                DutyCycle <= (others=>'1');
            else
                DutyCycle <= PID_out(2 downto 0);
            end if;
        end if;
    end process;

end Behavioral;
