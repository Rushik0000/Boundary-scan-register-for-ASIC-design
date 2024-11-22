library ieee;
use ieee.std_logic_1164.all;

entity TAP_Controller is
  port (TCK : in std_logic;
        TMS : in std_logic;
        TRST : in std_logic;
      
        ClockDR: out std_logic;
        ShiftDR: out std_logic;
        UpdateDR: out std_logic;
        
        ClockIR: out std_logic;
        ShiftIR: out std_logic;
        UpdateIR: out std_logic;
        
        Sel  : out std_logic;
        shift: out std_logic);
 end TAP_Controller;
 
 architecture tap_cont of TAP_Controller is 

 type Jtag_stage is (Reset, Run_idle, Select_DR_Scan, Capture_DR, Shift_DR, Exit1_DR, Pause_DR, Exit2_DR, Update_DR, Select_IR_Scan, Capture_IR, Shift_IR, Exit1_IR, Pause_IR, Exit2_IR, Update_IR);
 signal next_Jtag_stage, current_Jtag_stage :  Jtag_stage;
 

   
 begin
   
   process(TCK, TRST)
     begin
       if TRST ='1' then
         current_Jtag_stage <= Reset;
       elsif (TCK'event and TCK = '1') then
         current_Jtag_stage <= next_Jtag_stage;
       end if;
     end process;
     
     
     process (TMS, current_Jtag_stage, TCK)
       begin
         next_Jtag_stage <= current_Jtag_stage;
         
         ClockDR <='0';
         ShiftDR <='0';
         UpdateDR <='0';
         ClockIR <='0';
         ShiftIR <='0';
         UpdateIR <='0';
         Sel <='0';
         shift <='0';
 
         
         case current_Jtag_stage is
           
         when Reset =>
           if TMS = '0' then
             next_Jtag_stage <= Run_idle;
           end if;
           
         when Run_idle =>
           if TMS = '1' then
             next_Jtag_stage <= Select_DR_Scan;
           end if;
       
         when Select_DR_Scan =>
           Sel <='0';
           if TMS = '1' then
             next_Jtag_stage <= Select_IR_Scan;
           elsif TMS = '0' then
             next_Jtag_stage <= Capture_DR;
           end if;
           
         when Capture_DR =>
           Sel <='0';
           
           ClockDR <= '1';
           if TCK ='0' then
             ClockDR <='0';
           else
             ClockDR <= '1';
           end if;
           
           if TMS = '1' then
             next_Jtag_stage <= Exit1_DR;
           elsif TMS = '0' then
             next_Jtag_stage <= Shift_DR;
           end if;

         when Shift_DR =>
           Sel <='0';
           
           ShiftDR <= '1';
           shift <= '1';          
           if TMS = '1' then
             next_Jtag_stage <= Exit1_DR;
           else
             if TCK ='0' then
                ClockDR <='0';
              else
                ClockDR <= '1';
              end if;
           end if;

         when Exit1_DR =>
           Sel <='0';
           if TMS = '1' then
             next_Jtag_stage <= Update_DR;
           elsif TMS = '0' then
             next_Jtag_stage <= Pause_DR;
           end if;
           
         when Pause_DR =>
           Sel <='0';
           if TMS = '1' then
             next_Jtag_stage <= Exit2_DR;
           end if;
           
         when Exit2_DR =>
           Sel <='0';
           if TMS = '1' then
             next_Jtag_stage <= Update_DR;
           elsif TMS ='0' then
             next_Jtag_stage <= Shift_DR;
           end if;
           
         when Update_DR =>
           Sel <='0';
           
           UpdateDR <= '0';
           
           if TCK ='0' then
             UpdateDR <='1';
           else 
             UpdateDR <='0';
           end if;
           
           
           if TMS = '1' then
             next_Jtag_stage <= Select_DR_Scan;
           elsif TMS ='0' then
             next_Jtag_stage <= Run_idle;
           end if;

         when Select_IR_Scan =>
           Sel <='1';
           if TMS = '1' then
             next_Jtag_stage <= Reset;
           elsif TMS = '0' then
             next_Jtag_stage <= Capture_IR;
           end if;
           
         when Capture_IR =>
           Sel <='1';
           
           ClockIR <= '1';
           if TCK ='0' then
             ClockIR <='0';
           else
             ClockIR <='1';
           end if;
           
           if TMS = '1' then
             next_Jtag_stage <= Exit1_IR;
           elsif TMS = '0' then
             next_Jtag_stage <= Shift_IR;
           end if;


         when Shift_IR =>
           Sel <='1';
           ShiftIR <= '1';
           shift <= '1';
           if TMS = '1' then
             next_Jtag_stage <= Exit1_IR;
             
           else          
              if  TCK ='0' then
                ClockIR <='0';
              else 
                ClockIR <='1';
              end if;
        
           end if;
          
         when Exit1_IR =>
           Sel <='1';

           if TMS = '1' then
             next_Jtag_stage <= Update_IR;
           elsif TMS = '0' then
             next_Jtag_stage <= Pause_IR;
           end if;
           
         when Pause_IR =>
           Sel <='1';
           if TMS = '1' then
             next_Jtag_stage <= Exit2_IR;
           end if;
           
         when Exit2_IR =>
           Sel <='1';
           if TMS = '1' then
             next_Jtag_stage <= Update_IR;
           elsif TMS ='0' then
             next_Jtag_stage <= Shift_IR;
           end if;
           
         when Update_IR =>
           Sel <='1';
           UpdateIR <= '0';
           if TCK ='0' then
             UpdateIR <='1';
           else
             UpdateIR <= '0';
           end if;
         
           if TMS = '1' then
             next_Jtag_stage <= Select_DR_Scan;
           elsif TMS ='0' then
             next_Jtag_stage <= Run_idle;
           end if;
              
        when others =>
          next_Jtag_stage <= Reset;
           
         end case;
         
       end process;

end tap_cont;
