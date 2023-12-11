`timescale 1ns / 1ps

module layer #(
    parameter integer                    HWIDTH     = 12,
              integer                    VWIDTH     = 12,
              integer                    DATA_WIDTH = 13,
              integer                    SIZE       = 19200,
              integer                    IWIDTH     = 2,
              integer                    AWIDTH     = 15,
              logic signed [HWIDTH -1:0] HSIZE      = 640,
              logic signed [VWIDTH -1:0] VSIZE      = 480,
              integer                    REPLICAS   = 1,
              string                     INIT

) (
    input  logic                    clk,
    input  logic [    HWIDTH - 1:0] hdata,
    input  logic [    VWIDTH - 1:0] vdata,
    input  logic [    HWIDTH - 1:0] hoffset[REPLICAS],
    input  logic [    VWIDTH - 1:0] voffset[REPLICAS],
    input  logic                    hflip  [REPLICAS],
    input  logic                    vflip  [REPLICAS],
    input  logic [DATA_WIDTH - 1:0] prev,
    output logic [DATA_WIDTH - 1:0] next
);

  logic [DATA_WIDTH - 1:0] data[REPLICAS];
  logic [DATA_WIDTH - 1:0] dbus[REPLICAS+1]  /*verilator split_var*/;
  logic [AWIDTH - 1:0] addr[REPLICAS];
  logic valid[REPLICAS];

  always_comb begin
    dbus[0] = prev;
    next = dbus[REPLICAS];
  end

  genvar i;

  generate
    for (i = 0; i < REPLICAS; i = i + 1) begin
      compositor #(
          .WIDTH(DATA_WIDTH)
      ) compositor (
          .prev(dbus[i]),
          .curr(data[i]),
          .next(dbus[i+1])
      );
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
          .hoffset(hoffset[i]),
          .voffset(voffset[i]),
          .hflip(hflip[i]),
          .vflip(vflip[i]),
          .addr(addr[i]),
          .valid(valid[i])
      );
    end
  endgenerate

  vram #(
      .WIDTH(DATA_WIDTH),
      .DEPTH(SIZE),
      .INIT (INIT),
      .PORTS(REPLICAS)
  ) vram (
      .clk (clk),
      .addr(addr),
      .en  (valid),
      .data(data)
  );

endmodule
