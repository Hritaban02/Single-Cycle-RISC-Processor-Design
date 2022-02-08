
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- Test-bench for Controller module
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

module TestBench_Controller;

	// Inputs
	reg [5:0] opcode;

	// Outputs
	wire [2:0] aluOp;
	wire memWrite;
	wire [2:0] aluSrc;
	wire regWrite;
	wire [1:0] branchCompType;
	wire [1:0] regDest;
	wire branchReg;
	wire branchCarryType;
	wire branchCarryDep;
	wire branchNoRegNoCond;
	wire branchComp;
	wire [1:0] mem2RegData;

	// Instantiate the Unit Under Test (UUT)
	Controller uut (
		.opcode(opcode), 
		.aluOp(aluOp), 
		.memWrite(memWrite), 
		.aluSrc(aluSrc), 
		.regWrite(regWrite), 
		.branchCompType(branchCompType), 
		.regDest(regDest), 
		.branchReg(branchReg), 
		.branchCarryType(branchCarryType), 
		.branchCarryDep(branchCarryDep), 
		.branchNoRegNoCond(branchNoRegNoCond), 
		.branchComp(branchComp),
		.mem2RegData(mem2RegData)
	);

	initial begin
		opcode = 0 ; #10 ;
		// Simply print the entire truth table for all the control signals and tally with the
		// truth table that is written in the documentation (report).
		for ( opcode = 0 ; opcode <= 14 ; opcode = opcode + 1 ) begin
			#10 ;
			$display("OP : %b | AluOp: %b | MemWrite: %b | AluSrc: %b | RegWrite: %b | BranchCompType: %b | RegDest: %b | BranchReg: %b | BranchCarryType: %b | BranchCarryDep: %b | branchNoRegNoCond: %b | branchComp: %b | mem2RegData: %b", 
						opcode, aluOp, memWrite, aluSrc, regWrite, branchCompType, regDest, branchReg, branchCarryType, branchCarryDep, 
						branchNoRegNoCond, branchComp, mem2RegData) ;
		end
	end
      
endmodule

