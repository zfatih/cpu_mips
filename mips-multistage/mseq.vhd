library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mseq is
    Port ( n : in  STD_LOGIC;
           z : in  STD_LOGIC;
           cond : in  STD_LOGIC_VECTOR (1 downto 0);
           outmseq : out  STD_LOGIC);
end mseq;

architecture Behavioral of mseq is

begin
	outmseq<='1' when ((cond="11") or (cond="01" and n='1') or (cond="10" and z='1')) else 
				'0';
end Behavioral;

