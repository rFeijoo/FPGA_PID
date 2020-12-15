----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Rafael Feijo Leonardo
-- 
-- Create Date: 11/30/2020 03:14:08 PM
-- Design Name: 
-- Module Name: derivative_mod - Behavioral
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

entity derivative_mod is
    Port ( clk, rst :  in STD_LOGIC;
           start    :  in STD_LOGIC;
           error, kD:  in STD_LOGIC_VECTOR (31 downto 0);
           ready    : out STD_LOGIC;
           D        : out STD_LOGIC_VECTOR (31 downto 0));
end derivative_mod;

architecture Behavioral of derivative_mod is

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
    
    SIGNAL s_start : STD_LOGIC := '0';
    SIGNAL a_tready_mul, b_tready_mul, r_tvalid_mul : STD_LOGIC := '0';
    SIGNAL a_tready_sub, b_tready_sub, r_tvalid_sub : STD_LOGIC := '0';
    SIGNAL aux, s_D, last_s_D : STD_LOGIC_VECTOR (31 downto 0) := (others=>'0');

begin

    fp_int_mod_sub : fp_subtract Port Map ( aclk => clk,
                                            -- Op A (last_s_S)
                                            s_axis_a_tvalid => '1',
                                            s_axis_a_tready => a_tready_sub,
                                            s_axis_a_tdata  => last_s_D,
                                            -- Op B (error)
                                            s_axis_b_tvalid => s_start,
                                            s_axis_b_tready => b_tready_sub,
                                            s_axis_b_tdata  => error,
                                            -- Result
                                            m_axis_result_tvalid   => r_tvalid_sub,
                                            m_axis_result_tready   => '1',
                                            m_axis_result_tdata    => aux);

    fp_int_mod_mul : fp_multiply Port Map ( aclk => clk,
                                            -- Op A (kD)
                                            s_axis_a_tvalid => '1',
                                            s_axis_a_tready => a_tready_mul,
                                            s_axis_a_tdata  => kD,
                                            -- Op B (aux)
                                            s_axis_b_tvalid => r_tvalid_sub,
                                            s_axis_b_tready => b_tready_mul,
                                            s_axis_b_tdata  => aux,
                                            -- Result
                                            m_axis_result_tvalid   => r_tvalid_mul,
                                            m_axis_result_tready   => '1',
                                            m_axis_result_tdata    => s_D);

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
    
    process (clk, rst, r_tvalid_mul)
        variable lock : std_logic := '0';
    begin
        if rst = '1' then
            D <= (others=>'0');
            last_s_D <= (others=>'0');
            lock := '0';
        elsif rising_edge(clk) then
            if r_tvalid_mul = '1' then
                lock := '1';
            elsif lock = '1' then
                lock := '0';
                D <= s_D;
                last_s_D <= s_D;
            end if;
        end if;
    end process;
    
    ready <= r_tvalid_mul;

end Behavioral;
