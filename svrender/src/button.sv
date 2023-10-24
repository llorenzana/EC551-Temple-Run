module button #(
    parameter integer TOTAL_PREC = 18,
    parameter integer FRAC_BITS = 13
) (
    input wire logic clk,
    input wire logic w,
    input wire logic a,
    input wire logic s,
    input wire logic d,
    input wire logic reset,
    output logic signed [TOTAL_PREC - 1 : 0] q [3:0]
);
logic signed [TOTAL_PREC - 1 : 0] dw [3:0];
logic signed [TOTAL_PREC - 1 : 0] da [3:0];
logic signed [TOTAL_PREC - 1 : 0] ds [3:0];
logic signed [TOTAL_PREC - 1 : 0] dd [3:0];
logic signed [TOTAL_PREC - 1 : 0] rot [3:0];
logic signed [TOTAL_PREC - 1 : 0] curr [3:0];
logic signed [TOTAL_PREC - 1 : 0] post [3:0];
logic [4:0] counter = 5'd0;
initial begin
  dw[3] = 18'b1111111100001;
  dw[2] = 18'b0;
  dw[1] = 18'b0;
  dw[0] = 18'b1011001010;
  da[3] = 18'b1111111100001;
  da[2] = 18'b0;
  da[1] = 18'b111111110100110110;
  da[0] = 18'b0;
  ds[3] = 18'b1111111100001;
  ds[2] = 18'b0;
  ds[1] = 18'b0;
  ds[0] = 18'b111111110100110110;
  dd[3] = 18'b1111111100001;
  dd[2] = 18'b0;
  dd[1] = 18'b1011001010;
  dd[0] = 18'b0;
  curr[3] = 1 << FRAC_BITS;
  curr[2] = 0;
  curr[1] = 0;
  curr[0] = 0;
  q[3] = 1 << FRAC_BITS;
  q[2] = 0;
  q[1] = 0;
  q[0] = 0;
end
fixed_qq #(TOTAL_PREC, FRAC_BITS) qq0 (.clk(clk), .q1(rot), .q2(curr), .res(post));
always_ff @(posedge clk) begin
  if(counter > 0)
  begin
    counter <= counter - 1;
  end
  if (w) begin
    counter <= 5'd5;
    rot <= dw;
  end else if (a) begin
    counter <= 5'd5;
    rot <= da;
  end else if (s) begin
    counter <= 5'd5;
    rot <= ds;
  end else if (d) begin
    counter <= 5'd5;
    rot <= dd;
  end
  if(counter == 1)
  begin
    q <= post;
    curr <= post;
  end
  if (reset) begin
    curr[3] <= 1 << FRAC_BITS;
    curr[2] <= 0;
    curr[1] <= 0;
    curr[0] <= 0;

    q[3] <= 1 << FRAC_BITS;
    q[2] <= 0;
    q[1] <= 0;
    q[0] <= 0;
  end
end
endmodule
