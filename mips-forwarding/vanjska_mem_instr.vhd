library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity vanjska_mem_instr is
    Port ( adr_in : in  STD_LOGIC_VECTOR (31 downto 0);
           data_out : out  STD_LOGIC_VECTOR (31 downto 0);
			  clk : in std_logic);
end vanjska_mem_instr;

architecture Behavioral of vanjska_mem_instr is

type niz is array ( 0 to 2**15 - 1) of std_logic_vector(31 downto 0);
signal mem : niz :=(


0 => x"8C010000",--lw r1 r0(0)
4 => x"8C020001",--lw r2 r0(1)
12 => x"00221820",--add r3 r1 r2
16 => x"00432020",--add r4 r2 r3

others => x"00000020" --ostalo nop
);

begin
	data_out<=mem(conv_integer(adr_in)) when rising_edge(clk);
end Behavioral;

