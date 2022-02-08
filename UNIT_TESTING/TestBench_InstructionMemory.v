
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- Test-bench for InstructionMemory module
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

// Pre-Requisites
// Please load the following .coe files in the respective ip-cores before simulating the testbench.
//	INSTRUCTION MEMORY: Load the .coe file "A7_19CS10044_19CS30053/KGP_RISC/UNIT_TESTING/__instr_memory__.coe" in SINGLE_PORT_ROM ip-core.

module TestBench_InstructionMemory;

	// Inputs
	reg clk;
	reg [31:0] instrAdd;

	// Outputs
	wire [31:0] instr;

	// Instantiate the Unit Under Test (UUT)
	InstructionMemory uut (
		.clk(clk), 
		.instrAdd(instrAdd), 
		.instr(instr)
	);
	
	always #10 clk = ~clk ;	// clock cycle time (CCT) = 20ns

	initial begin
		#20 ;
		clk = 1 ;
		instrAdd = 32'd0 ;
		#20 $display("\n Address: %b (%d) | Instruction: %b", instrAdd, instrAdd, instr) ;	// print instruction 1
		
		#20 ;
		clk = 1 ;
		instrAdd = 32'd4 ;
		#20 $display(" Address: %b (%d) | Instruction: %b", instrAdd, instrAdd, instr) ;	// print instruction 2

		#20 ;
		clk = 1 ;
		instrAdd = 32'd8 ;
		#20 $display(" Address: %b (%d) | Instruction: %b", instrAdd, instrAdd, instr) ;	// print instruction 3

		#20 ;
		clk = 1 ;
		instrAdd = 32'd12 ;
		#20 $display(" Address: %b (%d) | Instruction: %b\n", instrAdd, instrAdd, instr) ;	// print instruction 4
	end

endmodule

