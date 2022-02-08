
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- 32-Bit Carry Look Adder
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

// Module for 32-Bit Carry LookAhead Adder with LookAhead Carry Unit
// (takes in two 32-bit binary strings "a" and "b" and an input-carry bit "c_in" as inputs; 
// and outputs an 32-bit binary string "s" and an output-carry bit "c_out", along with
// block propagate and block generate signals)

// Building a 32-bit Carry LookAhead Adder in a Hierarchial Fashion
// --- Using a seperate level of LookAhead Carry Unit
// --- The LookAhead Carry Unit uses Block Generate GG and Block Propagate PP

module CLA_32_bit ( s , c_out, a , b , c_in ) ;
	input [31:0] a, b ;		// 32-bits Inputs to the Carry LookAhead Adder
	input c_in ;			// input carry bit
	output [31:0] s ;		// 32-bit Sum Output of the Adder
	output c_out ;			// c_out -- carry-out from the addition(In case of overflow)
	
	// P -- Block Propagates, G -- Block Generates from the 16-bit CLA Modules
	// C -- Carry bits generated from the LookAhead Carry Unit
	wire [1:0] P, G, C ;
	
	assign c_out = C[1] ; // Carry-out from the entire addition

	// Module Instantiations of 4 Carry LookAhead Adders
	CLA_16_bit C0 (.BP(P[0]), .BG(G[0]), .s(s[15:0]), .a(a[15:0]), .b(b[15:0]), .c_in(c_in)) ;
	CLA_16_bit C1 (.BP(P[1]), .BG(G[1]), .s(s[31:16]), .a(a[31:16]), .b(b[31:16]), .c_in(C[0])) ;

	
	// Module Instantiation of LookAhead Carry Unit
	LookAhead_Carry_Unit_Level_2 LAC (.C(C), .P(P), .G(G), .c_in(c_in)) ;
endmodule