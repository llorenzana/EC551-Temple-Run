`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2023 08:02:44 PM
// Design Name: 
// Module Name: BCD_to_cathodes
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


module BCD_to_cathodes(
    input [4:0] bcd,
    output reg [6:0]seg
    );
    
    always @(bcd) 
    begin 
        case (bcd) //          GFEDCBA
            5'b00000 : seg = 7'b1000000; //0
            5'b00001 : seg = 7'b1111001; //1
            5'b00010 : seg = 7'b0100100; //2
            5'b00011 : seg = 7'b0110000; //3
            5'b00100 : seg = 7'b0011001; //4
            5'b00101 : seg = 7'b0010010; //5
            5'b00110 : seg = 7'b0000010; //6
            5'b00111 : seg = 7'b1111000; //7
            5'b01000 : seg = 7'b0000000; //8
            5'b01001 : seg = 7'b0011000; //9
            
            5'b01010: seg = 7'b0001100; //P
            5'b01011: seg = 7'b0000111; //t
            5'b01100: seg = 7'b0010010; //S
            5'b01101: seg = 7'b0111111; //dash  
            
            5'b01110: seg = 7'b0000010; //G
            5'b01111: seg = 7'b1001000;//half M
            5'b10001: seg = 7'b0000110; //E
            5'b10010: seg = 7'b1000001 ; //V
            5'b10011: seg = 7'b0001000 ; //R
                            
            default : seg = 7'b1111111; //null
        endcase 
    end 
    
endmodule
