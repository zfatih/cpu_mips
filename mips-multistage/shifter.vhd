library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shifter is
	Port ( ulaz : in  STD_LOGIC_VECTOR (15 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           izlaz : out  STD_LOGIC_VECTOR (15 downto 0));
end shifter;

architecture Behavioral of shifter is

begin

	process(ulaz, op)
	begin
		if op = "10" then
			izlaz(15)<= ulaz(14);
			izlaz(14)<= ulaz(13);
			izlaz(13)<= ulaz(12);
			izlaz(12)<= ulaz(11);
			izlaz(11)<= ulaz(10);
			izlaz(10)<= ulaz(9);
			izlaz(9)<= ulaz(8);
			izlaz(8)<= ulaz(7);
			izlaz(7)<= ulaz(6);
			izlaz(6)<= ulaz(5);
			izlaz(5)<= ulaz(4);
			izlaz(4)<= ulaz(3);
			izlaz(3)<= ulaz(2);
			izlaz(2)<= ulaz(1);
			izlaz(1)<= ulaz(0);
			izlaz(0)<= '0';
		elsif op = "01" then
			izlaz(15)<= '0';
			izlaz(14)<= ulaz(15);
			izlaz(13)<= ulaz(14);
			izlaz(12)<= ulaz(13);
			izlaz(11)<= ulaz(12);
			izlaz(10)<= ulaz(11);
			izlaz(9)<= ulaz(10);
			izlaz(8)<= ulaz(9);
			izlaz(7)<= ulaz(8);
			izlaz(6)<= ulaz(7);
			izlaz(5)<= ulaz(6);
			izlaz(4)<= ulaz(5);
			izlaz(3)<= ulaz(4);
			izlaz(2)<= ulaz(3);
			izlaz(1)<= ulaz(2);
			izlaz(0)<= ulaz(1);
		else 
			izlaz<=ulaz;
		end if;
	end process;

end Behavioral;

