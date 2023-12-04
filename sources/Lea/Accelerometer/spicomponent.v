`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2023 08:56:11 PM
// Design Name: 
// Module Name: spicomponent
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


module spicomponent(
   input CLK,
   input RST,
   input START,
   input SDI,
   output SDO,
   output SCLK,
   output SS,
   output [9:0] yAxis
    );
    
   wire [9:0] 	 yAxis;
   wire [15:0]  TxBuffer;
   wire [7:0]   RxBuffer;
   wire         doneConfigure;
   wire         done;
   wire         transmit;
   
		
   spi_master C0( .rst(RST),
                .start(START),
                .clk(CLK),
                .transmit(transmit),
                .txdata(TxBuffer),
                .rxdata(RxBuffer),
                .done(done),
                .y_axis_data(yAxis));
    
    spi_interface C1(.sdi(SDI),
                .sdo(SDO),
                .rst(RST),
                .clk(CLK),
                .sclk(SCLK),
                .txbuffer(TxBuffer),
                .rxbuffer(RxBuffer),
                .done_out(done),
                .transmit(transmit));
   
    ss C2(.clk(CLK),
                .ss(SS),
                .done(done),
                .transmit(transmit),
                .rst(RST)
    );
endmodule
