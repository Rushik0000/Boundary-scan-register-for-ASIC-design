library ieee;
use ieee.std_logic_1164.all;

entity MUX is
  port (a : in std_logic;
        b : in std_logic;
        con : in std_logic;
        outp : out std_logic);
 end MUX;
 
 architecture mux of MUX is 

   
 begin
   
 process (a,b, con)
   begin
     
    if (con ='0')  then
      outp<=a;
    else 
       outp<=b;
    end if;
 
end process;   

end mux;
