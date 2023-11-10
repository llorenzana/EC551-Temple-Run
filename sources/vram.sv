`timescale 1ns / 1ps

module vram #(parameter DATA_WIDTH=13, ADDR_WIDTH=15, INIT="init.mem") (
   input logic                     clk,
   input logic                      en,
   input logic [ADDR_WIDTH - 1:0] addr,
  output logic [DATA_WIDTH - 1:0] data
);

  reg [DATA_WIDTH - 1:0] ram [2 ** ADDR_WIDTH - 1:0];

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
