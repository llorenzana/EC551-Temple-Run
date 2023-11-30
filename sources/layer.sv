`timescale 1ns / 1ps

module layer #(
    parameter DEPTH      = 4,
              HWIDTH     = 12,
              VWIDTH     = 12,
              DATA_WIDTH = 13,
              SIZE       = 19200,
              ADDR_WIDTH = $clog2(SIZE),
              INIT       = "init.mem",
              IWIDTH     = 2,
              AWIDTH     = 15,
              HSIZE      = 640,
              VSIZE      = 480

) (
    input  logic                    clk,
    input  logic [    HWIDTH - 1:0] hdata,
    input  logic [    VWIDTH - 1:0] vdata,
    input  logic [    HWIDTH - 1:0] hoffset,
    input  logic [    VWIDTH - 1:0] voffset,
    input  logic [DATA_WIDTH - 1:0] prev,
    output logic [DATA_WIDTH - 1:0] next
);

  logic [DATA_WIDTH - 1:0] data[1];

  compositor #(
      .WIDTH(DATA_WIDTH)
  ) compositor (
      .prev(prev),
      .curr(data[0]),
      .next(next)
  );

  logic [AWIDTH - 1:0] addr[1];
  logic valid[1];

  transformer #(
      .IWIDTH(IWIDTH),
      .HWIDTH(HWIDTH),
      .HSIZE (HSIZE),
      .VWIDTH(VWIDTH),
      .VSIZE (VSIZE),
      .AWIDTH(AWIDTH)
  ) transformer (
      .hdata(hdata),
      .vdata(vdata),
      .hoffset(hoffset),
      .voffset(voffset),
      .addr(addr[0]),
      .valid(valid[0])
  );

  vram #(
      .WIDTH(DATA_WIDTH),
      .DEPTH(SIZE),
      .INIT (INIT),
      .PORTS(1)
  ) vram (
      .clk (clk),
      .addr(addr),
      .en  (valid),
      .data(data)
  );

endmodule
