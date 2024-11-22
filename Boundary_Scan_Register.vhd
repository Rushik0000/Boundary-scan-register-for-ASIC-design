library ieee;
use ieee.std_logic_1164.all;

entity Boundary_scan_reg is
  port (ClockDR : in std_logic;
        UpdateDR : in std_logic;
        ShiftDR : in std_logic;
        Last_cell : in std_logic;
        
        To_next_cell : out std_logic;
        inputs : in std_logic;
        mode : in std_logic;
        To_System : out std_logic );
 end Boundary_scan_reg;
 
 architecture Boundary of Boundary_scan_reg is 
 
signal Mux1_out, Mux2_in,  To_next_cell_signal : std_logic;

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
   
a1: MUX port map (inputs, Last_cell, ShiftDR,Mux1_out);   
a2: D_FF port map (ClockDR, Mux1_out, To_next_cell_signal); 
 
To_next_cell <=To_next_cell_signal; 

a3: D_FF port map (UpdateDR, To_next_cell_signal, Mux2_in); 
a4: MUX port map (inputs, Mux2_in, mode,To_System );    
        
end Boundary;