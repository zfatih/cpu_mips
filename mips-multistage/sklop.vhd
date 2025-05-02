library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sklop is
	Port ( clk : in std_logic;
			 adresaA : out std_logic_vector(3 downto 0);
			 A : out std_logic_vector(15 downto 0);
			 adresaB : out std_logic_vector(3 downto 0);
			 B : out std_logic_vector(15 downto 0);
			 adresaC : out std_logic_vector(3 downto 0);
			 C : out std_logic_vector(15 downto 0);
			 adresavanjske : out std_logic_vector(11 downto 0);
			 vanjska : out std_logic_vector(15 downto 0));
end sklop;

architecture Behavioral of sklop is

component alu
    Port ( prvi : in  STD_LOGIC_VECTOR (15 downto 0);
           drugi : in  STD_LOGIC_VECTOR (15 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           n : out  STD_LOGIC;
           z : out  STD_LOGIC;
           izlaz : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component amux
    Port ( sambra : in  STD_LOGIC_VECTOR (15 downto 0);
           A_latch : in  STD_LOGIC_VECTOR (15 downto 0);
           kontrolni_bit : in  STD_LOGIC;
           izlaz_u_ALU : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component clkdistrib
    Port ( clk : in  STD_LOGIC;
           clk1 : out  STD_LOGIC;
           clk2 : out  STD_LOGIC;
           clk3 : out  STD_LOGIC;
           clk4 : out  STD_LOGIC;
			  clk5 : out std_logic);
end component;

component mar
    Port ( imar : in  STD_LOGIC;
           clk3 : in  STD_LOGIC;
           sableca : in  STD_LOGIC_VECTOR (15 downto 0);
           zavanjsku : out  STD_LOGIC_VECTOR (11 downto 0));
end component;

component mbr
    Port ( imbr : in  STD_LOGIC;
			  ird : in std_logic;
           sashiftera : in  STD_LOGIC_VECTOR (15 downto 0);
			  savanjske : in std_logic_vector (15 downto 0);
           clk4 : in  STD_LOGIC;
           zavanjsku : out  STD_LOGIC_VECTOR (15 downto 0);
			  zaamux : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component mikinstrukcija
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
end component;

component mmux
    Port ( adresa : in  STD_LOGIC_VECTOR (7 downto 0);
           outmseq : in  STD_LOGIC;
			  clk4 : in std_logic;
           novaadresa : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component mseq
    Port ( n : in  STD_LOGIC;
           z : in  STD_LOGIC;
           cond : in  STD_LOGIC_VECTOR (1 downto 0);
           outmseq : out  STD_LOGIC);
end component;

component registri
    Port ( adek : in  STD_LOGIC_VECTOR (3 downto 0);
           bdek : in  STD_LOGIC_VECTOR (3 downto 0);
           cdek : in  STD_LOGIC_VECTOR (3 downto 0);
           aout : out  STD_LOGIC_VECTOR (15 downto 0);
           bout : out  STD_LOGIC_VECTOR (15 downto 0);
           cin : in  STD_LOGIC_VECTOR (15 downto 0);
			  clk2 : in std_logic;
			  clk4 : in std_logic;
			  enc : in std_logic);
end component;

component shifter
	Port ( ulaz : in  STD_LOGIC_VECTOR (15 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           izlaz : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component upravljackamem
    Port ( adresain : in  STD_LOGIC_VECTOR (7 downto 0);
           mikroinst : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component vanjskamem
	 Port ( clk4 : in std_logic;
			  iwr : in std_logic;
			  sambra : in std_logic_vector (15 downto 0);
			  umbr : out std_logic_vector (15 downto 0);
			  samara : in  STD_LOGIC_VECTOR (11 downto 0));
end component;

signal s_clk1 : std_logic :='0';
signal s_clk2 : std_logic :='0';
signal s_clk3 : std_logic :='0';
signal s_clk4 : std_logic :='0';
signal s_clk5 : std_logic :='0';

signal s_iamux : std_logic :='0';
signal s_icond : std_logic_vector(1 downto 0):="00";
signal s_ialu : std_logic_vector(1 downto 0):="00";
signal s_ishift : std_logic_vector(1 downto 0):="00";
signal s_imbr : std_logic :='0';
signal s_imar : std_logic :='0';
signal s_ird : std_logic :='0';
signal s_iwr : std_logic :='0';
signal s_ienc : std_logic :='0';
signal s_icdek : std_logic_vector(3 downto 0):="1010";
signal s_ibdek : std_logic_vector(3 downto 0):="1010";
signal s_iadek : std_logic_vector(3 downto 0):="1010";
signal s_iadr : std_logic_vector(7 downto 0):="00000000";

signal s_mikinstrukcija : std_logic_vector(31 downto 0):=x"00000000";
signal s_adresamikinstr : std_logic_vector(7 downto 0):=x"00";

signal s_izmseq : std_logic :='0';
signal s_n : std_logic :='0';
signal s_z : std_logic :='0';

signal s_asab : std_logic_vector(15 downto 0) :=x"0000";
signal s_bsab : std_logic_vector(15 downto 0) :=x"0000";
signal s_csab : std_logic_vector(15 downto 0) :=x"0000";

signal s_sambrauamux : std_logic_vector(15 downto 0) :=x"0000";
signal s_saamuxaualu : std_logic_vector(15 downto 0) :=x"0000";
signal s_saaluaushifter : std_logic_vector(15 downto 0) :=x"0000";

signal s_samarauvanjsku : std_logic_vector(11 downto 0) :=x"000";
signal s_savanjskeumbr : std_logic_vector(15 downto 0) :=x"0000";
signal s_sambrauvanjsku : std_logic_vector(15 downto 0) :=x"0000";

begin
	k_clkdistrib : clkdistrib port map(clk, s_clk1, s_clk2, s_clk3, s_clk4, s_clk5);
	k_mikinstrukcija : mikinstrukcija port map(s_mikinstrukcija, s_iamux, s_icond, s_ialu, s_ishift, s_imbr, s_imar, s_ird, s_iwr, s_ienc, s_icdek, s_ibdek, s_iadek, s_iadr);
	k_upravljackamem : upravljackamem port map(s_adresamikinstr, s_mikinstrukcija);
	k_mmux : mmux port map(s_iadr, s_izmseq, s_clk4, s_adresamikinstr);
	k_mseq : mseq port map(s_n, s_z, s_icond, s_izmseq);
	k_registri : registri port map(s_iadek, s_ibdek, s_icdek, s_asab, s_bsab, s_csab, s_clk2, s_clk4, s_ienc);
	k_amux : amux port map(s_sambrauamux, s_asab, s_iamux, s_saamuxaualu);
	k_alu : alu port map(s_saamuxaualu, s_bsab, s_ialu, s_n, s_z, s_saaluaushifter);
	k_shifter : shifter port map(s_saaluaushifter, s_ishift, s_csab);
	k_mar : mar port map(s_imar, s_clk3, s_bsab, s_samarauvanjsku);
	k_mbr : mbr port map(s_imbr, s_ird, s_csab, s_savanjskeumbr, s_clk4, s_sambrauvanjsku, s_sambrauamux);
	k_vanjskamem : vanjskamem port map(s_clk5, s_iwr, s_sambrauvanjsku, s_savanjskeumbr, s_samarauvanjsku);
	adresavanjske<=s_samarauvanjsku;
	vanjska<=s_savanjskeumbr;
	adresaA<=s_iadek;
	A<=s_asab;
	adresaB<=s_ibdek;
	B<=s_bsab;
	adresaC<=s_icdek;
	C<=s_csab;
end Behavioral;

