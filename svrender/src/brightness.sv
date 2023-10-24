module brightness #(
    parameter integer TOTAL_PREC = 27,
    parameter integer FRAC_BITS = 22
) (
    input wire logic signed [TOTAL_PREC - 1 : 0] tnorm [2:0],
    input wire logic signed [TOTAL_PREC - 1 : 0] dir [2:0],
    input wire logic clk,
    output logic [7 : 0] res
);
    logic signed [TOTAL_PREC - 1 : 0] tny2;
    assign tny2 = tnorm[1] << 1;
    logic signed [TOTAL_PREC - 1 : 0] prereflected [2:0];
    fixed_sv #(.TOTAL_PREC(TOTAL_PREC), .FRAC_BITS(FRAC_BITS)) fs0(.a(tnorm), .b(tny2), .clk(clk), .res(prereflected));
    logic signed [TOTAL_PREC - 1 : 0] dird [2:0] [2:0];
    assign dird[0] = dir;
    always_ff @(posedge clk) begin
       dird[2:1] <= dird[1:0];
    end
    logic signed [TOTAL_PREC - 1 : 0] reflected [2:0];
    assign reflected[0] = prereflected[0];
    assign reflected[1] = prereflected[1] + (-1 << FRAC_BITS);
    assign reflected[2] = prereflected[2];

    logic signed [TOTAL_PREC - 1 : 0] preres;
    fixed_dot #(.TOTAL_PREC(TOTAL_PREC), .FRAC_BITS(FRAC_BITS)) fd0(.a(reflected), .b(dird[2]), .clk(clk), .res(preres));
    /* verilator lint_off UNUSED */
    logic signed [TOTAL_PREC - 1 : 0] aftpreres;
    /* verilator lint_on UNUSED */
    assign aftpreres = preres + (1 << FRAC_BITS);

    always_comb begin
        res = aftpreres[FRAC_BITS: FRAC_BITS - 7];

        if (aftpreres < 0) begin
            res = '0;
        end else if (| aftpreres[TOTAL_PREC - 1 : FRAC_BITS + 1]) begin
            res = '1;
        end
    end
endmodule
