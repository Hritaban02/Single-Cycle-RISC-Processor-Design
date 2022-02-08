
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- 32-Bit Arithmetic Logic Unit
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

// [[ Arithmetic Logic Unit ]] -- Module for Arithmetic Logic Unit
// (takes in two 1-bit binary inputs "clk", "rst", two 32-bit binary inputs "a" and "b", and one 7-bit binary input "control_signal"; 
// and outputs one 32-bit binary output "result", two 1-bit binary outputs "carry_out" and "zero")
// "clk" 				--- 	clock signal
// "rst" 				--- 	reset signal
// "a" 					--- 	32-bit Input A
// "b" 					--- 	32-bit Input B
// "control_signal"	---	7-bit control signals interpreted as carry_out_select[1], Logic/Arithmetic[1], Direction[1], carry_in[1], operation[3]
// "result"				--- 	32-bit Output Result
//	"carry_out"			---	Carry Out of the ALU after performing a addition or complementation operation
//	"zero"				--- 	1 if the result is 0 else 0

module ALU(clk, rst, a, b, control_signal, result, carry_out, zero);
	input clk, rst;					// Clock signal and Reset Signal
	input signed [31:0] a, b; 				// 32-bits Inputs to the ALU
	input [6:0] control_signal;	// 7-bit Control Signals to the ALU
	output reg signed [31:0] result;		// 32-bit Output of the ALU
	output carry_out;					// Carry Out of the ALU after performing a addition or complementation operation
	output zero;						// Indicates whether the result is 0 or not
	
	reg [31:0] adder_input1, adder_input2;		// First and Second input to the adder
	reg fill_bit;						// Fill Bit of the Barrel Shifter-0 if logical shifting else a[31] if arithmetic shifting
	wire c_in, c_out, direction;	// Carry_in, Carry_out and Direction wires
	wire [31:0] adder_result, shift_result;	// Wires for the result of the adder and the barrel shifter
	
	assign direction = control_signal[4];	// direction is given by control_signal[4]
	assign c_in = control_signal[3];			// c_in is given by control_signal[3]
	assign zero = ~(|result);					// zero is 1 if and only if the result is 0
	
	// Multiplexer which regulates the value of carry_out in the DFF, changed if and only if operation is addition or complementation
	Mux2to1 Carry_Out(.Output(new_c_out), .Sel(control_signal[6]), .Input_0(carry_out), .Input_1(c_out));	
	
	// 32-bit Carry Look Ahead Adder is used for the addition operations
	CLA_32_bit Adder(.s(adder_result) , .c_out(c_out), .a(adder_input1) , .b(adder_input2) , .c_in(c_in));
	
	// 32-bit Barrel Shifter which can shift the bits in a upto 32 bits in either direction either logically or arithmetically
	Barrel_Shifter BS(.in(a), .shamt(b[5:0]), .fill_bit(fill_bit), .dir(direction), .out(shift_result));
	
	// D-Flip Flop to store the last computed value of carry_out in an addition or complementation operation
	D_Flip_Flop DFF_(.clk(clk), .rst(rst), .D(new_c_out), .Q(carry_out));
	
	always @(*)
	begin
		case(control_signal[3])
			1'b0:			// Addition 
				begin
					adder_input1 = a;
					adder_input2 = b;
				end
			1'b1:			// Complementation 
				begin
					adder_input1 = 0;
					adder_input2 = ~b;
				end
		endcase
		
		case(control_signal[5])
			1'b0: 		// Logical Shift
				begin
					fill_bit = 1'b0;
				end
			1'b1:			// Arithmetic Shift
				begin
					fill_bit = a[31];
				end
		endcase
		
		case(control_signal[2:0])
			3'b000:	 	// Addition Operation
				begin
					result = adder_result;
				end
			3'b001: 		// AND Operation
				begin
					result = a & b;
				end
			3'b010: 		// XOR Operation
				begin
					result = a ^ b;
				end
			3'b011: 		// Shift Operation
				begin
					result = shift_result;
				end
			default:		// Don't Care Signals
				begin
					result = 32'b0;
				end
		endcase
	end
endmodule
