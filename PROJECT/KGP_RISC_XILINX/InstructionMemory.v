
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- Instruction Memory
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

// Module for the Instruction Memory
// Here "SINGLE_PORT_ROM" is a 32-bit enabled single-port ROM IP-CORE generated 
// in the Xilinx. The instruction memory is synchronized with the rest of the  
// modules in the processor through "clk".
// "instrAdd" is the address of a memory location in the ROM from which the instruction has to be fetched.
// "instr" is the 32-bit instruction fetched from the instruction memory.

module InstructionMemory ( clk , instrAdd , instr ) ;
	input wire clk ;
	input wire [31:0] instrAdd ;
	output wire [31:0] instr ;
	SINGLE_PORT_ROM SROM (.clka(clk), .addra(instrAdd), .douta(instr)) ;
	// instantiate single-port ROM ip-core
endmodule
