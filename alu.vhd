----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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

entity alu is
	port (
		inp1			:	in signed (31 downto 0):=(others=>'0');			--input 1	
		inp2			:	in signed (31 downto 0):=(others=>'0');			--input 2
		inFlags		: 	in std_logic_vector(3 downto 0):=(others=>'0');
		ML				: 	in std_logic:='0';
		cin 			:	in std_logic; 
	--	s : in std_logic;
		
		outFlags			:	out signed (3 downto 0) := (others => '0');		--flags (f(0)=N; f(1)=C; f(2)=V; f(3)=Z;  -- NCVZ)
		opc 			: 	in std_logic_vector(3 downto 0) := (others => '0');
--		flag 			: out signed (3 downto 0) := (others => '0');
		outp			:	out signed(31 downto 0):=(others=>'0');
		Cout			:	out std_logic:='0'							-- carry out
	);
end alu;

architecture Behavioral of alu is

	signal a,b,ou : signed (32 downto 0) := (others => '0');
	signal carryin : std_logic := '0';
	signal carryAdd : signed(32 downto 0):=(others=>'0');
	signal mulRes : signed (65 downto 0):=(others=>'0');
	
	begin
		carryAdd(0) <= inflags(1) or cin;
		a <= inp1(31) & inp1;
		b <= inp2(31) & inp2;
		
		outp <= ou (31 downto 0);
		Cout <= ou(32);
	
	process (a,b,opc) --,s)
		begin
		if (ML='1') then
			ou<= resize(signed(a)*signed(b),ou'length );
			--ou<=mulRes(32 downto 0);
		else
			case opc is
				when "0000" =>			--and 0000
					ou <= a and b;
				when "0001" =>			--eor 0001
					ou <= a xor b;
				when "0010" =>			--sub 0010
					ou <= a - b;			--a + (not b)+"00000000000000000000000000000001";
				when "0011" =>
					ou <= b - a;
				when "0100" =>
					ou <= a + b;			--add 0100
				when "0101" =>									
					ou <= a + b + carryAdd;			--add with carry		-- ou = a+b+carry	
				when "0110" =>									
					ou <= a - b +carryAdd - "00000000000000000000000000000001";			--sub with carry  --ou= a-b+carry-1
				when "0111" =>									
					ou <= b - a +carryAdd - "00000000000000000000000000000001";			--reverse sub with c --ou=b-a+carry-1
				when "1000" =>
					ou <= a and b;
				when "1001" =>
					ou <= a xor b;
				when "1010" =>
					ou <= a - b;
				when "1011" =>
					ou <= a + b;
				when "1100" =>
					ou <= a or b;
				when "1101" =>
					ou <= b;
				when "1110" =>
					ou <= a and (not b);
				when "1111" =>
					ou <= not b;
				when others =>
					null;
			end case;
		end if;
	end process;	
--	
--mulProc:process(mulRes)
--		begin
--			ou<=mulres(32 downto 0);
--		end process;

	
setFlag: process (ou) --,s)
	begin
	--checkOu <= to_integer(ou(31 downto 0));
--	if s='1' then
		if to_integer(ou(31 downto 0)) < 0  then
		outFlags(0) <= '1';
--			n <= '1';
		else 
		outFlags(0) <= '0';
--			n <= '0';
		end if;
		if to_integer(ou(31 downto 0)) = 0 then
			--z <= '1';
		outFlags(3) <= '1';
		else 
		outFlags(3) <= '0';
--			z <= '0';
		end if;
		Cout <= ou(32);
	outFlags(1) <= ou(32);
--		c <= ou(32);
		if (to_integer(a(31 downto 0)) < 0) and (to_integer(b(31 downto 0)) < 0) and (to_integer(ou(31 downto 0)) > 0) then
		outFlags(2) <= '1';
--			v <= '1';
		elsif (to_integer(a(31 downto 0)) > 0) and (to_integer(b(31 downto 0)) > 0) and (to_integer(ou(31 downto 0)) < 0) then
		outFlags(2) <= '1';
--			v <= '1';
		else
		outFlags(2)<='0';
--			v <= '0';
		end if;
	--else 
	--outFlags <= "0000";
	--end if;
		
	end process;
	
end Behavioral;