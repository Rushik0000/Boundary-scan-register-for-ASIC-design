library ieee;
use ieee.std_logic_1164.all;

entity D_FF is
  port (Clk : in std_logic;
        D : in std_logic;
        outp : out std_logic);
 end D_FF;
 
 architecture d_ff of D_FF is 
 
 begin
 
 process(Clk)
   
   begin
     if (Clk'event and Clk='1') then
       outp <=D;
   ----  else
     ---  outp <= '0';
     end if;
       
  end process;
 
        
end d_ff;
