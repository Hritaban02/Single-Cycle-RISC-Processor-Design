
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- D Flip Flop (-ve edge trigerred) (for registers only)
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

// The circuitry implemented in this module is exactly the same as in
// "D_Flip_Flop.v", except that here there is a write-enabler which is
// if 0, the data in the DFF cannot be over-written.
// This DFF is written particularly for the registers.
// The variable names as verbose and hence self-explanatory.

// The D Flip Flop is active only at the negative edge of the Clock (clk)
// and can be reset to 0 synchronously by putting the rst bit to 1.
// Note that "writeEnable" is a control signal output by the Controller.

module DFF_NEG ( writeEnable , writeData , data , clk , rst ) ;
    input wire writeEnable, writeData, clk , rst ;
    output reg data ;

    always @ ( negedge clk ) begin  // negative-edge trigerred
        if ( rst )  data <= 1'b0 ;  // synchronous reset
        else if ( writeEnable )	data <= writeData ; // write data only when the enabler is active
    end
endmodule