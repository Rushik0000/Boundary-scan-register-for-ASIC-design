library ieee;
use ieee.std_logic_1164.all;

entity Instruction_Decoder is
  port (Instruction_Register : in std_logic_vector(1 downto 0);
               
        Sel  : out std_logic;
        Mode: out std_logic_vector(31 downto 0));
 end Instruction_Decoder;
 
 architecture inst_decoder of Instruction_Decoder is 


   
 begin
   
   process(Instruction_Register)
        begin
          if Instruction_Register = "00" then        --EXTEST INSTRUCTION
            Mode <= x"FFFFFFFF";
            Sel <= '0';
          elsif (Instruction_Register = "11") then    --BYPASS INSTRUCTION
            Sel <= '1';
          elsif (Instruction_Register = "01") then   ---Sample and preload
            Mode <= x"00000000";
        elsif  (Instruction_Register = "10") then 
            Mode <= x"00000000";
          end if;
          
        end process;
      
end inst_decoder;
