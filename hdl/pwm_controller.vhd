----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.10.2016 13:19:37
-- Design Name: 
-- Module Name: PWM_controller - Behavioral
-- Project Name: 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PWM_controller is
    Port ( CLK_IN : in STD_LOGIC;
           DUTYCYCLE : in STD_LOGIC_VECTOR(31 downto 0);
           PWM_OUT : out STD_LOGIC_VECTOR(7 downto 0));
end PWM_controller;

architecture Behavioral of PWM_controller is
constant period : integer := 10;
signal PWM_signal : std_logic_vector(7 downto 0);
signal count : std_logic_vector(period-1 downto 0);
begin

process(CLK_IN)
begin
    if rising_edge (CLK_IN) then
        count <= count +1;
    end if;
end process;

process(CLK_IN)
begin
    if rising_edge(CLK_IN) then
    if count<DUTYCYCLE then
        PWM_signal <= (others=>'1');
    else
        PWM_signal <= (others=>'0');
    end if;
    end if;
end process;


PWM_OUT <= PWM_signal;
end Behavioral;
