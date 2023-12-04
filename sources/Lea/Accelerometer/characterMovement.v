`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2023 09:16:13 PM
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


module characterMovement #(parameter X = 260, Y = 350)(
	input clk,
	input [9:0] ACL_IN,
	input rst,
	input win_rst,
	output reg [9:0] char_x,
	output [8:0]  char_y
    );
    
	reg [7:0] 	  v_x;
	assign char_y = Y;
	
	always @ (posedge clk) begin
        if (rst == 1 || win_rst == 1) begin
            char_x <= X; // Reset to default position
            v_x <= 120; //adjust to pixel range 
        end else begin
            // Move Left
            if (ACL_IN >= 0 && ACL_IN <= 212 && char_x > 0)
                char_x <= char_x - v_x;

            // Move Right
            else if (ACL_IN >= 416 && ACL_IN <= 469 && char_x < 469)
                char_x <= char_x + v_x;
            // No movement for ACL_IN between 213 and 415
            else
                char_x <= char_x;
        end
    end
                                  
endmodule
