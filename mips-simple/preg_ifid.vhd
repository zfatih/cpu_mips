library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity preg_ifid is
    Port ( npc_in : in  STD_LOGIC_VECTOR (31 downto 0);
           ir_in : in  STD_LOGIC_VECTOR (31 downto 0);
           npc_out : out  STD_LOGIC_VECTOR (31 downto 0);
           adr_a_out : out  STD_LOGIC_VECTOR (4 downto 0);
           adr_b_out : out  STD_LOGIC_VECTOR (4 downto 0);
           imm_out : out  STD_LOGIC_VECTOR (15 downto 0);
           ir_out : out  STD_LOGIC_VECTOR (31 downto 0);
			  clk : in std_logic);
end preg_ifid;

architecture Behavioral of preg_ifid is

begin
	npc_out <= npc_in;
	ir_out <= ir_in;
	imm_out(15 downto 0) <= ir_in(15 downto 0);
	adr_a_out(4 downto 0) <= ir_in(25 downto 21);
	adr_b_out(4 downto 0) <= ir_in(20 downto 16);
end Behavioral;

