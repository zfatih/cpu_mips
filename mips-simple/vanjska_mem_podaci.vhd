library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity vanjska_mem_podaci is
	Port ( adr_in : in  STD_LOGIC_VECTOR (31 downto 0);
           data_in : in  STD_LOGIC_VECTOR (31 downto 0);
           data_out : out  STD_LOGIC_VECTOR (31 downto 0);
           control_bit : in  STD_LOGIC;
			  clk : in std_logic);
end vanjska_mem_podaci;

architecture Behavioral of vanjska_mem_podaci is

type niz is array ( 0 to 2**15 - 1) of std_logic_vector(31 downto 0);
signal mem : niz :=(
0 => x"000000F0",
1 => x"000000F1",
2 => x"000000F2",
3 => x"000000F3",
4 => x"000000F4",
5 => x"000000F5",
others => x"00000000"
);

begin
	mem(conv_integer(adr_in))<=data_in when (rising_edge(clk) and control_bit='1');
	data_out<=mem(conv_integer(adr_in)) when (rising_edge(clk) and control_bit='0');
end Behavioral;

