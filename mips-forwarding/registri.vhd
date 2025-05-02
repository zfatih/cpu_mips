library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity registri is
    Port ( adr_a : in  STD_LOGIC_VECTOR (4 downto 0);
           adr_b : in  STD_LOGIC_VECTOR (4 downto 0);
           adr_wr : in  STD_LOGIC_VECTOR (4 downto 0);
           data_in : in  STD_LOGIC_VECTOR (31 downto 0);
           data_a : out  STD_LOGIC_VECTOR (31 downto 0);
           data_b : out  STD_LOGIC_VECTOR (31 downto 0);
			  write_control : in std_logic;
			  clk : in std_logic);
end registri;

architecture Behavioral of registri is

type niz is array ( 0 to 2**5 - 1) of std_logic_vector(31 downto 0);
signal reg : niz :=(
1 => x"00000001",
2 => x"00000002",
others => x"00000000"
);

begin
	reg(conv_integer(adr_wr))<=data_in when (rising_edge(clk) and write_control='1' and not(adr_wr=x"00000"));
	data_a<=reg(conv_integer(adr_a)) when (falling_edge(clk) and not(adr_a="UUUUU"));
	data_b<=reg(conv_integer(adr_b)) when (falling_edge(clk) and not(adr_b="UUUUU")); 
end Behavioral;
