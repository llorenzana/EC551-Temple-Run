`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2023 09:11:20 PM
// Design Name: 
// Module Name: ss
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


module ss(
    input rst,
    input clk,
    input transmit,
    input done,
    output ss
    );
    
    reg     ss = 1'b1;

    //-----------------------------------------------
    //			  Generates Slave Select Signal
    //-----------------------------------------------
    always @(posedge clk)
    begin: ssprocess
        
        begin
            //reset state, ss goes high ( disabled )
            if (rst == 1'b1)
                ss <= 1'b1;
            //if transmitting, then ss goes low ( enabled )
            else if (transmit == 1'b1)
                ss <= 1'b0;
            //if done, then ss goes high ( disabled )
            else if (done == 1'b1)
                ss <= 1'b1;
        end
    end
    
endmodule
