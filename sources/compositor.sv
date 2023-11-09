module compositor #(parameter DEPTH = 4) (
   input logic [DEPTH - 1:0]   R_prev,
   input logic [DEPTH - 1:0]   G_prev,
   input logic [DEPTH - 1:0]   B_prev,
   input logic                 A_prev,

   input logic [DEPTH - 1:0]   R_curr,
   input logic [DEPTH - 1:0]   G_curr,
   input logic [DEPTH - 1:0]   B_curr,
   input logic                 A_curr,

  output logic [DEPTH - 1:0]   R_next,
  output logic [DEPTH - 1:0]   G_next,
  output logic [DEPTH - 1:0]   B_next,
  output logic                 A_next
);
  always_comb begin
    R_next = A_curr ? R_curr : R_prev;
    G_next = A_curr ? G_curr : G_prev;
    B_next = A_curr ? B_curr : B_prev;
    A_next = A_curr ? A_curr : A_prev;
  end
endmodule
