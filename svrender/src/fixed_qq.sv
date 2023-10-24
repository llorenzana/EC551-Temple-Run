module fixed_qq #(
    parameter integer TOTAL_PREC = 18,
    parameter integer FRAC_BITS = 13
) (
    input wire logic clk,
    input wire logic signed [TOTAL_PREC - 1 : 0] q1 [3:0],
    input wire logic signed [TOTAL_PREC - 1 : 0] q2 [3:0],
    output logic signed [TOTAL_PREC - 1 : 0] res [3:0]
);
//res[2:0]: q1[2:0] * q2[2:0] + q1[2:0] * q2[3] + q2[2:0] * q1[3],
//res[3]: q1[3] * q2[3] - q1[2:0].dot(q2[2:0]),
logic signed [TOTAL_PREC - 1 : 0] r1 [2:0];
logic signed [TOTAL_PREC - 1 : 0] r2d [2:0];
logic signed [TOTAL_PREC - 1 : 0] r3d [2:0];
logic signed [TOTAL_PREC - 1 : 0] r2 [2:0];
logic signed [TOTAL_PREC - 1 : 0] r3 [2:0];
fixed_cross #(TOTAL_PREC, FRAC_BITS) fc0 (.clk(clk), .a(q1[2:0]), .b(q2[2:0]), .res(r1));
fixed_sv #(TOTAL_PREC, FRAC_BITS) fs0 (.clk(clk), .a(q1[2:0]), .b(q2[3]), .res(r2d));
fixed_sv #(TOTAL_PREC, FRAC_BITS) fs1 (.clk(clk), .a(q2[2:0]), .b(q1[3]), .res(r3d));
always_ff @(posedge clk) begin
    r2 <= r2d;
    r3 <= r3d;
    res[2] <= r1[2] + r2[2] + r3[2];
    res[1] <= r1[1] + r2[1] + r3[1];
    res[0] <= r1[0] + r2[0] + r3[0];
end

logic signed [TOTAL_PREC - 1 : 0] q13d [3:0];
logic signed [TOTAL_PREC - 1 : 0] q23d [3:0];
assign q13d[0] = q1[3];
assign q23d[0] = q2[3];
always_ff @(posedge clk) begin
    q13d[3 : 1] <= q13d[2 : 0];
    q23d[3 : 1] <= q23d[2 : 0];
end

logic signed [TOTAL_PREC - 1 : 0] r4;
logic signed [TOTAL_PREC - 1 : 0] r5;
fixed_dot #(TOTAL_PREC, FRAC_BITS) fd0 (.clk(clk), .a(q1[2:0]), .b(q2[2:0]), .res(r4));
fixed_mult #(TOTAL_PREC, FRAC_BITS) fm0 (.a(q13d[3]), .b(q23d[3]), .res(r5));
always_ff @(posedge clk) begin
    res[3] <= r5 - r4;
end
endmodule
