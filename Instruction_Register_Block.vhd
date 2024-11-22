library ieee;
use ieee.std_logic_1164.all;

entity Instruction_Register_block is
  port (System_inp :in std_logic_vector (1 downto 0);
        ClockIR : in std_logic;
        UpdateIR : in std_logic;
        ShiftIR : in std_logic;
        TDI : in std_logic;
        outp : out std_logic_vector (1 downto 0));
 end Instruction_Register_block;
 
 architecture instruction_reg_block of Instruction_Register_block is 
 
  signal Inst_reg_signal : std_logic;
  signal D_ff_out :std_logic_vector (1 downto 0);
  
  component Instruction_Register is
    port (System_input : in std_logic;
          ClockIR : in std_logic;
          UpdateIR : in std_logic;
          ShiftIR : in std_logic;
          TDI : in std_logic;
          d_ff_out : out std_logic;
          outp : out std_logic);
   end component;
    
    
 begin
 
 a1: Instruction_Register port map (System_inp (0) ,ClockIR, UpdateIR, ShiftIR, TDI, D_ff_out(1) ,Inst_reg_signal);
 outp(1) <= Inst_reg_signal;
 a2: Instruction_Register port map(System_inp (1), ClockIR, UpdateIR, ShiftIR, D_ff_out(1), D_ff_out(0), outp(0));
        
end instruction_reg_block;