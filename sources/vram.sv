module vram #(parameter DATA_WIDTH=13, parameter ADDR_WIDTH=12) (
   input logic                     clk,
   input logic [ADDR_WIDTH - 1:0] addr,
  output logic [DATA_WIDTH - 1:0] data
);

  reg [DATA_WIDTH - 1:0] ram [2 ** ADDR_WIDTH - 1:0];

  initial begin
    $readmemb("background.txt", ram);
  end

  always_ff @(posedge clk) begin
    data <= ram[addr];
  end
endmodule
