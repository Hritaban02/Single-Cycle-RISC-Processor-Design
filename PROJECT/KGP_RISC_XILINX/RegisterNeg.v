
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- 32-Bit Register (-ve edge trigerred)
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

// This module implements a 32-bit register as an array of 32 negative-edge
// trigerred DFFs.
// "data" is the 32-bit data stored in the register
// "writeEnable" is the a control signal that permits the processor to overwrite contents of a register
// "writeData" is a 32-bit data that is written into the register, when enabled
// "rst" signal is used for synchronous reset of the data to all zeros
// "clk" synchronizes the write operations on the register with the other modules in the processor

module RegisterNeg ( writeEnable , writeData , data , clk , rst ) ;
    input wire writeEnable, clk, rst ;
    input wire [31:0] writeData ;
    output wire [31:0] data ;

    // Instantiate 32 negative-edge trigerred DFFs, each storing one bit of the register
    DFF_NEG F00 (writeEnable, writeData[0], data[0], clk, rst) ;
    DFF_NEG F01 (writeEnable, writeData[1], data[1], clk, rst) ;
    DFF_NEG F02 (writeEnable, writeData[2], data[2], clk, rst) ;
    DFF_NEG F03 (writeEnable, writeData[3], data[3], clk, rst) ;
    DFF_NEG F04 (writeEnable, writeData[4], data[4], clk, rst) ;
    DFF_NEG F05 (writeEnable, writeData[5], data[5], clk, rst) ;
    DFF_NEG F06 (writeEnable, writeData[6], data[6], clk, rst) ;
    DFF_NEG F07 (writeEnable, writeData[7], data[7], clk, rst) ;

    DFF_NEG F08 (writeEnable, writeData[8], data[8], clk, rst) ;
    DFF_NEG F09 (writeEnable, writeData[9], data[9], clk, rst) ;
    DFF_NEG F10 (writeEnable, writeData[10], data[10], clk, rst) ;
    DFF_NEG F11 (writeEnable, writeData[11], data[11], clk, rst) ;
    DFF_NEG F12 (writeEnable, writeData[12], data[12], clk, rst) ;
    DFF_NEG F13 (writeEnable, writeData[13], data[13], clk, rst) ;
    DFF_NEG F14 (writeEnable, writeData[14], data[14], clk, rst) ;
    DFF_NEG F15 (writeEnable, writeData[15], data[15], clk, rst) ;

    DFF_NEG F16 (writeEnable, writeData[16], data[16], clk, rst) ;
    DFF_NEG F17 (writeEnable, writeData[17], data[17], clk, rst) ;
    DFF_NEG F18 (writeEnable, writeData[18], data[18], clk, rst) ;
    DFF_NEG F19 (writeEnable, writeData[19], data[19], clk, rst) ;
    DFF_NEG F20 (writeEnable, writeData[20], data[20], clk, rst) ;
    DFF_NEG F21 (writeEnable, writeData[21], data[21], clk, rst) ;
    DFF_NEG F22 (writeEnable, writeData[22], data[22], clk, rst) ;
    DFF_NEG F23 (writeEnable, writeData[23], data[23], clk, rst) ;

    DFF_NEG F24 (writeEnable, writeData[24], data[24], clk, rst) ;
    DFF_NEG F25 (writeEnable, writeData[25], data[25], clk, rst) ;
    DFF_NEG F26 (writeEnable, writeData[26], data[26], clk, rst) ;
    DFF_NEG F27 (writeEnable, writeData[27], data[27], clk, rst) ;
    DFF_NEG F28 (writeEnable, writeData[28], data[28], clk, rst) ;
    DFF_NEG F29 (writeEnable, writeData[29], data[29], clk, rst) ;
    DFF_NEG F30 (writeEnable, writeData[30], data[30], clk, rst) ;
    DFF_NEG F31 (writeEnable, writeData[31], data[31], clk, rst) ;
endmodule