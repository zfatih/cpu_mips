library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity registri is
    Port ( adek : in  STD_LOGIC_VECTOR (3 downto 0);
           bdek : in  STD_LOGIC_VECTOR (3 downto 0);
           cdek : in  STD_LOGIC_VECTOR (3 downto 0);
           aout : out  STD_LOGIC_VECTOR (15 downto 0);
           bout : out  STD_LOGIC_VECTOR (15 downto 0);
           cin : in  STD_LOGIC_VECTOR (15 downto 0);
			  clk2 : in std_logic;
			  clk4 : in std_logic;
			  enc : in std_logic);
end registri;

architecture Behavioral of registri is

type niz is array ( 0 to 2**4 - 1) of std_logic_vector(15 downto 0);
signal mem : niz :=(
6 => x"0001",
7 => x"FFFF",
8 => x"0FFF",
9 => x"00FF",
others => x"0000"
);

begin
	mem(conv_integer(cdek))<=cin when (clk4'event and clk4='1' and enc='1');
	aout<=mem(conv_integer(adek)) when (clk2'event and clk2='1');
	bout<=mem(conv_integer(bdek)) when (clk2'event and clk2='1'); 
end Behavioral;

