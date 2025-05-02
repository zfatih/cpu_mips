library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity preg_exmem is
    Port ( gran_in : in  STD_LOGIC;
           alu_output_in : in  STD_LOGIC_VECTOR (31 downto 0);
           b_in : in  STD_LOGIC_VECTOR (31 downto 0);
           ir_in : in  STD_LOGIC_VECTOR (31 downto 0);
           b_out : out  STD_LOGIC_VECTOR (31 downto 0);
           ir_out : out  STD_LOGIC_VECTOR (31 downto 0);
           gran_out : out  STD_LOGIC;
           alu_output_out : out  STD_LOGIC_VECTOR (31 downto 0);
			  control_bit : out std_logic;
			  clk : in std_logic);
end preg_exmem;

architecture Behavioral of preg_exmem is

begin
	gran_out <= gran_in;
	ir_out <= ir_in;
	alu_output_out <= alu_output_in;
	b_out <= b_in;
	control_bit<='1' when (ir_in(31 downto 26)="101011") else 
					'0' when ((ir_in(31 downto 26)="100011" or ir_in(31 downto 26)="000000"));
end Behavioral;
