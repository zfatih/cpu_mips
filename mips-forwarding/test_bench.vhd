LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY test_bench_vhd IS
END test_bench_vhd;

ARCHITECTURE behavior OF test_bench_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT glavna_komponenta
	PORT(
		clk : IN std_logic       
		);
	END COMPONENT;

	--Inputs
	SIGNAL clk :  std_logic := '0';

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: glavna_komponenta PORT MAP(
		clk => clk
	);
	
	clkp : process
	begin
		clk<='0';
		wait for 5 ns;
		clk<='1';
		wait for 5 ns;
	end process;
	
	tb : PROCESS
	BEGIN

		-- Wait 100 ns for global reset to finish
		wait for 100 ns;

		-- Place stimulus here

		wait; -- will wait forever
	END PROCESS;

END;
