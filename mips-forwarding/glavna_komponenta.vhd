library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity glavna_komponenta is
    Port ( clk : in  STD_LOGIC);
end glavna_komponenta;

architecture Behavioral of glavna_komponenta is
component vanjska_mem_instr 
    Port ( adr_in : in  STD_LOGIC_VECTOR (31 downto 0);
           data_out : out  STD_LOGIC_VECTOR (31 downto 0);
			  clk : in std_logic);
end component;

component preg_ifid 
    Port ( npc_in : in  STD_LOGIC_VECTOR (31 downto 0);
           ir_in : in  STD_LOGIC_VECTOR (31 downto 0);
           npc_out : out  STD_LOGIC_VECTOR (31 downto 0);
           adr_a_out : out  STD_LOGIC_VECTOR (4 downto 0);
           adr_b_out : out  STD_LOGIC_VECTOR (4 downto 0);
           imm_out : out  STD_LOGIC_VECTOR (15 downto 0);
           ir_out : out  STD_LOGIC_VECTOR (31 downto 0);
			  clk : in std_logic);
end component;

component registri 
    Port ( adr_a : in  STD_LOGIC_VECTOR (4 downto 0);
           adr_b : in  STD_LOGIC_VECTOR (4 downto 0);
           adr_wr : in  STD_LOGIC_VECTOR (4 downto 0);
           data_in : in  STD_LOGIC_VECTOR (31 downto 0);
           data_a : out  STD_LOGIC_VECTOR (31 downto 0);
           data_b : out  STD_LOGIC_VECTOR (31 downto 0);
			  write_control : in std_logic;
			  clk : in std_logic);
end component;

component wait_ifid_idex
    Port ( ir_in : in  STD_LOGIC_VECTOR (31 downto 0);
           ir_out : out  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC);
end component;

component sign_extend 
    Port ( data_in : in  STD_LOGIC_VECTOR (15 downto 0);
           data_out : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


component preg_idex
    Port ( npc_in : in  STD_LOGIC_VECTOR (31 downto 0);
           ir_in : in  STD_LOGIC_VECTOR (31 downto 0);
           imm_in : in  STD_LOGIC_VECTOR (31 downto 0);
           a_in : in  STD_LOGIC_VECTOR (31 downto 0);
           b_in : in  STD_LOGIC_VECTOR (31 downto 0);
           npc_out : out  STD_LOGIC_VECTOR (31 downto 0);
           ir_out : out  STD_LOGIC_VECTOR (31 downto 0);
           a_out : out  STD_LOGIC_VECTOR (31 downto 0);
           b_out : out  STD_LOGIC_VECTOR (31 downto 0);
           imm_out : out  STD_LOGIC_VECTOR (31 downto 0);
			  control_bit_mux_a : out std_logic_vector (1 downto 0);
			  control_bit_mux_b : out std_logic_vector (1 downto 0);
			  control_bit_mux_data_mem : out std_logic_vector(1 downto 0);
			  alu_control : out std_logic_vector(2 downto 0);
			  ir_ex_in : in std_logic_vector(31 downto 0);
			  ir_mem_in : in std_logic_vector(31 downto 0);
			  clk : in std_logic);
end component;

component alu 
	port( a, b: in STD_LOGIC_VECTOR(31 downto 0);
	      ALUControl: in STD_LOGIC_VECTOR(2 downto 0);
	      Result: buffer STD_LOGIC_VECTOR(31 downto 0);
	      ALUFlags: out STD_LOGIC_VECTOR(3 downto 0)); 
end component;

component mux_a
    Port ( npc_in : in  STD_LOGIC_VECTOR (31 downto 0);
			  a_in : in  STD_LOGIC_VECTOR (31 downto 0);
			  ex_in : in std_logic_vector(31 downto 0);
			  mem_in : in std_logic_vector(31 downto 0);
           control : in  STD_LOGIC_vector(1 downto 0);
           data_out : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component mux_b
	Port (  b_in : in  STD_LOGIC_VECTOR (31 downto 0);
           imm_in : in  STD_LOGIC_VECTOR (31 downto 0);
			  ex_in : std_logic_vector(31 downto 0);
			  mem_in : std_logic_vector(31 downto 0);
           control : in  STD_LOGIC_vector(1 downto 0);
           data_out : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component vanjska_mem_podaci
	Port ( adr_in : in  STD_LOGIC_VECTOR (31 downto 0);
           data_in : in  STD_LOGIC_VECTOR (31 downto 0);
           data_out : out  STD_LOGIC_VECTOR (31 downto 0);
           control_bit : in  STD_LOGIC;
			  clk : in std_logic);
end component;

component preg_exmem 
    Port ( gran_in : in  STD_LOGIC;
           alu_output_in : in  STD_LOGIC_VECTOR (31 downto 0);
           b_in : in  STD_LOGIC_VECTOR (31 downto 0);
           ir_in : in  STD_LOGIC_VECTOR (31 downto 0);
           b_out : out  STD_LOGIC_VECTOR (31 downto 0);
           ir_out : out  STD_LOGIC_VECTOR (31 downto 0);
           gran_out : out  STD_LOGIC;
           alu_output_out : out  STD_LOGIC_VECTOR (31 downto 0);
		   control_bit : out std_logic;
			  clk : in std_logic);
end component;

component mux_wb 
    Port ( mem_in : in  STD_LOGIC_VECTOR (31 downto 0);
           alu_in : in  STD_LOGIC_VECTOR (31 downto 0);
           control : in  STD_LOGIC;
           data_out : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component preg_memwb 
    Port ( mem_output_in : in  STD_LOGIC_VECTOR (31 downto 0);
           alu_output_in : in  STD_LOGIC_VECTOR (31 downto 0);
           ir_in : in  STD_LOGIC_VECTOR (31 downto 0);
           mem_output_out : out  STD_LOGIC_VECTOR (31 downto 0);
           alu_output_out : out  STD_LOGIC_VECTOR (31 downto 0);
			  adr_out : out std_logic_vector(4 downto 0);
			  control_bit : out std_logic;
			  control_bit_mux_wb : out std_logic;
			  ir_out : out std_logic_vector(31 downto 0);
			  clk : in std_logic);
end component;

component mux_pc 
    Port ( jump_pc : in  STD_LOGIC_VECTOR (31 downto 0);
		   inc_pc : in  STD_LOGIC_VECTOR (31 downto 0);
           control : in  STD_LOGIC;
           npc : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component increment 
    Port ( pc_in : in  STD_LOGIC_VECTOR (31 downto 0);
           pc_out : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component pc 
    Port ( pc_in : in  STD_LOGIC_VECTOR (31 downto 0);
           pc_out : out  STD_LOGIC_VECTOR (31 downto 0);
		   clk : in std_logic);
end component;

component wait_exmem_memwb
    Port ( aluoutput_in : in  STD_LOGIC_VECTOR (31 downto 0);
           ir_in : in  STD_LOGIC_VECTOR (31 downto 0);
           aluoutput_out : out  STD_LOGIC_VECTOR (31 downto 0);
           ir_out : out  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC);
end component;

component mux_mem_data_in
    Port ( b_in : in  STD_LOGIC_VECTOR (31 downto 0);
           ex_in : in  STD_LOGIC_VECTOR (31 downto 0);
           mem_in : in  STD_LOGIC_VECTOR (31 downto 0);
           control : in  STD_LOGIC_VECTOR (1 downto 0);
           data_out : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component wait_memwb
    Port ( data_in : in  STD_LOGIC_VECTOR (31 downto 0);
           ir_in : in  STD_LOGIC_VECTOR (31 downto 0);
           data_out : out  STD_LOGIC_VECTOR (31 downto 0);
           ir_out : out  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC);
end component;

--signali 

signal sa_mem_inst_u_ifid_ir : std_logic_vector(31 downto 0);

signal sa_mux_pc_u_ifid_i_pc_npc : std_logic_vector(31 downto 0);

signal sa_ifid_u_idex_npc : std_logic_vector(31 downto 0);
signal sa_ifid_u_wait_ir : std_logic_vector(31 downto 0);
signal sa_ifid_u_registre_adr_a : std_logic_vector(4 downto 0);
signal sa_ifid_u_registre_adr_b : std_logic_vector(4 downto 0);
signal sa_ifid_u_sign_extend_imm : std_logic_vector(15 downto 0);

signal sa_wait_ifid_u_idex : std_logic_vector(31 downto 0);

signal sa_registara_u_idex_a : std_logic_vector(31 downto 0);
signal sa_registara_u_idex_b : std_logic_vector(31 downto 0);

signal sa_sign_extend_u_idex : std_logic_vector(31 downto 0);

signal sa_idex_u_exmem_ir : std_logic_vector(31 downto 0);
signal sa_idex_u_mux_a_npc : std_logic_vector(31 downto 0);
signal sa_idex_u_mux_a_a : std_logic_vector(31 downto 0);
signal sa_idex_u_mux_b_i_exmem_b : std_logic_vector(31 downto 0);
signal sa_idex_u_mux_b_imm : std_logic_vector(31 downto 0);
signal sa_idex_u_mux_b_control : std_logic_vector(1 downto 0);
signal sa_idex_u_mux_a_control : std_logic_vector(1 downto 0);
signal sa_idex_u_mux_mem_data_control : std_logic_vector(1 downto 0);
signal sa_idex_u_alu_control : std_logic_vector(2 downto 0);

signal sa_mux_a_u_alu_a : std_logic_vector(31 downto 0);

signal sa_mux_b_u_alu_b : std_logic_vector(31 downto 0);

signal sa_alu_u_exmem_output : std_logic_vector(31 downto 0);
signal sa_alu_flagovi : std_logic_vector(3 downto 0);

signal sa_exmem_u_wait_ir : std_logic_vector(31 downto 0);
signal sa_exmem_u_mem_podataka_i_mux_npc_i_memwb_aluoutput : std_logic_vector(31 downto 0);
signal sa_exmem_u_mem_podataka_b : std_logic_vector(31 downto 0);
signal sa_exmem_gran_out : std_logic;
signal sa_exmem_control : std_logic :='0';

signal sa_wait_u_memwb_ir : std_logic_vector(31 downto 0);
signal sa_wait_u_memwb_aluoutput : std_logic_vector(31 downto 0);

signal sa_mem_podataka_u_memwb_data_out : std_logic_vector(31 downto 0);

signal sa_memwb_u_mux_wb_data_out : std_logic_vector(31 downto 0);
signal sa_memwb_u_mux_wb_aluoutput : std_logic_vector(31 downto 0);
signal sa_memwb_u_registre_control : std_logic := '0';
signal sa_memwb_u_mux_wb_control : std_logic;
signal sa_memwb_u_registre_adresa : std_logic_vector(4 downto 0);
signal sa_memwb_ir : std_logic_vector(31 downto 0);

signal sa_mux_wb_u_registre_data_out : std_logic_vector(31 downto 0);

signal sa_increment_u_mux_npc : std_logic_vector(31 downto 0);

signal sa_pc_u_increment_i_mem_instr : std_logic_vector(31 downto 0);

signal sa_mux_mem_data : std_logic_vector(31 downto 0);

signal sa_wait_memwb_data : std_logic_vector(31 downto 0);
signal sa_wait_memwb_ir : std_logic_vector(31 downto 0);


begin

	k_pc : pc port map(sa_mux_pc_u_ifid_i_pc_npc, sa_pc_u_increment_i_mem_instr, clk);
	
	k_vanjska_mem_instr : vanjska_mem_instr port map(sa_pc_u_increment_i_mem_instr, sa_mem_inst_u_ifid_ir, clk);

	k_increment : increment port map(sa_pc_u_increment_i_mem_instr, sa_increment_u_mux_npc);

	k_mux_pc : mux_pc port map (sa_exmem_u_mem_podataka_i_mux_npc_i_memwb_aluoutput, sa_increment_u_mux_npc, sa_exmem_control, sa_mux_pc_u_ifid_i_pc_npc);

	k_preg_ifid : preg_ifid port map(sa_mux_pc_u_ifid_i_pc_npc, sa_mem_inst_u_ifid_ir, sa_ifid_u_idex_npc, sa_ifid_u_registre_adr_a, sa_ifid_u_registre_adr_b, sa_ifid_u_sign_extend_imm, sa_ifid_u_wait_ir, clk);

	k_registri : registri port map(sa_ifid_u_registre_adr_a, sa_ifid_u_registre_adr_b, sa_memwb_u_registre_adresa, sa_mux_wb_u_registre_data_out, sa_registara_u_idex_a, sa_registara_u_idex_b, sa_memwb_u_registre_control, clk);

	k_sign_extend : sign_extend port map(sa_ifid_u_sign_extend_imm, sa_sign_extend_u_idex);
	
	k_preg_idex : preg_idex port map(sa_ifid_u_idex_npc, sa_wait_ifid_u_idex, sa_sign_extend_u_idex, sa_registara_u_idex_a, sa_registara_u_idex_b, sa_idex_u_mux_a_npc, sa_idex_u_exmem_ir, sa_idex_u_mux_a_a, sa_idex_u_mux_b_i_exmem_b, sa_idex_u_mux_b_imm, sa_idex_u_mux_a_control, sa_idex_u_mux_b_control, sa_idex_u_mux_mem_data_control, sa_idex_u_alu_control, sa_exmem_u_wait_ir, sa_memwb_ir, clk);
	
	k_mux_a : mux_a port map(sa_idex_u_mux_a_npc, sa_idex_u_mux_a_a, sa_wait_u_memwb_aluoutput, sa_wait_memwb_data, sa_idex_u_mux_a_control, sa_mux_a_u_alu_a);
	
	k_mux_b : mux_b port map(sa_idex_u_mux_b_i_exmem_b, sa_idex_u_mux_b_imm, sa_wait_u_memwb_aluoutput, sa_wait_memwb_data, sa_idex_u_mux_b_control, sa_mux_b_u_alu_b);
	
	k_mux_mem_data_in : mux_mem_data_in port map(sa_idex_u_mux_b_i_exmem_b, sa_wait_u_memwb_aluoutput, sa_wait_memwb_data, sa_idex_u_mux_mem_data_control, sa_mux_mem_data);
	
	k_alu : alu port map(sa_mux_a_u_alu_a, sa_mux_b_u_alu_b, sa_idex_u_alu_control, sa_alu_u_exmem_output, sa_alu_flagovi);
	
	k_preg_exmem : preg_exmem port map('0', sa_alu_u_exmem_output, sa_mux_mem_data, sa_idex_u_exmem_ir, sa_exmem_u_mem_podataka_b, sa_exmem_u_wait_ir, sa_exmem_gran_out, sa_exmem_u_mem_podataka_i_mux_npc_i_memwb_aluoutput, sa_exmem_control, clk);
	
	k_vanjska_mem_podaci : vanjska_mem_podaci port map(sa_exmem_u_mem_podataka_i_mux_npc_i_memwb_aluoutput, sa_exmem_u_mem_podataka_b, sa_mem_podataka_u_memwb_data_out, sa_exmem_control, clk);
	
	k_preg_memwb : preg_memwb port map(sa_mem_podataka_u_memwb_data_out, sa_wait_u_memwb_aluoutput, sa_wait_u_memwb_ir, sa_memwb_u_mux_wb_data_out, sa_memwb_u_mux_wb_aluoutput, sa_memwb_u_registre_adresa, sa_memwb_u_registre_control, sa_memwb_u_mux_wb_control, sa_memwb_ir, clk);
	
	k_mux_wb : mux_wb port map(sa_memwb_u_mux_wb_data_out, sa_memwb_u_mux_wb_aluoutput, sa_memwb_u_mux_wb_control, sa_mux_wb_u_registre_data_out);
	
	k_wait_memwb : wait_memwb port map(sa_mux_wb_u_registre_data_out, sa_memwb_ir, sa_wait_memwb_data, sa_wait_memwb_ir, clk);
	
	k_wait_ifid_idex : wait_ifid_idex port map(sa_ifid_u_wait_ir, sa_wait_ifid_u_idex, clk);
	
	k_wait_exmem_memwb : wait_exmem_memwb port map(sa_exmem_u_mem_podataka_i_mux_npc_i_memwb_aluoutput, sa_exmem_u_wait_ir, sa_wait_u_memwb_aluoutput, sa_wait_u_memwb_ir, clk);
end Behavioral;                                


