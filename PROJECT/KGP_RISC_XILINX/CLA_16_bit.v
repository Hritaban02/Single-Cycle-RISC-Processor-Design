
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- 16-Bit Carry Look Adder
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

// Module for 16-Bit Carry LookAhead Adder with LookAhead Carry Unit
// (takes in two 16-bit binary strings "a" and "b" and an input-carry bit "c_in" as inputs; 
// and outputs an 16-bit binary string "s" and an output-carry bit "c_out", along with
// block propagate and block generate signals)

// Building a 16-bit Carry LookAhead Adder in a Hierarchial Fashion
// --- Using a seperate level of LookAhead Carry Unit
// --- The LookAhead Carry Unit uses Block Generate GG and Block Propagate PP

module CLA_16_bit ( s , BP , BG , a , b , c_in ) ;
	input [15:0] a, b ;		// 16-bits Inputs to the Carry LookAhead Adder
	input c_in ;			// input carry bit
	output [15:0] s ;		// 16-bit Sum Output of the Adder
	output BP, BG ;			// // Block Propagate & Block Generate Signals produced for the next level of hierarchy
	
	// P -- Block Propagates, G -- Block Generates from the 4-bit CLA Modules
	// C -- Carry bits generated from the LookAhead Carry Unit
	wire [3:0] P, G, C ;

	// Module Instantiations of 4 Carry LookAhead Adders
	CLA_4_bit C0 (.PP(P[0]), .GG(G[0]), .s(s[3:0]), .a(a[3:0]), .b(b[3:0]), .c_in(c_in)) ;
	CLA_4_bit C1 (.PP(P[1]), .GG(G[1]), .s(s[7:4]), .a(a[7:4]), .b(b[7:4]), .c_in(C[0])) ;
	CLA_4_bit C2 (.PP(P[2]), .GG(G[2]), .s(s[11:8]), .a(a[11:8]), .b(b[11:8]), .c_in(C[1])) ;
	CLA_4_bit C3 (.PP(P[3]), .GG(G[3]), .s(s[15:12]), .a(a[15:12]), .b(b[15:12]), .c_in(C[2])) ;
	
	// Module Instantiation of LookAhead Carry Unit
	LookAhead_Carry_Unit_Level_1 LAC (.C(C), .BP(BP), .BG(BG), .P(P), .G(G), .c_in(c_in)) ;
endmodule