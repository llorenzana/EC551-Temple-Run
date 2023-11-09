`timescale 1ns / 1ps

module transformer #(
  parameter IWIDTH =                   2,
            HWIDTH =                  12,
             HSIZE = 640 / (2 ** IWIDTH),
            VWIDTH =                  12,
             VSIZE = 480 / (2 ** IWIDTH),
            AWIDTH =                  15
) (
   input logic [HWIDTH - 1:0] hdata,
   input logic [VWIDTH - 1:0] vdata,
  output logic [AWIDTH - 1:0]  addr
);
  always_comb begin
    addr = vdata[VWIDTH - 1:IWIDTH] * HSIZE + AWIDTH'(hdata[HWIDTH - 1:IWIDTH]);
  end
endmodule
