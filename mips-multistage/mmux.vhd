library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mmux is
    Port ( adresa : in  STD_LOGIC_VECTOR (7 downto 0);
           outmseq : in  STD_LOGIC;
			  clk4 : in std_logic;
           novaadresa : out  STD_LOGIC_VECTOR (7 downto 0));
end mmux;

architecture Behavioral of mmux is

signal mpc : std_logic_vector(7 downto 0):=x"00";

begin
	process(clk4)
	begin
		if (clk4'event and clk4='1') then
			if (outmseq='1') then 
				mpc<=adresa;
			else
				mpc<=mpc+1;
			end if;
		end if;
	end process;
	novaadresa<=mpc;
end Behavioral;

