`timescale 1ns / 1ps

module transformer #(
  parameter IWIDTH =                   2,
            HWIDTH =                  12,
             HSIZE = 640 / (2 ** IWIDTH),
            VWIDTH =                  12,
             VSIZE = 480 / (2 ** IWIDTH),
            AWIDTH =                  15
) (
   input logic        [HWIDTH - 1:0]   hdata,
   input logic        [VWIDTH - 1:0]   vdata,
   input logic signed [HWIDTH - 1:0] hoffset,
   input logic signed [VWIDTH - 1:0] voffset,
  output logic        [AWIDTH - 1:0]    addr
);
  logic [HWIDTH - 1:0] haddr;
  logic [VWIDTH - 1:0] vaddr;
  always_comb begin
    haddr = hdata + hoffset;
    vaddr = vdata + voffset;
    addr = vaddr[VWIDTH - 1:IWIDTH] * HSIZE + AWIDTH'(haddr[HWIDTH - 1:IWIDTH]);
  end
endmodule
