library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mikinstrukcija is
    Port ( instr : in  STD_LOGIC_VECTOR (31 downto 0);
           oamux : out  STD_LOGIC;
           ocond : out  STD_LOGIC_VECTOR (1 downto 0);
           oalu : out  STD_LOGIC_VECTOR (1 downto 0);
           oshft : out  STD_LOGIC_VECTOR (1 downto 0);
           ombr : out  STD_LOGIC;
           omar : out  STD_LOGIC;
           ord : out  STD_LOGIC;
           owr : out  STD_LOGIC;
           oenc : out  STD_LOGIC;
           oc : out  STD_LOGIC_VECTOR (3 downto 0);
           ob : out  STD_LOGIC_VECTOR (3 downto 0);
           oa : out  STD_LOGIC_VECTOR (3 downto 0);
           oadr : out  STD_LOGIC_VECTOR (7 downto 0));
end mikinstrukcija;

architecture Behavioral of mikinstrukcija is

begin
	oamux<=instr(31);
	ocond(1)<=instr(30);
	ocond(0)<=instr(29);
	oalu(1)<=instr(28);
	oalu(0)<=instr(27); 
	oshft(1)<=instr(26);
	oshft(0)<=instr(25);
	ombr<=instr(24); 
	omar<=instr(23); 
	ord<=instr(22);
	owr<=instr(21);
	oenc<=instr(20);
	oc(3)<=instr(19);
	oc(2)<=instr(18);
	oc(1)<=instr(17);
	oc(0)<=instr(16);
	ob(3)<=instr(15);
	ob(2)<=instr(14);
	ob(1)<=instr(13);
	ob(0)<=instr(12);
	oa(3)<=instr(11);
	oa(2)<=instr(10);
	oa(1)<=instr(9);
	oa(0)<=instr(8);
	oadr(7)<=instr(7);
	oadr(6)<=instr(6);
	oadr(5)<=instr(5);
	oadr(4)<=instr(4);
	oadr(3)<=instr(3);
	oadr(2)<=instr(2);
	oadr(1)<=instr(1);
	oadr(0)<=instr(0);	
end Behavioral;

