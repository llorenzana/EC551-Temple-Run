module fixed_dot #(
    parameter integer TOTAL_PREC = 27,
    parameter integer FRAC_BITS = 22
) (
    input wire logic signed [TOTAL_PREC - 1 : 0] a [2:0],
    input wire logic signed [TOTAL_PREC - 1 : 0] b [2:0],
    input wire logic clk,
    output logic signed [TOTAL_PREC - 1 : 0] res
);
    logic signed [TOTAL_PREC - 1 : 0] ad [2:0];
    logic signed [TOTAL_PREC - 1 : 0] bd [2:0];
    always_ff @(posedge clk) begin
       ad <= a;
       bd <= b;
    end
    logic signed [TOTAL_PREC - 1 : 0] pre [2:0];
    fixed_mult #(.TOTAL_PREC(TOTAL_PREC), .FRAC_BITS(FRAC_BITS)) fm0(.a(ad[0]), .b(bd[0]), .res(pre[0]));
    fixed_mult #(.TOTAL_PREC(TOTAL_PREC), .FRAC_BITS(FRAC_BITS)) fm1(.a(ad[1]), .b(bd[1]), .res(pre[1]));
    fixed_mult #(.TOTAL_PREC(TOTAL_PREC), .FRAC_BITS(FRAC_BITS)) fm2(.a(ad[2]), .b(bd[2]), .res(pre[2]));
    logic signed [TOTAL_PREC - 1 : 0] aft [2:0];
    always_ff @(posedge clk) begin
       aft <= pre;
    end
    logic signed [TOTAL_PREC - 1 : 0] resd;
    assign resd = aft[0] + aft[1] + aft[2];
    always_ff @(posedge clk) begin
       res <= resd;
    end
endmodule
