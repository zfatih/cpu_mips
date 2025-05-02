library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity alu is
	port( a, b: in STD_LOGIC_VECTOR(31 downto 0);
	      ALUControl: in STD_LOGIC_VECTOR(2 downto 0); 
                                                   -- kako su samo cetiri operacije mo?e i dva bita
	      Result: buffer STD_LOGIC_VECTOR(31 downto 0);
	      ALUFlags: out STD_LOGIC_VECTOR(3 downto 0)); 
                                                   -- da umjesto cetiri izlaza bude jedan cetverobitni
end alu;

architecture behave of alu is
		  signal neg, zero, carryout, overflow: STD_LOGIC;
        signal condb: STD_LOGIC_VECTOR (31 downto 0);
                                                   -- za slucaj da se radi o operaciji SUB
        signal sum: STD_LOGIC_VECTOR(32 downto 0); -- 32 bita radi carry bita
begin
	condb <= not b when ALUControl(2)='1' else b;
	
	sum <= ('0' & a) + ('0' & condb) + ALUControl(2);
                                                   -- dodaje se 0 za 32. bit jer je sum du?ine 32 bita
						                                 -- sub operacija preko add (2kk)
        	
	process (ALUControl, result, sum, a, b)
	begin
		case ALUControl(2 downto 0) is
			when "010"=> result <= sum(31 downto 0);
                                                   -- za sub je ALUControl 110, a za add 010
			when "110"=> result <= sum(31 downto 0);
         
			when "000"=> result <= a and b;
			when "001"=> result <= a or b;
			when others => result <= (others => '-');
		end case;
	end process;
	neg <= Result(31);
	zero <= '1' when (Result = 0) else '0';
	carryout <= ALUControl(1) and sum(32);          -- carry pri sabiranju dva broja, ALUControl=1
	overflow <= ALUControl(1) and (not (a(31) xor b(31) xor ALUControl(2))) and (a(31) xor sum(31));                     
                                                  	-- overflow ako a + b < 0, a>0 i b>0
	ALUFlags<= (neg, zero, carryout, overflow);
end;

