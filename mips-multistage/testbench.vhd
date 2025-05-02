
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY testbench_vhd IS
END testbench_vhd;

ARCHITECTURE behavior OF testbench_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT sklop
	PORT(
		clk : IN std_logic;          
		adresaA : OUT std_logic_vector(3 downto 0);
		A : OUT std_logic_vector(15 downto 0);
		adresaB : OUT std_logic_vector(3 downto 0);
		B : OUT std_logic_vector(15 downto 0);
		adresaC : OUT std_logic_vector(3 downto 0);
		C : OUT std_logic_vector(15 downto 0);
		adresavanjske : OUT std_logic_vector(11 downto 0);
		vanjska : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL clk :  std_logic := '0';

	--Outputs
	SIGNAL adresaA :  std_logic_vector(3 downto 0);
	SIGNAL A :  std_logic_vector(15 downto 0);
	SIGNAL adresaB :  std_logic_vector(3 downto 0);
	SIGNAL B :  std_logic_vector(15 downto 0);
	SIGNAL adresaC :  std_logic_vector(3 downto 0);
	SIGNAL C :  std_logic_vector(15 downto 0);
	SIGNAL adresavanjske :  std_logic_vector(11 downto 0);
	SIGNAL vanjska :  std_logic_vector(15 downto 0);

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: sklop PORT MAP(
		clk => clk,
		adresaA => adresaA,
		A => A,
		adresaB => adresaB,
		B => B,
		adresaC => adresaC,
		C => C,
		adresavanjske => adresavanjske,
		vanjska => vanjska
	);
	klok : process
	begin
		clk<='0';
		wait for 1 ns;
		clk<='1';
		wait for 1 ns;
	end process;
	tb : PROCESS
	BEGIN

		-- Wait 100 ns for global reset to finish
		wait for 100 ns;

		-- Place stimulus here

		wait; -- will wait forever
	END PROCESS;

END;
