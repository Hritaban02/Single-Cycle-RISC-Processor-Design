
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- ALU Control Module
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

// [[ Arithmetic Logic Unit Control Module ]] -- Module for Arithmetic Logic Unit Control
// (takes in one 3-bit binary input "ALUOp", and one 10-bit binary input "function_code"; 
// and outputs one 7-bit binary output "control_signal")

// "control_signal"	---	7-bit control signals interpreted as carry_out_select[1], Logic/Arithmetic[1], Direction[1], carry_in[1], operation[3]
// "ALUOp"				---	3-bit binary code which dictates the control signal to the ALU
//	"function_code"	---	10-bit binary code which dictates the specific operation to be performed by the ALU

module ALU_Control(control_signal, ALUOp, function_code);
	input [2:0] ALUOp;				// 3-bit binary code which dictates the control signal to the ALU
	input [9:0] function_code;		// 10-bit binary code which dictates the specific operation to be performed by the ALU
	output reg [6:0] control_signal;	// 7-bit Control Signals to the ALU
	
	// Order of control signals to the ALU --- carry_out_select, Logic/Arithmetic, Direction, carry_in, operation 
	// dir = 1 for left shifts and dir = 0 for right shifts
	always @(*)
		begin
			case(ALUOp)
				3'b001:								// Primary Arithmetic Operations
					begin
						case(function_code)
							10'b0000000000:		// add rs, rt 
								begin
									control_signal = 7'b1000000;
								end
							10'b0000000001:		// and rs, rt
								begin
									control_signal = 7'b0000001;
								end
							10'b0000000010:		// xor rs, rt
								begin
									control_signal = 7'b0000010;
								end
							10'b0000000011:		// comp rs, rt
								begin
									control_signal = 7'b0001000;
								end
							default:					// Don't Cares
								begin
									control_signal = 7'b0111111;
								end
						endcase
					end
					
				3'b010:								// Constant Value Shift Operations
					begin
						case(function_code)
							10'b0000000000:		// shll rs, sh
								begin
									control_signal = 7'b0010011;
								end
							10'b0000000001:		// shrl rs, sh
								begin
									control_signal = 7'b0000011;
								end
							10'b0000000010:		// shra rs, sh
								begin
									control_signal = 7'b0100011;
								end
							default:					// Don't Cares
								begin
									control_signal = 7'b0111111;
								end
						endcase
					end
						
				3'b011:								// Variable Value Shift Operations			
					begin
						case(function_code)
							10'b0000000000:		// shllv rs, rt
								begin
									control_signal = 7'b0010011;
								end
							10'b0000000001:		// shrlv rs, rt
								begin
									control_signal = 7'b0000011;
								end
							10'b0000000010:		// shrav rs, rt
								begin
									control_signal = 7'b0100011;
								end
							default:					// Don't Cares
								begin
									control_signal = 7'b0111111;
								end
						endcase
					end
					
				3'b100:		// addi rs, imm 
					begin
						control_signal = 7'b1000000;
					end
				
				3'b101:		// compi rs, imm
					begin
						control_signal = 7'b0001000;
					end
					
				3'b110:		// bnz rs, L | bz rs, L | bltz rs, L | lw rt, imm(rs) | sw rt, imm(rs) 
					begin
						control_signal = 7'b0000000;
					end
				
				3'b000:		// ALU not required
					begin
						control_signal = 7'b0111111;
					end
					
				default:		// Don't Cares	
					begin
						control_signal = 7'b0111111;
					end
			endcase
		end
	
endmodule
