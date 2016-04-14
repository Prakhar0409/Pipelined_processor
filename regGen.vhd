----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Design Name: 
-- Module Name:   
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

entity regGen is
	 Generic (
			N: integer := 32
			);
	 Port ( 	
			clk : in std_logic;
			regIn : in std_logic_vector(N-1 downto 0):= (others => '0');			--value is N bit wide
			regOut : out std_logic_vector(N-1 downto 0) := (others => '0');
			regReset : in std_logic:='0';
			regEn : in std_logic
         );
end regGen;

architecture Behavioral of regGen is
	signal mem : std_logic_vector(N-1 downto 0) := (others => '0');

begin
	
inc:process(clk)
	begin	
		if rising_edge(clk) then
			if regReset = '0' then
				if regEn = '1' then 
					regOut<=regIn;--regOut<=mem;
					mem<=regIn;
				else
					regOut<=mem;
				end if;			
			else
				mem <= (others => '0');
				regOut <= mem;
			end if;
		end if;
	end process;
end Behavioral;

