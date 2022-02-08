
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- Test-bench for RegisterFile module
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

module TestBench_RegisterFile ;

	// Inputs
	reg [4:0] rs;
	reg [4:0] rt;
	reg [4:0] rd;
	reg regWrite;
	reg [31:0] writeData;
	reg clk;
	reg rst;

	// Outputs
	wire [31:0] rsReadData;
	wire [31:0] rtReadData;

	// Instantiate the Unit Under Test (UUT)
	RegisterFile uut (
		.rs(rs), 
		.rt(rt), 
		.rd(rd), 
		.regWrite(regWrite), 
		.writeData(writeData), 
		.rsReadData(rsReadData), 
		.rtReadData(rtReadData), 
		.clk(clk), 
		.rst(rst)
	) ;

	always #10 clk = ~clk ;	// clock cycle time (CCT) = 20ns

	initial begin
		// Initialize Inputs
		rs = 0;
		rt = 0;
		rd = 0;
		regWrite = 0;
		writeData = 0;
		clk = 1;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#100 rst = 0 ;
		
		rs = 5'b00001 ;		// source reg1 = $1
		rt = 5'b00010 ;		// source reg1 = $2
		$display("\n +++ READ FROM REGISTER AFTER RESET +++") ;	// picked any two registers
		#10 $display(" [After reset] [-ve edge 1] rs: %d | rs: %d", rsReadData, rtReadData) ;
		#10 $display(" [After reset] [+ve edge 2] rs: %d | rs: %d", rsReadData, rtReadData) ;

		#20 ;	// wait 1 clock cycle
		regWrite = 1'b1 ;	// write enabled
		rd = 5'b00110 ;		// dest reg = $3
		writeData = 12345 ;
		rs = 5'b00110 ;		// read from the dest reg (rs = rd)
		$display("\n +++ WRITE TO REGISTER & READ ITS CONTENT (1) +++") ;
		#10 $display(" [After write op1] [-ve edge 1] rd: %d | write-data: %d", rsReadData, writeData) ;	// read operation only (prints old value because write-op has not yet happened)
		#10 ; // write operation happens only at +ve edge (wait for half clock cycle)
		#1  $display(" [After write op1] [-ve edge 2] rd: %d | write-data: %d", rsReadData, writeData) ;	// read operation only (prints new value because write-op is completed)
		
		#20 ;	// wait 1 clock cycle
		regWrite = 1'b1 ;	// write enabled
		rd = 5'b00110 ;		// dest reg = $3
		writeData = 67890 ;
		rs = 5'b00110 ;		// read from the dest reg (rs = rd)
		$display("\n +++ WRITE TO REGISTER & READ ITS CONTENT (2) +++") ;
		#10 $display(" [After write op2] [-ve edge 1] rd: %d | write-data: %d", rsReadData, writeData) ;	// read operation only (prints old value because write-op has not yet happened)
		#10 ; // write operation happens only at +ve edge (wait for half clock cycle)
		#1  $display(" [After write op2] [-ve edge 2] rd: %d | write-data: %d", rsReadData, writeData) ;	// read operation only (prints new value because write-op is completed)
		
		#20 ;	// wait 1 clock cycle
		regWrite = 1'b0 ;	// write disabled
		rs = 5'b00110 ;		// read from the older dest reg (rd)
		$display("\n +++ READ FROM A REGISTER +++") ;
		#10 $display(" [After read op] [-ve edge] rs: %d", rsReadData) ;	// read operation only (print latest value)

		#10 ;
		regWrite = 1'b1 ;	// write enabled
		rd = 5'b00000 ;		// dest reg = $0 = $zero (try overwriting constant value in the $zero register)
		writeData = 98765 ;
		rs = 5'b00000 ;		// read from the dest reg (rs = rd = $0)
		$display("\n +++ TRY WRITING TO $0 REGISTER +++") ;
		#10 $display(" [After write op3] [-ve edge 1] rd: %d | write-data: %d", rsReadData, writeData) ;	// read operation only (prints old value because write-op has not yet happened)
		#10 ; // write operation happens only at +ve edge (wait for half clock cycle)
		#1  $display(" [After write op3] [-ve edge 2] rd: %d | write-data: %d", rsReadData, writeData) ;	// read operation only (should print the old value because $0 register is read-only)
		$display("\n") ;
	end
endmodule