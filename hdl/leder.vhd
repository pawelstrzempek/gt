----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.10.2016 13:36:06
-- Design Name: 
-- Module Name: leder - Behavioral
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
use IEEE.STD_LOGIC_ARITH.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity leder is
port(
LED : out std_logic_vector(7 downto 0);
CLK : in std_logic
);
end leder;

architecture Behavioral of leder is
signal counter : std_logic_vector(30 downto 0) := (others=>'0');
signal led_sgn : std_logic_vector(7 downto 0):= x"ff";
signal dutycnt : std_logic_vector(7 downto 0):= x"00";
signal duty_sgn : std_logic_vector(31 downto 0)  := (others=>'0');
signal clk_sgn : std_logic := '0';
component PWM_controller is
    port ( CLK_IN : in STD_LOGIC;
           DUTYCYCLE : in STD_LOGIC_VECTOR(31 downto 0);
           PWM_OUT : out STD_LOGIC_VECTOR(7 downto 0));
end component;

component clk_wiz_0 is
    port(
        clk_in1 : in std_logic;
        reset : in std_logic;
        clk_out1 : out std_logic;
        locked : out std_logic
    );
end component;
begin

pwm_ctr_1 : PWM_controller 
port map(
    CLK_IN => clk_sgn,
    DUTYCYCLE=> duty_sgn,
    PWM_OUT =>led_sgn
);

clk_wiz_i1 : component clk_wiz_0
    port map(
        clk_in1 => CLK,
        reset => '0',
        clk_out1 => clk_sgn,
        locked => open
        );


process(clk_sgn)
begin
    if rising_edge(clk_sgn) then
        if counter<3000002 then
            counter <= counter + 1;
        else
            counter <= (others=>'0');
        end if;
    end if;
end process;

process(clk_sgn)
begin
    if rising_edge(clk_sgn) then
        if(counter > 3000000) then
           dutycnt <= dutycnt +1; 
        end if;
    end if;
end process;


--LED <= counter (30 downto 27);
duty_sgn <= x"000000" & dutycnt;
LED<= led_sgn;
end Behavioral;
