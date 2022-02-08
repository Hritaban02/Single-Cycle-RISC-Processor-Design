
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- 2-to-1 Multiplexor (Bus Width: 1)
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

// [[ 2 to 1 Multiplexer ]] -- Module for 2 to 1 Multiplexer (takes in three 1-bit binary inputs
// "Sel", "Input_0", and "Input_1" as inputs; and outputs one 1-bit binary output
// "Output")
//////////////////////////////////////////////////////////////////////////////////
// The 2 to 1 Multiplexer selects either Input_0 or Input_1 based on the Select bit.
// 
// The truth table of the 2 to 1 Multiplexer is given below 
// Sel	|	Input_0	|	Input_1	|	Output
// ---------------------------------------
// 0		|		0		|		0		|		0
// 0		|		0		|		1		|		0
// 0		|		1		|		1		|		1
// 0		|		1		|		0		|		1
// 1		|		0		|		0		|		0
// 1		|		0		|		1		|		1
// 1		|		1		|		1		|		1
// 1		|		1		|		0		|		0

module Mux2to1(Output, Sel, Input_0, Input_1);
	input wire Input_0, Input_1, Sel; 	// Input wires Input_0, Input_1 and Sel
	output wire Output;						// Output wires "Output"
	wire Sel_bar, F1, F2;					// Interconnecting wires Sel_bar, F1 and F2 in the Netlist
	
	// Logic for Implementation of 2 to 1 Multiplexer
	not NG(Sel_bar, Sel); 				// Sel_bar = ~Sel
	and AG1(F1, Sel_bar, Input_0);	// F1 = Sel_bar and Input_0
	and AG2(F2, Sel, Input_1);			// F2 = Sel and Input_1
	or OG(Output, F1, F2);				// Output = F1 or F2
endmodule
