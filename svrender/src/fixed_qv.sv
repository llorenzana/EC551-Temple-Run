module fixed_qv #(
    parameter integer TOTAL_PREC = 18,
    parameter integer FRAC_BITS = 13
) (
    input wire logic signed [TOTAL_PREC - 1 : 0] v [2:0],
    input wire logic signed [TOTAL_PREC - 1 : 0] q [3:0],
    input wire logic clk,
    output logic signed [TOTAL_PREC - 1 : 0] res [2:0]
);
    logic signed [TOTAL_PREC - 1 : 0] qv [2:0];
    logic signed [TOTAL_PREC - 1 : 0] qs;
    assign qv = q[2:0];
    assign qs = q[3];
    logic signed [TOTAL_PREC - 1 : 0] pret [2:0];
    fixed_cross #(.TOTAL_PREC(TOTAL_PREC), .FRAC_BITS(FRAC_BITS)) fc0(.a(qv), .b(v),.clk(clk),.res(pret));
    logic signed [TOTAL_PREC - 1 : 0] t [2:0];
    assign t[0] = pret[0] << 1;
    assign t[1] = pret[1] << 1;
    assign t[2] = pret[2] << 1;
    logic signed [TOTAL_PREC - 1 : 0] qvd [3:0] [2:0];
    logic signed [TOTAL_PREC - 1 : 0] qsd [3:0];
    assign qvd[0] = qv;
    assign qsd[0] = qs;
    always_ff @(posedge clk) begin
        qvd[3 : 1] <= qvd[2 : 0];
        qsd[3 : 1] <= qsd[2 : 0];
    end
    logic signed [TOTAL_PREC - 1 : 0] qvt [2:0];
    logic signed [TOTAL_PREC - 1 : 0] qst [2:0];
    fixed_cross #(.TOTAL_PREC(TOTAL_PREC), .FRAC_BITS(FRAC_BITS)) fc1(.a(qvd[3]), .b(t),.clk(clk),.res(qvt));
    fixed_sv #(.TOTAL_PREC(TOTAL_PREC), .FRAC_BITS(FRAC_BITS)) fs0(.a(t), .b(qsd[3]),.clk(clk),.res(qst));
    logic signed [TOTAL_PREC - 1 : 0] qstd [2:0];
    always_ff @(posedge clk) begin
      qstd <= qst;
    end
    logic signed [TOTAL_PREC - 1 : 0] dv [6 : 0] [2:0];
    assign dv[0] = v;
    always_ff @(posedge clk) begin
      dv[6:1] <= dv[5:0];
    end
    logic signed [TOTAL_PREC - 1 : 0] pres [2:0];
    assign pres[0] = qvt[0] + qstd[0] + dv[6][0];
    assign pres[1] = qvt[1] + qstd[1] + dv[6][1];
    assign pres[2] = qvt[2] + qstd[2] + dv[6][2];
    always_ff @(posedge clk) begin
      res <= pres;
    end
endmodule
