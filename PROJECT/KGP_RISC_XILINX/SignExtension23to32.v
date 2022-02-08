
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- 23-to-32 Sign Extension Module
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

// This module takes as input a 23-bit binary string and gives
// as output the "sign extended" 32-bit binary string.

module SignExtension23to32 ( in , out ) ;
    input wire [22:0] in ;
    output reg signed [31:0] out ;
    always @ ( * ) begin
        case ( in[22] )
            1'b0 : out = {9'b0, in} ;   // pad 9 0's if the leading bit is 0 (no. is pos)
            1'b1 : out = {9'b111111111, in} ;   // pad 9 1's if the leading bit is 1 (no. is neg)
            default : out = {9'b0, in} ;   // to avoid latches
        endcase
    end
endmodule