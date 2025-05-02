library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clkdistrib is
    Port ( clk : in  STD_LOGIC;
           clk1 : out  STD_LOGIC;
           clk2 : out  STD_LOGIC;
           clk3 : out  STD_LOGIC;
           clk4 : out  STD_LOGIC;
			  clk5 : out std_logic);
end clkdistrib;

architecture Behavioral of clkdistrib is

signal pom : std_logic_vector(2 downto 0):="100";

begin
	process(clk)
	begin
		if (clk'event and clk = '1') then
			if (pom = "100") then
				pom <= "000";
			else	 
				pom <= pom + '1';
			end if;
		end if;
	end process;
	clk1 <='1' when (pom="000") else
			 '0';
	clk2 <='1' when (pom="001") else
			 '0';
	clk3 <='1' when (pom="010") else
			 '0';
	clk4 <='1' when (pom="011") else
			 '0';
	clk5 <='1' when (pom="100") else
			 '0';		 
end Behavioral;
