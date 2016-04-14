----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:    preAlu - Behavioral 
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
--use IEEE.STD_LOGIC_UNSIGNED.ALL;

--use ieee.std_logic_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- Task: Check if I = 0 or 1 and accordingly process the dp instruction to get the correct rotate and the shift amounts

entity preAlu is
	port (
		ML 	: in std_logic:='0';
		Rsrc : in std_logic := '0';
		I : in std_logic := '0';
		preAluInp : in std_logic_vector(11 downto 0) := (others => '0');
		preAluNum : in bit_vector(31 downto 0) := (others => '0');
		--s_amt: in integer;
		--rot : in integer;
		preAluCout : out std_logic_vector(0 downto 0):= (others=>'0');--:='0';		
		preAluOutp : out std_logic_vector(31 downto 0) := (others => '0')
	);
end preAlu;

architecture Behavioral of preAlu is
	signal s_amt : std_logic_vector(4 downto 0) := preAluInp(11 downto 7);
	signal s_type : std_logic_vector(1 downto 0) := preAluInp(6 downto 5);
	signal rot : std_logic_vector(3 downto 0) := preAluInp(11 downto 8) ;
	signal imm : bit_vector(31 downto 0) := (others => '0');
	signal Outp : bit_vector(31 downto 0) := (others => '0');

begin
	s_amt  <= preAluInp(11 downto 7);
	s_type  <= preAluInp(6 downto 5);
	rot  <= preAluInp(11 downto 8) ;
	imm(7 downto 0) <= to_bitvector(preAluInp(7 downto 0));

	preAluOutp <= to_StdLogicVector(Outp);

	process(Rsrc,I,preAluInp,s_amt,rot,preAluNum,s_type,ML,imm)
	begin
		if ML='1' then 
			Outp <= preAluNum;
		else
			if Rsrc='0' then
				if I='0' then		--then shift type and shit amt
					case s_type is
						when "00" =>		--left shift
							Outp <= preAluNum sll to_integer(unsigned(s_amt));
						when "01" =>		--right shift
							Outp <= preAluNum srl to_integer(unsigned(s_amt));
						when "10" =>
							Outp <= preAluNum sra to_integer(unsigned(s_amt));
						when "11" =>
							Outp <= preAluNum ror to_integer(unsigned(s_amt));
						when others =>
							null;
						end case;
				else
					Outp <= imm ror to_integer(unsigned(rot));
				end if;
			else
				Outp <= preAluNum;	--"00000000000000000000" & ins(11 downto 0);
			end if;
		end if;
	end process;

	process(Outp,I,Rsrc,    I,preAluInp,s_amt,rot,preAluNum,s_type,ML)
	begin
		if Rsrc='1' then
			if I='0' then		--then shift type and shit amt
				case s_type is
					when "00" =>		--left shift
						if to_integer(unsigned(s_amt))= 0 then preAlucout<="0";
						else	
							preAlucout <= to_StdLogicvector(preAluNum((32-to_integer(unsigned(s_amt))) downto (32-to_integer(unsigned(s_amt)))));
							
						end if;
					when "01" =>		--right shift
						if to_integer(unsigned(s_amt))> 32 then preAlucout<="0";
						else	preAlucout <= to_stdLogicVector(preAluNum(to_integer(unsigned(s_amt))-1 downto to_integer(unsigned(s_amt))-1));
						end if;
					when "10" =>
						if to_integer(unsigned(s_amt))> 32 then preAlucout<= to_stdLogicVector(preAluNum(31 downto 31));
						else	preAlucout <= to_stdLogicVector(preAluNum(to_integer(unsigned(s_amt))-1 downto to_integer(unsigned(s_amt))-1));
						end if;
					when "11" =>
						if to_integer(unsigned(s_amt))= 0 then preAlucout<="0";
						else	preAlucout <= to_stdLogicVector(preAluNum(((to_integer(unsigned(s_amt))-1) mod 32) downto ((to_integer(unsigned(s_amt))-1) mod 32)));
						end if;
					when others =>
						null;
					end case;
			else
				if to_integer(unsigned(rot))= 0 then preAlucout<="0";
					else	preAlucout <= to_stdLogicVector(preAluNum(((to_integer(unsigned(rot))-1) mod 32) downto ((to_integer(unsigned(rot))-1) mod 32)));
				end if;
			end if;
		--else
		--	preAluOutp <= preAluNum;	--"00000000000000000000" & ins(11 downto 0);
		end if;
	end process;



end Behavioral;

