
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 07 -- Test-bench for DataMemory module
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)

`timescale 1ns / 1ps

// Pre-Requisites
// Please load the following .coe files in the respective ip-cores before simulating the testbench.
//	DATA MEMORY:	 	Load the .coe file "A7_19CS10044_19CS30053/KGP_RISC/UNIT_TESTING/__data_memory__.coe" in SINGLE_PORT_RAM ip-core.

module TestBench_DataMemory;

	// Inputs
	reg clk;
	reg memWrite;
	reg [31:0] address;
	reg [31:0] writeData;

	// Outputs
	wire [31:0] readData;

	// Instantiate the Unit Under Test (UUT)
	DataMemory uut (
		.clk(clk), 
		.memWrite(memWrite), 
		.address(address), 
		.writeData(writeData), 
		.readData(readData)
	);
	
	always #10 clk = ~clk ; 

	initial begin
		// Initialize Inputs
		clk = 1'b0;
		memWrite = 1'b0;
		address = 32'b0;
		writeData = 32'b0;

		// Wait 100 ns for global reset to finish
		#100;
		clk = 1'b1 ;
		$display("\n +++ READ FROM MEMORY +++") ;

		address = 32'd0 ;
		#20 $display(" Address: %b (%d) | Data: %d", address, address, readData) ; 	// Read data from address 0
		
		address = 32'd4 ;
		#20 $display(" Address: %b (%d) | Data: %d", address, address, readData) ;  	// Read data from address 4

		address = 32'd8 ;
		#20 $display(" Address: %b (%d) | Data: %d", address, address, readData) ;  	// Read data from address 8

		address = 32'd12 ;
		#20 $display(" Address: %b (%d) | Data: %d", address, address, readData) ;  	// Read data from address 12

		address = 32'd16 ;
		#20 $display(" Address: %b (%d) | Data: %d", address, address, readData) ;  	// Read data from address 16

		address = 32'd20 ;
		#20 $display(" Address: %b (%d) | Data: %d", address, address, readData) ;  	// Read data from address 20

		$display("\n +++ WRITE TO MEMORY +++") ;
		address = 32'd24 ;
		memWrite = 1'b1;
		writeData = 32'd1234;
		$display(" [BEFORE WRITE] Address: %b (%d) | Data: %d", address, address, readData) ;  	// Read data from address 24 (before write)
		#20 ;
		memWrite = 1'b0;
		#20 $display(" [AFTER WRITE] Address: %b (%d) | Data: %d", address, address, readData) ;  	// Read data from address 24 (after write)

	end

endmodule
