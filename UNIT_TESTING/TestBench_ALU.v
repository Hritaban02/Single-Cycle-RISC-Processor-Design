
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- Test-bench for ALU module
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

// [[ Test Bench for Arithmetic Logic Unit ]] -- Test Bench Module for Arithmetic Logic Unit
// (takes in two 1-bit binary inputs "clk", "rst", two 32-bit binary inputs "a" and "b", and one 7-bit binary input "control_signal"; 
// and outputs one 32-bit binary output "result", two 1-bit binary outputs "carry_out" and "zero")

// Unit Under Test is the Arithmetic Logic Unit Module
// The Unit has been tested for several control signals and the outputs are monitored.
// We wait for the outputs to stabilise for one clock cycle (20ns).

module TestBench_ALU;

	// Inputs
	reg clk;
	reg rst;
	reg signed [31:0] a;
	reg signed [31:0] b;
	reg [6:0] control_signal;

	// Outputs
	wire signed [31:0] result;
	wire carry_out;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.clk(clk), 
		.rst(rst), 
		.a(a), 
		.b(b), 
		.control_signal(control_signal), 
		.result(result), 
		.carry_out(carry_out), 
		.zero(zero)
	);
	
	// Initialise the clock
	initial
	begin
		clk = 1'b0;
	end
	
	// Toggle the clock every 10 ns
	always 
		#10 clk = ~clk; 

	initial begin
		// Initialize Inputs
		rst = 1'b0;
		a = 0;
		b = 0;
		control_signal = 7'b0000000;

		// Wait 20 ns for global reset to finish
		#20;
        
		// Add stimulus here
		// TEST CASE 1				// add rs, rt
		rst = 1'b0;
		a = 10;
		b = 101;
		control_signal = 7'b1000000;
		
		#20;
		
		$display("ADD  a = %d, b = %d, a (in binary) = %b, b (in binary) = %b, control_signal = %b, result = %d, result (in binary) = %b, carry_out = %b, zero = %b", a, b, a, b, control_signal, result, result, carry_out, zero);
		
		// TEST CASE 2				// add rs, rt
		rst = 1'b0;
		a = 98;
		b = -201;
		control_signal = 7'b1000000;
		
		#20;
		
		$display("ADD  a = %d, b = %d, a (in binary) = %b, b (in binary) = %b, control_signal = %b, result = %d, result (in binary) = %b, carry_out = %b, zero = %b", a, b, a, b, control_signal, result, result, carry_out, zero);
		
		// TEST CASE 3				// add rs, rt
		rst = 1'b0;
		a = 10000;
		b = 0;
		control_signal = 7'b1000000;
		
		#20;
		
		$display("ADD  a = %d, b = %d, a (in binary) = %b, b (in binary) = %b, control_signal = %b, result = %d, result (in binary) = %b, carry_out = %b, zero = %b", a, b, a, b, control_signal, result, result, carry_out, zero);
		
		// TEST CASE 4				// add rs, rt
		rst = 1'b0;
		a = 1009876;
		b = -101;
		control_signal = 7'b1000000;
		
		#20;
		
		$display("ADD  a = %d, b = %d, a (in binary) = %b, b (in binary) = %b, control_signal = %b, result = %d, result (in binary) = %b, carry_out = %b, zero = %b", a, b, a, b, control_signal, result, result, carry_out, zero);
		
		// TEST CASE 5				// and rs, rt
		rst = 1'b0;
		a = 100123;
		b = 101230;
		control_signal = 7'b0000001;
		
		#20;
		
		$display("AND  a = %d, b = %d, a (in binary) = %b, b (in binary) = %b, control_signal = %b, result = %d, result (in binary) = %b, carry_out = %b, zero = %b", a, b, a, b, control_signal, result, result, carry_out, zero);
		
		// TEST CASE 6				// xor rs, rt
		rst = 1'b0;
		a = 100123;
		b = 101230;
		control_signal = 7'b0000010;
		
		#20;
		
		$display("XOR  a = %d, b = %d, a (in binary) = %b, b (in binary) = %b, control_signal = %b, result = %d, result (in binary) = %b, carry_out = %b, zero = %b", a, b, a, b, control_signal, result, result, carry_out, zero);
		
		// TEST CASE 6				// comp rs, rt
		rst = 1'b0;
		a = 0;
		b = 999;
		control_signal = 7'b1001000;
		
		#20;
		
		$display("COMP a = %d, b = %d, a (in binary) = %b, b (in binary) = %b, control_signal = %b, result = %d, result (in binary) = %b, carry_out = %b, zero = %b", a, b, a, b, control_signal, result, result, carry_out, zero);
		
		// TEST CASE 7				// shllv rs, rt
		rst = 1'b0;
		a = 1432;
		b = 6;
		control_signal = 7'b0010011;
		
		#20;
		
		$display("SLL  a = %d, b = %d, a (in binary) = %b, b (in binary) = %b, control_signal = %b, result = %d, result (in binary) = %b, carry_out = %b, zero = %b", a, b, a, b, control_signal, result, result, carry_out, zero);
			
		// TEST CASE 8				// shrlv rs, rt
		rst = 1'b0;
		a = 1432;
		b = 7;
		control_signal = 7'b00000011;
		
		#20;

		$display("SRL  a = %d, b = %d, a (in binary) = %b, b (in binary) = %b, control_signal = %b, result = %d, result (in binary) = %b, carry_out = %b, zero = %b", a, b, a, b, control_signal, result, result, carry_out, zero);
		
		// TEST CASE 9				// shrav rs, rt
		rst = 1'b0;
		a = 1432;
		b = 8;
		control_signal = 7'b0100011;
		
		#20;
		
		$display("SRA  a = %d, b = %d, a (in binary) = %b, b (in binary) = %b, control_signal = %b, result = %d, result (in binary) = %b, carry_out = %b, zero = %b", a, b, a, b, control_signal, result, result, carry_out, zero);
	
		// TEST CASE 10			// shrav rs, rt
		rst = 1'b0;
		a = -1324;
		b = 9;
		control_signal = 7'b0100011;
		
		#20;
		
		$display("SRA  a = %d, b = %d, a (in binary) = %b, b (in binary) = %b, control_signal = %b, result = %d, result (in binary) = %b, carry_out = %b, zero = %b", a, b, a, b, control_signal, result, result, carry_out, zero);
		
		// TEST CASE 11				// add rs, rt
		rst = 1'b0;
		a = 0;
		b = 0;
		control_signal = 7'b1000000;
		
		#20;
		
		$display("ADD  a = %d, b = %d, a (in binary) = %b, b (in binary) = %b, control_signal = %b, result = %d, result (in binary) = %b, carry_out = %b, zero = %b", a, b, a, b, control_signal, result, result, carry_out, zero);
		
		// TEST CASE 12				// comp rs, rt
		rst = 1'b0;
		a = 98;
		b = 0;
		control_signal = 7'b1000000;
		
		#20;
		
		$display("ADD  a = %d, b = %d, a (in binary) = %b, b (in binary) = %b, control_signal = %b, result = %d, result (in binary) = %b, carry_out = %b, zero = %b", a, b, a, b, control_signal, result, result, carry_out, zero);
		
		// TEST CASE 13				// add rs, rt
		rst = 1'b0;
		a = 10000;
		b = -10000;
		control_signal = 7'b1000000;
		
		#20;
		
		$display("ADD  a = %d, b = %d, a (in binary) = %b, b (in binary) = %b, control_signal = %b, result = %d, result (in binary) = %b, carry_out = %b, zero = %b", a, b, a, b, control_signal, result, result, carry_out, zero);
		
		// TEST CASE 14				// add rs, rt
		rst = 1'b0;
		a = 109876;
		b = -1010008;
		control_signal = 7'b1000000;
		
		#20;
		
		$display("ADD  a = %d, b = %d, a (in binary) = %b, b (in binary) = %b, control_signal = %b, result = %d, result (in binary) = %b, carry_out = %b, zero = %b", a, b, a, b, control_signal, result, result, carry_out, zero);
		
		// TEST CASE 15				// and rs, rt
		rst = 1'b0;
		a = 10124;
		b = 1230;
		control_signal = 7'b0000001;
		
		#20;
		
		$display("AND  a = %d, b = %d, a (in binary) = %b, b (in binary) = %b, control_signal = %b, result = %d, result (in binary) = %b, carry_out = %b, zero = %b", a, b, a, b, control_signal, result, result, carry_out, zero);
		
	end
      
endmodule

