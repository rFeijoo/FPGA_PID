----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Rafael Feijo Leonardo
-- 
-- Create Date: 11/13/2020 12:47:34 AM
-- Design Name: 
-- Module Name: integrative_mod - Behavioral
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

entity integrative_mod is
    Port ( clk, rst :  in STD_LOGIC;
           start    :  in STD_LOGIC;
           error, kI:  in STD_LOGIC_VECTOR (31 downto 0);
           ready    : out STD_LOGIC;
           I        : out STD_LOGIC_VECTOR (31 downto 0));
end integrative_mod;

architecture Behavioral of integrative_mod is

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
    
    COMPONENT fp_add
        Port ( aclk                 :  in STD_LOGIC;
               s_axis_a_tvalid      :  in STD_LOGIC;
               s_axis_a_tready      : out STD_LOGIC;
               s_axis_a_tdata       :  in STD_LOGIC_VECTOR (31 DOWNTO 0);
               s_axis_b_tvalid      :  in STD_LOGIC;
               s_axis_b_tready      : out STD_LOGIC;
               s_axis_b_tdata       :  in STD_LOGIC_VECTOR (31 DOWNTO 0);
               m_axis_result_tvalid : out STD_LOGIC;
               m_axis_result_tready :  in STD_LOGIC;
               m_axis_result_tdata  : out STD_LOGIC_VECTOR (31 DOWNTO 0));
    end COMPONENT;
    
    SIGNAL s_start : STD_LOGIC := '0';
    SIGNAL a_tready_mul, b_tready_mul, r_tvalid_mul : STD_LOGIC := '0';
    SIGNAL a_tready_add, b_tready_add, r_tvalid_add : STD_LOGIC := '0';
    SIGNAL aux, s_I, last_s_I : STD_LOGIC_VECTOR (31 downto 0) := (others=>'0');

begin

    fp_int_mod_mul : fp_multiply Port Map ( aclk => clk,
                                            -- Op A (kI)
                                            s_axis_a_tvalid => '1',
                                            s_axis_a_tready => a_tready_mul,
                                            s_axis_a_tdata  => kI,
                                            -- Op B (error)
                                            s_axis_b_tvalid => s_start,
                                            s_axis_b_tready => b_tready_mul,
                                            s_axis_b_tdata  => error,
                                            -- Result
                                            m_axis_result_tvalid   => r_tvalid_mul,
                                            m_axis_result_tready   => '1',
                                            m_axis_result_tdata    => aux);
                                            
    fp_int_mod_add : fp_add Port Map ( aclk => clk,
                                       -- Op A (last_s_I)
                                       s_axis_a_tvalid => '1',
                                       s_axis_a_tready => a_tready_add,
                                       s_axis_a_tdata  => last_S_I,
                                       -- Op B (s_I)
                                       s_axis_b_tvalid => r_tvalid_mul,
                                       s_axis_b_tready => b_tready_add,
                                       s_axis_b_tdata  => aux,
                                       -- Result
                                       m_axis_result_tvalid   => r_tvalid_add,
                                       m_axis_result_tready   => '1',
                                       m_axis_result_tdata    => s_I);

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
    
    process (clk, rst, r_tvalid_add)
        variable lock : std_logic := '0';
    begin
        if rst = '1' then
            I <= (others=>'0');
            last_s_I <= (others=>'0');
            lock := '0';
        elsif rising_edge(clk) then
            if r_tvalid_add = '1' then
                lock := '1';
            elsif lock = '1' then
                lock := '0';
                I <= s_I;
                last_s_I <= s_I;
            end if;
        end if;
    end process;
    
    ready <= r_tvalid_add;

end Behavioral;
