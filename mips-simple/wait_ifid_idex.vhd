library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity wait_ifid_idex is
    Port ( ir_in : in  STD_LOGIC_VECTOR (31 downto 0);
           ir_out : out  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC);
end wait_ifid_idex;

architecture Behavioral of wait_ifid_idex is

begin
	ir_out<=ir_in when falling_edge(clk);
end Behavioral;

