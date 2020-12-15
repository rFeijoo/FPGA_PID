----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Rafael Feijo Leonardo
-- 
-- Create Date: 12/15/2020 03:20:48 AM
-- Design Name: 
-- Module Name: top_block - Behavioral
-- Project Name: Bettas House - Temperature PID Controller
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

entity top_block is
    Port ( clk    :  in STD_LOGIC;
           start  :  in STD_LOGIC;
           rx_pin :  in STD_LOGIC;
           seg    : out STD_LOGIC_VECTOR (0 to 6);
           dp     : out STD_LOGIC;
           an     : out STD_LOGIC_VECTOR (3 downto 0);
           duty   : out STD_LOGIC_VECTOR (2 downto 0);
           pwm_out: out STD_LOGIC;
           pwm_led: out STD_LOGIC;
           ready  : out STD_LOGIC);
end top_block;

architecture Behavioral of top_block is

    COMPONENT VIO_0
        Port ( clk        :  in STD_LOGIC;
               probe_in0  :  in STD_LOGIC_VECTOR (31 downto 0);
               probe_in1  :  in STD_LOGIC_VECTOR (0  downto 0);
               probe_in2  :  in STD_LOGIC_VECTOR (7  downto 0);
               probe_out0 : out STD_LOGIC_VECTOR (0  downto 0);
               probe_out1 : out STD_LOGIC_VECTOR (31 downto 0);
               probe_out2 : out STD_LOGIC_VECTOR (31 downto 0);
               probe_out3 : out STD_LOGIC_VECTOR (31 downto 0);
               probe_out4 : out STD_LOGIC_VECTOR (31 downto 0));
    end COMPONENT;

    COMPONENT top_module
        Port ( clk, rst :  in STD_LOGIC;
               rx_pin   :  in STD_LOGIC;
               temp     : out STD_LOGIC_VECTOR (7 downto 0);
               ready    : out STD_LOGIC;
               seg      : out STD_LOGIC_VECTOR (0 to 6);
               dp       : out STD_LOGIC;
               an       : out STD_LOGIC_VECTOR (3 downto 0));
    end COMPONENT;
    
    COMPONENT PID_0
        Port ( clk, rst :  in STD_LOGIC;
               start    :  in STD_LOGIC;
               temp_in  :  in STD_LOGIC_VECTOR (7  downto 0);
               setpoint :  in STD_LOGIC_VECTOR (31 downto 0);
               kP,kI,kD :  in STD_LOGIC_VECTOR (31 downto 0);
               PID      : out STD_LOGIC_VECTOR (31 downto 0);
               ready    : out STD_LOGIC);
    end COMPONENT;
    
    COMPONENT PID_decoder is
        Port ( clk, rst :  in STD_LOGIC;
               start    :  in STD_LOGIC;
               PID_in   :  in STD_LOGIC_VECTOR (31 downto 0);
               DutyCycle: out STD_LOGIC_VECTOR (2  downto 0);
               ready    : out STD_LOGIC);
    end COMPONENT;
    
    COMPONENT pwm_cell_0
        Port ( clk  :  in STD_LOGIC;
               rst  :  in STD_LOGIC;
               duty :  in STD_LOGIC_VECTOR (2 downto 0);
               pwm  : out STD_LOGIC);
    end COMPONENT;

    SIGNAL rst, s_start, s_ready_interface, s_ready_pid, s_pwm : STD_LOGIC := '0';
    SIGNAL s_setpoint, s_kP, s_kI, s_kD, s_PID : STD_LOGIC_VECTOR (31 downto 0) := (others=>'0');
    SIGNAL s_fixed_point_temp : STD_LOGIC_VECTOR (7 downto 0) := (others=>'0');
    SIGNAL s_duty : STD_LOGIC_VECTOR (2 downto 0) := (others=>'0');

begin

    virtual_IO: VIO_0 Port Map (clk           => clk, 
                                probe_in0     => s_PID,
                                probe_in1(0)  => start,
                                probe_in2     => s_fixed_point_temp,
                                probe_out0(0) => rst, 
                                probe_out1    => s_setpoint, 
                                probe_out2    => s_kP, 
                                probe_out3    => s_kI, 
                                probe_out4    => s_kD);
    interface: top_module Port Map (clk, rst, rx_pin, s_fixed_point_temp, s_ready_interface, seg, dp, an);
    controller: PID_0 Port Map (clk, rst, s_start, s_fixed_point_temp, s_setpoint, s_kP, s_kI, s_kD, s_PID, s_ready_pid);
    decoder: PID_decoder Port Map (clk, rst, s_ready_pid, s_PID, s_duty, ready);
    pwm_cell: pwm_cell_0 Port Map (clk, rst, s_duty, s_pwm);

    process (clk, rst, start)
        variable enable : std_logic := '0';
        variable counter : integer range 0 to 49999999 := 0;
        --variable aux : std_logic := '0';
    begin
        if rst = '1' then
            s_start <= '0';
            counter := 0;
            enable := '0';
        elsif rising_edge(clk) then
            if start = '1' OR enable = '1' then
                enable := '1';
                if counter = 49999999 then
                    counter := 0;
                    s_start <= '1';
                    enable := '0';
                    --aux := NOT aux;
                    --pwm <= aux;
                else
                    counter := counter + 1;
                    s_start <= '0';
                end if;
            end if;
        end if;
    end process;

    ready <= s_ready_pid;
    pwm_out <= s_pwm;
    pwm_led <= s_pwm;
    duty <= s_duty;

end Behavioral;
