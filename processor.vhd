----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:06:39 04/11/2016 
-- Design Name: 
-- Module Name:    processor - Behavioral 
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

entity processor is
	port(
		clock : in std_logic:='0'
	);
end processor;

architecture Behavioral of processor is
	
	
	component Controller is
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
	end component;

	component datapath is
		port(
			clk 			: in std_logic:='0';
			
			Rsrc 			: in std_logic := '0';			
			--Actrl	: out std_logic_vector(3 downto 0);
			Psrc 			: in std_logic := '0';
			Asrc 			: in std_logic:='0';
			FSet 			: in std_logic:='0';
			MW 			: in std_logic:='0';
			p				: in std_logic;			--predication p
			MR 			: in std_logic;
			RW 			: in std_logic;
			M2R 			: in std_logic:='0';
			ML				: in std_logic:='0';			--multiply indicator
			opc 			: in std_logic_vector(3 downto 0):=(others=>'0');
			
			instRegOut 	: out std_logic_vector(31 downto 0) := (others => '0')
		);
	end component;
	
	signal inst 		: std_logic_vector(31 downto 0) := (others=>'0');
	signal flags 		: std_logic_vector(3 downto 0) := (others=>'0');
	signal Rsrc 		: std_logic:='0';
	signal Psrc 		: std_logic:='0';
	signal Asrc 		: std_logic:='0';
	signal Fset 		: std_logic:='0';
	signal MW 			: std_logic:='0';
	signal p 			: std_logic:='0';
	signal MR 			: std_logic:='0';
	signal RW 			: std_logic:='0';
	signal M2R 			: std_logic:='0';
	signal ML 			: std_logic:='0';
	signal opCode 		: std_logic_vector(3 downto 0):= (others => '0');

	-- TODO Donno
	signal mul : std_logic_vector(3 downto 0) := (others=>'0');
begin
	
	
	control : Controller 
		port map(
			inst 	=> inst,
			mul	=> mul,
			clock	=> clock,
			flags	=> flags,
			
			Rsrc 	=> Rsrc,
			--Actrl	: out std_logic_vector(3 downto 0);
			Psrc 	=> Psrc,
			Asrc 	=> Asrc,
			FSet 	=> Fset,
			MW 	=> MW,
			p		=> p,			--predication p
			MR 	=> MR,
			RW 	=> RW,
			M2R 	=> M2R,
			ML		=> ML,			--multiply indicator
			opc 	=> opCode
		);
	
	
	datapather1 : datapath 
		port map(
			clk 			=> clock,
			
			instRegOut	=> inst,
			
			Rsrc 			=> Rsrc,
			RW 			=> RW,
			--Actrl	: out std_logic_vector(3 downto 0);
			Psrc 			=> Psrc,
			Asrc 			=> Asrc,
			FSet 			=> Fset,
			MW 			=> MW,
			p				=> p,			--predication p
			MR 			=> MR,
			
			M2R 			=> M2R,
			ML				=> ML,
			opc 			=> opCode
		);



end Behavioral;

