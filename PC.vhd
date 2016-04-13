----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Design Name: 
-- Module Name:    pc - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pc is
	 Port ( 	
			clk : in std_logic;
			pcin : in std_logic_vector(9 downto 0):= (others => '0');			--instruction address is 10 bit wide
			pcout : out std_logic_vector(9 downto 0) := (others => '0');
			reset : in std_logic:='0';
			pcen : in std_logic
         );
end pc;

architecture Behavioral of pc is
	signal mem : std_logic_vector(9 downto 0) := (others => '0');

begin
	
inc:process(clk)
	begin	
		if rising_edge(clk) then
			if reset = '0' then
				if pcen = '1' then 
					pcout<=mem;
					mem<=pcin;
				else
					pcout<=mem;
				end if;			
			else
				mem <= (others => '0');
				pcout <= mem;
			end if;
		end if;
	end process;



end Behavioral;

