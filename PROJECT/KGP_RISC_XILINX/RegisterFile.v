
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- 32x32 Register File
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

// This module implements a 32x32 register file as an array of 32 32-bit registers.
// Some special registers are --
//  $0 / $zero - stores "constant" zero value
//  $31 / $ra - stores return address for a branch-and-link instruction

module RegisterFile ( rs, rt , rd , regWrite , writeData , rsReadData , rtReadData , clk , rst ) ;
    input wire [4:0] rs, rt, rd ;   // rs, rt - source registers ; rd - destination register
    input wire regWrite, clk, rst ; // regWrite is a control signal to enable writing rd in the register file
    input wire signed [31:0] writeData ;    // 32-bit data that is written to rd, when enabled
    output reg signed [31:0] rsReadData, rtReadData ;   // data fetched from rs, rt registers
    wire signed [1023:32] data ;    // data lines coming out of each of the instantiated register
    reg [31:1] writeEnable ;    // write-enablers for the individual registers

    // Register R00 (writeEnable[0], writeData, data[31:0], clk, rst) ;
    // There is absolutely no need to explicitly store a CONSTANT value in register because
    // it should never be over-written. In fact if we store a constant value in a register,
    // Xilinx returns the following warning 
    // Xst:1895 - Due to other FF/Latch trimming, FF/Latch <R00/F02/data> (without init value) has 
    // a constant value of 0 in block <RegisterFile>. This FF/Latch will be trimmed during the optimization process.

    // Instantiate 31 Register modules to store the contents of the remaining 31 registers.
    Register R01 (writeEnable[1], writeData, data[63:32], clk, rst) ;
    Register R02 (writeEnable[2], writeData, data[95:64], clk, rst) ;
    Register R03 (writeEnable[3], writeData, data[127:96], clk, rst) ;
    Register R04 (writeEnable[4], writeData, data[159:128], clk, rst) ;
    Register R05 (writeEnable[5], writeData, data[191:160], clk, rst) ;
    Register R06 (writeEnable[6], writeData, data[223:192], clk, rst) ;
    Register R07 (writeEnable[7], writeData, data[255:224], clk, rst) ;
    Register R08 (writeEnable[8], writeData, data[287:256], clk, rst) ;
    Register R09 (writeEnable[9], writeData, data[319:288], clk, rst) ;
    Register R10 (writeEnable[10], writeData, data[351:320], clk, rst) ;
    Register R11 (writeEnable[11], writeData, data[383:352], clk, rst) ;
    Register R12 (writeEnable[12], writeData, data[415:384], clk, rst) ;
    Register R13 (writeEnable[13], writeData, data[447:416], clk, rst) ;
    Register R14 (writeEnable[14], writeData, data[479:448], clk, rst) ;
    Register R15 (writeEnable[15], writeData, data[511:480], clk, rst) ;
    Register R16 (writeEnable[16], writeData, data[543:512], clk, rst) ;
    Register R17 (writeEnable[17], writeData, data[575:544], clk, rst) ;
    Register R18 (writeEnable[18], writeData, data[607:576], clk, rst) ;
    Register R19 (writeEnable[19], writeData, data[639:608], clk, rst) ;
    Register R20 (writeEnable[20], writeData, data[671:640], clk, rst) ;
    Register R21 (writeEnable[21], writeData, data[703:672], clk, rst) ;
    Register R22 (writeEnable[22], writeData, data[735:704], clk, rst) ;
    Register R23 (writeEnable[23], writeData, data[767:736], clk, rst) ;
    Register R24 (writeEnable[24], writeData, data[799:768], clk, rst) ;
    Register R25 (writeEnable[25], writeData, data[831:800], clk, rst) ;
    Register R26 (writeEnable[26], writeData, data[863:832], clk, rst) ;
    Register R27 (writeEnable[27], writeData, data[895:864], clk, rst) ;
    Register R28 (writeEnable[28], writeData, data[927:896], clk, rst) ;
    Register R29 (writeEnable[29], writeData, data[959:928], clk, rst) ;
    Register R30 (writeEnable[30], writeData, data[991:960], clk, rst) ;
    RegisterNeg R31 (writeEnable[31], writeData, data[1023:992], clk, rst) ;

    always @ ( * ) begin
        if ( ~ regWrite )
            writeEnable <= 32'b0 ;
        
        else begin  // if writing to register file is enabled (regWrite = 1)
            writeEnable <= 32'b0 ;
            case ( rd ) // 32-to-1 MUX with bus width 32 and selector width 5 (purely combinational)
                // enable "writeEnable" for only the rd register and for the remaining it should remain at zero
                5'b00001: writeEnable[1] <= 1'b1 ;
                5'b00010: writeEnable[2] <= 1'b1 ;
                5'b00011: writeEnable[3] <= 1'b1 ;
                5'b00100: writeEnable[4] <= 1'b1 ;
                5'b00101: writeEnable[5] <= 1'b1 ;
                5'b00110: writeEnable[6] <= 1'b1 ;
                5'b00111: writeEnable[7] <= 1'b1 ;
                5'b01000: writeEnable[8] <= 1'b1 ;
                5'b01001: writeEnable[9] <= 1'b1 ;
                5'b01010: writeEnable[10] <= 1'b1 ;
                5'b01011: writeEnable[11] <= 1'b1 ;
                5'b01100: writeEnable[12] <= 1'b1 ;
                5'b01101: writeEnable[13] <= 1'b1 ;
                5'b01110: writeEnable[14] <= 1'b1 ;
                5'b01111: writeEnable[15] <= 1'b1 ;
                5'b10000: writeEnable[16] <= 1'b1 ;
                5'b10001: writeEnable[17] <= 1'b1 ;
                5'b10010: writeEnable[18] <= 1'b1 ;
                5'b10011: writeEnable[19] <= 1'b1 ;
                5'b10100: writeEnable[20] <= 1'b1 ;
                5'b10101: writeEnable[21] <= 1'b1 ;
                5'b10110: writeEnable[22] <= 1'b1 ;
                5'b10111: writeEnable[23] <= 1'b1 ;
                5'b11000: writeEnable[24] <= 1'b1 ;
                5'b11001: writeEnable[25] <= 1'b1 ;
                5'b11010: writeEnable[26] <= 1'b1 ;
                5'b11011: writeEnable[27] <= 1'b1 ;
                5'b11100: writeEnable[28] <= 1'b1 ;
                5'b11101: writeEnable[29] <= 1'b1 ;
                5'b11110: writeEnable[30] <= 1'b1 ;
                default: writeEnable[31] <= 1'b1 ;  // put in default clause to avoid latches
            endcase
        end

        case ( rs ) // 32-to-1 MUX with bus width 32 and selector width 5 (purely combinational)
            // select data wires coming out from the appropriate register to get the value stored in rs
            5'b00000: rsReadData <= 32'd0 ;     // constant zero value
            5'b00001: rsReadData <= data[63:32] ;
            5'b00010: rsReadData <= data[95:64] ;
            5'b00011: rsReadData <= data[127:96] ;
            5'b00100: rsReadData <= data[159:128] ;
            5'b00101: rsReadData <= data[191:160] ;
            5'b00110: rsReadData <= data[223:192] ;
            5'b00111: rsReadData <= data[255:224] ;
            5'b01000: rsReadData <= data[287:256] ;
            5'b01001: rsReadData <= data[319:288] ;
            5'b01010: rsReadData <= data[351:320] ;
            5'b01011: rsReadData <= data[383:352] ;
            5'b01100: rsReadData <= data[415:384] ;
            5'b01101: rsReadData <= data[447:416] ;
            5'b01110: rsReadData <= data[479:448] ;
            5'b01111: rsReadData <= data[511:480] ;
            5'b10000: rsReadData <= data[543:512] ;
            5'b10001: rsReadData <= data[575:544] ;
            5'b10010: rsReadData <= data[607:576] ;
            5'b10011: rsReadData <= data[639:608] ;
            5'b10100: rsReadData <= data[671:640] ;
            5'b10101: rsReadData <= data[703:672] ;
            5'b10110: rsReadData <= data[735:704] ;
            5'b10111: rsReadData <= data[767:736] ;
            5'b11000: rsReadData <= data[799:768] ;
            5'b11001: rsReadData <= data[831:800] ;
            5'b11010: rsReadData <= data[863:832] ;
            5'b11011: rsReadData <= data[895:864] ;
            5'b11100: rsReadData <= data[927:896] ;
            5'b11101: rsReadData <= data[959:928] ;
            5'b11110: rsReadData <= data[991:960] ;
            default: rsReadData <= data[1023:992] ;  // put in default clause to avoid latches
        endcase

        case ( rt ) // 32-to-1 MUX with bus width 32 and selector width 5 (purely combinational)
            // select data wires coming out from the appropriate register to get the value stored in rt
            5'b00000: rtReadData <= 32'd0 ;     // constant zero value
            5'b00001: rtReadData <= data[63:32] ;
            5'b00010: rtReadData <= data[95:64] ;
            5'b00011: rtReadData <= data[127:96] ;
            5'b00100: rtReadData <= data[159:128] ;
            5'b00101: rtReadData <= data[191:160] ;
            5'b00110: rtReadData <= data[223:192] ;
            5'b00111: rtReadData <= data[255:224] ;
            5'b01000: rtReadData <= data[287:256] ;
            5'b01001: rtReadData <= data[319:288] ;
            5'b01010: rtReadData <= data[351:320] ;
            5'b01011: rtReadData <= data[383:352] ;
            5'b01100: rtReadData <= data[415:384] ;
            5'b01101: rtReadData <= data[447:416] ;
            5'b01110: rtReadData <= data[479:448] ;
            5'b01111: rtReadData <= data[511:480] ;
            5'b10000: rtReadData <= data[543:512] ;
            5'b10001: rtReadData <= data[575:544] ;
            5'b10010: rtReadData <= data[607:576] ;
            5'b10011: rtReadData <= data[639:608] ;
            5'b10100: rtReadData <= data[671:640] ;
            5'b10101: rtReadData <= data[703:672] ;
            5'b10110: rtReadData <= data[735:704] ;
            5'b10111: rtReadData <= data[767:736] ;
            5'b11000: rtReadData <= data[799:768] ;
            5'b11001: rtReadData <= data[831:800] ;
            5'b11010: rtReadData <= data[863:832] ;
            5'b11011: rtReadData <= data[895:864] ;
            5'b11100: rtReadData <= data[927:896] ;
            5'b11101: rtReadData <= data[959:928] ;
            5'b11110: rtReadData <= data[991:960] ;
            default: rtReadData <= data[1023:992] ;  // put in default clause to avoid latches
        endcase
    end

endmodule
