module rotation #(
    parameter integer TOTAL_PREC = 18,
    parameter integer FRAC_BITS = 13
) (
    input wire logic clk,
    input wire logic signed [TOTAL_PREC - 1 : 0] a [2:0],
    input wire logic signed [TOTAL_PREC - 1 : 0] b [2:0],
    input wire logic signed [TOTAL_PREC - 1 : 0] c [2:0],
    input wire logic signed [TOTAL_PREC - 1 : 0] n [2:0],
    input wire logic signed [TOTAL_PREC - 1 : 0] q [3:0],
    output logic signed [TOTAL_PREC - 1 : 0] oa [2:0],
    output logic signed [TOTAL_PREC - 1 : 0] ob [2:0],
    output logic signed [TOTAL_PREC - 1 : 0] oc [2:0],
    output logic signed [TOTAL_PREC - 1 : 0] on [2:0]
);
    fixed_qv #(.TOTAL_PREC(TOTAL_PREC), .FRAC_BITS(FRAC_BITS)) qv0(.v(a), .q(q),.clk(clk),.res(oa));
    fixed_qv #(.TOTAL_PREC(TOTAL_PREC), .FRAC_BITS(FRAC_BITS)) qv1(.v(b), .q(q),.clk(clk),.res(ob));
    fixed_qv #(.TOTAL_PREC(TOTAL_PREC), .FRAC_BITS(FRAC_BITS)) qv2(.v(c), .q(q),.clk(clk),.res(oc));
    fixed_qv #(.TOTAL_PREC(TOTAL_PREC), .FRAC_BITS(FRAC_BITS)) qv3(.v(n), .q(q),.clk(clk),.res(on));
endmodule
