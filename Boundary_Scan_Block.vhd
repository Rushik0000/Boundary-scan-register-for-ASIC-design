library ieee;
use ieee.std_logic_1164.all;

entity Boundary_scan_block is
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
        
 end Boundary_scan_block;
 
 architecture Boundary_Block of Boundary_scan_block is 


signal To_next_cell_Signal   : std_logic_vector (32 downto 1);
signal From_last_cell_Signal : std_logic_vector (31 downto 0);


component Boundary_scan_reg is
  port (ClockDR : in std_logic;
        UpdateDR : in std_logic;
        ShiftDR : in std_logic;
        Last_cell : in std_logic;      
        To_next_cell : out std_logic;
        inputs : in std_logic;
        mode : in std_logic;
        To_System : out std_logic );
 end component;


 begin

----------------------------------------------------------       
-- Input Boundary Scan Cell--
----------------------------------------------------------       


Cell0: Boundary_scan_reg port map (ClockDR, UpdateDR, ShiftDR, TDI, To_next_cell_Signal(1), From_system_pin(0), mode_logic(0), To_system_logic(0));  
  
From_last_cell_Signal(0) <=To_next_cell_Signal(1);
Cell1: Boundary_scan_reg port map (ClockDR, UpdateDR, ShiftDR, From_last_cell_Signal(0), To_next_cell_Signal(2), From_system_pin(1), mode_logic(1), To_system_logic(1));   
  
From_last_cell_Signal(1) <=To_next_cell_Signal(2);
Cell2: Boundary_scan_reg port map (ClockDR, UpdateDR, ShiftDR, From_last_cell_Signal(1), To_next_cell_Signal(3), From_system_pin(2), mode_logic(2), To_system_logic(2));   

From_last_cell_Signal(2) <=To_next_cell_Signal(3);
Cell3: Boundary_scan_reg port map (ClockDR, UpdateDR, ShiftDR, From_last_cell_Signal(2), To_next_cell_Signal(4), From_system_pin(3), mode_logic(3), To_system_logic(3));  

From_last_cell_Signal(3) <=To_next_cell_Signal(4);
Cell4: Boundary_scan_reg port map (ClockDR, UpdateDR, ShiftDR, From_last_cell_Signal(3), To_next_cell_Signal(5), From_system_pin(4), mode_logic(4), To_system_logic(4));

From_last_cell_Signal(4) <=To_next_cell_Signal(5);
Cell5: Boundary_scan_reg port map (ClockDR, UpdateDR, ShiftDR, From_last_cell_Signal(4), To_next_cell_Signal(6), From_system_pin(5), mode_logic(5), To_system_logic(5));
       
From_last_cell_Signal(5) <=To_next_cell_Signal(6);
Cell6: Boundary_scan_reg port map (ClockDR, UpdateDR, ShiftDR, From_last_cell_Signal(5), To_next_cell_Signal(7), From_system_pin(6), mode_logic(6), To_system_logic(6));
  
From_last_cell_Signal(6) <=To_next_cell_Signal(7);
Cell7: Boundary_scan_reg port map (ClockDR, UpdateDR, ShiftDR, From_last_cell_Signal(6), To_next_cell_Signal(8), From_system_pin(7), mode_logic(7), To_system_logic(7));

From_last_cell_Signal(7) <=To_next_cell_Signal(8);
Cell8: Boundary_scan_reg port map (ClockDR, UpdateDR, ShiftDR, From_last_cell_Signal(7), To_next_cell_Signal(9), From_system_pin(8), mode_logic(8), To_system_logic(8));

From_last_cell_Signal(8) <=To_next_cell_Signal(9);
Cell9: Boundary_scan_reg port map (ClockDR, UpdateDR, ShiftDR, From_last_cell_Signal(8), To_next_cell_Signal(10), From_system_pin(9), mode_logic(9), To_system_logic(9));

From_last_cell_Signal(9) <=To_next_cell_Signal(10);
Cell10: Boundary_scan_reg port map (ClockDR, UpdateDR, ShiftDR, From_last_cell_Signal(9), To_next_cell_Signal(11), From_system_pin(10), mode_logic(10), To_system_logic(10));

From_last_cell_Signal(10) <=To_next_cell_Signal(11);
Cell11: Boundary_scan_reg port map (ClockDR, UpdateDR, ShiftDR, From_last_cell_Signal(10), To_next_cell_Signal(12), From_system_pin(11), mode_logic(11), To_system_logic(11));
  
From_last_cell_Signal(11) <=To_next_cell_Signal(12);
Cell12: Boundary_scan_reg port map (ClockDR, UpdateDR, ShiftDR, From_last_cell_Signal(11), To_next_cell_Signal(13), From_system_pin(12), mode_logic(12), To_system_logic(12));   

From_last_cell_Signal(12) <=To_next_cell_Signal(13);
Cell13: Boundary_scan_reg port map (ClockDR, UpdateDR, ShiftDR, From_last_cell_Signal(12), To_next_cell_Signal(14), From_system_pin(13), mode_logic(13), To_system_logic(13));  

From_last_cell_Signal(13) <=To_next_cell_Signal(14);
Cell14: Boundary_scan_reg port map (ClockDR, UpdateDR, ShiftDR, From_last_cell_Signal(13), To_next_cell_Signal(15), From_system_pin(14), mode_logic(14), To_system_logic(14));

From_last_cell_Signal(14) <=To_next_cell_Signal(15);
Cell15: Boundary_scan_reg port map (ClockDR, UpdateDR, ShiftDR, From_last_cell_Signal(14), To_next_cell_Signal(16), From_system_pin(15), mode_logic(15), To_system_logic(15));
  
----------------------------------------------------------       
-- Output Boundary Scan Cell--
----------------------------------------------------------   
    
From_last_cell_Signal(15) <=To_next_cell_Signal(16);
Cell16: Boundary_scan_reg port map (ClockDR, UpdateDR, ShiftDR, From_last_cell_Signal(15), To_next_cell_Signal(17), From_system_logic(0), mode_logic(16), To_system_pins(0));
  
From_last_cell_Signal(16) <=To_next_cell_Signal(17);
Cell17: Boundary_scan_reg port map (ClockDR, UpdateDR, ShiftDR, From_last_cell_Signal(16), To_next_cell_Signal(18), From_system_logic(1), mode_logic(17), To_system_pins(1));

From_last_cell_Signal(17) <=To_next_cell_Signal(18);
Cell18: Boundary_scan_reg port map (ClockDR, UpdateDR, ShiftDR, From_last_cell_Signal(17), To_next_cell_Signal(19), From_system_logic(2), mode_logic(18), To_system_pins(2));

From_last_cell_Signal(18) <=To_next_cell_Signal(19);
Cell19: Boundary_scan_reg port map (ClockDR, UpdateDR, ShiftDR, From_last_cell_Signal(18), To_next_cell_Signal(20), From_system_logic(3), mode_logic(19), To_system_pins(3));

From_last_cell_Signal(19) <=To_next_cell_Signal(20);
Cell20: Boundary_scan_reg port map (ClockDR, UpdateDR, ShiftDR, From_last_cell_Signal(19), To_next_cell_Signal(21), From_system_logic(4), mode_logic(20), To_system_pins(4));

From_last_cell_Signal(20) <=To_next_cell_Signal(21);
Cell21: Boundary_scan_reg port map (ClockDR, UpdateDR, ShiftDR, From_last_cell_Signal(20), To_next_cell_Signal(22), From_system_logic(5), mode_logic(21), To_system_pins(5));
  
From_last_cell_Signal(21) <=To_next_cell_Signal(22);
Cell22: Boundary_scan_reg port map (ClockDR, UpdateDR, ShiftDR, From_last_cell_Signal(21), To_next_cell_Signal(23), From_system_logic(6), mode_logic(22), To_system_pins(6));   

From_last_cell_Signal(22) <=To_next_cell_Signal(23);
Cell23: Boundary_scan_reg port map (ClockDR, UpdateDR, ShiftDR, From_last_cell_Signal(22), To_next_cell_Signal(24), From_system_logic(7), mode_logic(23), To_system_pins(7));  

From_last_cell_Signal(23) <=To_next_cell_Signal(24);
Cell24: Boundary_scan_reg port map (ClockDR, UpdateDR, ShiftDR, From_last_cell_Signal(23), To_next_cell_Signal(25), From_system_logic(8), mode_logic(24), To_system_pins(8));   

From_last_cell_Signal(24) <=To_next_cell_Signal(25);
Cell25: Boundary_scan_reg port map (ClockDR, UpdateDR, ShiftDR, From_last_cell_Signal(24), To_next_cell_Signal(26), From_system_logic(9), mode_logic(25), To_system_pins(9));  

From_last_cell_Signal(25) <=To_next_cell_Signal(26);
Cell26: Boundary_scan_reg port map (ClockDR, UpdateDR, ShiftDR, From_last_cell_Signal(25), To_next_cell_Signal(27), From_system_logic(10), mode_logic(26), To_system_pins(10));
  
From_last_cell_Signal(26) <=To_next_cell_Signal(27);
Cell27: Boundary_scan_reg port map (ClockDR, UpdateDR, ShiftDR, From_last_cell_Signal(26), To_next_cell_Signal(28), From_system_logic(11), mode_logic(27), To_system_pins(11));

From_last_cell_Signal(27) <=To_next_cell_Signal(28);
Cell28: Boundary_scan_reg port map (ClockDR, UpdateDR, ShiftDR, From_last_cell_Signal(27), To_next_cell_Signal(29), From_system_logic(12), mode_logic(28), To_system_pins(12));

From_last_cell_Signal(28) <=To_next_cell_Signal(29);
Cell29: Boundary_scan_reg port map (ClockDR, UpdateDR, ShiftDR, From_last_cell_Signal(28), To_next_cell_Signal(30), From_system_logic(13), mode_logic(29), To_system_pins(13));

From_last_cell_Signal(29) <=To_next_cell_Signal(30);
Cell30: Boundary_scan_reg port map (ClockDR, UpdateDR, ShiftDR, From_last_cell_Signal(29), To_next_cell_Signal(31), From_system_logic(14), mode_logic(30), To_system_pins(14));

From_last_cell_Signal(30) <=To_next_cell_Signal(31);
Cell31: Boundary_scan_reg port map (ClockDR, UpdateDR, ShiftDR, From_last_cell_Signal(30), To_next_cell_Signal(32), From_system_logic(15), mode_logic(31), To_system_pins(15));

To_next_cell <= To_next_cell_Signal;
To_next_cell_value <= To_next_cell_signal(32);

end Boundary_Block;