
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- D Flip Flop (for ALU only)
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

// Module for D Flip Flop (takes in three 1-bit binary inputs
// "clk", "rst", and "D" as inputs; and outputs a two 1-bit binary outputs
// "Q" and "Q_bar")

// The D Flip Flop is active only at the negative edge of the Clock (clk)
// and can be reset to 0 synchronously by putting the rst bit to 1.

module D_Flip_Flop(clk, rst, D, Q);
	input wire clk, rst, D; // Input wires clk, rst, and D
	output reg Q; 	// Outputs Q
	
	// The always block's is active either at the positive edge of the clock or when the reset bit is 1
	always @(negedge clk)
	begin
		// If reset bit is 1 then set Q to 0
		if(rst)
			begin
				Q <= 1'b0;
			end
		// Else set Q to D 
		else
			begin
				Q <= D;
			end
	end
endmodule
