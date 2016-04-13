----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:
-- Design Name: 
-- Module Name:    Controller - Behavioral 
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

entity controller is
	port (
		inst 	: in 	std_logic_vector(11 downto 0):=(others=>'0');				--ins[31 downto 20]
		mul	: in  std_logic_vector(3 downto 0):=(others=>'0');					--ins[7 downto 4] = 1001 for mul
		clock	: in 	std_logic;
		flags	: in  std_logic_vector(3 downto 0):=(others=>'0');
		Rsrc 	: out std_logic := '0';
		--Actrl	: out std_logic_vector(3 downto 0);
		Psrc 	: out std_logic := '0';
		Asrc 	: out std_logic:='0';
		FSet 	: out std_logic:='0';
		MW 	: out std_logic:='0';
		p		: out std_logic;			--predication p
		MR 	: out std_logic;
		RW 	: out std_logic;
		M2R 	: out std_logic:='0';
		ML		: out std_logic:='0';			--multiply indicator
		opc 	: out std_logic_vector(3 downto 0):=(others=>'0')
	);
end controller;

architecture Behavioral of Controller is
	
	component Actrl is
	  port(
		clk 	: 	in	std_logic;							--clock not needed
		ins	:	in std_logic_vector(5 downto 0):=(others=>'0');
		opc	:	out std_logic_vector(3 downto 0):=(others=>'0')
	  );
	end component;

	component Bctrl is
	  port(
		ins	:	in	std_logic_vector(3 downto 0):=(others=>'0');			--ins[31 downto 28]
		flags	:	in std_logic_vector(3 downto 0):=(others=>'0');			--flags (f(0)=N; f(1)=C; f(2)=V; f(3)=Z;  -- NCVZ)
		p		:	out std_logic				--predicate
	  );
	end component;
	
	signal predicatep : std_logic :='0';
	--signal Rsrc			: std_logic :='0';
	
begin
	-- Asrc
	
	actr : Actrl 
		port map(
			clk => clock,
			ins => inst (6 downto 1),
			opc => opc
		);

	bctr : Bctrl
		port map(
			ins => inst(11 downto 8),
			flags => flags,
			p => predicatep
		);
	
	
	p<= predicatep;
	
	
	
	--Asrc <= Rsrc;
	--M2R <= Rsrc;
	--M2R and Asrc are same as Rsrc
	
	process(clock)			--generate all control signals based on dp or dt or branch instruction
	begin							-- ins[31-20] in ins(11 downto 0)
		if(inst(7 downto 6) = "00") then
			if (mul = "1001") then
				Rsrc <= '1';	Asrc<='0';		M2R<='0';		RW<= predicatep;		MW<='0';			MR <='0';	Psrc <= '0';	Fset <= predicatep;		ML<='1';
			elsif (inst(4)='0' and inst(0)='0') then
				Rsrc <= '0'; 	Asrc<='0';		M2R<='0';		RW <= predicatep;		MW <= '0';  	MR <= '0';	Psrc <= '0';	Fset <= '0';				ML<='0';
			elsif (inst(4)='0' and inst(0)='1') then
				Rsrc <= '0'; 	Asrc<='0';		M2R<='0';		RW <= predicatep;		MW <= '0';  	MR <= '0';	Psrc <= '0';	Fset <= predicatep;		ML<='0';
			elsif (inst(3) ='1' and inst(0)='0') then	
				Rsrc <= '0'; 	Asrc<='0';		M2R<='0';		RW <= predicatep;		MW <= '0';  	MR <= '0';	Psrc <= '0';	Fset <= '0';				ML<='0';
			elsif (inst(3)= '1' and inst(0)='1') then
				Rsrc <= '0'; 	Asrc<='0';		M2R<='0';		RW <= predicatep;		MW <= '0';  	MR <= '0';	Psrc <= '0';	Fset <= predicatep;		ML<='0';
			elsif (inst(4)='1' and inst(3)='0') then
				Rsrc <= '0'; 	Asrc<='0';		M2R<='0';		RW <= '0';				MW <= '0';  	MR <= '0';	Psrc <= '0';	Fset <= predicatep;		ML<='0';
			else null;
			end if;
		elsif (inst(7 downto 6) = "01") then
			Rsrc <= '1';
			Asrc<='1';		
			M2R<='1';		
			Psrc <='0';
			Fset <='0';
			ML<='0';			--is it a multiply instruction?
			if (inst(0)='0') then
				RW <='0';
				MW <=predicatep;
				MR <='0';
			else
				RW <=predicatep;
				MW<='0';
				MR <='1';
			end if;
		elsif (inst(7 downto 6) = "10") then		--branch instruction
			Rsrc <= '0';     --Rsrc = X
			Asrc<='0';
			M2R<='0';		
			RW <= '0';
			MW <= '0';
			MR <= '0';
			ML<='0';			--is it a multiply instruction?
			Psrc <= predicatep;
			Fset <= '0';
		else null;
		end if;
	end process;



end Behavioral;