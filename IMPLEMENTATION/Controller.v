
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- Controller
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

// In this module the combinational circuit for the Controller (as shown in the Datapath
// diagram in the documentation) is implemented using primitive logic gates.
// This is just a translation of the truth table given in the report into a
// circuit of logic gates.
// The values of all the control signals are determined by the 6-bit opcode.

module Controller ( opcode , aluOp , memWrite , aluSrc , regWrite , branchCompType , 
                    regDest , branchReg , branchCarryType , branchCarryDep , 
                    branchNoRegNoCond , branchComp , mem2RegData ) ;
    
    output wire memWrite, regWrite, branchReg, branchCarryType, 
                branchCarryDep, branchNoRegNoCond, branchComp ;
    output wire [2:0] aluOp, aluSrc ;
    output wire [1:0] branchCompType, regDest, mem2RegData ;
    input wire [5:0] opcode ;

    wire [5:0] neg_opcode ;   // negation for every opcode bit
    not NOT0 (neg_opcode[0], opcode[0]) ;
    not NOT1 (neg_opcode[1], opcode[1]) ;
    not NOT2 (neg_opcode[2], opcode[2]) ;
    not NOT3 (neg_opcode[3], opcode[3]) ;
    not NOT4 (neg_opcode[4], opcode[4]) ;
    not NOT5 (neg_opcode[5], opcode[5]) ;

    // +++ MEM-WRITE (whether or not writing to data memory is allowed) +++
    and AND0 (memWrite, neg_opcode[5], neg_opcode[4], neg_opcode[3], opcode[2], opcode[1], neg_opcode[0]) ;

    wire wire0, wire1, wire2, wire3, wire4, wire5, wire6, wire7, wire8, wire9,
         wire13, wire15, wire16, wire19, wire20, wire21,
         wire23, wire24, wire25, wire26, wire27 ;
	
    // +++ REG-WRITE (whether or not writing to destination register in the register-file is allowed) +++
    and AND1 (wire0, opcode[2], neg_opcode[1]) ;
    or OR0 (wire1, wire0, neg_opcode[2]) ;
    and AND2 (wire2, neg_opcode[3], wire1) ;
    and AND3 (wire3, opcode[3], neg_opcode[2], neg_opcode[1], neg_opcode[0]) ;
    or OR1 (wire4, wire2, wire3) ;
    and AND4 (regWrite, neg_opcode[5], neg_opcode[4], wire4) ;
    
    // +++ BRANCH-REG (whether or not the instruction is a "br" instruction) +++
    and AND5 (branchReg, neg_opcode[5], neg_opcode[4], opcode[3], neg_opcode[2], opcode[1], opcode[0]) ;

    // +++ BRANCH-CARRY-WRITE (the type of the carry-dependent branch instruction (bcy or bncy)) +++
    and AND6 (branchCarryType, neg_opcode[5], neg_opcode[4], opcode[3], neg_opcode[2], neg_opcode[1], opcode[0]) ;

    // +++ BRANCH-CARRY-DEP (whether or not the instruction is a branch dependent on the value of carry) +++
    xor XOR0 (wire5, opcode[1], opcode[0]) ;
    and AND7 (branchCarryDep, neg_opcode[5], neg_opcode[4], opcode[3], neg_opcode[2], wire5) ;

    // +++ BRANCH-NO-REG-NO-COND (true for only the branch instructions that are not "br" and also unconditional -- b, bl) +++
    and AND8 (wire6, neg_opcode[3], opcode[2], opcode[1], opcode[0]) ;
    and AND9 (wire7, opcode[3], neg_opcode[2], neg_opcode[1], neg_opcode[0]) ;
    or OR2 (wire8, wire6, wire7) ;
    and AND10 (branchNoRegNoCond, neg_opcode[5], neg_opcode[4], wire8) ;

    // +++ BRANCH-COMP (whether or not the instruction is a comparison-based branch instruction) +++
    nand NAND0 (wire9, opcode[1], opcode[0]) ;
    and AND11 (branchComp, neg_opcode[5], neg_opcode[4], opcode[3], opcode[2], wire9) ;
    nand NAND1 (wire13, opcode[1], opcode[2]) ;
    
    // +++ ALU-OP (type of ALU operation that the ALU should perform) +++
    and AND26 (wire23, neg_opcode[2], opcode[1], opcode[0]) ;
    and AND27 (wire24, opcode[2], wire9) ;
    or OR8 (wire25, wire23, wire24) ;
    and AND28 (wire26, neg_opcode[5], neg_opcode[4], neg_opcode[3], wire25) ;
    or OR9 (aluOp[2], wire26, branchComp) ;
    and AND29 (wire27, neg_opcode[5], neg_opcode[4], neg_opcode[3], wire5) ;
    or OR10 (aluOp[1], wire27, branchComp) ;
    and AND20 (aluOp[0], neg_opcode[5], neg_opcode[4], neg_opcode[3], neg_opcode[0], wire13) ;

    // +++ ALU-SRC (selector for the MUX that selects the second operand of the ALU) +++
    xnor XNOR0 (wire15, opcode[1], opcode[0]) ;
    xor XOR1 (wire16, opcode[2], opcode[1]) ;
    and AND18 (aluSrc[2], neg_opcode[5], neg_opcode[4], neg_opcode[3], wire15, wire16) ;
    and AND19 (wire19, neg_opcode[5], neg_opcode[4], neg_opcode[3], neg_opcode[2], neg_opcode[1], opcode[0]) ;
    or OR5 (aluSrc[1], wire19, branchComp) ;
    and AND30 (wire20, neg_opcode[5], neg_opcode[4], neg_opcode[3], opcode[2], wire5) ;
    or OR6 (aluSrc[0], wire20, branchComp) ;

    // +++ BRANCH-COMP-TYPE (type of comparison in a comparison-based branch instruction -- bz, bnz, bltz) +++
    and AND21 (wire21, neg_opcode[5], neg_opcode[4], opcode[3], opcode[2], neg_opcode[0]) ;
    and AND22 (branchCompType[1], wire21, opcode[1]) ;
    and AND23 (branchCompType[0], wire21, neg_opcode[1]) ;

    // +++ REG-DEST (destination register in the register file to which a value must be written) +++
    and AND24 (regDest[1], neg_opcode[5], neg_opcode[4], neg_opcode[3], opcode[2], neg_opcode[1], opcode[0]) ;
    and AND25 (regDest[0], neg_opcode[5], neg_opcode[4], opcode[3], neg_opcode[2], neg_opcode[1], neg_opcode[0]) ;

    // +++ MEM-TO-REG-DATA (select the data returned after the memory-access phase to the register file -- write-back) +++
    assign mem2RegData[1] = regDest[0] ;
    assign mem2RegData[0] = regDest[1] ;
    
endmodule