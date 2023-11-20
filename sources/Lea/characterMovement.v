`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2023 09:07:36 PM
// Design Name: 
// Module Name: characterMovement
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


module characterMovement(
    input clk,            // nexys a7 clock
    input ACL_MISO,             // master in
    output ACL_MOSI,            // master out
    output ACL_SCLK,            // spi sclk
    output ACL_CSN,             // spi ~chip select
    output [4:0] LED        
    );
    
    wire w_4MHz;
    wire [4:0] acl_data;
        
    clkAccelerometer clock_generation(
        .clk(clk),
        .clk_4MHz(w_4MHz)
    );
    
    spiMaster master(
        .clk(w_4MHz),
        .miso(ACL_MISO),
        .sclk(ACL_SCLK),
        .mosi(ACL_MOSI),
        .cs(ACL_CSN),
        .acl_data(acl_data)
    );

    assign LED[4:0] = acl_data[4:0];    // 5 bits of x data
    
endmodule
