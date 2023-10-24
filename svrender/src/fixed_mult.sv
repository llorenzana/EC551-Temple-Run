module fixed_mult #(
    parameter integer TOTAL_PREC = 27,
    parameter integer FRAC_BITS = 22
) (
    input wire logic signed [TOTAL_PREC - 1 : 0] a,
    input wire logic signed [TOTAL_PREC - 1 : 0] b,
    output logic signed [TOTAL_PREC - 1 : 0] res
);

    /* verilator lint_off UNUSED */
    logic signed [2 * TOTAL_PREC - 1 : 0] res_full;
    /* verilator lint_on UNUSED */

    assign res_full = a * b;

    assign res = res_full[FRAC_BITS + TOTAL_PREC - 1 : FRAC_BITS];
endmodule
