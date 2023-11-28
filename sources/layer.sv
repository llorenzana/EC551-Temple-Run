`timescale 1ns / 1ps

module layer #(parameter DEPTH      =                   4,
                         HWIDTH     =                  12,
                         VWIDTH     =                  12,
                         DATA_WIDTH =                  13,
                         SIZE       =               19200,
                         ADDR_WIDTH =        $clog2(SIZE),
                         INIT       =          "init.mem",
                         IWIDTH     =                   2,
                         AWIDTH     =                  15,
                         HSIZE      = 640 / (2 ** IWIDTH),
                         VSIZE      = 480 / (2 ** IWIDTH)

) (
   input logic                           clk,
   input logic        [HWIDTH - 1:0]   hdata,
   input logic        [VWIDTH - 1:0]   vdata,

   input logic signed [HWIDTH - 1:0] hoffset,
   input logic signed [VWIDTH - 1:0] voffset,

   input logic [DEPTH - 1:0]   R_prev,
   input logic [DEPTH - 1:0]   G_prev,
   input logic [DEPTH - 1:0]   B_prev,
   input logic                 A_prev,

  output logic [DEPTH - 1:0]   R_next,
  output logic [DEPTH - 1:0]   G_next,
  output logic [DEPTH - 1:0]   B_next,
  output logic                 A_next
);

  logic [DEPTH - 1:0] R, G, B;
  logic A;

  compositor #(.DEPTH(DEPTH)) compositor(
    .R_prev(R_prev),
    .G_prev(G_prev),
    .B_prev(B_prev),
    .A_prev(A_prev),
    .R_curr(R),
    .G_curr(G),
    .B_curr(B),
    .A_curr(A),
    .R_next(R_next),
    .G_next(G_next),
    .B_next(B_next),
    .A_next(A_next)
  );

  logic [DATA_WIDTH - 1:0] data;
  logic [ADDR_WIDTH - 1:0] addr;
  logic valid;

  transformer #(
    .IWIDTH(IWIDTH),
    .HWIDTH(HWIDTH),
    .HSIZE(HSIZE),
    .VWIDTH(VWIDTH),
    .VSIZE(VSIZE),
    .AWIDTH(AWIDTH)
  ) transformer(
    .hdata(hdata),
    .vdata(vdata),
    .hoffset(hoffset),
    .voffset(voffset),
    .addr(addr),
    .valid(valid)
  );

  vram #(
    .DATA_WIDTH(DATA_WIDTH),
    .SIZE(SIZE),
    .ADDR_WIDTH(ADDR_WIDTH),
    .INIT(INIT)
  ) vram(
    .clk(clk),
    .addr(addr),
    .en(valid),
    .data(data)
  );

  // FIXME: not parameterized
  assign R = valid ? data[12:9] : 4'b0;
  assign G = valid ? data[ 8:5] : 4'b0;
  assign B = valid ? data[ 4:1] : 4'b0;
  assign A = valid ? data[   0] : 1'b0;
endmodule
