
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- Branch Instruction Success Checking Module
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

// This module is enabled in the processor when the isntruction is a 
// comparison-based branch instruction (bz, bnz, bltz). 
// "ctrl" tells the type of comparison. It is actually a 2-bit control 
// signal of the Controller.
// "zero" is the zero-line coming out of the 32-bit ALU that is 0 if and
// only if the result computed by ALU is zero.
// "leadBitResult" is the most significant bit of the result computed
// by ALU. The most significant bit tells the sign of the 32-bit signed
// integer in 2's complement form and hence predicts whether the branch
// will be taken or not in case of bltz.
// "isSuccess" is 1 iff the branching can happen successfully.

// The connections will become clearewith other modules will become clear in
// the Datapath module.

module BranchComparisonSuccess ( zero , leadBitResult , ctrl , isSuccess ) ;
    input wire zero ;
    input wire [1:0] ctrl ;
    input wire leadBitResult ;
    output reg isSuccess ;

    always @ ( * ) begin    // purely combinational module
        case ({ctrl, zero, leadBitResult})
            // when branch instruction is bz (ctrl is 00)
            4'b00_1_0 : isSuccess = 1'b1 ;
            4'b00_1_1 : isSuccess = 1'b1 ;
            4'b00_0_0 : isSuccess = 1'b0 ;
            4'b00_0_1 : isSuccess = 1'b0 ;

            // when branch instruction is bltz (ctrl is 01)
            4'b01_1_0 : isSuccess = 1'b0 ;
            4'b01_0_0 : isSuccess = 1'b0 ;
            4'b01_1_1 : isSuccess = 1'b1 ;
            4'b01_0_1 : isSuccess = 1'b1 ;

            // when branch instruction is bnz (ctrl is 10)
            4'b10_1_0 : isSuccess = 1'b0 ;
            4'b10_1_1 : isSuccess = 1'b0 ;
            4'b10_0_0 : isSuccess = 1'b1 ;
            4'b10_0_1 : isSuccess = 1'b1 ;

            default : isSuccess = 1'b0 ;    // to avoid latches
        endcase
    end
endmodule