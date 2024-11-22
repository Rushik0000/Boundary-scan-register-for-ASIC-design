library ieee;
use ieee.std_logic_1164.all;

entity Instruction_Register is
  port (System_input : in std_logic;
        ClockIR : in std_logic;
        UpdateIR : in std_logic;
        ShiftIR : in std_logic;
        TDI : in std_logic;
        d_ff_out : out std_logic;
        outp : out std_logic);
 end Instruction_Register;
 
 architecture instruction_reg of Instruction_Register is 
 
  signal mux_out, d_ff_signal : std_logic;
  
  component MUX is
    port (a : in std_logic;
          b : in std_logic;
          con : in std_logic;
          outp : out std_logic);
   end component;
   
   component D_FF is
     port (Clk : in std_logic;
           D : in std_logic;
           outp : out std_logic);
    end component;
    

    
 begin
 
 a1: MUX port map (System_input, TDI, ShiftIR, mux_out);
 a2: D_FF port map(ClockIR, mux_out, d_ff_signal);
   d_ff_out <= d_ff_signal ;
 a3: D_FF port map (UpdateIR, d_ff_signal, outp);
        
end instruction_reg;
