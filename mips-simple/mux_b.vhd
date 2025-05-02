library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux_b is
	Port (  b_in : in  STD_LOGIC_VECTOR (31 downto 0);
           imm_in : in  STD_LOGIC_VECTOR (31 downto 0);
           control : in  STD_LOGIC;
           data_out : out  STD_LOGIC_VECTOR (31 downto 0));
end mux_b;

architecture Behavioral of mux_b is

begin
	data_out<=imm_in when control='1' else b_in;
end Behavioral;

