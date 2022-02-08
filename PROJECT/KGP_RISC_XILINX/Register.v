
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- 32-Bit Register (+ve edge trigerred)
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

// This module implements a 32-bit register as an array of 32 positive-edge
// trigerred DFFs.
// "data" is the 32-bit data stored in the register
// "writeEnable" is the a control signal that permits the processor to overwrite contents of a register
// "writeData" is a 32-bit data that is written into the register, when enabled
// "rst" signal is used for synchronous reset of the data to all zeros
// "clk" synchronizes the write operations on the register with the other modules in the processor

module Register ( writeEnable , writeData , data , clk , rst ) ;
    input wire writeEnable, clk, rst ;
    input wire [31:0] writeData ;
    output wire [31:0] data ;

    // Instantiate 32 positive-edge trigerred DFFs, each storing one bit of the register
    DFF F00 (writeEnable, writeData[0], data[0], clk, rst) ;
    DFF F01 (writeEnable, writeData[1], data[1], clk, rst) ;
    DFF F02 (writeEnable, writeData[2], data[2], clk, rst) ;
    DFF F03 (writeEnable, writeData[3], data[3], clk, rst) ;
    DFF F04 (writeEnable, writeData[4], data[4], clk, rst) ;
    DFF F05 (writeEnable, writeData[5], data[5], clk, rst) ;
    DFF F06 (writeEnable, writeData[6], data[6], clk, rst) ;
    DFF F07 (writeEnable, writeData[7], data[7], clk, rst) ;

    DFF F08 (writeEnable, writeData[8], data[8], clk, rst) ;
    DFF F09 (writeEnable, writeData[9], data[9], clk, rst) ;
    DFF F10 (writeEnable, writeData[10], data[10], clk, rst) ;
    DFF F11 (writeEnable, writeData[11], data[11], clk, rst) ;
    DFF F12 (writeEnable, writeData[12], data[12], clk, rst) ;
    DFF F13 (writeEnable, writeData[13], data[13], clk, rst) ;
    DFF F14 (writeEnable, writeData[14], data[14], clk, rst) ;
    DFF F15 (writeEnable, writeData[15], data[15], clk, rst) ;

    DFF F16 (writeEnable, writeData[16], data[16], clk, rst) ;
    DFF F17 (writeEnable, writeData[17], data[17], clk, rst) ;
    DFF F18 (writeEnable, writeData[18], data[18], clk, rst) ;
    DFF F19 (writeEnable, writeData[19], data[19], clk, rst) ;
    DFF F20 (writeEnable, writeData[20], data[20], clk, rst) ;
    DFF F21 (writeEnable, writeData[21], data[21], clk, rst) ;
    DFF F22 (writeEnable, writeData[22], data[22], clk, rst) ;
    DFF F23 (writeEnable, writeData[23], data[23], clk, rst) ;

    DFF F24 (writeEnable, writeData[24], data[24], clk, rst) ;
    DFF F25 (writeEnable, writeData[25], data[25], clk, rst) ;
    DFF F26 (writeEnable, writeData[26], data[26], clk, rst) ;
    DFF F27 (writeEnable, writeData[27], data[27], clk, rst) ;
    DFF F28 (writeEnable, writeData[28], data[28], clk, rst) ;
    DFF F29 (writeEnable, writeData[29], data[29], clk, rst) ;
    DFF F30 (writeEnable, writeData[30], data[30], clk, rst) ;
    DFF F31 (writeEnable, writeData[31], data[31], clk, rst) ;
endmodule