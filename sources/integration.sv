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

  assign R[0] = valid ? counter[31:28] : 4'b0;
  assign G[0] = valid ? counter[27:24] : 4'b0;
  assign B[0] = valid ? counter[24:21] : 4'b0;
  assign A[0] = valid ?              1 : 1'b0;

  assign R[1] = valid ?      counter[24:21] : 4'b0;
  assign G[1] = valid ?      counter[31:28] : 4'b0;
  assign B[1] = valid ?      counter[27:24] : 4'b0;
  assign A[1] = valid ? vdata[5] ^ hdata[5] : 1'b0;

endmodule
