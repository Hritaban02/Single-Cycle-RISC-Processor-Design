
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- Data Memory
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

// Module for the Data Memory
// Here "SINGLE_PORT_RAM" is a 32-bit enabled single-port RAM IP-CORE generated 
// in the Xilinx. The data memory is synchronized with the rest of the modules 
// in the processor through "clk".
// "memWrite" is an enabler to write to the memory.
// "address" is the address of a memory location in the RAM.
// "writeData" is the 32-bit data that is to be written at a location when enabled.
// "readData" is a 32-bit output that is the data read/fetched from the data memory.

module DataMemory ( clk , memWrite , address , writeData , readData );
	input wire clk, memWrite ;
	input wire [31:0] address ;
	input wire signed [31:0] writeData ;
	output wire signed [31:0] readData ;
	SINGLE_PORT_RAM SRAM (.clka(clk), .wea({memWrite, memWrite, memWrite, memWrite}), 
								 .addra(address), .dina(writeData), .douta(readData)) ;
								 // instantiate single-port RAM ip-core
endmodule
