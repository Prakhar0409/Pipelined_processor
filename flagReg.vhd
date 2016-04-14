----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:   
-- Design Name: 
-- Module Name:    flagReg - Behavioral 
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

entity flagReg is
	port (
		flagClk		: in  std_logic:='0';
		flagInp 		: in	std_logic_vector(3 downto 0):=(others=>'0');
		flagEn		: in  std_logic:='0';
		flagOut		: out std_logic_vector(3 downto 0):=(others=>'0')
	);
end flagReg;

architecture Behavioral of flagReg is
	signal flagMem : std_logic_vector(3 downto 0):=(others=>'0');
begin

	process(flagClk,flagEn)
	begin
	
	if rising_edge(flagClk) then
		if (flagEn = '1') then
			flagMem <= flagInp;
			flagOut <= flagMem;
		end if;
	end if;
	end process;

end Behavioral;

