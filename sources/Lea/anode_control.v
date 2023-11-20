`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2023 07:38:26 PM
// Design Name: 
// Module Name: anode_control
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


module anode_control(
    input [2:0] refreshcounter, 
    output reg [7:0] an 
    );
    
    always@(refreshcounter) 
        case(refreshcounter) 
            3'b000:
                an = 8'b11111110; //right most digit
            
            3'b001:
                an = 8'b11111101;
                
            3'b010:
                an = 8'b11111011;

            3'b011:
                an = 8'b11110111;

            3'b100: 
                an = 8'b11101111;

            3'b101:
                an = 8'b11011111;

            3'b110:
                an = 8'b10111111;

            default: 
                an = 8'b01111111;//left most digit
        endcase
        
endmodule

