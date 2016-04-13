----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:56:44 03/14/2016 
-- Design Name: 
-- Module Name:    Bctrl - Behavioral 
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

entity Bctrl is
	port(
		ins	:	in	std_logic_vector(3 downto 0):=(others=>'0');			--ins[31 downto 28]
		flags	:	in std_logic_vector(3 downto 0):=(others=>'0');			--flags (f(0)=N; f(1)=C; f(2)=V; f(3)=Z;  -- NCVZ)
		p		:	out std_logic				--predicate
	);
end Bctrl;

architecture Behavioral of Bctrl is
	signal cond : 	std_logic_vector(3 downto 0);
	signal C,Z,V,N		:	std_logic;
begin
		N <= flags(0);
		C <= flags(1);
		V <= flags(2);
		Z <= flags(3);

	process(ins,flags,Z,C,V,N)
	begin
	
		case ins is
			when "0000" => p<=Z;			--EQ 'Z=1'
			when "0001" => p<= not Z;
			when "0010" => p<=C;
			when "0011"	=> p<= not C;
			when "0100" => p<=N;
			when "0101" => p<=not N;
			when "0110" => p<=V;
			when "0111"	=> p<= not V;
			when "1000" => p<= (C and (not Z));
			when "1001" => p<= ((not C) or Z);
			when "1010" => p<= ((N and V) or ((not N) and (not V)));		--N=V
			when "1011" => p<= ((N and (not V)) or ((not N) and (V)));		--N!=V
			when "1100" => p <= ((not Z) and ((N and V) or ((not N) and (not V))));		--Zclear and N=V
			when "1101" => p <= (Z or ((N and (not V)) or ((not N) and V)));		--Zclear and N=V
			when "1110" => p<= '1';
			when others =>
				null;
			end case;
	end process;
end Behavioral;

