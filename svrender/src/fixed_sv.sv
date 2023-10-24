module fixed_sv #(
    parameter integer TOTAL_PREC = 27,
    parameter integer FRAC_BITS = 22
) (
    input wire logic signed [TOTAL_PREC - 1 : 0] a [2:0],
    input wire logic signed [TOTAL_PREC - 1 : 0] b,
    input wire logic clk,
    output logic signed [TOTAL_PREC - 1 : 0] res [2:0]
);
    logic signed [TOTAL_PREC - 1 : 0] ad [2:0];
    logic signed [TOTAL_PREC - 1 : 0] bd;
    logic signed [TOTAL_PREC - 1 : 0] resd [2:0];
    always_ff @(posedge clk) begin
       ad <= a;
       bd <= b;
    end
    always_ff @(posedge clk) begin
       res <= resd;
    end
    fixed_mult #(.TOTAL_PREC(TOTAL_PREC), .FRAC_BITS(FRAC_BITS)) fm0(.a(ad[0]), .b(bd), .res(resd[0]));
    fixed_mult #(.TOTAL_PREC(TOTAL_PREC), .FRAC_BITS(FRAC_BITS)) fm1(.a(ad[1]), .b(bd), .res(resd[1]));
    fixed_mult #(.TOTAL_PREC(TOTAL_PREC), .FRAC_BITS(FRAC_BITS)) fm2(.a(ad[2]), .b(bd), .res(resd[2]));
endmodule
