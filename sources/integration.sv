`timescale 1ns / 1ps

module integration(
   input logic       CLK100MHZ,
  output logic          VGA_HS,
  output logic          VGA_VS,
  output logic [3:0]     VGA_R,
  output logic [3:0]     VGA_G,
  output logic [3:0]     VGA_B
);

  logic [31:0] counter;
  logic [11:0] hdata, vdata;
  logic valid;

  always_ff @(posedge CLK100MHZ) begin
    counter <= counter + 1;
  end

  vga vga_i(
    .clk(CLK100MHZ), // FIXME: should be CLK25MHZ
    .hsync(VGA_HS),
    .vsync(VGA_VS),
    .hdata(hdata),
    .vdata(vdata),
    .valid(valid)
  );

  logic [3:0] R [4:0], G [4:0], B [4:0];
  logic                         A [4:0];

  compositor compositor_i0(
    .R_prev(R[0]),
    .G_prev(G[0]),
    .B_prev(B[0]),
    .A_prev(A[0]),
    .R_curr(R[1]),
    .G_curr(G[1]),
    .B_curr(B[1]),
    .A_curr(A[1]),
    .R_next(VGA_R),
    .G_next(VGA_G),
    .B_next(VGA_B),
    .A_next()
  );

  logic [12:0] datab, dataf;
  logic [14:0] addr;

  transformer transformer_i(
    .hdata(hdata),
    .vdata(vdata),
    .addr(addr)
  );

  vram vram_i0(
    .clk(CLK100MHZ),
    .addr(addr),
    .data(datab)
  );

  defparam vram_i0.INIT = "../../artwork/background.txt";

  vram vram_i1(
    .clk(CLK100MHZ),
    .addr(addr),
    .data(dataf)
  );

  defparam vram_i1.INIT = "../../artwork/logo.txt";

  assign R[0] = valid ? datab[12:9] : 4'b0;
  assign G[0] = valid ? datab[ 8:5] : 4'b0;
  assign B[0] = valid ? datab[ 4:1] : 4'b0;
  assign A[0] = valid ? datab[   0] : 1'b0;

  assign R[1] = valid ? dataf[12:9] : 4'b0;
  assign G[1] = valid ? dataf[ 8:5] : 4'b0;
  assign B[1] = valid ? dataf[ 4:1] : 4'b0;
  assign A[1] = valid ? dataf[   0] : 1'b0;

endmodule
