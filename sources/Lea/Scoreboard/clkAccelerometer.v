`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2023 10:26:06 AM
// Design Name: 
// Module Name: clkAccelerometer
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


module clkAccelerometer( 
    input clk,        
    output clk_4MHz         // 4MHz clk
);
    
    reg [4:0] counter;
    reg clk_reg = 1'b1;
    
    always @(posedge clk) begin
        if(counter == 12)           // 0-12 is 13 ticks
            clk_reg <= ~clk_reg;
        if(counter == 24) begin     // 13-24 is 12 ticks
            clk_reg <= ~clk_reg;
            counter <= 5'b0;        // reset counter
        end
        else
            counter <= counter + 1;
    end

    assign clk_4MHz = clk_reg;

endmodule

