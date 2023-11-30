`timescale 1ns / 1ps

module vram #(
    parameter  WIDTH,
    parameter  DEPTH,
    parameter  PORTS,
    parameter  INIT,
    localparam AWIDTH = $clog2(DEPTH)
) (
    input  logic                clk,
    input  logic                en  [PORTS],
    input  logic [AWIDTH - 1:0] addr[PORTS],
    output logic [ WIDTH - 1:0] data[PORTS]
);

  logic [WIDTH - 1:0] ram[DEPTH - 1:0];

  initial begin
    $readmemb(INIT, ram);
  end

  always_ff @(posedge clk) begin
    for (integer i = 0; i < PORTS; i = i + 1) begin
      if (en[i]) begin
        data[i] <= ram[addr[i]];
      end else begin
        data[i] <= 0;
      end
    end
  end

endmodule
