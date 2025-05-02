library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux_a is
    Port ( npc_in : in  STD_LOGIC_VECTOR (31 downto 0);
			  a_in : in  STD_LOGIC_VECTOR (31 downto 0);
			  ex_in : in std_logic_vector(31 downto 0);
			  mem_in : in std_logic_vector(31 downto 0);
           control : in  STD_LOGIC_vector(1 downto 0);
           data_out : out  STD_LOGIC_VECTOR (31 downto 0));
end mux_a;

architecture Behavioral of mux_a is

begin
	data_out<=npc_in when control="00" else
				 a_in when control="01" else
				 ex_in when control="10" else
				 mem_in when control="11";
end Behavioral;

