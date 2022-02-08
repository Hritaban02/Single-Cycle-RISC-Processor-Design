
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- 32-Bit Carry Look-Ahead Adder (without carry-in/carry-out ports)
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

// The circuitry implemented in this module is exactly the same as in
// "CLA_32_bit.v", but here the carry_in port is not available. The input
// carry is assumed as 0. The carry-out port is also not available.

// This module is written solely for the purpose of removing synthesis 
// warnings on Xilinx ISE. When we use an adder for incrementing PC by 4
// or for computing PC-relative address for a branch instruction, the 
// carry-out port is not used which gives a warning.

module CLA32BitNoCarry ( s, a , b ) ;
	input [31:0] a, b ;		// 32-bits Inputs to the Carry LookAhead Adder
	output [31:0] s ;		// 32-bit Sum Output of the Adder
	
	// P -- Block Propagates, G -- Block Generates from the 16-bit CLA Modules
	// C -- Carry bits generated from the LookAhead Carry Unit
	wire [1:0] P, G, C ;

	// Module Instantiations of 4 Carry LookAhead Adders
	CLA_16_bit C0 (.BP(P[0]), .BG(G[0]), .s(s[15:0]), .a(a[15:0]), .b(b[15:0]), .c_in(1'b0)) ;	// carry-in = 0
	CLA_16_bit C1 (.BP(P[1]), .BG(G[1]), .s(s[31:16]), .a(a[31:16]), .b(b[31:16]), .c_in(C[0])) ;
	
	// Module Instantiation of LookAhead Carry Unit
	LookAhead_Carry_Unit_Level_2 LAC (.C(C), .P(P), .G(G), .c_in(1'b0)) ;	// carry-in = 0
endmodule