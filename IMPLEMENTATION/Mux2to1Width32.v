
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- 2-to-1 Multiplexor (Bus Width: 32)
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

// It is a 2-to-1 multiplexor where the bus width of each of
// the 2 inputs is 32. A 1-bit selector selects one of these
// and outputs the chosen 32-bit binary string.

module Mux2to1Width32 ( out , in0 , in1 , sel ) ;
    input wire sel ;
    input wire [31:0] in0 ;
    input wire [31:0] in1 ;
    output reg [31:0] out ;

    always @ ( * ) begin
        case ( sel )    // multiplexor logic (purely combinational)
            1'b0 : out = in0 ;
            1'b1 : out = in1 ;
            default : out = in0 ;   // to avoid latches
        endcase
    end
endmodule