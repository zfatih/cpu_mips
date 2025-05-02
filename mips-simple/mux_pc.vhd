library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux_pc is
    Port ( jump_pc : in  STD_LOGIC_VECTOR (31 downto 0);
			  inc_pc : in  STD_LOGIC_VECTOR (31 downto 0);
           control : in  STD_LOGIC;
           npc : out  STD_LOGIC_VECTOR (31 downto 0));
end mux_pc;

architecture Behavioral of mux_pc is

begin
	npc<=inc_pc;
end Behavioral;


