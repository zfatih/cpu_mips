library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux_b is
	Port (  b_in : in  STD_LOGIC_VECTOR (31 downto 0);
           imm_in : in  STD_LOGIC_VECTOR (31 downto 0);
			  ex_in : std_logic_vector(31 downto 0);
			  mem_in : std_logic_vector(31 downto 0);
           control : in  STD_LOGIC_vector(1 downto 0);
           data_out : out  STD_LOGIC_VECTOR (31 downto 0));
end mux_b;

architecture Behavioral of mux_b is

begin
	data_out<=b_in when control="00" else
				 imm_in when control="01" else 
				 ex_in when control="10" else
				 mem_in when control="11";
end Behavioral;

