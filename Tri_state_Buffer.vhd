
library ieee;
use ieee.std_logic_1164.all;

entity Tri_State_Buffer is
  port (Inp : in std_logic;
        Con : in std_logic;
        Outp : out std_logic);
 end Tri_State_Buffer;
 
 architecture Tri_Buffer of Tri_State_Buffer is 
 
 begin
   
   Outp <= Inp when (Con = '1') else 'Z';
 
 
 end Tri_Buffer;
 
 
