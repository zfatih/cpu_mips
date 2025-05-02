library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity wait_exmem_memwb is
    Port ( aluoutput_in : in  STD_LOGIC_VECTOR (31 downto 0);
           ir_in : in  STD_LOGIC_VECTOR (31 downto 0);
           aluoutput_out : out  STD_LOGIC_VECTOR (31 downto 0);
           ir_out : out  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC);
end wait_exmem_memwb;

architecture Behavioral of wait_exmem_memwb is

begin
	aluoutput_out<=aluoutput_in when rising_edge(clk);
	ir_out<=ir_in when rising_edge(clk);
end Behavioral;

