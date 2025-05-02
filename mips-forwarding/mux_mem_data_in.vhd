----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:49:20 05/21/2018 
-- Design Name: 
-- Module Name:    mux_mem_data_in - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux_mem_data_in is
    Port ( b_in : in  STD_LOGIC_VECTOR (31 downto 0);
           ex_in : in  STD_LOGIC_VECTOR (31 downto 0);
           mem_in : in  STD_LOGIC_VECTOR (31 downto 0);
           control : in  STD_LOGIC_VECTOR (1 downto 0);
           data_out : out  STD_LOGIC_VECTOR (31 downto 0));
end mux_mem_data_in;

architecture Behavioral of mux_mem_data_in is

begin
	data_out<=b_in when control="00" else 
				 ex_in when control="01" else
				 mem_in when control="10";
end Behavioral;

