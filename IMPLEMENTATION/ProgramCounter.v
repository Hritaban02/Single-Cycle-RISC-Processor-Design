
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- Program Counter
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

// This module acts as the program counter in the KGP-RISC processor.
// Its implementation is similar to that of a D Flip Flop.
// "next" is the 32-bit address of the next instruction in the instruction memory
// "add" is the 32-bit address of the current instruction in the instruction memory

module ProgramCounter ( clk , rst , next , add ) ;
	input wire clk, rst ;
	input wire [31:0] next ;
	output reg [31:0] add ;
	
	always @ ( negedge clk ) begin	// negative-edge triggered
		if ( rst )	add <= 32'b0 ;	// synchronous reset through "rst" signal
		else			add <= next ;
	end
endmodule
