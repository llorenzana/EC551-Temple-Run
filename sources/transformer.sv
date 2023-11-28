`timescale 1ns / 1ps

module transformer #(
  parameter IWIDTH =                   2,
            HWIDTH =                  12,
             HSIZE =                 640,
            VWIDTH =                  12,
             VSIZE =                 480,
            AWIDTH =                  15
) (
   input logic        [HWIDTH - 1:0]   hdata,
   input logic        [VWIDTH - 1:0]   vdata,
   input logic signed [HWIDTH - 1:0] hoffset,
   input logic signed [VWIDTH - 1:0] voffset,
  output logic        [AWIDTH - 1:0]    addr,
  output logic                         valid
);
  logic [HWIDTH - 1 - IWIDTH:0] haddr;
  logic [VWIDTH - 1 - IWIDTH:0] vaddr;
  always_comb begin
    haddr = {hdata + hoffset}[HWIDTH - 1:IWIDTH];
    vaddr = {vdata + voffset}[VWIDTH - 1:IWIDTH];

    addr  = vaddr * HSIZE[HWIDTH - 1:IWIDTH] + AWIDTH'(haddr);
    valid = (vaddr < VSIZE[VWIDTH - 1:IWIDTH]) & (haddr < HSIZE[HWIDTH - 1:IWIDTH]);
  end
endmodule
