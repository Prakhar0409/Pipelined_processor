----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 
-- Design Name: 
-- Module Name:    Actrl - Behavioral 
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

entity Actrl is
	port(
		clk 	: 	in	std_logic;							--clock not needed
		ins	:	in std_logic_vector(5 downto 0):=(others=>'0');
		opc	:	out std_logic_vector(3 downto 0):=(others=>'0')
	);
end Actrl;

architecture Behavioral of Actrl is
																
begin
	process(clk,ins)
	begin 
		if (ins(5) = '0') then				--DP or multiply instruction 
			opc <= ins(3 downto 0);
		else
			if(ins(2)= '1') then		--means up
				opc <= "0100";			--opc for add
			else
				opc <= "0010";
			end if;
		end if;
	end process;

end Behavioral;

