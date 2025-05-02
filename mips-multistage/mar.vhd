library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity mar is
    Port ( imar : in  STD_LOGIC;
           clk3 : in  STD_LOGIC;
           sableca : in  STD_LOGIC_VECTOR (15 downto 0);
           zavanjsku : out  STD_LOGIC_VECTOR (11 downto 0));
end mar;

architecture Behavioral of mar is

signal vrijednost : std_logic_vector(11 downto 0):=x"000";

begin
	process(clk3)
	begin
		if (clk3'event and clk3='1') then
			if (imar='1') then
				vrijednost(11)<=sableca(11);
				vrijednost(10)<=sableca(10);
				vrijednost(9)<=sableca(9);
				vrijednost(8)<=sableca(8);
				vrijednost(7)<=sableca(7);
				vrijednost(6)<=sableca(6);
				vrijednost(5)<=sableca(5);
				vrijednost(4)<=sableca(4);
				vrijednost(3)<=sableca(3);
				vrijednost(2)<=sableca(2);
				vrijednost(1)<=sableca(1);
				vrijednost(0)<=sableca(0);
			end if;
		end if;
	end process;
	zavanjsku <= vrijednost;
end Behavioral;

