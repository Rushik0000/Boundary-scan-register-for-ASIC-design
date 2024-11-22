library ieee;
use ieee.std_logic_1164.all;

entity TOP_MODULE_WITH_JTAG is
  port (TCK : in std_logic;
        TMS : in std_logic;
        TRST : in std_logic;
        TDI  :in std_logic;
        
        a : in std_logic_vector (7 downto 0);
        x : in std_logic_vector (7 downto 0);
        
        System_instruction_pin : in std_logic_vector (1 downto 0);
        
        To_system_pins_out : out std_logic_vector (15 downto 0);
        To_next_cell : out std_logic_vector (31 downto 0);
        To_next_cell_value : out std_logic;
       -- Boundary_cells : out std_logic;
        TDO: out std_logic);
 end TOP_MODULE_WITH_JTAG;
 
 architecture JTAG of TOP_MODULE_WITH_JTAG is 
 
 -------------- Component--------------------
 
  component multi_8bit is
   Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
   x : in STD_LOGIC_VECTOR (7 downto 0);
   p : out STD_LOGIC_VECTOR (15 downto 0));
  end component;
 
 component TAP_Controller is
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
  end component;
  
  component Bypass_Reg is
    port (ClockDR : in std_logic;
          ShiftDR : in std_logic;
          TDI : in std_logic;
          To_TDO : out std_logic );
   end component;
   
   component Boundary_scan_block is
     port (From_system_pin : in std_logic_vector (15 downto 0);
           From_system_logic : in std_logic_vector(15 downto 0);
           mode_logic : in std_logic_vector (31 downto 0);
           ClockDR : in std_logic;
           UpdateDR : in std_logic;
           ShiftDR : in std_logic;
           TDI : in std_logic;
           To_next_cell : out std_logic_vector (31 downto 0);
           To_next_cell_value : out std_logic;
           To_system_logic : out std_logic_vector (15 downto 0);    
           To_system_pins : out std_logic_vector (15 downto 0)    
           );
           
    end component;
    
    component Instruction_Register_block is
      port (System_inp :in std_logic_vector (1 downto 0);
            ClockIR : in std_logic;
            UpdateIR : in std_logic;
            ShiftIR : in std_logic;
            TDI : in std_logic;
            outp : out std_logic_vector (1 downto 0));
     end component;
     
     component Instruction_Decoder is
       port (Instruction_Register : in std_logic_vector(1 downto 0);
                    
             Sel  : out std_logic;
             Mode: out std_logic_vector(31 downto 0));
      end component;
      
      
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
        
        
        component Tri_State_Buffer is
          port (Inp : in std_logic;
                Con : in std_logic;
                Outp : out std_logic);
         end component;
        
----------------------------------- - END OF COMPONENT---------------------------------- 


signal ClockDR, ShiftDR, UpdateDR, ClockIR, ShiftIR, UpdateIR, Sel, Shift: std_logic;
signal  Bypass_out : std_logic;
signal From_system_logic, To_system_logic, From_system_pin, To_system_pins :std_logic_vector(15 downto 0);  
signal mode_logic : std_logic_vector(31 downto 0); 
signal instruction_reg_out : std_logic_vector(1 downto 0);
signal selec : std_logic;
signal Mux_1_out, Mux_2_out :std_logic;
---signal Boundary_scan_out :std_logic;
signal not_TCK : std_logic;
signal TDO_sig : std_logic;

begin

From_system_pin <= a & x;
To_system_pins_out <= To_system_pins;
not_TCK <= not TCK;
a1: TAP_Controller port map (TCK, TMS, TRST, ClockDR, ShiftDR, UpdateDR, ClockIR, ShiftIR, UpdateIR, Sel, Shift);
a2: Instruction_Register_block port map (System_instruction_pin, ClockIR, UpdateIR, ShiftIR, TDI, instruction_reg_out);
  
a3: Instruction_Decoder port map (instruction_reg_out, selec, mode_logic);
  
a4: Bypass_Reg port map (ClockDR, ShiftDR, TDI, Bypass_out);
a5: Boundary_scan_block port map ( From_system_pin, From_system_logic, mode_logic ,ClockDR, UpdateDR, ShiftDR, TDI,  To_next_cell, To_next_cell_value, To_system_logic, To_system_pins);
a6: multi_8bit port map (To_system_logic(7 downto 0), To_system_logic(15 downto 8), From_system_logic);

a7: MUX port map (To_system_pins(15),Bypass_out ,selec, Mux_1_out);
a8: MUX port map (Mux_1_out , instruction_reg_out(1), Sel, Mux_2_out);
a9: D_FF port map (not_TCK , Mux_2_out , TDO_sig);
  
a10: Tri_State_Buffer port map (TDO_sig, Shift, TDO);
   
end JTAG;
