
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- 5-to-1 Multiplexor (Bus Width: 32)
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

// It is a 5-to-1 multiplexor where the bus width of each of
// the 5 inputs is 32. A 3-bit selector selects one of these
// and outputs the chosen 32-bit binary string.

module Mux5to1Width32 ( out , in0 , in1 , in2 , in3 , in4 , sel ) ;
    input wire [2:0] sel ;
    input wire [31:0] in0 ;
    input wire [31:0] in1 ;
    input wire [31:0] in2 ;
    input wire [31:0] in3 ;
    input wire [31:0] in4 ;
    output reg [31:0] out ;

    always @ ( * ) begin
        case ( sel )    // multiplexor logic (purely combinational)
            3'b000 : out = in0 ;
            3'b001 : out = in1 ;
            3'b010 : out = in2 ;
            3'b011 : out = in3 ;
            3'b100 : out = in4 ;
            default : out = in0 ;   // to avoid latches
        endcase
    end
endmodule