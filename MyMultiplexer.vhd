----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    
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
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MyMultiplexer is
	generic (
			N : integer := 32
	);
	port(
         minp1 	: in STD_LOGIC_VECTOR(N-1 downto 0);
			minp2 	: in STD_LOGIC_VECTOR(N-1 downto 0);
--			minp3 	: in STD_LOGIC_VECTOR(N-1 downto 0);
--			minp4 	: in STD_LOGIC_VECTOR(N-1 downto 0);
         msel	 	: in STD_LOGIC;--_VECTOR(1 downto 0);
         moutp		: out STD_LOGIC_VECTOR(N-1 downto 0)
         );
end MyMultiplexer;

architecture Behavioral of MyMultiplexer is

begin
	
	 mux : process (minp1,minp2,msel) is
    begin
        if ( msel='0') then
            moutp <= minp1;
        elsif (msel='1') then
            moutp <= minp2;
       -- elsif (msel="10") then
        --    moutp <= minp3;
       -- else
        --    moutp <= minp4;
        end if;
    end process mux;

end Behavioral;

