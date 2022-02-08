
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- Test-bench for KGP-RISC (Assembly code for Binary to Decimal)
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

// +++ Binary to Decimal Converter Code Testing +++
/*
	0:	 lw $2, 0($1)			// Load the number of bits in the binary number (n)
	1:  bltz $2, exit(11)
	2:  bz $2, exit(10)
	3:  lw $3, 4($1)   		// Initialise decimal number to first binary number, because n is at least 1
	4:  addi $2, -1
	5:	 bz $2, print(6)		// If n-1==0 then print
	6:	 shll $3, 1				// Shift by 1 bit to the left	
	7:	 lw $4, 8($1)			// Get the next binary digit and add
	8:	 add $3, $4				// Update decimal number
	9:	 addi $1, 4				// Increment Stack Pointer
	10: addi $2, -1			// Decrement iterator (in this case n)
	11: b __5__
	12: print: sw $3, 8($1)	// Store the decimal number in memory	
	13: exit: no op
*/

module TestBench_BinaryToDecimal;

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
		//(Depends on the number of bits in the binary number.)
		//(Therefore take an upper bound assuming resonable inputs.)
		#50000; 
		
		// Display the status of the registers
		$display(" \n ");
		$display(" Status of the Registers after program end along with their semantic meaning in the program ");
		$display(" Register 00 [Fixed at Zero $zero	]: %b	%d ", 32'd0, 32'd0); // R0 is implemented as a constant value
		$display(" Register 01 [Memory Data Pointer	]: %b	%d ", uut.DP.RF.R01.data, uut.DP.RF.R01.data);
		$display(" Register 02 [Iterator(initial=n)	]: %b	%d ", uut.DP.RF.R02.data, uut.DP.RF.R02.data);
		$display(" Register 03 [Final DecimalNumber	]: %b	%d ", uut.DP.RF.R03.data, uut.DP.RF.R03.data);
		$display(" Register 04 [Next Binary Digit	]: %b	%d ", uut.DP.RF.R04.data, uut.DP.RF.R04.data);
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

		// Display the decimal number obtained
		$display(" \n ");		
		$display(" Decimal Number obtained after conversion = %d ", uut.DP.RF.R03.data);
		$display(" \n ");

	end
      
endmodule
