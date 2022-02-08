
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- KGP-RISC (TOP MODULE)
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

// KGPRISC is our highest level of abstraction of the complete RTL Verliog code 
// for the processor. It has the complete architechture embedded in it for 
// supporting the ISA of KGPRISC.

module KGPRISC(clk, rst);
	input wire clk, rst; 		// Clock and Reset Signals
	Datapath DP( clk , rst ) ; 	// Complete DATA PATH supporting the ISA for KGPRISC
endmodule
