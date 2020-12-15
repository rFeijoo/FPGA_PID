----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Rafael Feijo Leonardo
-- 
-- Create Date: 11/13/2020 06:25:19 PM
-- Design Name: 
-- Module Name: top_module - Behavioral
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

entity top_module is
    Port ( clk, rst :  in STD_LOGIC;
           rx_pin   :  in STD_LOGIC;
           temp     : out STD_LOGIC_VECTOR (7 downto 0);
           ready    : out STD_LOGIC;
           seg      : out STD_LOGIC_VECTOR (0 to 6);
           dp       : out STD_LOGIC;
           an       : out STD_LOGIC_VECTOR (3 downto 0));
end top_module;

architecture Behavioral of top_module is

    COMPONENT serialcom
        Port ( reset      :  in STD_LOGIC;
               clk        :  in STD_LOGIC;
               start      :  in STD_LOGIC;
               sw         :  in STD_LOGIC_VECTOR (7 downto 0);
               din        :  in STD_LOGIC;
               led        : out STD_LOGIC_VECTOR (7 downto 0);
               ready_data : out STD_LOGIC;
               dout       : out STD_LOGIC);
    end COMPONENT;
    
    COMPONENT bcd_to_7seg is
        Port ( clk, rst :  in STD_LOGIC;
               ascii    :  in STD_LOGIC_VECTOR (7 downto 0);
               temp     : out STD_LOGIC_VECTOR (7 downto 0);
               ready    : out STD_LOGIC;
               disp3    : out STD_LOGIC_VECTOR (0 to 6);
               disp2    : out STD_LOGIC_VECTOR (0 to 6);
               disp1    : out STD_LOGIC_VECTOR (0 to 6);
               disp0    : out STD_LOGIC_VECTOR (0 to 6));
    end COMPONENT;
    
    COMPONENT driver_7seg is
        Port ( clk, rst :  in STD_LOGIC;
               disp3    :  in STD_LOGIC_VECTOR (0 to 6);
               disp2    :  in STD_LOGIC_VECTOR (0 to 6);
               disp1    :  in STD_LOGIC_VECTOR (0 to 6);
               disp0    :  in STD_LOGIC_VECTOR (0 to 6);
               seg      : out STD_LOGIC_VECTOR (0 to 6);
               dp       : out STD_LOGIC;
               an       : out STD_LOGIC_VECTOR (3 downto 0));
    end COMPONENT;
    
    SIGNAL s_ready, s_dout : STD_LOGIC;
    SIGNAL serial_data     : STD_LOGIC_VECTOR (7 downto 0);
    SIGNAL d3, d2, d1, d0  : STD_LOGIC_VECTOR (0 to 6);

begin

    serial_mod: serialcom Port Map ( reset      => rst,
                                     clk        => clk,
                                     start      => '0',
                                     sw         => (others=>'0'),
                                     din        => rx_pin,
                                     led        => serial_data,
                                     ready_data => s_ready,
                                     dout       => s_dout);
                                     
    decoder_mod: bcd_to_7seg Port Map ( clk   => clk,
                                        rst   => rst,
                                        ascii => serial_data,
                                        temp  => temp,
                                        ready => ready,
                                        disp3 => d3,
                                        disp2 => d2,
                                        disp1 => d1,
                                        disp0 => d0);
                                        
    disp_diver: driver_7seg Port Map ( clk   => clk,
                                       rst   => rst,
                                       disp3 => d3,
                                       disp2 => d2,
                                       disp1 => d1,
                                       disp0 => d0,
                                       seg   => seg,
                                       dp    => dp,
                                       an    => an);

end Behavioral;
