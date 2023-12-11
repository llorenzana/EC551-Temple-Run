`timescale 1ns / 1ps

module vga #(
    parameter HWIDTH = 12,
              HSIZE  = 640,
              HFP    = 656,
              HSP    = 752,
              HMAX   = 800,
              VWIDTH = 12,
              VSIZE  = 480,
              VFP    = 490,
              VSP    = 492,
              VMAX   = 525,
              HSPP   = 1,
              VSPP   = 1
) (
    input  wire                clk,
    output wire                hsync,
    output wire                vsync,
    output reg  [HWIDTH - 1:0] hdata,
    output reg  [VWIDTH - 1:0] vdata,
    output wire                valid
);

  // hdata
  always @(posedge clk) begin
    if (hdata == (HMAX - 1)) hdata <= 0;
    else hdata <= hdata + 1;
  end

  // vdata
  always @(posedge clk) begin
    if (hdata == (HMAX - 1)) begin
      if (vdata == (VMAX - 1)) vdata <= 0;
      else vdata <= vdata + 1;
    end
  end

  // hsync & vsync & blank
  assign hsync = ((hdata >= HFP) && (hdata < HSP)) ? HSPP : !HSPP;
  assign vsync = ((vdata >= VFP) && (vdata < VSP)) ? VSPP : !VSPP;
  assign valid = ((hdata < HSIZE) & (vdata < VSIZE));

endmodule
