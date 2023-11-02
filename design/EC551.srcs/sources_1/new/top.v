`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2023 07:53:20 PM
// Design Name: 
// Module Name: top
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


module top(
// clock
input wire CLK100MHZ,

// reset
input wire CPU_RESETN,

// 
input wire ACL_MISO,
output wire ACL_MOSI,
output wire ACL_SCLK,
output wire ACL_CSN,
input wire [2:1] ACL_INT,

// 7 segment display
output wire CA,
output wire CB,
output wire CC,
output wire CD,
output wire CE,
output wire CF,
output wire CG,
output wire DP,
output wire [7:0] AN,

// VGA display
output wire [3:0] VGA_R,
output wire [3:0] VGA_G,
output wire [3:0] VGA_B,
output wire VGA_HS,
output wire VGA_VS,

// audio
output wire AUD_PWM
);
endmodule
