`timescale 1ns / 1ps

module transformer #(
    parameter HWIDTH,
              VWIDTH,
              AWIDTH,
              IWIDTH,
              HSIZE,
              VSIZE
) (
    input  logic [HWIDTH - 1:0] hdata,
    input  logic [VWIDTH - 1:0] vdata,
    input  logic [HWIDTH - 1:0] hoffset,
    input  logic [VWIDTH - 1:0] voffset,
    input  logic                hflip,
    input  logic                vflip,
    output logic [AWIDTH - 1:0] addr,
    output logic                valid
);

  logic [HWIDTH - 1:0] haddr;
  logic [VWIDTH - 1:0] vaddr;

  always_comb begin
    haddr = hflip ? HSIZE - (hdata - hoffset) : (hdata - hoffset);
    vaddr = vflip ? VSIZE - (vdata - voffset) : (vdata - voffset);

    addr  = AWIDTH'(vaddr[VWIDTH-1:IWIDTH] * HSIZE[HWIDTH-1:IWIDTH]) + AWIDTH'(haddr[HWIDTH-1:IWIDTH]);
    valid = (vaddr < VSIZE) & (haddr < HSIZE);
  end

endmodule
