library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mbr is
    Port ( imbr : in  STD_LOGIC;
			  ird : in std_logic;
           sashiftera : in  STD_LOGIC_VECTOR (15 downto 0);
			  savanjske : in std_logic_vector (15 downto 0);
           clk4 : in  STD_LOGIC;
           zavanjsku : out  STD_LOGIC_VECTOR (15 downto 0);
			  zaamux : out  STD_LOGIC_VECTOR (15 downto 0));
end mbr;

architecture Behavioral of mbr is

signal vrijednost : std_logic_vector (15 downto 0):=x"0000";

begin
	process(clk4)
	begin
		if (clk4'event and clk4='1') then
			if (imbr='1') then
				vrijednost<=sashiftera;
			end if;
			if (ird='1') then
				vrijednost<=savanjske;
			end if;
		end if;
	end process;
	zavanjsku<=vrijednost;
	zaamux<=vrijednost;
end Behavioral;

