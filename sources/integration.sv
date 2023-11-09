`timescale 1ns / 1ps

module integration(
   input logic       CLK100MHZ,
  output logic          VGA_HS,
  output logic          VGA_VS,
  output logic [3:0]     VGA_R,
  output logic [3:0]     VGA_G,
  output logic [3:0]     VGA_B
);

  wire [11:0] hdata, vdata;
  wire valid;

  vga vga_i(
    .clk(CLK100MHZ), // FIXME: should be CLK25MHZ
    .hsync(VGA_HS),
    .vsync(VGA_VS),
    .hdata(hdata),
    .vdata(vdata),
    .valid(valid)
  );

  assign VGA_R = hdata[9:6];
  assign VGA_G = hdata[9:6];
  assign VGA_B = hdata[9:6];

endmodule
