`timescale 1ns / 1ps

module compositor #(
    parameter WIDTH
) (
    input  logic [WIDTH - 1:0] prev,
    input  logic [WIDTH - 1:0] curr,
    output logic [WIDTH - 1:0] next
);

  always_comb begin
    next = curr[0] ? curr : prev;
  end

endmodule
