`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2023 10:02:15 PM
// Design Name: 
// Module Name: clkdiv_5hz
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module ClkDiv_5Hz(
		CLK,
		RST,
		CLKOUT
);

   input            CLK;		// 100MHz onboard clock
   input            RST;		// Reset
   output           CLKOUT;	// New clock output
   
   reg CLKOUT;
	
   // Current count value
   reg [23:0]       clkCount = 24'h000000;
   // Value to toggle output clock at
   parameter [23:0] cntEndVal = 24'h989680;
   
//  ===================================================================================
// 							  				Implementation
//  ===================================================================================
   
		//------------------------------------------------
		//	5Hz Clock Divider Generates Send/Receive signal
		//------------------------------------------------
		always @(posedge CLK or posedge RST)
			
			// Reset clock
			if (RST == 1'b1) begin
					CLKOUT <= 1'b0;
					clkCount <= 24'h000000;
			end
			else begin
					if (clkCount == cntEndVal) begin
						CLKOUT <= (~CLKOUT);
						clkCount <= 24'h000000;
					end
					else begin
						clkCount <= clkCount + 1'b1;
					end
			end
   
endmodule