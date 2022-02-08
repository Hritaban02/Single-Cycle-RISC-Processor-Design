
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- 3-to-1 Multiplexor (Bus Width: 32)
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

// It is a 3-to-1 multiplexor where the bus width of each of
// the 3 inputs is 32. A 2-bit selector selects one of these
// and outputs the chosen 32-bit binary string.

module Mux3to1Width32 ( out , in0 , in1 , in2 , sel ) ;
    input wire [1:0] sel ;
    input wire [31:0] in0 ;
    input wire [31:0] in1 ;
    input wire [31:0] in2 ;
    output reg signed [31:0] out ;

    always @ ( * ) begin
        case ( sel )    // multiplexor logic (purely combinational)
            2'b00 : out = in0 ;
            2'b01 : out = in1 ;
            2'b10 : out = in2 ;
            default : out = in0 ;   // to avoid latches
        endcase
    end
endmodule