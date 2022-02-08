
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- Test-bench for ALU Control Module
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

// [[ Test Bench for Arithmetic Logic Unit Control Module]] -- Test Bench Module for Arithmetic Logic Unit Control
// (takes in one 3-bit binary input "ALUOp", and one 10-bit binary input "function_code"; 
// and outputs one 7-bit binary output "control_signal")

// Unit Under Test is the Arithmetic Logic Unit Control Module
// The Unit has been tested for several ALUOps and function codes and the outputs are monitored.

module TestBench_ALUControl;

	// Inputs
	reg [2:0] ALUOp;
	reg [9:0] function_code;

	// Outputs
	wire [6:0] control_signal;

	// Instantiate the Unit Under Test (UUT)
	ALU_Control uut (
		.control_signal(control_signal), 
		.ALUOp(ALUOp), 
		.function_code(function_code)
	);

	initial begin
		// Initialize Inputs
		ALUOp = 0;
		function_code = 0;

		// Wait 10 ns for global reset to finish
		#10;
        
		// Add stimulus here
		ALUOp = 3'b001;								// Primary Arithmetic Operations
		function_code = 10'b0000000000;		// add rs, rt 
		#10;
		$display("ALUOp = %b, function_code = %b, control_signal = %b", ALUOp, function_code, control_signal);
								
		function_code = 10'b0000000001;		// and rs, rt
		#10;
		$display("ALUOp = %b, function_code = %b, control_signal = %b", ALUOp, function_code, control_signal);
			
		function_code = 10'b0000000010;		// xor rs, rt
		#10;
		$display("ALUOp = %b, function_code = %b, control_signal = %b", ALUOp, function_code, control_signal);
			
		function_code = 10'b0000000011;		// comp rs, rt		
		#10;
		$display("ALUOp = %b, function_code = %b, control_signal = %b", ALUOp, function_code, control_signal);	

		ALUOp = 3'b010;								// Constant Value Shift Operations
		function_code = 10'b0000000000;		// shll rs, sh
		#10;
		$display("ALUOp = %b, function_code = %b, control_signal = %b", ALUOp, function_code, control_signal);
		
		function_code = 10'b0000000001;		// shrl rs, sh
		#10;
		$display("ALUOp = %b, function_code = %b, control_signal = %b", ALUOp, function_code, control_signal);
		
		function_code = 10'b0000000010;		// shra rs, sh
		#10;
		$display("ALUOp = %b, function_code = %b, control_signal = %b", ALUOp, function_code, control_signal);	

		ALUOp = 3'b011;								// Variable Value Shift Operations			
		function_code = 110'b0000000000;		// shllv rs, rt
		#10;
		$display("ALUOp = %b, function_code = %b, control_signal = %b", ALUOp, function_code, control_signal);
			
		function_code = 110'b0000000001;		// shrlv rs, rt
		#10;
		$display("ALUOp = %b, function_code = %b, control_signal = %b", ALUOp, function_code, control_signal);
			
		function_code = 110'b0000000010;		// shrav rs, rt
		#10;
		$display("ALUOp = %b, function_code = %b, control_signal = %b", ALUOp, function_code, control_signal);
		
		ALUOp = 3'b100;		// addi rs, imm | lw rt, imm(rs) | sw rt, imm(rs) 
		#10;
		$display("ALUOp = %b, control_signal = %b", ALUOp, control_signal);
				
		ALUOp = 3'b101;		// compi rs, imm
		#10;
		$display("ALUOp = %b, control_signal = %b", ALUOp, control_signal);
			
		ALUOp = 3'b110;		// bnz rs, L | bz rs, L | bltz rs, L
		#10;
		$display("ALUOp = %b, control_signal = %b", ALUOp, control_signal);	
				
	end
      
endmodule

