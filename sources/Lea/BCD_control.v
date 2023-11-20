`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2023 08:01:55 PM
// Design Name: 
// Module Name: BCD_control
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


module BCD_control(
    input [4:0] digit0,
    input [4:0] digit1,
    input [4:0] digit2,
    input [4:0] digit3,
    input [4:0] digit4,
    input [4:0] digit5,
    input [4:0] digit6,
    input [4:0] digit7,
    input [3:0] refreshcounter,
    input gameover,
    output reg [3:0] ONEDIGIT
    );
    
    
    always@(refreshcounter) 
        case(refreshcounter)
            3'b000:
                ONEDIGIT <= gameover ? 5'b01110 : digit0;
            
            3'b001:
                ONEDIGIT <= gameover ? 5'b01111 : digit1;
  
            3'b010:
                ONEDIGIT <= gameover ? 5'b01111 : digit2;

            3'b011:
                ONEDIGIT <= gameover ? 5'b10001:  digit3;

            3'b100: 
                ONEDIGIT <= gameover ? 5'b00000 : 4'b1101;

            3'b101:
                ONEDIGIT <= gameover ? 5'b10010 : 4'b1100;

            3'b110:
                ONEDIGIT <= gameover ? 5'b10001 : 4'b1011;

            default: 
                ONEDIGIT <= gameover ? 5'b10011 : 4'b1010;
        endcase 
    
endmodule
