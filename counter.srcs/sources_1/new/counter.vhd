----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2019 04:22:22 PM
-- Design Name: 
-- Module Name: counter - Behavioral
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
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
    Port ( sysclk : in STD_LOGIC; -- 125MHz
           led : out STD_LOGIC_VECTOR (3 downto 0));
end counter;

architecture Behavioral of counter is
  signal count : unsigned(28 downto 0) := (others => '0');
  signal probe : unsigned(7 downto 0) := (others => '0');
  attribute mark_debug : string;
  attribute mark_debug of probe: signal is "true";
begin

  process(sysclk) is
  begin
    if rising_edge(sysclk) then
      count <= count + 1; 
      probe <= count(7 downto 0);     
    end if;
  end process;

  led <= std_logic_vector( count(28 downto 25) );
  

end Behavioral;
