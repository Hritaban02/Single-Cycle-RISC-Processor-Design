
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- Look-Ahead Carry Unit (Level 2)
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

// LookAhead Carry Unit Module generates Carry bits at a higher level of hierarchy
// (takes in two 2-bit binary strings "P"(Block Propagates) and "G"(Block Generates) and an input-carry 
// bit "c_in" as inputs; and outputs an 2-bit binary string "C" which are the carry bits)
// Uses additional hardware to generate the carry bits that is why it is called Carry LookAhead Adder

module LookAhead_Carry_Unit_Level_2 ( C , P , G , c_in ) ;
	input [1:0] P, G ;	// P -- Propagate, G -- Generate Inputs from the Carry LookAhead Adders
	input c_in ;		// input carry bit
	output [1:0] C ;	// Carry-bits generated as Output
	
	// Carry-bits generated as Output
	assign C[0] = G[0] | (P[0] & c_in) ;	// Carry-in for Second CLA Unit
	assign C[1] = G[1] | (P[1] & (G[0] | (P[0] & c_in))) ;	// Carry-out from the entire addition
endmodule