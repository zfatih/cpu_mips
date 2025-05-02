library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity preg_idex is
    Port ( npc_in : in  STD_LOGIC_VECTOR (31 downto 0);
           ir_in : in  STD_LOGIC_VECTOR (31 downto 0);
           imm_in : in  STD_LOGIC_VECTOR (31 downto 0);
           a_in : in  STD_LOGIC_VECTOR (31 downto 0);
           b_in : in  STD_LOGIC_VECTOR (31 downto 0);
           npc_out : out  STD_LOGIC_VECTOR (31 downto 0);
           ir_out : out  STD_LOGIC_VECTOR (31 downto 0);
           a_out : out  STD_LOGIC_VECTOR (31 downto 0);
           b_out : out  STD_LOGIC_VECTOR (31 downto 0);
           imm_out : out  STD_LOGIC_VECTOR (31 downto 0);
			  control_bit_mux_b : out std_logic;
			  alu_control : out std_logic_vector(2 downto 0);
			  clk : in std_logic);
end preg_idex;

architecture Behavioral of preg_idex is

begin
	npc_out <= npc_in when rising_edge(clk);
	ir_out <= ir_in when rising_edge(clk);
	a_out <= a_in when rising_edge(clk);
	b_out <= b_in when rising_edge(clk);
	imm_out <= imm_in when rising_edge(clk);
	control_bit_mux_b<='1' when ((ir_in(31 downto 26)="101011" or ir_in(31 downto 26)="100011") and rising_edge(clk)) else 
					'0' when (ir_in(31 downto 26)="000000" and rising_edge(clk));
	alu_control<="110" when (rising_edge(clk) and ir_in(31 downto 26)="000000" and ir_in(5 downto 0)="100010") else
					 "010" when (rising_edge(clk) and ((ir_in(31 downto 26)="000000" and ir_in(5 downto 0)="100000") or ir_in(31 downto 26)="100011" or ir_in(31 downto 26)="101011")) else
					 "000" when (rising_edge(clk) and ir_in(31 downto 26)="000000" and ir_in(5 downto 0)="100100") else
					 "001" when (rising_edge(clk) and ir_in(31 downto 26)="000000" and ir_in(5 downto 0)="100101");
end Behavioral;
