
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- 21-to-23 Left Shifter
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

// This module takes as input a 21 bit binary string and left
// shifts it by 2 contents and then returns the resultant 23
// bit binary string.

module LeftShiftTwoPlacesWidth21 ( in , out ) ;
    input wire [20:0] in ;
    output wire [22:0] out ;
    assign out = {in, 2'b0} ;   // simply append 2 zero bits at the least significant side.
endmodule
