
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- 4-Bit Carry Look Adder
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

// Module for 4-Bit Carry LookAhead Adder augmented to output Block Propagate 
// and Block Generate signals (takes in two 4-bit binary strings
// "a" and "b" and an input-carry bit "c_in" as inputs; and outputs an 4-bit binary string 
// "s" along with Block Propagate bit "PP" and Block Generate bit "GG")

module CLA_4_bit( PP , GG , s , a , b , c_in ) ;
	input [3:0] a, b ;		// 4-bit Binary Inputs to the Adder
	input c_in ;			// input carry bit
	output [3:0] s ;		// 4-bit Sum Output of the Adder
	output PP, GG ;			// PP -- Block propagate Signal, GG -- Block generate signal
	wire [3:0] P, G ;		// P -- Propagate signals, G -- Generate signals
	wire C1, C2, C3 ;		// LookAhead Carry Bits
	
	assign P[0] = a[0] ^ b[0] ,	// Propagate signals computed using bits of a and b	
		   P[1] = a[1] ^ b[1] ,
		   P[2] = a[2] ^ b[2] ,
		   P[3] = a[3] ^ b[3] ;
	
	assign G[0] = a[0] & b[0] ,	// Generate signals computed using bits of a and b
		   G[1] = a[1] & b[1] ,
		   G[2] = a[2] & b[2] ,
		   G[3] = a[3] & b[3] ;
	
	assign PP = P[3] & P[2] & P[1] & P[0] ; // Block Propagate Signal
	assign GG = G[3] | (P[3] & (G[2] | (P[2] & (G[1] | (P[1] & G[0]))))) ;	// Block Generate Signal
	
	assign C1 = G[0] | (P[0] & c_in) ;	// Carry-in for the Second Adder
	assign C2 = G[1] | (P[1] & C1) ;	// Carry-in for the Third Adder
	assign C3 = G[2] | (P[2] & (G[1] | (P[1] & C1))) ;	// Carry-in for the Fourth Adder
	
	// sum[i] bit is simply (a[i] xor b[i] xor carry_in)
	assign s[0] = P[0] ^ c_in ;	// outputs the 1st least significant bit of "sum" 
	assign s[1] = P[1] ^ C1 ;	// outputs the 2nd least significant bit of "sum"
	assign s[2] = P[2] ^ C2 ;	// outputs the 3rd least significant bit of "sum"
	assign s[3] = P[3] ^ C3 ;	// outputs the 4th least significant(most significant) bit of "sum"
endmodule
