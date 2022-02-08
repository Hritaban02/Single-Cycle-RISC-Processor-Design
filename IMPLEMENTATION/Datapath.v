
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- KGP-RISC Datapath
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

// This is the DATAPATH module that integerates all the remaining modules into the
// KGP-RISC processor. This module is an exact translation of the datapath diagram
// drawn in the report into a verilog code.
// Though the names are kept extremely verbose for the purpose of self-documentation,
// please refer to that diagram in order to understand it more effectively.

module Datapath ( clk , rst ) ;
    input wire clk, rst ;

    wire [2:0] aluOp;
	wire memWrite;
	wire [2:0] aluSrc;
	wire regWrite;
	wire [1:0] branchCompType;
	wire [1:0] regDest;
	wire branchReg;
	wire branchCarryType;
	wire branchCarryDep;
	wire branchNoRegNoCond;
	wire branchComp;
	wire [1:0] mem2RegData;

    wire [31:0] nextInstrAdd ;
    wire [31:0] instrAdd ;
    wire [31:0] instr ;

    wire [4:0] destReg ;
	wire signed [31:0] rsReadData;
	wire signed [31:0] rtReadData;
    wire signed [31:0] writeData ;

    Controller CNT (
		.opcode(instr[31:26]),
		.aluOp(aluOp), 
		.memWrite(memWrite), 
		.aluSrc(aluSrc), 
		.regWrite(regWrite), 
		.branchCompType(branchCompType), 
		.regDest(regDest), 
		.branchReg(branchReg), 
		.branchCarryType(branchCarryType), 
		.branchCarryDep(branchCarryDep), 
		.branchNoRegNoCond(branchNoRegNoCond), 
		.branchComp(branchComp),
		.mem2RegData(mem2RegData)
	);
    ProgramCounter PC (.clk(clk), .rst(rst), .next(nextInstrAdd), .add(instrAdd)) ;
    InstructionMemory IM (.clk(clk), .instrAdd(instrAdd), .instr(instr)) ;
    RegisterFile RF (
		.rs(instr[25:21]), 
		.rt(instr[20:16]), 
		.rd(destReg), 
		.regWrite(regWrite), 
		.writeData(writeData), 
		.rsReadData(rsReadData), 
		.rtReadData(rtReadData), 
		.clk(clk), 
		.rst(rst)
	) ;

    Mux3to1Width5 DESTREG (.out(destReg), .in0(instr[25:21]), .in1(5'b11111), .in2(instr[20:16]), .sel(regDest)) ;

    wire signed [31:0] immedExt ;
    wire signed [31:0] offsetExt ;
    wire [31:0] shamtPadded ;
    SignExtension16to32 SIGNEXTD16 (.in(instr[15:0]), .out(immedExt)) ;
    SignExtension21to32 SIGNEXTD21 (.in(instr[20:0]), .out(offsetExt)) ;
    PadLeadingZeros6to32 ZEROPADDER (.in(instr[15:10]), .out(shamtPadded)) ;

    wire signed [31:0] aluSecOperand ;
    Mux5to1Width32 ALUSECOP (.out(aluSecOperand), .in0(rtReadData), .in1(immedExt), 
                             .in2(shamtPadded), .in3(32'b0), .in4(offsetExt), .sel(aluSrc)) ;

    wire [6:0] aluControlSig ;
    ALU_Control ALUCNT (.control_signal(aluControlSig), .ALUOp(aluOp), .function_code(instr[9:0])) ;

    wire [31:0] aluResult ;
    wire aluCarryOut ;
    wire aluZero ;
    ALU ALU32BIT (.clk(clk), .rst(rst), .a(rsReadData), .b(aluSecOperand), .control_signal(aluControlSig),
                  .result(aluResult), .carry_out(aluCarryOut), .zero(aluZero)) ;
    
    wire signed [31:0] memReadData ;
    DataMemory DM (.clk(~clk), .memWrite(memWrite), .address(aluResult), .writeData(rtReadData), .readData(memReadData)) ;

    wire [31:0] pcPlus4 ;
    Mux3to1Width32 REGWRITEDATA (.out(writeData), .in0(aluResult), .in1(memReadData), .in2(pcPlus4), .sel(mem2RegData)) ;

    CLA32BitNoCarry ADDER1 (.a(instrAdd), .b(32'b100), .s(pcPlus4)) ;

    wire [27:0] addrShifted ;
    wire [31:0] pseudoDirAdd ;
    LeftShiftTwoPlacesWidth26 LSH1 (.in(instr[25:0]), .out(addrShifted)) ;
    ConcatenateHigh4Low28 CONCAT (.high(pcPlus4[31:28]), .low(addrShifted), .out(pseudoDirAdd)) ;

    wire [22:0] offsetShifted ;
    wire [31:0] pcRelAdd ;
	 wire signed [31:0] offsetShiftedExtd ; 
    LeftShiftTwoPlacesWidth21 LSH2 (.in(instr[20:0]), .out(offsetShifted)) ;
	 SignExtension23to32 SIGNEXTD23 (.in(offsetShifted), .out(offsetShiftedExtd)) ;
    CLA32BitNoCarry ADDER2 (.a(offsetShiftedExtd), .b(pcPlus4), .s(pcRelAdd)) ;

    wire branchSuccess, branchPermit ;
    BranchComparisonSuccess BCS (.zero(aluZero), .leadBitResult(aluResult[31]), .ctrl(branchCompType), .isSuccess(branchSuccess)) ;
    and BP1 (branchPermit, branchSuccess, branchComp) ;

    wire [31:0] nextInstrAdd1 ;
    wire [31:0] nextInstrAdd2 ;
    wire [31:0] nextInstrAdd3 ;
    Mux2to1Width32 CHK1 (.out(nextInstrAdd1), .in0(pcPlus4), .in1(pcRelAdd), .sel(branchPermit)) ;
    Mux2to1Width32 CHK2 (.out(nextInstrAdd2), .in0(nextInstrAdd1), .in1(pseudoDirAdd), .sel(branchNoRegNoCond)) ;

    wire carryBrPermit ;
    xnor CARRYBRSUC (carryBrPossible, aluCarryOut, branchCarryType) ;
    and BP2 (carryBrPermit, carryBrPossible, branchCarryDep) ;

    Mux2to1Width32 CHK3 (.out(nextInstrAdd3), .in0(nextInstrAdd2), .in1(pseudoDirAdd), .sel(carryBrPermit)) ;
    Mux2to1Width32 CHK4 (.out(nextInstrAdd), .in0(nextInstrAdd3), .in1(rsReadData), .sel(branchReg)) ;

endmodule