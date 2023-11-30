`timescale 1ns / 1ps

module vram #(
    parameter  WIDTH,
    parameter  DEPTH,
    parameter  INIT,
    localparam AWIDTH = $clog2(DEPTH)
) (
    input  logic                clk,
    input  logic                en,
    input  logic [AWIDTH - 1:0] addr,
    output logic [ WIDTH - 1:0] data
);

  logic [WIDTH - 1:0] ram[DEPTH - 1:0];

  initial begin
    $readmemb(INIT, ram);
  end

  always_ff @(posedge clk) begin
    if (en) begin
      data <= ram[addr];
    end else begin
      data <= 0;
    end
  end

endmodule
