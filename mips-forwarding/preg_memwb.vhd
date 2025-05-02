library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity preg_memwb is
    Port ( mem_output_in : in  STD_LOGIC_VECTOR (31 downto 0);
           alu_output_in : in  STD_LOGIC_VECTOR (31 downto 0);
           ir_in : in  STD_LOGIC_VECTOR (31 downto 0);
           mem_output_out : out  STD_LOGIC_VECTOR (31 downto 0);
           alu_output_out : out  STD_LOGIC_VECTOR (31 downto 0);
			  adr_out : out std_logic_vector(4 downto 0);
			  control_bit : out std_logic;
			  control_bit_mux_wb : out std_logic;
			  ir_out : out std_logic_vector(31 downto 0);
			  clk : in std_logic);
end preg_memwb;

architecture Behavioral of preg_memwb is

begin
	mem_output_out <= mem_output_in;
	alu_output_out <= alu_output_in;
	control_bit<='0' when (ir_in(31 downto 26)="101011") else 
					'1' when ((ir_in(31 downto 26)="000000" or ir_in(31 downto 26)="100011" ));
	control_bit_mux_wb <= '1' when (ir_in(31 downto 26)="100011") else
								 '0' when ((ir_in(31 downto 26)="000000" or ir_in(31 downto 26)="101011"));
	adr_out <= ir_in(15 downto 11) when (ir_in(31 downto 26)="000000") else
			     ir_in(20 downto 16) when ((ir_in(31 downto 26)="100011" or ir_in(31 downto 26)="101011"));
	ir_out <= ir_in;
end Behavioral;

