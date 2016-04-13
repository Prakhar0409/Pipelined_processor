----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Design Name: 
-- Module Name:    registerFile - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegisterFile is
port(
    outA        : out std_logic_vector(31 downto 0):=(others=>'0');
    outB        : out std_logic_vector(31 downto 0):=(others=>'0');
    input       : in  std_logic_vector(31 downto 0):=(others=>'0');
    writeEnable : in  std_logic:='0';
    regASel     : in  std_logic_vector(3 downto 0):=(others=>'0');
    regBSel     : in  std_logic_vector(3 downto 0):=(others=>'0');
    writeRegSel : in  std_logic_vector(3 downto 0):=(others=>'0');
    clk         : in  std_logic:='0'
    );
end registerFile;

architecture Behavioral of registerFile is
	type registerCollection is array(0 to 15) of std_logic_vector(31 downto 0);
	signal registers : registerCollection := ("00000000000000000000000000000011",
																"00000000000000000000000000000001",
																"00000000000000000000000000000111",
																"00000000000000000000000000000000",
																"00000000000000000000000000000101",
																"00000000000000000000000000000110",
																"00000000000000000000000000000000",
																"00000000000000000000000000001111",
																
																"00000000000000000000000000000011",
																"00000000000000000000000000000001",
																"00000000000000000000000000000111",
																"00000000000000000000000000000100",
																"00000000000000000000000000000101",
																"00000000000000000000000000000110",
																"00000000000000000000000000000000",
																"00000000000000000000000000001111"	
																);
	
begin

	
	reg: process (clk,regASel,regBSel) is
	begin
	
		if rising_edge(clk) then
			if(regASel /= writeRegSel) then
				outA <= registers(to_integer(unsigned(regASel)));
			end if;
			if(regBSel /= writeRegSel) then
				outB <= registers(to_integer(unsigned(regBSel)));
			end if;
			
			if (writeEnable= '1') then
				registers(to_integer(unsigned(writeRegSel))) <= input;
				if(regASel = writeRegSel) then
					outA <= input;
				end if;
				if(regBSel = writeRegSel) then
					outB <= input;
				end if;
			end if;
		else
			outA <= registers(to_integer(unsigned(regASel)));
			outB <= registers(to_integer(unsigned(regBSel)));
		end if;
	end process;


end Behavioral;

