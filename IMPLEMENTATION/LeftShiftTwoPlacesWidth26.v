
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- 26-to-28 Left Shifter
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

// This module takes as input a 26 bit binary string and left
// shifts it by 2 contents and then returns the resultant 28
// bit binary string.

module LeftShiftTwoPlacesWidth26 ( in , out ) ;
    input wire [25:0] in ;
    output wire [27:0] out ;
    assign out = {in, 2'b0} ;   // simply append 2 zero bits at the least significant side.
endmodule