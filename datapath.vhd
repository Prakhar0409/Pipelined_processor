----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:48:37 04/02/2016 
-- Design Name: 
-- Module Name:    datapath - Behavioral 
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

entity datapath is
	port(
		clk : in std_logic:='0';
	
		exMemEn	: in std_logic := '0';
		dmEn		: in std_logic:='0';
		idExEn	: in std_logic := '0';
		memWbEn	: in std_logic:='0';
		ifIdEn	: in std_logic:='0';											



		-- Directly to the correct places
		Rsrc 	: in std_logic := '0';			
		
		-- tobe sent to the first register in datapath IDorEX 
		Asrc 	: in std_logic:='0';		
		opc 	: in std_logic_vector(3 downto 0):=(others=>'0');		-- Actrl is not sent opc is sent
		FSet 	: in std_logic:='0';
		
		-- tobe sent through IDorEX , EXorMem
		MW 	: in std_logic:='0';
		MR 	: in std_logic;
		M2R 	: in std_logic:='0';	
		--Actrl	: out std_logic_vector(3 downto 0);
		
		-- tobe sent through IDorEX, EXorMem , MemorWB
		RW 	: in std_logic := '0';
		
		-- output inst
		instOut : out std_logic_vector(31 downto 0) := (others => '0');
		
		-- TODO DONNO
		Psrc 	: in std_logic := '0';			-- pc is not to be modified so throw away this signal // TODO
		p		: in std_logic := '0';			--predication p
		ML		: in std_logic:='0'			--multiply indicator
		
	);
end datapath;

architecture Behavioral of datapath is
	
	component Multiplex4 is
	generic (
			N : integer := 31
	);
	port(
         minp1 	: in STD_LOGIC_VECTOR(N-1 downto 0);
			minp2 	: in STD_LOGIC_VECTOR(N-1 downto 0);
			minp3 	: in STD_LOGIC_VECTOR(N-1 downto 0);
			minp4 	: in STD_LOGIC_VECTOR(N-1 downto 0);
         msel	 	: in STD_LOGIC_VECTOR(1 downto 0);
         moutp		: out STD_LOGIC_VECTOR(N-1 downto 0)
         );
	end component;
	
	component MyMultiplexer is
		generic (
			N : integer := 31
		);
		port(
         minp1 	: in STD_LOGIC_VECTOR(N-1 downto 0);
			minp2 	: in STD_LOGIC_VECTOR(N-1 downto 0);
--			minp3 	: in STD_LOGIC_VECTOR(N-1 downto 0);
--			minp4 	: in STD_LOGIC_VECTOR(N-1 downto 0);
         msel	 	: in STD_LOGIC;--_VECTOR(1 downto 0);
         moutp		: out STD_LOGIC_VECTOR(N-1 downto 0)
         );
	end component;

	COMPONENT dataMem
    PORT(
         clka 		: IN  std_logic;
         ena 		: IN  std_logic;
         wea 		: IN  std_logic_vector(0 downto 0);
         addra 	: IN  std_logic_vector(15 downto 0);
         dina 		: IN  std_logic_vector(31 downto 0);
         douta 	: OUT std_logic_vector(31 downto 0)
        );
    END COMPONENT;

	COMPONENT InstMem
    PORT(
         clka 		: IN  std_logic;
         ena 		: IN  std_logic;
         wea 		: IN  std_logic_vector(0 downto 0);
         addra 	: IN  std_logic_vector(15 downto 0);
         dina 		: IN  std_logic_vector(31 downto 0);
         douta 	: OUT std_logic_vector(31 downto 0)
        );
    END COMPONENT;
	
	component RegisterFile is
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
	 end component;
	
	component regGen is
	 Generic (
			N: integer := 32
			);
	 Port ( 	
			clk 		: in std_logic;
			regIn 	: in std_logic_vector(N-1 downto 0):= (others => '0');			--value is N bit wide
			regOut 	: out std_logic_vector(N-1 downto 0) := (others => '0');
			regReset : in std_logic:='0';
			regEn 	: in std_logic
         );
	end component;
	
	component pc
	 Port ( 	
			clk 	: in std_logic;
			pcin 	: in std_logic_vector(9 downto 0):= (others => '0');			--instruction address is 10 bit wide
			pcout : out std_logic_vector(9 downto 0) := (others => '0');
			reset : in std_logic:='0';
			pcen 	: in std_logic
         );
	end component;
	
	component preAlu is
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
	end component;
	
	component alu
		port (
			inp1			:	in signed (31 downto 0):=(others=>'0');			--input 1	
			inp2			:	in signed (31 downto 0):=(others=>'0');			--input 2
			inFlags		: 	in std_logic_vector(3 downto 0):=(others=>'0');
			ML				: 	in std_logic:='0';
			cin 			:	in std_logic; 
		--	s : in std_logic;
			
			outFlags		:	out signed (3 downto 0) := (others => '0');		--flags (f(0)=N; f(1)=C; f(2)=V; f(3)=Z;  -- NCVZ)
			opc 			: 	in std_logic_vector(3 downto 0) := (others => '0');
	--		flag 			: out signed (3 downto 0) := (others => '0');
			outp			:	out signed(31 downto 0):=(others=>'0');
			Cout			:	out std_logic:='0'							-- carry out
			);
	end component;



	
	-- Signals connected to progrm counter
	signal pcOut 		: std_logic_vector(9 downto 0):=(others=>'0');
	signal pcIn	 		: std_logic_vector(31 downto 0):=(others=>'0');
	signal pcEn  		: std_logic:='1';
	--Signals to instMem
	signal instRegIn 		: 	std_logic_vector(31 downto 0):=(others=>'0');

	--signals to registerFile
	signal aIn			:	std_logic_vector(31 downto 0):=(others=>'0');
	signal bIn			: 	std_logic_vector(31 downto 0):=(others=>'0');
	signal rfWriteEn	:  std_logic:='0';
	signal regASel		: 	std_logic_vector(3 downto 0):=(others=>'0');
	signal regBSel		: 	std_logic_vector(3 downto 0):=(others=>'0');

	signal b				: 	std_logic_vector(31 downto 0):=(others=>'0');
	
	--ExMem multiplexer
	signal exMemOut	:	std_logic_vector(71 downto 0):=(others=>'0');
	
	-- IDorEX register
	signal idExOut		: 	std_logic_vector(143 downto 0):=(others=>'0');
	signal aOut			:	std_logic_vector(31 downto 0):=(others=>'0');
	signal bOut			:	std_logic_vector(31 downto 0):=(others=>'0');
	signal ExOffOut	:	std_logic_vector(31 downto 0):=(others=>'0');
	signal wbAddr		:	std_logic_vector(3 downto 0):=(others=>'0');
	
	signal instRegOut :  std_logic_vector(31 downto 0) := (others => '0');

	--signals for alu
	signal carryIn		: 	std_logic:='0';
	signal inFlags		: 	std_logic_vector(3 downto 0):=(others=>'0');
	signal outFlags	: 	signed(3 downto 0):=(others=>'0');
	signal alooOut		:	signed(31 downto 0):=(others=>'0');
	signal carryOut	:	std_logic:='0';

		
	
	--data memory
	signal dmWriteEn 	:	std_logic:='0';
	signal dmOut		:	std_logic_vector(31 downto 0):=(others=>'0');
	
	--memWB register
	signal memWbOut	:	std_logic_vector(69 downto 0):=(others=>'0');
	--signal memWbOut	:	std_logic_vector(32 downto 0):=(others=>'0');
	
	-- dmOutMux
	signal outp		:	std_logic_vector(31 downto 0):=(others=>'0');
	signal dmOutSel:  std_logic:='0';
	
	--dataforwarding paths
	signal a1		: std_logic_vector(31 downto 0):=(others=>'0');
	signal b1		: std_logic_vector(31 downto 0):=(others=>'0');
	signal fwdA		: std_logic_vector(1 downto 0):=(others=>'0');
	signal fwdB		: std_logic_vector(1 downto 0):=(others=>'0');
	signal c				: 	std_logic_vector(31 downto 0):=(others=>'0');
	signal fwdC		: std_logic:='0';
	
	--random unknown signals
	signal pSel	:	std_logic:='0';	-- TODO pc Mul select


	signal preAluMuxSel:std_logic:='0';
	
	signal preAluCout : std_logic_vector(0 downto 0):= (others=>'0');		
   signal inp2 : std_logic_vector(31 downto 0) := (others => '0');		--alu inp2

	
	-- TODO remaining signals ifIdEn, ML(tell whether the instruction is multiply or not) , rfWriteEn , idExEn, preAluMuxSel, exMemEn, dmEn, memWbEn

begin
	
DataForwards:process(clk)
					begin
						-- for fwdA
						if((exMemOut(71) = '1') and (exMemOut(67 downto 64) = idExOut(142 downto 139))) then
							fwdA <= "01";
						elsif((memWbOut(68) = '1') and (exMemOut(67 downto 64) /= idExOut(142 downto 139)) and (memWbOut(67 downto 64) = idExOut(142 downto 139))) then 
							fwdA <= "10";
						else 
							fwdA <= "00";
						end if;
						-- for fwdB
						if((exMemOut(71) = '1') and (exMemOut(67 downto 64) = idExOut(138 downto 135))) then
							fwdB <= "01";
						elsif((memWbOut(68) = '1') and (exMemOut(67 downto 64) /= idExOut(138 downto 135)) and (memWbOut(67 downto 64) = idExOut(138 downto 135))) then 
							fwdB <= "10";
						else 
							fwdB <= "00";
						end if;
						-- for fwdC
						if((memWbOut(68) = '1') and (memWbOut(67 downto 64) = exMemOut(67 downto 64))) then
							fwdC <= '1';
						else 
							fwdC <= '0';
						end if;

					end process;
	
	pcMux : MyMultiplexer generic map (N => 10) 
		port map (										--Selects between Rd and Rm
			minp1 => std_logic_vector(unsigned(pcOut)+1),
			minp2 => std_logic_vector(unsigned(pcOut)+unsigned(idExOut(9 downto 0))),	--  branch 23 bits cannot fit into memory of a bram hence offset of 10 bits
			moutp => pcIn(9 downto 0), 
			msel=> pSel
			);
	

	 programCounter:pc
	   Port map( 	
			clk 		=> 	clk,
			pcin  	=> 	pcIn(9 downto 0),
			pcout 	=>		pcOut,
			reset 	=>		'0',
			pcen 		=>		pcEn
         );
			
	InstructionMemory : InstMem
		port map(
			clka 		=> 	clk,
         ena 		=>		'1',
         wea 		=>		"0",
         addra 	=>		"000000" & pcOut,
         dina 		=> 	"00000000000000000000000000000000",
         douta 	=>		instRegIn
			);
			
	IForID : regGen 
	 Generic map(
			N			=> 32
			)
	 Port map( 	
			clk 		=>		clk,
			regIn 	=> 	instRegIn,
			regOut 	=>		instRegOut,
			regReset =>		'0',
			regEn 	=>		ifIdEn
         );
	instOut <= instRegOut;		--instruction to be sent to the controller
	-- TODO see if ML is also being forwarded to appropriate componenet via the register chaining
--updateML:process(clk,instRegOut)				--checks if instruction is multiply or not kindoff part of control but still added in datapath
--	begin
--		if(instRegOut(25)='1' and instRegOut(7 downto 4)="1001") then
--			ML	<=	'1';
--		else 
--			ML <= '0';
--		end if;
--	end process;
	
	
	

	reg1Mul : MyMultiplexer generic map (N => 4) 
		port map (										--Selects between Rn and Rs
			minp1 => instRegOut(19 downto 16), 		-- Rn
			minp2 => instRegOut(11 downto 8), 		-- Rs
			moutp => regASel, 
			msel	=> ML
			);
	
	
	reg2Mul : MyMultiplexer generic map (N => 4) 
		port map (										--Selects between Rd and Rm
			minp1 => instRegOut(3 downto 0), 	--Rm
			minp2 => instRegOut(15 downto 12), 	--Rd
			moutp => regBSel, 
			msel=> Rsrc
			);
	
	
	RF : RegisterFile
		port map(
		 outA				=> 	aIn,
		 outB 			=>		bIn,
		 input   		=>		outp,
		 writeEnable 	=>		memWbOut(68), -- rfWriteEn,				-- DONE rfwrite EN should be replaced by RW in the last cycle
		 regASel     	=>		regASel,
		 regBSel     	=>		regBSel,
		 writeRegSel 	=>		memWbOut(67 downto 64),			--select writeaddr
		 clk         	=>		clk
		);
	
	
	IDorEX : regGen 			-- 23 downto 0 => PC branch || 55 downto 24 for aIn || 
									-- 87 downto 56 for bIn || 119 downto 88 for extended offset || 123 downto 119 for write Addr @tot 123 downto 0
	 Generic map(
			N			=> 144     -- 124 for datapath signals + 11 control signals + 8 regASel, regBsel + 1 bit inst Immediate
			)
	 Port map( 					-- idExOut(27 downto 24) == aIn; 
			clk 		=>		clk,
			regIn 	=> 	instRegOut(25) & regASel & regBSel & RW & ML & Asrc & opc(3 downto 0) & Fset & MW & MR & M2R & instRegOut(15 downto 12) & "00000000000000000000" & instRegOut(11 downto 0) &  bIn & aIn & instRegOut(23 downto 0),
			regOut 	=>		idExOut,				
			regReset =>		'0',
			regEn 	=>		idExEn
         );
	
	
	preAluMux: MyMultiplexer generic map (N => 32) 
		port map (										--Selects between Rd and Rm
			minp1 => idExOut(87 downto 56),
			minp2 => "00000000000000000000" & idExOut(11 downto 0),							--idExOut(119 downto 88),
			moutp => b, 
			msel=> idExOut(132)					--preAluMuxSel				-- Asrc
			);
			
	
	preeAloo: preAlu 
			port map (
					I => idExOut(143), 
					Rsrc => Rsrc, 
					preAluInp => idExOut(11 downto 0),			--inst(11 downto 0),
					preAluNum => to_bitVector(b), 			-- b == preAluNum
					preAluOutp =>inp2 , 							-- actual number 
					preAluCout => preAluCout					--cin for alu
					);
			
	
	fwdAMux: Multiplex4				-- TODO caution with the four way multiplexer instead of the three way as shown this is to 
		generic map(	
			N 	=> 32
	)
	port map(
         minp1 	=> idExOut(55 downto 24),		--op1 = a
			minp2 	=> exMemOut(31 downto 0),
			minp3 	=> outp,
			minp4 	=>	"00000000000000000000000000000000",
         msel	 	=> fwdA,
         moutp		=> a1
         );

	
	fwdBMux: Multiplex4				-- TODO caution with the four way multiplexer instead of the three way as shown this is to 
		generic map(	
			N 	=> 32
	)
	port map(
         minp1 	=> inp2,		-- adding inp2 from the prealu		--b,
			minp2 	=> exMemOut(31 downto 0),
			minp3 	=> outp,
			minp4 	=>	"00000000000000000000000000000000",
         msel	 	=> fwdB,
         moutp		=> b1
         );

	
	Aloo:alu
		port map(
			--pre alu task
			--I				=> idExOut(143),
			
			
			inp1			=>	signed(a1),
			inp2			=>	signed(b1),
			inFlags		=> inFlags,
			ML				=>	idExOut(133),			--ML
			cin 			=> carryIn,
		--	s : in std_logic;	
			outFlags		=>	outFlags,
			opc 			=> idExOut(131 downto 128),						--instRegOut(24 downto 21),			
	--		flag 			: out signed (3 downto 0) := (others => '0');
			outp			=>	alooOut,
			Cout			=>	carryOut
			);
	
	
	EXorMem : regGen 			-- 31 downto 0 => aluOut branch || 63 downto 32 for strData || 
									-- 67 downto 64 for writeAddr  @tot 67 downto 0
	 Generic map(
			N			=> 72				--68 for datapath + 4 for control  idExOut(134) == RW ; idExOut(126 downto 124) == MW,MR,M2R
			)
	 Port map( 	
			clk 		=>		clk,
			regIn 	=> 	idExOut(134) & idExOut(126 downto 124) & idExOut(123 downto 120) & idExOut(87 downto 56) & std_logic_vector(alooOut) ,
			regOut 	=>		exMemOut,
			regReset =>		'0',
			regEn 	=>		exMemEn
         );
													-- exMemOut(71) == RW; exMemOut(70 downto 68) == MW,MR,M2R; exMemOut(67 downto 64) == WAD;
													-- exMemOut(63 downto 32) == DMwriteAddress; exMemOut(31 downto 0) == AlooOut
			
	
	fwdCMux : MyMultiplexer generic map (N => 32) 
		port map (										--Selects between Rd and Rm
			minp1 => exMemOut(63 downto 32),
			minp2 => outp,
			moutp => c, 
			msel=> fwdC
			);		
			
	data : dataMem
    PORT map(
         clka 		=>	clk,
         ena 		=>	'1',		-- Control MR i.e. exMemOut(71) == RW; exMemOut(70 downto 68) == MW,MR,M2R;
         wea(0) 	=> exMemOut(69),					--dmEn,
         addra 	=>	exMemOut(15 downto 0),				--  TODO check about possibility of fitting in exMemOut(31 downto 0),
         dina 		=> c,									--exMemOut(63 downto 32),
         douta 	=>	dmOut
        );
    		
			
	MemorWb : regGen 			-- 31 downto 0 => aluOut branch || 63 downto 32 for strData || 
									-- 67 downto 64 for writeAddr  @tot 67 downto 0
	 Generic map(
			N			=> 70		--68 datapath + 1 control + 1 m2R
			)
	 Port map( 	
			clk 		=>		clk,
			regIn 	=> 	exMemOut(68) & exMemOut(71) & exMemOut(67 downto 64) & exMemOut(31 downto 0) & dmOut, 
			regOut 	=>		memWbOut,
			regReset =>		'0',
			regEn 	=>		memWbEn
         );		
									-- memWbOut(68) = RW ; memWbOut(67 downto 64) = RW ; 
	outputMux : MyMultiplexer generic map (N => 32) 
		port map (										--Selects between Rd and Rm
			minp1 => memWbOut(63 downto 32),
			minp2 => memWbOut(31 downto 0),
			moutp => outp, 
			msel	=> memWbOut(69)			--exMemOut(68)					--dmOutSel
			);
	
	
	
			
--	outputMux : MyMultiplexer generic map (N => 32) 
--		port map (										--Selects between Rd and Rm
--			minp1 => exMemOut(31 downto 0),					--memWbOut(63 downto 32),
--			minp2 => dmOut,			--memWbOut(31 downto 0),
--			moutp => outp, 
--			msel	=> exMemOut(68)					--dmOutSel
--			);	
--			
--			
--	MemorWb : regGen 			-- 31 downto 0 => aluOut branch || 63 downto 32 for strData || 
--									-- 67 downto 64 for writeAddr  @tot 67 downto 0
--	 Generic map(
--			N			=> 69		--68 datapath + 1 control + 1 m2R
--			)
--	 Port map( 	
--			clk 		=>		clk,
--			regIn 	=> 	exMemOut(71) & exMemOut(67 downto 64) & exMemOut(31 downto 0) & outp, 
--			regOut 	=>		memWbOut,
--			regReset =>		'0',
--			regEn 	=>		memWbEn
--         );		
--									-- memWbOut(68) = RW ; memWbOut(67 downto 64) = RW ; 
	
	

end Behavioral;

