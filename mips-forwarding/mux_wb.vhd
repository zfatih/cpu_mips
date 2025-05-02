library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux_wb is
    Port ( mem_in : in  STD_LOGIC_VECTOR (31 downto 0);
           alu_in : in  STD_LOGIC_VECTOR (31 downto 0);
           control : in  STD_LOGIC;
           data_out : out  STD_LOGIC_VECTOR (31 downto 0));
end mux_wb;

architecture Behavioral of mux_wb is

begin
	data_out<= mem_in when control='1' else alu_in;
end Behavioral;


