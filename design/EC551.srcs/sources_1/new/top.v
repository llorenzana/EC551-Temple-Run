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

wire [11:0] hdata, vdata;
wire valid;

wire CLK25MHZ;

pll pll_i(
  .clk_in1(CLK100MHZ),
  .clk_out1(CLK25MHZ)
);

vga vga_i(
  .clk(CLK25MHZ),
  .hsync(VGA_HS),
  .vsync(VGA_VS),
  .hdata(hdata),
  .vdata(vdata),
  .valid(valid)
);

assign VGA_R = (hdata >=   0 && hdata < 200) ? 4'b1111 : 4'b0000;
assign VGA_G = (hdata >= 200 && hdata < 400) ? 4'b1111 : 4'b0000;
assign VGA_B = (hdata >= 400 && hdata < 640) ? 4'b1111 : 4'b0000;
endmodule
