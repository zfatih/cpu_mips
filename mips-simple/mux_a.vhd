library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux_a is
    Port ( npc_in : in  STD_LOGIC_VECTOR (31 downto 0);
			  a_in : in  STD_LOGIC_VECTOR (31 downto 0);
           control : in  STD_LOGIC;
           data_out : out  STD_LOGIC_VECTOR (31 downto 0));
end mux_a;

architecture Behavioral of mux_a is

begin
	data_out<=a_in;
end Behavioral;

