
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- Test-bench for Datapath module
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

// There are total 22 instructions in the ISA. We have divided different types of 
// instructions among 7 test suites, that are as follows. Each test-suite has multiple
// test cases that checks the various algorithmic routines as implemented in the
// datapath.
//	TEST SUITE 01 - (MAIN) add, addi   				 |   (OTHERS) sw
//	TEST SUITE 02 - (MAIN) comp, compi   			 |   (OTHERS) sw
//	TEST SUITE 03 - (MAIN) and, xor		   		     |   (OTHERS) sw
//	TEST SUITE 04 - (MAIN) shrl, shll, shra, shrav   |   (OTHERS) addi, sw
//	TEST SUITE 05 - (MAIN) b, bl, bcy   			 |   (OTHERS) sw
//	TEST SUITE 06 - (MAIN) br, bz, bnz, bltz   		 |   (OTHERS) addi, sw
//	TEST SUITE 07 - (MAIN) lw, sw   				 |   (OTHERS) addi
// This test-bench "surjectively" tests all types of instructions so the coverage
// is the maximum. This test-bench should clear all the test-cases in each of the test
// suite in order to ensure the correctness of all the datapaths in the processor.

// Pre-Requisites
// Please load the following .coe files in the respective ip-cores before simulating the testbench.
//	DATA MEMORY:	 	Load the .coe file "A7_19CS10044_19CS30053/KGP_RISC/UNIT_TESTING/__data_memory__.coe" in SINGLE_PORT_RAM ip-core.
//	INSTRUCTION MEMORY: Load the .coe file "A7_19CS10044_19CS30053/KGP_RISC/UNIT_TESTING/__instr_memory__.coe" in SINGLE_PORT_ROM ip-core.

module TestBench_Datapath;

	// Inputs
	reg clk;
	reg rst;

	// Instantiate the Unit Under Test (UUT)
	Datapath uut (
		.clk(clk), 
		.rst(rst)
	);
	
	always #10 clk = ~clk ; // clock cycle time = 20ns

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#100;
		rst = 0 ;
		clk = 1 ;
		
		$display("\n +++ [TEST SUITE 1] ADD & ADD IMMED. +++") ;
		// CYCLE 1 (I1)
		$display(" (ADD) ALU Oper 1: %d | ALU Oper 2: %d | ALU Result: %d ", uut.ALU32BIT.a, uut.ALU32BIT.b, uut.ALU32BIT.result) ;
		#20 ;
		// CYCLE 2 (I2)
		$display(" (ADDI) ALU Oper 1: %d | ALU Oper 2: %d | ALU Result: %d ", uut.ALU32BIT.a, uut.ALU32BIT.b, uut.ALU32BIT.result) ;
		#20 ;
		// CYCLE 3 (I3)
		$display(" ALU Oper 1: %d | ALU Oper 2: %d | ALU Result: %d ", uut.ALU32BIT.a, uut.ALU32BIT.b, uut.ALU32BIT.result) ;
		#20 ; 
		// CYCLE 4 (I4)
		$display(" DataMem WriteData: %d | DataMem ReadData: %d", uut.DM.writeData, uut.DM.readData) ;
		#20 ; 
		// CYCLE 5 (I5)
		$display(" DataMem WriteData: %d | DataMem ReadData: %d", uut.DM.writeData, uut.DM.readData) ;
		#20 ; 
		// CYCLE 6 (I5 END / I6 START)
		$display(" DataMem WriteData: %d | DataMem ReadData: %d", uut.DM.writeData, uut.DM.readData) ;
		
		
		$display("\n +++ [TEST SUITE 2] COMP & COMP IMMED. +++") ;
		// CYCLE 6 (I6)
		$display(" (COMP) ALU Oper 1: %d | ALU Oper 2: %d | ALU Result: %d ", uut.ALU32BIT.a, uut.ALU32BIT.b, uut.ALU32BIT.result) ;
		#20 ;
		// CYCLE 7 (I7)
		$display(" (COMPI) ALU Oper 1: %d | ALU Oper 2: %d | ALU Result: %d ", uut.ALU32BIT.a, uut.ALU32BIT.b, uut.ALU32BIT.result) ;
		#20 ; 
		// CYCLE 8 (I8) 
		$display(" DataMem WriteData: %d | DataMem ReadData: %d", uut.DM.writeData, uut.DM.readData) ;
		#20 ; 
		// CYCLE 9 (I9)
		$display(" DataMem WriteData: %d | DataMem ReadData: %d", uut.DM.writeData, uut.DM.readData) ;
		#20 ; 
		// CYCLE 10 (I9 END / I10 START)
		$display(" DataMem WriteData: %d | DataMem ReadData: %d", uut.DM.writeData, uut.DM.readData) ;
		
		
		$display("\n +++ [TEST SUITE 3] AND & XOR OPS +++") ;
		// CYCLE 10 (I10)
		$display(" (AND) ALU Oper 1: %d | ALU Oper 2: %d | ALU Result: %d ", uut.ALU32BIT.a, uut.ALU32BIT.b, uut.ALU32BIT.result) ;
		#20 ;
		// CYCLE 11 (I11)
		$display(" (XOR) ALU Oper 1: %d | ALU Oper 2: %d | ALU Result: %d ", uut.ALU32BIT.a, uut.ALU32BIT.b, uut.ALU32BIT.result) ;
		#20 ; 
		// CYCLE 12 (I12) 
		$display(" DataMem WriteData: %d | DataMem ReadData: %d", uut.DM.writeData, uut.DM.readData) ;
		#20 ; 
		// CYCLE 13 (I13)
		$display(" DataMem WriteData: %d | DataMem ReadData: %d", uut.DM.writeData, uut.DM.readData) ;
		#20 ; 
		// CYCLE 14 (I13 END / I14 START)
		$display(" DataMem WriteData: %d | DataMem ReadData: %d", uut.DM.writeData, uut.DM.readData) ;
		
		
		$display("\n +++ [TEST SUITE 4] SHIFT (VARIABLE & IMMED.) OPS +++") ;
		// CYCLE 14 (I14)
		$display(" (SHRL) ALU Oper 1: %d | ALU Oper 2: %d | ALU Result: %d", uut.ALU32BIT.a, uut.ALU32BIT.b, uut.ALU32BIT.result) ;
		#20 ;
		// CYCLE 15 (I15)
		$display(" (SHLL) ALU Oper 1: %d | ALU Oper 2: %d | ALU Result: %d", uut.ALU32BIT.a, uut.ALU32BIT.b, uut.ALU32BIT.result) ;
		#20 ;
		// CYCLE 16 (I16)
		$display(" (ADDI) ALU Oper 1: %d | ALU Oper 2: %d | ALU Result: %d", uut.ALU32BIT.a, uut.ALU32BIT.b, uut.ALU32BIT.result) ;
		#20 ;
		// CYCLE 17 (I17)
		$display(" (SHRA) ALU Oper 1: %d | ALU Oper 2: %d | ALU Result: %d ", uut.ALU32BIT.a, uut.ALU32BIT.b, uut.ALU32BIT.result) ;
		#20 ;
		// CYCLE 18 (I18)
		$display(" (ADDI) ALU Oper 1: %d | ALU Oper 2: %d | ALU Result: %d ", uut.ALU32BIT.a, uut.ALU32BIT.b, uut.ALU32BIT.result) ;
		#20 ;
		// CYCLE 19 (I19)
		$display(" (SHRAV) ALU Oper 1: %d | ALU Oper 2: %d | ALU Result: %d ", uut.ALU32BIT.a, uut.ALU32BIT.b, uut.ALU32BIT.result) ;
		#20 ; 
		// CYCLE 20 (I20) 
		$display(" DataMem WriteData: %d | DataMem ReadData: %d", uut.DM.writeData, uut.DM.readData) ;
		#20 ; 
		// CYCLE 21 (I21) 
		$display(" DataMem WriteData: %d | DataMem ReadData: %d", uut.DM.writeData, uut.DM.readData) ;
		#20 ;
		// CYCLE 22 (I22)
		$display(" DataMem WriteData: %d | DataMem ReadData: %d", uut.DM.writeData, uut.DM.readData) ;
		#20 ; 
		// CYCLE 23 (I22 END / I23 START)
		$display(" DataMem WriteData: %d | DataMem ReadData: %d", uut.DM.writeData, uut.DM.readData) ;
		
		
		$display("\n +++ [TEST SUITE 5] BRANCH INSTRUCTIONS WITH PSEUDO-DIRECT ADDRESSING +++") ;
		// CYCLE 23 (I23)
		$display(" (PC BEFORE b) PC: %b [%d]", uut.PC.add, uut.PC.add) ;
		$display(" (b) Pseudo-Direct Address: %b [%d]", uut.CONCAT.out, uut.CONCAT.out) ;
		#20 ;
		// CYCLE 24 (I23 END / I24 START)
		$display(" (PC AFTER b) PC: %b [%d]", uut.PC.add, uut.PC.add) ;
		
		$display("\n (PC BEFORE bl) PC: %b [%d]", uut.PC.add, uut.PC.add) ;
		$display(" ($ra BEFORE bl) $ra: %b [%d]", uut.RF.R31.data, uut.RF.R31.data) ;
		$display(" (bl) Pseudo-Direct Address: %b [%d]", uut.CONCAT.out, uut.CONCAT.out) ;
		#20 ;
		// CYCLE 25 (I24 END / I25 START)
		$display(" (PC AFTER bl) PC: %b [%d]", uut.PC.add, uut.PC.add) ;
		$display(" ($ra AFTER bl) $ra: %b [%d]", uut.RF.R31.data, uut.RF.R31.data) ;
		
		$display("\n (ADDI) ALU Oper 1: %d | ALU Oper 2: %d | ALU Result: %d | Carry: %d", 
					uut.ALU32BIT.a, uut.ALU32BIT.b, uut.ALU32BIT.result, uut.ALU32BIT.Adder.c_out) ;
		#20 ;
		// CYCLE 26 (I25 END / I26 START)
		$display(" (PC BEFORE bcy) PC: %b [%d]", uut.PC.add, uut.PC.add) ;
		#20 ;
		// CYCLE 27 (I26 END / I27 START)
		$display(" (PC AFTER bcy) PC: %b [%d]", uut.PC.add, uut.PC.add) ;
		
		$display("\n (ADDI) ALU Oper 1: %d | ALU Oper 2: %d | ALU Result: %d | Carry: %d", 
					uut.ALU32BIT.a, uut.ALU32BIT.b, uut.ALU32BIT.result, uut.ALU32BIT.Adder.c_out) ;
		#20 ;
		// CYCLE 28 (I27 END / I28 START)
		$display(" (PC BEFORE bcy) PC: %b [%d]", uut.PC.add, uut.PC.add) ;
		#20 ;
		// CYCLE 29 (I28 END / I29 START)
		$display(" (PC AFTER bcy) PC: %b [%d]", uut.PC.add, uut.PC.add) ;
		
		
		$display("\n +++ [TEST SUITE 6] BRANCH INSTRUCTIONS WITH PC-RELATIVE ADDRESSING +++") ;
		// CYCLE 29 (I29 END)
		$display(" (ADDI) ALU Oper 1: %d | ALU Oper 2: %d | ALU Result: %d", uut.ALU32BIT.a, uut.ALU32BIT.b, uut.ALU32BIT.result) ;

		#20 ;
		// CYCLE 30 (I30)
		$display(" (PC BEFORE bltz) PC: %b [%d]", uut.PC.add, uut.PC.add) ;
		$display(" (flag) rs: %d", uut.RF.rsReadData) ;
		$display(" (bltz) PC-Relative Address: %b [%d]", uut.ADDER2.s, uut.ADDER2.s) ;
		#20 ;
		// CYCLE 31 (I31)
		$display(" (PC AFTER bltz) PC: %b [%d]", uut.PC.add, uut.PC.add) ;
		
		$display("\n (PC BEFORE bnz) PC: %b [%d]", uut.PC.add, uut.PC.add) ;
		$display(" (flag) rs: %d", uut.RF.rsReadData) ;
		$display(" (bnz) PC-Relative Address: %b [%d]", uut.ADDER2.s, uut.ADDER2.s) ;
		#20 ;
		// CYCLE 32 (I32)
		$display(" (PC AFTER bnz) PC: %b [%d]", uut.PC.add, uut.PC.add) ;
		
		$display("\n (PC BEFORE bz) PC: %b [%d]", uut.PC.add, uut.PC.add) ;
		$display(" (flag) rs: %d", uut.RF.rsReadData) ;
		$display(" (bz) PC-Relative Address: %b [%d]", uut.ADDER2.s, uut.ADDER2.s) ;
		#20 ;
		// CYCLE 33 (I33)
		$display(" (PC AFTER bz) PC: %b [%d]", uut.PC.add, uut.PC.add) ;
		
		$display("\n (PC BEFORE br) PC: %b [%d]", uut.PC.add, uut.PC.add) ;
		$display(" (Jump Address in Reg.) $ra: %b [%d]", uut.RF.R31.data, uut.RF.R31.data) ;
		#20 ;
		// CYCLE 34 (I33 END / I34 START)
		$display(" (PC AFTER br) PC: %b [%d]", uut.PC.add, uut.PC.add) ;
		
		
		$display("\n +++ [TEST SUITE 7] LOAD & STORE INSTRUCTIONS +++") ;
		// CYCLE 34 (I34)
		$display(" ($11 BEFORE lw) $11: %d", uut.RF.R11.data) ;
		#20 ;
		// CYCLE 35 (I35)
		$display(" ($11 AFTER lw) $11: %d", uut.RF.R11.data) ;

		#20 ;
		// CYCLE 36 (I36)
		$display(" (addi) $30: %d", uut.RF.R30.data) ;
		
		$display("\n (sw) [Store $6 at 0($30)]  $6: %d", uut.RF.R06.data) ;
		$display(" ($11 BEFORE sw) $11: %d", uut.RF.R11.data) ;
		#20 ;
		// CYCLE 37 (I37)
		$display(" ($11 AFTER sw) $11: %d", uut.RF.R11.data) ;
		
		$display("\n ($11 BEFORE lw from 0($30)) $11: %d", uut.RF.R11.data) ;
		#20 ;
		// CYCLE 38 (I38)
		$display(" ($11 AFTER lw from 0($30)) $11: %d\n", uut.RF.R11.data) ;
	end

endmodule

// Following is the test report generated by Xilinx ISE Design Suite on simulating the behavioral model.
// [ OBSERVATION ] -- ERRORS = 0
// [ CONCLUSION ]  -- All test cases are passed.
/*
 +++ [TEST SUITE 1] ADD & ADD IMMED. +++
 (ADD) ALU Oper 1:           0 | ALU Oper 2:           4 | ALU Result:           4 
 (ADDI) ALU Oper 1:           0 | ALU Oper 2:           9 | ALU Result:           9 
 ALU Oper 1:           4 | ALU Oper 2:           9 | ALU Result:          13 
 DataMem WriteData:          13 | DataMem ReadData:           4
 DataMem WriteData:           9 | DataMem ReadData:          13
 DataMem WriteData:          13 | DataMem ReadData:           9

 +++ [TEST SUITE 2] COMP & COMP IMMED. +++
 (COMP) ALU Oper 1:           0 | ALU Oper 2:          13 | ALU Result:         -13 
 (COMPI) ALU Oper 1:           0 | ALU Oper 2:        -123 | ALU Result:         123 
 DataMem WriteData:         -13 | DataMem ReadData:          15
 DataMem WriteData:         123 | DataMem ReadData:         -13
 DataMem WriteData:         123 | DataMem ReadData:         123

 +++ [TEST SUITE 3] AND & XOR OPS +++
 (AND) ALU Oper 1:          13 | ALU Oper 2:         123 | ALU Result:           9 
 (XOR) ALU Oper 1:           9 | ALU Oper 2:         -13 | ALU Result:          -6 
 DataMem WriteData:           9 | DataMem ReadData:          15
 DataMem WriteData:          -6 | DataMem ReadData:           9
 DataMem WriteData:           0 | DataMem ReadData:          -6

 +++ [TEST SUITE 4] SHIFT (VARIABLE & IMMED.) OPS +++
 (SHRL) ALU Oper 1:          -6 | ALU Oper 2:           2 | ALU Result:  1073741822
 (SHLL) ALU Oper 1:  1073741822 | ALU Oper 2:           5 | ALU Result:         -64
 (ADDI) ALU Oper 1:           0 | ALU Oper 2:     -117788 | ALU Result:     -117788
 (SHRA) ALU Oper 1:     -117788 | ALU Oper 2:           3 | ALU Result:      -14724 
 (ADDI) ALU Oper 1:           0 | ALU Oper 2:           6 | ALU Result:           6 
 (SHRAV) ALU Oper 1:      -14724 | ALU Oper 2:           6 | ALU Result:        -231 
 DataMem WriteData:         -64 | DataMem ReadData:          15
 DataMem WriteData:        -231 | DataMem ReadData:         -64
 DataMem WriteData:           6 | DataMem ReadData:        -231
 DataMem WriteData:           0 | DataMem ReadData:           6

 +++ [TEST SUITE 5] BRANCH INSTRUCTIONS WITH PSEUDO-DIRECT ADDRESSING +++
 (PC BEFORE b) PC: 00000000000000000000000001011000 [        88]
 (b) Pseudo-Direct Address: 00000000000000000000000001110100 [       116]
 (PC AFTER b) PC: 00000000000000000000000001110100 [       116]

 (PC BEFORE bl) PC: 00000000000000000000000001110100 [       116]
 ($ra BEFORE bl) $ra: 00000000000000000000000000000000 [         0]
 (bl) Pseudo-Direct Address: 00000000000000000000000010001100 [       140]
 (PC AFTER bl) PC: 00000000000000000000000010001100 [       140]
 ($ra AFTER bl) $ra: 00000000000000000000000001111000 [       120]

 (ADDI) ALU Oper 1:           6 | ALU Oper 2:     -646468 | ALU Result:     -646462 | Carry: 0
 (PC BEFORE bcy) PC: 00000000000000000000000010010000 [       144]
 (PC AFTER bcy) PC: 00000000000000000000000010010100 [       148]

 (ADDI) ALU Oper 1:     -646462 | ALU Oper 2:       -7492 | ALU Result:     -653954 | Carry: 1
 (PC BEFORE bcy) PC: 00000000000000000000000010011000 [       152]
 (PC AFTER bcy) PC: 00000000000000000000000010100100 [       164]

 +++ [TEST SUITE 6] BRANCH INSTRUCTIONS WITH PC-RELATIVE ADDRESSING +++
 (ADDI) ALU Oper 1:           0 | ALU Oper 2:       -6212 | ALU Result:       -6212
 (PC BEFORE bltz) PC: 00000000000000000000000010101000 [       168]
 (flag) rs:       -6212
 (bltz) PC-Relative Address: 00000000000000000000000010111000 [       184]
 (PC AFTER bltz) PC: 00000000000000000000000010111000 [       184]

 (PC BEFORE bnz) PC: 00000000000000000000000010111000 [       184]
 (flag) rs:           0
 (bnz) PC-Relative Address: 00000000000000000000000011000100 [       196]
 (PC AFTER bnz) PC: 00000000000000000000000010111100 [       188]

 (PC BEFORE bz) PC: 00000000000000000000000010111100 [       188]
 (flag) rs:           0
 (bz) PC-Relative Address: 00000000000000000000000011001100 [       204]
 (PC AFTER bz) PC: 00000000000000000000000011001100 [       204]

 (PC BEFORE br) PC: 00000000000000000000000011001100 [       204]
 (Jump Address in Reg.) $ra: 00000000000000000000000001111000 [       120]
 (PC AFTER br) PC: 00000000000000000000000001111000 [       120]

 +++ [TEST SUITE 7] LOAD & STORE INSTRUCTIONS +++
 ($11 BEFORE lw) $11: 4294961084
 ($11 AFTER lw) $11:        659
 (addi) $30:      66720

 (sw) [Store $6 at 0($30)]  $6: 4294967232
 ($11 BEFORE sw) $11:        659
 ($11 AFTER sw) $11:        659

 ($11 BEFORE lw from 0($30)) $11:        659
 ($11 AFTER lw from 0($30)) $11: 4294967232
*/