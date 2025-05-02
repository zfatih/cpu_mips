library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pc is
    Port ( pc_in : in  STD_LOGIC_VECTOR (31 downto 0);
           pc_out : out  STD_LOGIC_VECTOR (31 downto 0);
			  clk : in std_logic);
end pc;

architecture Behavioral of pc is

signal pc : std_logic_vector(31 downto 0) := x"00000000";

begin
	pc<=pc_in when rising_edge(clk);
	pc_out<=pc;
end Behavioral;
