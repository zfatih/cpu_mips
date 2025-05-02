library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu is
    Port ( prvi : in  STD_LOGIC_VECTOR (15 downto 0);
           drugi : in  STD_LOGIC_VECTOR (15 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           n : out  STD_LOGIC;
           z : out  STD_LOGIC;
           izlaz : out  STD_LOGIC_VECTOR (15 downto 0));
end alu;

architecture Behavioral of alu is

signal temp : std_logic_vector(15 downto 0):=x"0000";

begin
	temp <= (prvi+drugi) when op="00" else
				(prvi and drugi) when op="01" else
				prvi when op="10" else
				(not prvi);
	z <= '1' when temp=x"0000" else
		  '0';
	n <= temp(15);
	izlaz<=temp;
end Behavioral;