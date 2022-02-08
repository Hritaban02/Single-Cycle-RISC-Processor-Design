
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- 6-to-32 Leading Zeros Padder
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

// This module takes as input a 6-bit binary string and pads it to
// 32-bits by appending zeros at the most significant side and then
// returns the resultant 32-bit binary string.

module PadLeadingZeros6to32 ( in , out ) ;
    input wire [5:0] in ;
    output wire [31:0] out ;
    assign out = {26'b0, in} ;  // simply append 26 zeros at the most significant side
endmodule