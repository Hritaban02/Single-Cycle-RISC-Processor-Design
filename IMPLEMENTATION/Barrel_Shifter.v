
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- Bidirectional Barrel Shifter
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

// [[ Bidirectional Barrel Shifter ]] -- Module for Bidirectional Barrel Shifter 
// (takes in one 32-bit binary input "in", one 3-bit binary input "shamt", and one 
// 1-bit binary input "dir" as inputs; and outputs one 32-bit binary output "out")

// The 32-bit Bidirectional Barrel Shifter circuit, which can perform shift by a specified
// amount shamt, either in right or in left direction depending on a control signal dir.

module Barrel_Shifter(in, shamt, fill_bit, dir, out);
	input wire signed [31:0] in;			// 32-bit Input before shifting
	input wire [5:0] shamt;		// 6-bit binary number which is the amount of shift - 0 to 63
	input wire dir;				// dir indicates the direction of shifting
	input wire fill_bit;			// Can be 0 or 1 depending on logical or arithmetic shift
	output wire signed [31:0] out;		// 32-bit Output after shifting by shift amount in the direction indicated by dir
	
	wire [31:0] w0, w1, w2, w3, w4, w5, w6; // Interconnecting wires - A total of 224 wires
	
	//dir = 1 for left shifts and dir = 0 for right shifts
	//Level of Multiplexers which reverses the 32-bit input depending on the direction of shift "dir"
	Mux2to1 dir_Level_0_Mux_0(.Output(w0[31]), .Sel(dir), .Input_0(in[31]), .Input_1(in[0]));
	Mux2to1 dir_Level_0_Mux_1(.Output(w0[30]), .Sel(dir), .Input_0(in[30]), .Input_1(in[1]));
	Mux2to1 dir_Level_0_Mux_2(.Output(w0[29]), .Sel(dir), .Input_0(in[29]), .Input_1(in[2]));
	Mux2to1 dir_Level_0_Mux_3(.Output(w0[28]), .Sel(dir), .Input_0(in[28]), .Input_1(in[3]));
	Mux2to1 dir_Level_0_Mux_4(.Output(w0[27]), .Sel(dir), .Input_0(in[27]), .Input_1(in[4]));
	Mux2to1 dir_Level_0_Mux_5(.Output(w0[26]), .Sel(dir), .Input_0(in[26]), .Input_1(in[5]));
	Mux2to1 dir_Level_0_Mux_6(.Output(w0[25]), .Sel(dir), .Input_0(in[25]), .Input_1(in[6]));
	Mux2to1 dir_Level_0_Mux_7(.Output(w0[24]), .Sel(dir), .Input_0(in[24]), .Input_1(in[7]));
	Mux2to1 dir_Level_0_Mux_8(.Output(w0[23]), .Sel(dir), .Input_0(in[23]), .Input_1(in[8]));
	Mux2to1 dir_Level_0_Mux_9(.Output(w0[22]), .Sel(dir), .Input_0(in[22]), .Input_1(in[9]));
	Mux2to1 dir_Level_0_Mux_10(.Output(w0[21]), .Sel(dir), .Input_0(in[21]), .Input_1(in[10]));
	Mux2to1 dir_Level_0_Mux_11(.Output(w0[20]), .Sel(dir), .Input_0(in[20]), .Input_1(in[11]));
	Mux2to1 dir_Level_0_Mux_12(.Output(w0[19]), .Sel(dir), .Input_0(in[19]), .Input_1(in[12]));
	Mux2to1 dir_Level_0_Mux_13(.Output(w0[18]), .Sel(dir), .Input_0(in[18]), .Input_1(in[13]));
	Mux2to1 dir_Level_0_Mux_14(.Output(w0[17]), .Sel(dir), .Input_0(in[17]), .Input_1(in[14]));
	Mux2to1 dir_Level_0_Mux_15(.Output(w0[16]), .Sel(dir), .Input_0(in[16]), .Input_1(in[15]));
	Mux2to1 dir_Level_0_Mux_16(.Output(w0[15]), .Sel(dir), .Input_0(in[15]), .Input_1(in[16]));
	Mux2to1 dir_Level_0_Mux_17(.Output(w0[14]), .Sel(dir), .Input_0(in[14]), .Input_1(in[17]));
	Mux2to1 dir_Level_0_Mux_18(.Output(w0[13]), .Sel(dir), .Input_0(in[13]), .Input_1(in[18]));
	Mux2to1 dir_Level_0_Mux_19(.Output(w0[12]), .Sel(dir), .Input_0(in[12]), .Input_1(in[19]));
	Mux2to1 dir_Level_0_Mux_20(.Output(w0[11]), .Sel(dir), .Input_0(in[11]), .Input_1(in[20]));
	Mux2to1 dir_Level_0_Mux_21(.Output(w0[10]), .Sel(dir), .Input_0(in[10]), .Input_1(in[21]));
	Mux2to1 dir_Level_0_Mux_22(.Output(w0[9]), .Sel(dir), .Input_0(in[9]), .Input_1(in[22]));
	Mux2to1 dir_Level_0_Mux_23(.Output(w0[8]), .Sel(dir), .Input_0(in[8]), .Input_1(in[23]));
	Mux2to1 dir_Level_0_Mux_24(.Output(w0[7]), .Sel(dir), .Input_0(in[7]), .Input_1(in[24]));
	Mux2to1 dir_Level_0_Mux_25(.Output(w0[6]), .Sel(dir), .Input_0(in[6]), .Input_1(in[25]));
	Mux2to1 dir_Level_0_Mux_26(.Output(w0[5]), .Sel(dir), .Input_0(in[5]), .Input_1(in[26]));
	Mux2to1 dir_Level_0_Mux_27(.Output(w0[4]), .Sel(dir), .Input_0(in[4]), .Input_1(in[27]));
	Mux2to1 dir_Level_0_Mux_28(.Output(w0[3]), .Sel(dir), .Input_0(in[3]), .Input_1(in[28]));
	Mux2to1 dir_Level_0_Mux_29(.Output(w0[2]), .Sel(dir), .Input_0(in[2]), .Input_1(in[29]));
	Mux2to1 dir_Level_0_Mux_30(.Output(w0[1]), .Sel(dir), .Input_0(in[1]), .Input_1(in[30]));
	Mux2to1 dir_Level_0_Mux_31(.Output(w0[0]), .Sel(dir), .Input_0(in[0]), .Input_1(in[31]));
	
	//Level 1 of Muxes to handle 32 bit  right shifts
	//Level of Multiplexers which performs  shift by 32 bits to the right depending on 5th bit of shift amount "shamt[5]"
	Mux2to1 shift_Level_1_Mux_0(.Output(w1[31]), .Sel(shamt[5]), .Input_0(w0[31]), .Input_1(fill_bit));
	Mux2to1 shift_Level_1_Mux_1(.Output(w1[30]), .Sel(shamt[5]), .Input_0(w0[30]), .Input_1(fill_bit));
	Mux2to1 shift_Level_1_Mux_2(.Output(w1[29]), .Sel(shamt[5]), .Input_0(w0[29]), .Input_1(fill_bit));
	Mux2to1 shift_Level_1_Mux_3(.Output(w1[28]), .Sel(shamt[5]), .Input_0(w0[28]), .Input_1(fill_bit));
	Mux2to1 shift_Level_1_Mux_4(.Output(w1[27]), .Sel(shamt[5]), .Input_0(w0[27]), .Input_1(fill_bit));
	Mux2to1 shift_Level_1_Mux_5(.Output(w1[26]), .Sel(shamt[5]), .Input_0(w0[26]), .Input_1(fill_bit));
	Mux2to1 shift_Level_1_Mux_6(.Output(w1[25]), .Sel(shamt[5]), .Input_0(w0[25]), .Input_1(fill_bit));
	Mux2to1 shift_Level_1_Mux_7(.Output(w1[24]), .Sel(shamt[5]), .Input_0(w0[24]), .Input_1(fill_bit));
	Mux2to1 shift_Level_1_Mux_8(.Output(w1[23]), .Sel(shamt[5]), .Input_0(w0[23]), .Input_1(fill_bit));
	Mux2to1 shift_Level_1_Mux_9(.Output(w1[22]), .Sel(shamt[5]), .Input_0(w0[22]), .Input_1(fill_bit));
	Mux2to1 shift_Level_1_Mux_10(.Output(w1[21]), .Sel(shamt[5]), .Input_0(w0[21]), .Input_1(fill_bit));
	Mux2to1 shift_Level_1_Mux_11(.Output(w1[20]), .Sel(shamt[5]), .Input_0(w0[20]), .Input_1(fill_bit));
	Mux2to1 shift_Level_1_Mux_12(.Output(w1[19]), .Sel(shamt[5]), .Input_0(w0[19]), .Input_1(fill_bit));
	Mux2to1 shift_Level_1_Mux_13(.Output(w1[18]), .Sel(shamt[5]), .Input_0(w0[18]), .Input_1(fill_bit));
	Mux2to1 shift_Level_1_Mux_14(.Output(w1[17]), .Sel(shamt[5]), .Input_0(w0[17]), .Input_1(fill_bit));
	Mux2to1 shift_Level_1_Mux_15(.Output(w1[16]), .Sel(shamt[5]), .Input_0(w0[16]), .Input_1(fill_bit));
	Mux2to1 shift_Level_1_Mux_16(.Output(w1[15]), .Sel(shamt[5]), .Input_0(w0[15]), .Input_1(fill_bit));
	Mux2to1 shift_Level_1_Mux_17(.Output(w1[14]), .Sel(shamt[5]), .Input_0(w0[14]), .Input_1(fill_bit));
	Mux2to1 shift_Level_1_Mux_18(.Output(w1[13]), .Sel(shamt[5]), .Input_0(w0[13]), .Input_1(fill_bit));
	Mux2to1 shift_Level_1_Mux_19(.Output(w1[12]), .Sel(shamt[5]), .Input_0(w0[12]), .Input_1(fill_bit));
	Mux2to1 shift_Level_1_Mux_20(.Output(w1[11]), .Sel(shamt[5]), .Input_0(w0[11]), .Input_1(fill_bit));
	Mux2to1 shift_Level_1_Mux_21(.Output(w1[10]), .Sel(shamt[5]), .Input_0(w0[10]), .Input_1(fill_bit));
	Mux2to1 shift_Level_1_Mux_22(.Output(w1[9]), .Sel(shamt[5]), .Input_0(w0[9]), .Input_1(fill_bit));
	Mux2to1 shift_Level_1_Mux_23(.Output(w1[8]), .Sel(shamt[5]), .Input_0(w0[8]), .Input_1(fill_bit));
	Mux2to1 shift_Level_1_Mux_24(.Output(w1[7]), .Sel(shamt[5]), .Input_0(w0[7]), .Input_1(fill_bit));
	Mux2to1 shift_Level_1_Mux_25(.Output(w1[6]), .Sel(shamt[5]), .Input_0(w0[6]), .Input_1(fill_bit));
	Mux2to1 shift_Level_1_Mux_26(.Output(w1[5]), .Sel(shamt[5]), .Input_0(w0[5]), .Input_1(fill_bit));
	Mux2to1 shift_Level_1_Mux_27(.Output(w1[4]), .Sel(shamt[5]), .Input_0(w0[4]), .Input_1(fill_bit));
	Mux2to1 shift_Level_1_Mux_28(.Output(w1[3]), .Sel(shamt[5]), .Input_0(w0[3]), .Input_1(fill_bit));
	Mux2to1 shift_Level_1_Mux_29(.Output(w1[2]), .Sel(shamt[5]), .Input_0(w0[2]), .Input_1(fill_bit));
	Mux2to1 shift_Level_1_Mux_30(.Output(w1[1]), .Sel(shamt[5]), .Input_0(w0[1]), .Input_1(fill_bit));
	Mux2to1 shift_Level_1_Mux_31(.Output(w1[0]), .Sel(shamt[5]), .Input_0(w0[0]), .Input_1(fill_bit));

	//Level 2 of Muxes to handle 16 bit  right shifts
	//Level of Multiplexers which performs  shift by 16 bits to the right depending on 4th bit of shift amount "shamt[4]"
	Mux2to1 shift_Level_2_Mux_0(.Output(w2[31]), .Sel(shamt[4]), .Input_0(w1[31]), .Input_1(fill_bit));
	Mux2to1 shift_Level_2_Mux_1(.Output(w2[30]), .Sel(shamt[4]), .Input_0(w1[30]), .Input_1(fill_bit));
	Mux2to1 shift_Level_2_Mux_2(.Output(w2[29]), .Sel(shamt[4]), .Input_0(w1[29]), .Input_1(fill_bit));
	Mux2to1 shift_Level_2_Mux_3(.Output(w2[28]), .Sel(shamt[4]), .Input_0(w1[28]), .Input_1(fill_bit));
	Mux2to1 shift_Level_2_Mux_4(.Output(w2[27]), .Sel(shamt[4]), .Input_0(w1[27]), .Input_1(fill_bit));
	Mux2to1 shift_Level_2_Mux_5(.Output(w2[26]), .Sel(shamt[4]), .Input_0(w1[26]), .Input_1(fill_bit));
	Mux2to1 shift_Level_2_Mux_6(.Output(w2[25]), .Sel(shamt[4]), .Input_0(w1[25]), .Input_1(fill_bit));
	Mux2to1 shift_Level_2_Mux_7(.Output(w2[24]), .Sel(shamt[4]), .Input_0(w1[24]), .Input_1(fill_bit));
	Mux2to1 shift_Level_2_Mux_8(.Output(w2[23]), .Sel(shamt[4]), .Input_0(w1[23]), .Input_1(fill_bit));
	Mux2to1 shift_Level_2_Mux_9(.Output(w2[22]), .Sel(shamt[4]), .Input_0(w1[22]), .Input_1(fill_bit));
	Mux2to1 shift_Level_2_Mux_10(.Output(w2[21]), .Sel(shamt[4]), .Input_0(w1[21]), .Input_1(fill_bit));
	Mux2to1 shift_Level_2_Mux_11(.Output(w2[20]), .Sel(shamt[4]), .Input_0(w1[20]), .Input_1(fill_bit));
	Mux2to1 shift_Level_2_Mux_12(.Output(w2[19]), .Sel(shamt[4]), .Input_0(w1[19]), .Input_1(fill_bit));
	Mux2to1 shift_Level_2_Mux_13(.Output(w2[18]), .Sel(shamt[4]), .Input_0(w1[18]), .Input_1(fill_bit));
	Mux2to1 shift_Level_2_Mux_14(.Output(w2[17]), .Sel(shamt[4]), .Input_0(w1[17]), .Input_1(fill_bit));
	Mux2to1 shift_Level_2_Mux_15(.Output(w2[16]), .Sel(shamt[4]), .Input_0(w1[16]), .Input_1(fill_bit));
	Mux2to1 shift_Level_2_Mux_16(.Output(w2[15]), .Sel(shamt[4]), .Input_0(w1[15]), .Input_1(w1[31]));
	Mux2to1 shift_Level_2_Mux_17(.Output(w2[14]), .Sel(shamt[4]), .Input_0(w1[14]), .Input_1(w1[30]));
	Mux2to1 shift_Level_2_Mux_18(.Output(w2[13]), .Sel(shamt[4]), .Input_0(w1[13]), .Input_1(w1[29]));
	Mux2to1 shift_Level_2_Mux_19(.Output(w2[12]), .Sel(shamt[4]), .Input_0(w1[12]), .Input_1(w1[28]));
	Mux2to1 shift_Level_2_Mux_20(.Output(w2[11]), .Sel(shamt[4]), .Input_0(w1[11]), .Input_1(w1[27]));
	Mux2to1 shift_Level_2_Mux_21(.Output(w2[10]), .Sel(shamt[4]), .Input_0(w1[10]), .Input_1(w1[26]));
	Mux2to1 shift_Level_2_Mux_22(.Output(w2[9]), .Sel(shamt[4]), .Input_0(w1[9]), .Input_1(w1[25]));
	Mux2to1 shift_Level_2_Mux_23(.Output(w2[8]), .Sel(shamt[4]), .Input_0(w1[8]), .Input_1(w1[24]));
	Mux2to1 shift_Level_2_Mux_24(.Output(w2[7]), .Sel(shamt[4]), .Input_0(w1[7]), .Input_1(w1[23]));
	Mux2to1 shift_Level_2_Mux_25(.Output(w2[6]), .Sel(shamt[4]), .Input_0(w1[6]), .Input_1(w1[22]));
	Mux2to1 shift_Level_2_Mux_26(.Output(w2[5]), .Sel(shamt[4]), .Input_0(w1[5]), .Input_1(w1[21]));
	Mux2to1 shift_Level_2_Mux_27(.Output(w2[4]), .Sel(shamt[4]), .Input_0(w1[4]), .Input_1(w1[20]));
	Mux2to1 shift_Level_2_Mux_28(.Output(w2[3]), .Sel(shamt[4]), .Input_0(w1[3]), .Input_1(w1[19]));
	Mux2to1 shift_Level_2_Mux_29(.Output(w2[2]), .Sel(shamt[4]), .Input_0(w1[2]), .Input_1(w1[18]));
	Mux2to1 shift_Level_2_Mux_30(.Output(w2[1]), .Sel(shamt[4]), .Input_0(w1[1]), .Input_1(w1[17]));
	Mux2to1 shift_Level_2_Mux_31(.Output(w2[0]), .Sel(shamt[4]), .Input_0(w1[0]), .Input_1(w1[16]));
	
	
	//Level 3 of Muxes to handle 8 bit  right shifts
	//Level of Multiplexers which performs  shift by 8 bit to the right depending on 3rd bit of shift amount "shamt[3]"
	Mux2to1 shift_Level_3_Mux_0(.Output(w3[31]), .Sel(shamt[3]), .Input_0(w2[31]), .Input_1(fill_bit));
	Mux2to1 shift_Level_3_Mux_1(.Output(w3[30]), .Sel(shamt[3]), .Input_0(w2[30]), .Input_1(fill_bit));
	Mux2to1 shift_Level_3_Mux_2(.Output(w3[29]), .Sel(shamt[3]), .Input_0(w2[29]), .Input_1(fill_bit));
	Mux2to1 shift_Level_3_Mux_3(.Output(w3[28]), .Sel(shamt[3]), .Input_0(w2[28]), .Input_1(fill_bit));
	Mux2to1 shift_Level_3_Mux_4(.Output(w3[27]), .Sel(shamt[3]), .Input_0(w2[27]), .Input_1(fill_bit));
	Mux2to1 shift_Level_3_Mux_5(.Output(w3[26]), .Sel(shamt[3]), .Input_0(w2[26]), .Input_1(fill_bit));
	Mux2to1 shift_Level_3_Mux_6(.Output(w3[25]), .Sel(shamt[3]), .Input_0(w2[25]), .Input_1(fill_bit));
	Mux2to1 shift_Level_3_Mux_7(.Output(w3[24]), .Sel(shamt[3]), .Input_0(w2[24]), .Input_1(fill_bit));
	Mux2to1 shift_Level_3_Mux_8(.Output(w3[23]), .Sel(shamt[3]), .Input_0(w2[23]), .Input_1(w2[31]));
	Mux2to1 shift_Level_3_Mux_9(.Output(w3[22]), .Sel(shamt[3]), .Input_0(w2[22]), .Input_1(w2[30]));
	Mux2to1 shift_Level_3_Mux_10(.Output(w3[21]), .Sel(shamt[3]), .Input_0(w2[21]), .Input_1(w2[29]));
	Mux2to1 shift_Level_3_Mux_11(.Output(w3[20]), .Sel(shamt[3]), .Input_0(w2[20]), .Input_1(w2[28]));
	Mux2to1 shift_Level_3_Mux_12(.Output(w3[19]), .Sel(shamt[3]), .Input_0(w2[19]), .Input_1(w2[27]));
	Mux2to1 shift_Level_3_Mux_13(.Output(w3[18]), .Sel(shamt[3]), .Input_0(w2[18]), .Input_1(w2[26]));
	Mux2to1 shift_Level_3_Mux_14(.Output(w3[17]), .Sel(shamt[3]), .Input_0(w2[17]), .Input_1(w2[25]));
	Mux2to1 shift_Level_3_Mux_15(.Output(w3[16]), .Sel(shamt[3]), .Input_0(w2[16]), .Input_1(w2[24]));
	Mux2to1 shift_Level_3_Mux_16(.Output(w3[15]), .Sel(shamt[3]), .Input_0(w2[15]), .Input_1(w2[23]));
	Mux2to1 shift_Level_3_Mux_17(.Output(w3[14]), .Sel(shamt[3]), .Input_0(w2[14]), .Input_1(w2[22]));
	Mux2to1 shift_Level_3_Mux_18(.Output(w3[13]), .Sel(shamt[3]), .Input_0(w2[13]), .Input_1(w2[21]));
	Mux2to1 shift_Level_3_Mux_19(.Output(w3[12]), .Sel(shamt[3]), .Input_0(w2[12]), .Input_1(w2[20]));
	Mux2to1 shift_Level_3_Mux_20(.Output(w3[11]), .Sel(shamt[3]), .Input_0(w2[11]), .Input_1(w2[19]));
	Mux2to1 shift_Level_3_Mux_21(.Output(w3[10]), .Sel(shamt[3]), .Input_0(w2[10]), .Input_1(w2[18]));
	Mux2to1 shift_Level_3_Mux_22(.Output(w3[9]), .Sel(shamt[3]), .Input_0(w2[9]), .Input_1(w2[17]));
	Mux2to1 shift_Level_3_Mux_23(.Output(w3[8]), .Sel(shamt[3]), .Input_0(w2[8]), .Input_1(w2[16]));
	Mux2to1 shift_Level_3_Mux_24(.Output(w3[7]), .Sel(shamt[3]), .Input_0(w2[7]), .Input_1(w2[15]));
	Mux2to1 shift_Level_3_Mux_25(.Output(w3[6]), .Sel(shamt[3]), .Input_0(w2[6]), .Input_1(w2[14]));
	Mux2to1 shift_Level_3_Mux_26(.Output(w3[5]), .Sel(shamt[3]), .Input_0(w2[5]), .Input_1(w2[13]));
	Mux2to1 shift_Level_3_Mux_27(.Output(w3[4]), .Sel(shamt[3]), .Input_0(w2[4]), .Input_1(w2[12]));
	Mux2to1 shift_Level_3_Mux_28(.Output(w3[3]), .Sel(shamt[3]), .Input_0(w2[3]), .Input_1(w2[11]));
	Mux2to1 shift_Level_3_Mux_29(.Output(w3[2]), .Sel(shamt[3]), .Input_0(w2[2]), .Input_1(w2[10]));
	Mux2to1 shift_Level_3_Mux_30(.Output(w3[1]), .Sel(shamt[3]), .Input_0(w2[1]), .Input_1(w2[9]));
	Mux2to1 shift_Level_3_Mux_31(.Output(w3[0]), .Sel(shamt[3]), .Input_0(w2[0]), .Input_1(w2[8]));
	
	//Level 4 of Muxes to handle 4 bit  right shifts
	//Level of Multiplexers which performs  shift by 4 bit to the right depending on 2nd bit of shift amount "shamt[2]"
	Mux2to1 shift_Level_4_Mux_0(.Output(w4[31]), .Sel(shamt[2]), .Input_0(w3[31]), .Input_1(fill_bit));
	Mux2to1 shift_Level_4_Mux_1(.Output(w4[30]), .Sel(shamt[2]), .Input_0(w3[30]), .Input_1(fill_bit));
	Mux2to1 shift_Level_4_Mux_2(.Output(w4[29]), .Sel(shamt[2]), .Input_0(w3[29]), .Input_1(fill_bit));
	Mux2to1 shift_Level_4_Mux_3(.Output(w4[28]), .Sel(shamt[2]), .Input_0(w3[28]), .Input_1(fill_bit));
	Mux2to1 shift_Level_4_Mux_4(.Output(w4[27]), .Sel(shamt[2]), .Input_0(w3[27]), .Input_1(w3[31]));
	Mux2to1 shift_Level_4_Mux_5(.Output(w4[26]), .Sel(shamt[2]), .Input_0(w3[26]), .Input_1(w3[30]));
	Mux2to1 shift_Level_4_Mux_6(.Output(w4[25]), .Sel(shamt[2]), .Input_0(w3[25]), .Input_1(w3[29]));
	Mux2to1 shift_Level_4_Mux_7(.Output(w4[24]), .Sel(shamt[2]), .Input_0(w3[24]), .Input_1(w3[28]));
	Mux2to1 shift_Level_4_Mux_8(.Output(w4[23]), .Sel(shamt[2]), .Input_0(w3[23]), .Input_1(w3[27]));
	Mux2to1 shift_Level_4_Mux_9(.Output(w4[22]), .Sel(shamt[2]), .Input_0(w3[22]), .Input_1(w3[26]));
	Mux2to1 shift_Level_4_Mux_10(.Output(w4[21]), .Sel(shamt[2]), .Input_0(w3[21]), .Input_1(w3[25]));
	Mux2to1 shift_Level_4_Mux_11(.Output(w4[20]), .Sel(shamt[2]), .Input_0(w3[20]), .Input_1(w3[24]));
	Mux2to1 shift_Level_4_Mux_12(.Output(w4[19]), .Sel(shamt[2]), .Input_0(w3[19]), .Input_1(w3[23]));
	Mux2to1 shift_Level_4_Mux_13(.Output(w4[18]), .Sel(shamt[2]), .Input_0(w3[18]), .Input_1(w3[22]));
	Mux2to1 shift_Level_4_Mux_14(.Output(w4[17]), .Sel(shamt[2]), .Input_0(w3[17]), .Input_1(w3[21]));
	Mux2to1 shift_Level_4_Mux_15(.Output(w4[16]), .Sel(shamt[2]), .Input_0(w3[16]), .Input_1(w3[20]));
	Mux2to1 shift_Level_4_Mux_16(.Output(w4[15]), .Sel(shamt[2]), .Input_0(w3[15]), .Input_1(w3[19]));
	Mux2to1 shift_Level_4_Mux_17(.Output(w4[14]), .Sel(shamt[2]), .Input_0(w3[14]), .Input_1(w3[18]));
	Mux2to1 shift_Level_4_Mux_18(.Output(w4[13]), .Sel(shamt[2]), .Input_0(w3[13]), .Input_1(w3[17]));
	Mux2to1 shift_Level_4_Mux_19(.Output(w4[12]), .Sel(shamt[2]), .Input_0(w3[12]), .Input_1(w3[16]));
	Mux2to1 shift_Level_4_Mux_20(.Output(w4[11]), .Sel(shamt[2]), .Input_0(w3[11]), .Input_1(w3[15]));
	Mux2to1 shift_Level_4_Mux_21(.Output(w4[10]), .Sel(shamt[2]), .Input_0(w3[10]), .Input_1(w3[14]));
	Mux2to1 shift_Level_4_Mux_22(.Output(w4[9]), .Sel(shamt[2]), .Input_0(w3[9]), .Input_1(w3[13]));
	Mux2to1 shift_Level_4_Mux_23(.Output(w4[8]), .Sel(shamt[2]), .Input_0(w3[8]), .Input_1(w3[12]));
	Mux2to1 shift_Level_4_Mux_24(.Output(w4[7]), .Sel(shamt[2]), .Input_0(w3[7]), .Input_1(w3[11]));
	Mux2to1 shift_Level_4_Mux_25(.Output(w4[6]), .Sel(shamt[2]), .Input_0(w3[6]), .Input_1(w3[10]));
	Mux2to1 shift_Level_4_Mux_26(.Output(w4[5]), .Sel(shamt[2]), .Input_0(w3[5]), .Input_1(w3[9]));
	Mux2to1 shift_Level_4_Mux_27(.Output(w4[4]), .Sel(shamt[2]), .Input_0(w3[4]), .Input_1(w3[8]));
	Mux2to1 shift_Level_4_Mux_28(.Output(w4[3]), .Sel(shamt[2]), .Input_0(w3[3]), .Input_1(w3[7]));
	Mux2to1 shift_Level_4_Mux_29(.Output(w4[2]), .Sel(shamt[2]), .Input_0(w3[2]), .Input_1(w3[6]));
	Mux2to1 shift_Level_4_Mux_30(.Output(w4[1]), .Sel(shamt[2]), .Input_0(w3[1]), .Input_1(w3[5]));
	Mux2to1 shift_Level_4_Mux_31(.Output(w4[0]), .Sel(shamt[2]), .Input_0(w3[0]), .Input_1(w3[4]));
	
	//Level 5 of Muxes to handle 2 bit  right shifts
	//Level of Multiplexers which performs  shift by 2 bit to the right depending on 1st bit of shift amount "shamt[1]"
	Mux2to1 shift_Level_5_Mux_0(.Output(w5[31]), .Sel(shamt[1]), .Input_0(w4[31]), .Input_1(fill_bit));
	Mux2to1 shift_Level_5_Mux_1(.Output(w5[30]), .Sel(shamt[1]), .Input_0(w4[30]), .Input_1(fill_bit));
	Mux2to1 shift_Level_5_Mux_2(.Output(w5[29]), .Sel(shamt[1]), .Input_0(w4[29]), .Input_1(w4[31]));
	Mux2to1 shift_Level_5_Mux_3(.Output(w5[28]), .Sel(shamt[1]), .Input_0(w4[28]), .Input_1(w4[30]));
	Mux2to1 shift_Level_5_Mux_4(.Output(w5[27]), .Sel(shamt[1]), .Input_0(w4[27]), .Input_1(w4[29]));
	Mux2to1 shift_Level_5_Mux_5(.Output(w5[26]), .Sel(shamt[1]), .Input_0(w4[26]), .Input_1(w4[28]));
	Mux2to1 shift_Level_5_Mux_6(.Output(w5[25]), .Sel(shamt[1]), .Input_0(w4[25]), .Input_1(w4[27]));
	Mux2to1 shift_Level_5_Mux_7(.Output(w5[24]), .Sel(shamt[1]), .Input_0(w4[24]), .Input_1(w4[26]));
	Mux2to1 shift_Level_5_Mux_8(.Output(w5[23]), .Sel(shamt[1]), .Input_0(w4[23]), .Input_1(w4[25]));
	Mux2to1 shift_Level_5_Mux_9(.Output(w5[22]), .Sel(shamt[1]), .Input_0(w4[22]), .Input_1(w4[24]));
	Mux2to1 shift_Level_5_Mux_10(.Output(w5[21]), .Sel(shamt[1]), .Input_0(w4[21]), .Input_1(w4[23]));
	Mux2to1 shift_Level_5_Mux_11(.Output(w5[20]), .Sel(shamt[1]), .Input_0(w4[20]), .Input_1(w4[22]));
	Mux2to1 shift_Level_5_Mux_12(.Output(w5[19]), .Sel(shamt[1]), .Input_0(w4[19]), .Input_1(w4[21]));
	Mux2to1 shift_Level_5_Mux_13(.Output(w5[18]), .Sel(shamt[1]), .Input_0(w4[18]), .Input_1(w4[20]));
	Mux2to1 shift_Level_5_Mux_14(.Output(w5[17]), .Sel(shamt[1]), .Input_0(w4[17]), .Input_1(w4[19]));
	Mux2to1 shift_Level_5_Mux_15(.Output(w5[16]), .Sel(shamt[1]), .Input_0(w4[16]), .Input_1(w4[18]));
	Mux2to1 shift_Level_5_Mux_16(.Output(w5[15]), .Sel(shamt[1]), .Input_0(w4[15]), .Input_1(w4[17]));
	Mux2to1 shift_Level_5_Mux_17(.Output(w5[14]), .Sel(shamt[1]), .Input_0(w4[14]), .Input_1(w4[16]));
	Mux2to1 shift_Level_5_Mux_18(.Output(w5[13]), .Sel(shamt[1]), .Input_0(w4[13]), .Input_1(w4[15]));
	Mux2to1 shift_Level_5_Mux_19(.Output(w5[12]), .Sel(shamt[1]), .Input_0(w4[12]), .Input_1(w4[14]));
	Mux2to1 shift_Level_5_Mux_20(.Output(w5[11]), .Sel(shamt[1]), .Input_0(w4[11]), .Input_1(w4[13]));
	Mux2to1 shift_Level_5_Mux_21(.Output(w5[10]), .Sel(shamt[1]), .Input_0(w4[10]), .Input_1(w4[12]));
	Mux2to1 shift_Level_5_Mux_22(.Output(w5[9]), .Sel(shamt[1]), .Input_0(w4[9]), .Input_1(w4[11]));
	Mux2to1 shift_Level_5_Mux_23(.Output(w5[8]), .Sel(shamt[1]), .Input_0(w4[8]), .Input_1(w4[10]));
	Mux2to1 shift_Level_5_Mux_24(.Output(w5[7]), .Sel(shamt[1]), .Input_0(w4[7]), .Input_1(w4[9]));
	Mux2to1 shift_Level_5_Mux_25(.Output(w5[6]), .Sel(shamt[1]), .Input_0(w4[6]), .Input_1(w4[8]));
	Mux2to1 shift_Level_5_Mux_26(.Output(w5[5]), .Sel(shamt[1]), .Input_0(w4[5]), .Input_1(w4[7]));
	Mux2to1 shift_Level_5_Mux_27(.Output(w5[4]), .Sel(shamt[1]), .Input_0(w4[4]), .Input_1(w4[6]));
	Mux2to1 shift_Level_5_Mux_28(.Output(w5[3]), .Sel(shamt[1]), .Input_0(w4[3]), .Input_1(w4[5]));
	Mux2to1 shift_Level_5_Mux_29(.Output(w5[2]), .Sel(shamt[1]), .Input_0(w4[2]), .Input_1(w4[4]));
	Mux2to1 shift_Level_5_Mux_30(.Output(w5[1]), .Sel(shamt[1]), .Input_0(w4[1]), .Input_1(w4[3]));
	Mux2to1 shift_Level_5_Mux_31(.Output(w5[0]), .Sel(shamt[1]), .Input_0(w4[0]), .Input_1(w4[2]));
	
	//Level 6 of Muxes to handle 1 bit  right shifts
	//Level of Multiplexers which performs  shift by 1 bit to the right depending on 0th bit of shift amount "shamt[0]"
	Mux2to1 shift_Level_6_Mux_0(.Output(w6[31]), .Sel(shamt[0]), .Input_0(w5[31]), .Input_1(fill_bit));
	Mux2to1 shift_Level_6_Mux_1(.Output(w6[30]), .Sel(shamt[0]), .Input_0(w5[30]), .Input_1(w5[31]));
	Mux2to1 shift_Level_6_Mux_2(.Output(w6[29]), .Sel(shamt[0]), .Input_0(w5[29]), .Input_1(w5[30]));
	Mux2to1 shift_Level_6_Mux_3(.Output(w6[28]), .Sel(shamt[0]), .Input_0(w5[28]), .Input_1(w5[29]));
	Mux2to1 shift_Level_6_Mux_4(.Output(w6[27]), .Sel(shamt[0]), .Input_0(w5[27]), .Input_1(w5[28]));
	Mux2to1 shift_Level_6_Mux_5(.Output(w6[26]), .Sel(shamt[0]), .Input_0(w5[26]), .Input_1(w5[27]));
	Mux2to1 shift_Level_6_Mux_6(.Output(w6[25]), .Sel(shamt[0]), .Input_0(w5[25]), .Input_1(w5[26]));
	Mux2to1 shift_Level_6_Mux_7(.Output(w6[24]), .Sel(shamt[0]), .Input_0(w5[24]), .Input_1(w5[25]));
	Mux2to1 shift_Level_6_Mux_8(.Output(w6[23]), .Sel(shamt[0]), .Input_0(w5[23]), .Input_1(w5[24]));
	Mux2to1 shift_Level_6_Mux_9(.Output(w6[22]), .Sel(shamt[0]), .Input_0(w5[22]), .Input_1(w5[23]));
	Mux2to1 shift_Level_6_Mux_10(.Output(w6[21]), .Sel(shamt[0]), .Input_0(w5[21]), .Input_1(w5[22]));
	Mux2to1 shift_Level_6_Mux_11(.Output(w6[20]), .Sel(shamt[0]), .Input_0(w5[20]), .Input_1(w5[21]));
	Mux2to1 shift_Level_6_Mux_12(.Output(w6[19]), .Sel(shamt[0]), .Input_0(w5[19]), .Input_1(w5[20]));
	Mux2to1 shift_Level_6_Mux_13(.Output(w6[18]), .Sel(shamt[0]), .Input_0(w5[18]), .Input_1(w5[19]));
	Mux2to1 shift_Level_6_Mux_14(.Output(w6[17]), .Sel(shamt[0]), .Input_0(w5[17]), .Input_1(w5[18]));
	Mux2to1 shift_Level_6_Mux_15(.Output(w6[16]), .Sel(shamt[0]), .Input_0(w5[16]), .Input_1(w5[17]));
	Mux2to1 shift_Level_6_Mux_16(.Output(w6[15]), .Sel(shamt[0]), .Input_0(w5[15]), .Input_1(w5[16]));
	Mux2to1 shift_Level_6_Mux_17(.Output(w6[14]), .Sel(shamt[0]), .Input_0(w5[14]), .Input_1(w5[15]));
	Mux2to1 shift_Level_6_Mux_18(.Output(w6[13]), .Sel(shamt[0]), .Input_0(w5[13]), .Input_1(w5[14]));
	Mux2to1 shift_Level_6_Mux_19(.Output(w6[12]), .Sel(shamt[0]), .Input_0(w5[12]), .Input_1(w5[13]));
	Mux2to1 shift_Level_6_Mux_20(.Output(w6[11]), .Sel(shamt[0]), .Input_0(w5[11]), .Input_1(w5[12]));
	Mux2to1 shift_Level_6_Mux_21(.Output(w6[10]), .Sel(shamt[0]), .Input_0(w5[10]), .Input_1(w5[11]));
	Mux2to1 shift_Level_6_Mux_22(.Output(w6[9]), .Sel(shamt[0]), .Input_0(w5[9]), .Input_1(w5[10]));
	Mux2to1 shift_Level_6_Mux_23(.Output(w6[8]), .Sel(shamt[0]), .Input_0(w5[8]), .Input_1(w5[9]));
	Mux2to1 shift_Level_6_Mux_24(.Output(w6[7]), .Sel(shamt[0]), .Input_0(w5[7]), .Input_1(w5[8]));
	Mux2to1 shift_Level_6_Mux_25(.Output(w6[6]), .Sel(shamt[0]), .Input_0(w5[6]), .Input_1(w5[7]));
	Mux2to1 shift_Level_6_Mux_26(.Output(w6[5]), .Sel(shamt[0]), .Input_0(w5[5]), .Input_1(w5[6]));
	Mux2to1 shift_Level_6_Mux_27(.Output(w6[4]), .Sel(shamt[0]), .Input_0(w5[4]), .Input_1(w5[5]));
	Mux2to1 shift_Level_6_Mux_28(.Output(w6[3]), .Sel(shamt[0]), .Input_0(w5[3]), .Input_1(w5[4]));
	Mux2to1 shift_Level_6_Mux_29(.Output(w6[2]), .Sel(shamt[0]), .Input_0(w5[2]), .Input_1(w5[3]));
	Mux2to1 shift_Level_6_Mux_30(.Output(w6[1]), .Sel(shamt[0]), .Input_0(w5[1]), .Input_1(w5[2]));
	Mux2to1 shift_Level_6_Mux_31(.Output(w6[0]), .Sel(shamt[0]), .Input_0(w5[0]), .Input_1(w5[1]));
	
	//dir = 1 for left shifts and dir = 0 for right shifts
	//Level of Multiplexers which reverses the 32-bit output depending on the direction of shift "dir"
	Mux2to1 dir_Level_7_Mux_0(.Output(out[31]), .Sel(dir), .Input_0(w6[31]), .Input_1(w6[0]));
	Mux2to1 dir_Level_7_Mux_1(.Output(out[30]), .Sel(dir), .Input_0(w6[30]), .Input_1(w6[1]));
	Mux2to1 dir_Level_7_Mux_2(.Output(out[29]), .Sel(dir), .Input_0(w6[29]), .Input_1(w6[2]));
	Mux2to1 dir_Level_7_Mux_3(.Output(out[28]), .Sel(dir), .Input_0(w6[28]), .Input_1(w6[3]));
	Mux2to1 dir_Level_7_Mux_4(.Output(out[27]), .Sel(dir), .Input_0(w6[27]), .Input_1(w6[4]));
	Mux2to1 dir_Level_7_Mux_5(.Output(out[26]), .Sel(dir), .Input_0(w6[26]), .Input_1(w6[5]));
	Mux2to1 dir_Level_7_Mux_6(.Output(out[25]), .Sel(dir), .Input_0(w6[25]), .Input_1(w6[6]));
	Mux2to1 dir_Level_7_Mux_7(.Output(out[24]), .Sel(dir), .Input_0(w6[24]), .Input_1(w6[7]));
	Mux2to1 dir_Level_7_Mux_8(.Output(out[23]), .Sel(dir), .Input_0(w6[23]), .Input_1(w6[8]));
	Mux2to1 dir_Level_7_Mux_9(.Output(out[22]), .Sel(dir), .Input_0(w6[22]), .Input_1(w6[9]));
	Mux2to1 dir_Level_7_Mux_10(.Output(out[21]), .Sel(dir), .Input_0(w6[21]), .Input_1(w6[10]));
	Mux2to1 dir_Level_7_Mux_11(.Output(out[20]), .Sel(dir), .Input_0(w6[20]), .Input_1(w6[11]));
	Mux2to1 dir_Level_7_Mux_12(.Output(out[19]), .Sel(dir), .Input_0(w6[19]), .Input_1(w6[12]));
	Mux2to1 dir_Level_7_Mux_13(.Output(out[18]), .Sel(dir), .Input_0(w6[18]), .Input_1(w6[13]));
	Mux2to1 dir_Level_7_Mux_14(.Output(out[17]), .Sel(dir), .Input_0(w6[17]), .Input_1(w6[14]));
	Mux2to1 dir_Level_7_Mux_15(.Output(out[16]), .Sel(dir), .Input_0(w6[16]), .Input_1(w6[15]));
	Mux2to1 dir_Level_7_Mux_16(.Output(out[15]), .Sel(dir), .Input_0(w6[15]), .Input_1(w6[16]));
	Mux2to1 dir_Level_7_Mux_17(.Output(out[14]), .Sel(dir), .Input_0(w6[14]), .Input_1(w6[17]));
	Mux2to1 dir_Level_7_Mux_18(.Output(out[13]), .Sel(dir), .Input_0(w6[13]), .Input_1(w6[18]));
	Mux2to1 dir_Level_7_Mux_19(.Output(out[12]), .Sel(dir), .Input_0(w6[12]), .Input_1(w6[19]));
	Mux2to1 dir_Level_7_Mux_20(.Output(out[11]), .Sel(dir), .Input_0(w6[11]), .Input_1(w6[20]));
	Mux2to1 dir_Level_7_Mux_21(.Output(out[10]), .Sel(dir), .Input_0(w6[10]), .Input_1(w6[21]));
	Mux2to1 dir_Level_7_Mux_22(.Output(out[9]), .Sel(dir), .Input_0(w6[9]), .Input_1(w6[22]));
	Mux2to1 dir_Level_7_Mux_23(.Output(out[8]), .Sel(dir), .Input_0(w6[8]), .Input_1(w6[23]));
	Mux2to1 dir_Level_7_Mux_24(.Output(out[7]), .Sel(dir), .Input_0(w6[7]), .Input_1(w6[24]));
	Mux2to1 dir_Level_7_Mux_25(.Output(out[6]), .Sel(dir), .Input_0(w6[6]), .Input_1(w6[25]));
	Mux2to1 dir_Level_7_Mux_26(.Output(out[5]), .Sel(dir), .Input_0(w6[5]), .Input_1(w6[26]));
	Mux2to1 dir_Level_7_Mux_27(.Output(out[4]), .Sel(dir), .Input_0(w6[4]), .Input_1(w6[27]));
	Mux2to1 dir_Level_7_Mux_28(.Output(out[3]), .Sel(dir), .Input_0(w6[3]), .Input_1(w6[28]));
	Mux2to1 dir_Level_7_Mux_29(.Output(out[2]), .Sel(dir), .Input_0(w6[2]), .Input_1(w6[29]));
	Mux2to1 dir_Level_7_Mux_30(.Output(out[1]), .Sel(dir), .Input_0(w6[1]), .Input_1(w6[30]));
	Mux2to1 dir_Level_7_Mux_31(.Output(out[0]), .Sel(dir), .Input_0(w6[0]), .Input_1(w6[31]));
endmodule
