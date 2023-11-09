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

  assign VGA_R = valid ? hdata[9:6] : 4'b0;
  assign VGA_G = valid ? vdata[9:6] : 4'b0;
  assign VGA_B = valid ? vdata[9:6] : 4'b0;

endmodule
