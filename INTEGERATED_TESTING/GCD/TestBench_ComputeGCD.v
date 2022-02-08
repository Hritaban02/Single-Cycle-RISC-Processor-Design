
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- Test-bench for KGP-RISC (Assembly code for GCD Computation)
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

// +++ GCD Calculator Code Testing +++
/*
	0:      lw $1, 0($0) 	// a
	1:      lw $2, 4($0) 	// b
	2:      bz $1, __15__
	3:      bz $2, __13__
	4:      comp $3, $2 		// $3 <- -b
	5:      add $3, $1  		// $3 <- a - b
	6:      bz $3, __13__   // if a == b
	7:      bltz __11__     // if a < b
	8:      comp $1, $3     // a <- - $3 OR a <- - (a - b)
	9:      comp $1, $1     // a <- - a
	10:     b __2__
	11:     comp $2, $3 		// b <- - $3 OR b <- b - a
	12:     b __2__
	13:     sw $1, 8($0)
	14:     b __16__
	15:     sw $2, 8($0)
	16:     nop
*/

module TestBench_ComputeGCD;

	// Inputs
	reg clk;
	reg rst;

	// Instantiate the Unit Under Test (UUT)
	KGPRISC uut (
		.clk(clk), 
		.rst(rst)
	);

	always #10 clk = ~clk ; // clock cycle time = 20ns

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#100;
		rst = 0 ;
		clk = 1 ;
        
		// Add stimulus here
		// Let the simulation run for 2500 clock cycles 
		#50000; 
		
		// Display the status of the registers
		$display(" \n ");
		$display(" Status of the Registers after program end along with their semantic meaning in the program ");
		$display(" Register 00 [Fixed at Zero $zero	]: %b	%d ", 32'd0, 32'd0); // R0 is implemented as a constant value
		$display(" Register 01 [FirstValue (initial=a)	]: %b	%d ", uut.DP.RF.R01.data, uut.DP.RF.R01.data);
		$display(" Register 02 [SecondValue (initial=b)	]: %b	%d ", uut.DP.RF.R02.data, uut.DP.RF.R02.data);
		$display(" Register 03 [Temporary	]: %b	%d ", uut.DP.RF.R03.data, uut.DP.RF.R03.data);
		$display(" Register 04 [Not Used	]: %b	%d ", uut.DP.RF.R04.data, uut.DP.RF.R04.data);
		$display(" Register 05 [Not Used	]: %b	%d ", uut.DP.RF.R05.data, uut.DP.RF.R05.data);
		$display(" Register 06 [Not Used	]: %b	%d ", uut.DP.RF.R06.data, uut.DP.RF.R06.data);
		$display(" Register 07 [Not Used	]: %b	%d ", uut.DP.RF.R07.data, uut.DP.RF.R07.data);
		$display(" Register 08 [Not Used	]: %b	%d ", uut.DP.RF.R08.data, uut.DP.RF.R08.data);
		$display(" Register 09 [Not Used	]: %b	%d ", uut.DP.RF.R09.data, uut.DP.RF.R09.data);
		$display(" Register 10 [Not Used	]: %b	%d ", uut.DP.RF.R10.data, uut.DP.RF.R10.data);
		$display(" Register 11 [Not Used	]: %b	%d ", uut.DP.RF.R11.data, uut.DP.RF.R11.data);
		$display(" Register 12 [Not Used	]: %b	%d ", uut.DP.RF.R12.data, uut.DP.RF.R12.data);
		$display(" Register 13 [Not Used	]: %b	%d ", uut.DP.RF.R13.data, uut.DP.RF.R13.data);
		$display(" Register 14 [Not Used	]: %b	%d ", uut.DP.RF.R14.data, uut.DP.RF.R14.data);
		$display(" Register 15 [Not Used	]: %b	%d ", uut.DP.RF.R15.data, uut.DP.RF.R15.data);
		$display(" Register 16 [Not Used	]: %b	%d ", uut.DP.RF.R16.data, uut.DP.RF.R16.data);
		$display(" Register 17 [Not Used	]: %b	%d ", uut.DP.RF.R17.data, uut.DP.RF.R17.data);
		$display(" Register 18 [Not Used	]: %b	%d ", uut.DP.RF.R18.data, uut.DP.RF.R18.data);
		$display(" Register 19 [Not Used	]: %b	%d ", uut.DP.RF.R19.data, uut.DP.RF.R19.data);
		$display(" Register 20 [Not Used	]: %b	%d ", uut.DP.RF.R20.data, uut.DP.RF.R20.data);
		$display(" Register 21 [Not Used	]: %b	%d ", uut.DP.RF.R21.data, uut.DP.RF.R21.data);
		$display(" Register 22 [Not Used	]: %b	%d ", uut.DP.RF.R22.data, uut.DP.RF.R22.data);
		$display(" Register 23 [Not Used	]: %b	%d ", uut.DP.RF.R23.data, uut.DP.RF.R23.data);
		$display(" Register 24 [Not Used	]: %b	%d ", uut.DP.RF.R24.data, uut.DP.RF.R24.data);
		$display(" Register 25 [Not Used	]: %b	%d ", uut.DP.RF.R25.data, uut.DP.RF.R25.data);
		$display(" Register 26 [Not Used	]: %b	%d ", uut.DP.RF.R26.data, uut.DP.RF.R26.data);
		$display(" Register 27 [Not Used	]: %b	%d ", uut.DP.RF.R27.data, uut.DP.RF.R27.data);
		$display(" Register 28 [Not Used	]: %b	%d ", uut.DP.RF.R28.data, uut.DP.RF.R28.data);
		$display(" Register 29 [Not Used	]: %b	%d ", uut.DP.RF.R29.data, uut.DP.RF.R29.data);
		$display(" Register 30 [Not Used	]: %b	%d ", uut.DP.RF.R30.data, uut.DP.RF.R30.data);
		$display(" Register 31 [Return Address	]: %b	%d ", uut.DP.RF.R31.data, uut.DP.RF.R31.data);
		$display(" \n ");
		
		// Display the GCD obtained 
		if(uut.DP.RF.R01.data == uut.DP.RF.R02.data)
			begin
				$display(" Greatest Common Divisor = %d ", uut.DP.RF.R01.data);
			end
		else if(uut.DP.RF.R01.data == 0)
			begin
				$display(" Greatest Common Divisor = %d ", uut.DP.RF.R02.data);
			end
		else
			begin
				$display(" Greatest Common Divisor = %d ", uut.DP.RF.R01.data);
			end
			
		$display(" \n ");

	end
      
endmodule

