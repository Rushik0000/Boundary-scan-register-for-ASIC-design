# Boundary-scan-register-for-ASIC-design
Structurally designed and synthesised the main components of JTAG/Boundary Scan (input and output boundary scan cells, TAP controller, instruction decoder, instruction register, bypass register and boundary scan register) using ModelSim and precision RTL logic synthesis tools. 

Project Name: Multiplier incorporated with JTAG Standard

---------------------------------------------------

Code Folder Contains 4 folders:

1) Multiplier_Design_File
Description:- This folder contains all the design files of given design (Multiplier) given by the Professor.

Files:-
•creating_pp.vhd
•Exact_Array_Multi_8bit.vhd
•fullAdder.vhd
•myAND.vhd
 

2) JTAG_Incorporated_with_Multiplier
Description:- This folder contains all the design files for for developing JATG Standard.

Files:-

•MUX_2_x_1.vhd                  :- In this file  1-bit MUX 2*1 is implemented.
•D_FF.vhd                       :- In this file D-Filip Flop is implemented which trigged at rising Edge of clock.
•Boundary_Scan_Block.vhd        :- In this file Entire Boundary Scan cell which inculde 16-bits inputs and 16-bits outputs are linked together.
•Boundary_Scan_Register.vhd     :- In this file  Boundary Scan Register is implemented which can perform 4 operations (Normal, Scan, Update and Capture).
•Bypass_Register.vhd            :- In this file 1-bit Bypass Register is implemented which can bypass the TDI to TDO.
•Instruction_Register_Block.vhd :- In this file 2-bit Instruction Register is implemented which can perform 4 basic JTAG instructions (Sample, Preload, Extest and Bypass).
•Instruction_Register.vhd       :- In this file  Instruction Register is implemented which is uesd to load instruction from TDI input.
•Instruction_Decoder.vhd        :- In this file  Instruction Decoder is implemented which is uesd to Decode the instruction and generating control signals for Boundary Scan and Multiplexer.
•TAP_Controller.vhd             :- In this file  Tap Controller Decoder is implemented which has 16 transition state and it genrate control sgnal for all modules in JTAG.
•TOP_MODULE_WITH_JTAG.vhd       :- In this file the design file (Multiplier) is incorporated with JTAG.
•Tri_state_Buffer.vhd           :- In this file  Tri-State Buffer is implemented which is uesd to genrate TDO.

Below files are design file of 8-bit Multiplier
•creating_pp.vhd
•Exact_Array_Multi_8bit.vhd
•fullAdder.vhd
•myAND.vhd

3) Test_Bench_Files_For_JTAG
Description:- This folder contains all the Test bench files for Testing JTAG Modules/Compoents and the design incorporated with JTAG Standard.


•Test_Bench_Boundary_Scan_Block.vhd      :- In this file  Test-Bench of Boundary Scan Block is implemented to test the functionality of Boundary cell block.
•Test_Bench_Boundary_Scan_Register.vhd   :- In this file  Test-Bench of Boundary Scan Register is implemented to test the functionality of Boundary Scan Register.
•Test_Bench_Bypass_Reg.vhd               :- In this file  Test-Bench of Bypass Register is implemented to test the functionality.
•Test_Bench_Instruction_Block.vhd        :- In this file  Test-Bench of Instruction Register Block is implemented to test the functionality instruction register module.
•Test_Bench_Instruction_Register.vhd     :- In this file  Test-Bench of Instruction Register is implemented to test the functionality.
•Test_Bench_TAP_Controller.vhd           :- In this file  Test-Bench of Tap Controller is implemented to test the transtion from one sate to other.
•Test_Bench_Sample_Instruction.vhd       :- In this file  Test-Bench of Sample Instuction is implemented the instruction is working according to JTAG Standard.
•Test_Bench_EXTEST_Instruction.vhd       :- In this file  Test-Bench of EXTEST Instuction is implemented the instruction is working according to JTAG Standard.
•Test_Bench_Bypass_Instruction.vhd       :- In this file  Test-Bench of Bypass Instuction is implemented the instruction is working according to JTAG Standard.
•Test_Bench_Preload_Instruction.vhd      :- In this file  Test-Bench of Preload Instuction is implemented the instruction is working according to JTAG Standard.

4) Area_Report
Description:- This folder contains the Area Report of Design and design incorporated with JTAG.

•Area_Report_with_JTAG
•Area_Report_without_JTAG
