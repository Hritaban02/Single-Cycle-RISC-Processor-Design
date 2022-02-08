
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- Concatenation Module (4 High bits & 28 Low bits)
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

// This module takes as input a 4-bit "high" binary string
// and 28-bit "low" binary string and gives as output the
// concatenation of the two strings with "low" constituting the
// low bits (less significant) and "high" constituting the
// high bits (more significant).

module ConcatenateHigh4Low28 ( high , low , out ) ;
    input wire [3:0] high ;
    input wire [27:0] low ;
    output wire [31:0] out ;
    assign out = {high, low} ;  // simple concatenation using {}
endmodule