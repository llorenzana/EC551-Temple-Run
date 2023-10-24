// Delay = 3 cycles
module fixed_cross #(
    parameter integer TOTAL_PREC = 27,
    parameter integer FRAC_BITS = 22
) (
    input wire logic clk,
    input wire logic signed [TOTAL_PREC - 1 : 0] a [2:0],
    input wire logic signed [TOTAL_PREC - 1 : 0] b [2:0],
    output logic signed [TOTAL_PREC - 1 : 0] res [2:0]
);

    logic signed [TOTAL_PREC - 1 : 0] ad [2:0];
    logic signed [TOTAL_PREC - 1 : 0] bd [2:0];

    always_ff @(posedge clk) begin
        ad <= a;
        bd <= b;
    end

    logic signed [TOTAL_PREC - 1 : 0] a1b2;
    logic signed [TOTAL_PREC - 1 : 0] a1b2d;
    fixed_mult #(TOTAL_PREC, FRAC_BITS) fixed_mult_a1b2 (.a(ad[1]), .b(bd[2]), .res(a1b2));

    logic signed [TOTAL_PREC - 1 : 0] a2b1;
    logic signed [TOTAL_PREC - 1 : 0] a2b1d;
    fixed_mult #(TOTAL_PREC, FRAC_BITS) fixed_mult_a2b1 (.a(ad[2]), .b(bd[1]), .res(a2b1));

    logic signed [TOTAL_PREC - 1 : 0] a2b0;
    logic signed [TOTAL_PREC - 1 : 0] a2b0d;
    fixed_mult #(TOTAL_PREC, FRAC_BITS) fixed_mult_a2b0 (.a(ad[2]), .b(bd[0]), .res(a2b0));

    logic signed [TOTAL_PREC - 1 : 0] a0b2;
    logic signed [TOTAL_PREC - 1 : 0] a0b2d;
    fixed_mult #(TOTAL_PREC, FRAC_BITS) fixed_mult_a0b2 (.a(ad[0]), .b(bd[2]), .res(a0b2));

    logic signed [TOTAL_PREC - 1 : 0] a0b1;
    logic signed [TOTAL_PREC - 1 : 0] a0b1d;
    fixed_mult #(TOTAL_PREC, FRAC_BITS) fixed_mult_a0b1 (.a(ad[0]), .b(bd[1]), .res(a0b1));

    logic signed [TOTAL_PREC - 1 : 0] a1b0;
    logic signed [TOTAL_PREC - 1 : 0] a1b0d;
    fixed_mult #(TOTAL_PREC, FRAC_BITS) fixed_mult_a1b0 (.a(ad[1]), .b(bd[0]), .res(a1b0));

    always_ff @(posedge clk) begin
        { a1b2d, a2b1d, a2b0d, a0b2d, a0b1d, a1b0d } <= { a1b2, a2b1, a2b0, a0b2, a0b1, a1b0 };
    end

    logic signed [TOTAL_PREC - 1 : 0] resd [2:0];
    assign resd[0] = a1b2d - a2b1d;
    assign resd[1] = a2b0d - a0b2d;
    assign resd[2] = a0b1d - a1b0d;

    always_ff @(posedge clk) begin
        res <= resd;
    end
endmodule
