library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity amux is
    Port ( sambra : in  STD_LOGIC_VECTOR (15 downto 0);
           A_latch : in  STD_LOGIC_VECTOR (15 downto 0);
           kontrolni_bit : in  STD_LOGIC;
           izlaz_u_ALU : out  STD_LOGIC_VECTOR (15 downto 0));
end amux;

architecture Behavioral of amux is

begin

	izlaz_u_ALU <= sambra when kontrolni_bit = '1' else A_latch;

end Behavioral;
