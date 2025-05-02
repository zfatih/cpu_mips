library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vanjskamem is
	 Port ( clk4 : in std_logic;
			  iwr : in std_logic;
			  sambra : in std_logic_vector (15 downto 0);
			  umbr : out std_logic_vector (15 downto 0);
			  samara : in  STD_LOGIC_VECTOR (11 downto 0));
end vanjskamem;

architecture Behavioral of vanjskamem is

type niz is array ( 0 to 2**12 - 1) of std_logic_vector(15 downto 0);
signal mem : niz :=(
0 => x"0ABC",
1 => x"1ABD",
2 => x"0ABD",
3 => x"2ABC",
4 => x"3BBB",
2748 => x"0003",
3003 => x"0004",
others => "0000000000000000"
);

begin
	process(clk4)
	begin
		if (clk4'event and clk4='1') then
			if (iwr='1') then  
				mem(conv_integer(samara))<=sambra;
			end if;
		end if;
	end process;
	umbr<=mem(conv_integer(samara));
end Behavioral;

