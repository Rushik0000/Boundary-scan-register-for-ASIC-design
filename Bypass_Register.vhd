library ieee;
use ieee.std_logic_1164.all;

entity Bypass_Reg is
  port (ClockDR : in std_logic;
        ShiftDR : in std_logic;
        TDI : in std_logic;
        To_TDO : out std_logic );
 end Bypass_Reg;
 
 architecture Reg of Bypass_Reg is 
 
 signal andoperation : std_logic;
 
 component D_FF is
   port (Clk : in std_logic;
         D : in std_logic;
         outp : out std_logic);
  end component;
  
 begin
   
 andoperation <= ShiftDR and TDI;
 
a1: D_FF port map(ClockDR, andoperation,  To_TDO );
        
end Reg;