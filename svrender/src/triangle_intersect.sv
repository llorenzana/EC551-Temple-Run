module triangle_intersect #(
    parameter integer TOTAL_PREC = 27,
    parameter integer FRAC_BITS = 22
) (
    input wire logic clk,
    input wire logic signed [TOTAL_PREC - 1 : 0] a [2:0],
    input wire logic signed [TOTAL_PREC - 1 : 0] b [2:0],
    input wire logic signed [TOTAL_PREC - 1 : 0] c [2:0],
    input wire logic signed [TOTAL_PREC - 1 : 0] n [2:0],
    input wire logic signed [TOTAL_PREC - 1 : 0] dir [2:0],

    output logic signed [TOTAL_PREC - 1 : 0] oa,
    output logic signed [TOTAL_PREC - 1 : 0] t,
    output logic hit
);
    logic signed [TOTAL_PREC - 1 : 0] ad [2:0];
    logic signed [TOTAL_PREC - 1 : 0] bd [2:0];
    logic signed [TOTAL_PREC - 1 : 0] cd [2:0];
    logic signed [TOTAL_PREC - 1 : 0] dird [2:0];

    intersect_delay #(TOTAL_PREC) delay_ad (.clk, .i(a), .o(ad));
    intersect_delay #(TOTAL_PREC) delay_bd (.clk, .i(b), .o(bd));
    intersect_delay #(TOTAL_PREC) delay_cd (.clk, .i(c), .o(cd));
    intersect_delay #(TOTAL_PREC) delay_dird (.clk, .i(dir), .o(dird));

    logic signed [TOTAL_PREC - 1 : 0] n_dir;

    fixed_dot #(TOTAL_PREC, FRAC_BITS) dot_n_dir (.clk, .a(n), .b(dir), .res(n_dir));

    logic signed [TOTAL_PREC - 1 : 0] pe1 [2:0];
    logic signed [TOTAL_PREC - 1 : 0] pe2 [2:0];

    assign pe1 = (n_dir > 0) ? ad : bd;
    assign pe2 = (n_dir > 0) ? bd : ad;

    logic signed [TOTAL_PREC - 1 : 0] e1 [2:0];
    logic signed [TOTAL_PREC - 1 : 0] e2 [2:0];

    genvar i;

    generate
        for (i = 0; i < 3; i = i + 1) begin : gen_e1_e2
            always_comb begin
                e1[i] = pe1[i] - cd[i];
                e2[i] = pe2[i] - cd[i];
            end
        end
    endgenerate

    logic signed [TOTAL_PREC - 1 : 0] s [2:0];
    assign s[0] = - cd[0];
    assign s[1] = - cd[1];
    assign s[2] = TOTAL_PREC'(4 << 22) - cd[2];

    logic signed [TOTAL_PREC - 1 : 0] e1d [2:0];
    logic signed [TOTAL_PREC - 1 : 0] e2d [2:0];
    logic signed [TOTAL_PREC - 1 : 0] sd [2:0];
    logic signed [TOTAL_PREC - 1 : 0] dirdd [2:0];

    intersect_delay #(TOTAL_PREC) delay_e1d (.clk, .i(e1), .o(e1d));
    intersect_delay #(TOTAL_PREC) delay_e2d (.clk, .i(e2), .o(e2d));
    intersect_delay #(TOTAL_PREC) delay_sd (.clk, .i(s), .o(sd));
    intersect_delay #(TOTAL_PREC) delay_dirdd (.clk, .i(dird), .o(dirdd));

    logic signed [TOTAL_PREC - 1 : 0] h [2:0];
    logic signed [TOTAL_PREC - 1 : 0] se1 [2:0];

    fixed_cross #(TOTAL_PREC, FRAC_BITS) cross_dire2 (.clk, .a(dird), .b(e2), .res(h));
    fixed_cross #(TOTAL_PREC, FRAC_BITS) cross_se1 (.clk, .a(s), .b(e1), .res(se1));

    logic signed [TOTAL_PREC - 1 : 0] u;
    logic signed [TOTAL_PREC - 1 : 0] v;

    fixed_dot #(TOTAL_PREC, FRAC_BITS) dot_oa (.clk, .a(e1d), .b(h), .res(oa));
    fixed_dot #(TOTAL_PREC, FRAC_BITS) dot_t (.clk, .a(e2d), .b(se1), .res(t));
    fixed_dot #(TOTAL_PREC, FRAC_BITS) dot_u (.clk, .a(h), .b(sd), .res(u));
    fixed_dot #(TOTAL_PREC, FRAC_BITS) dot_v (.clk, .a(dirdd), .b(se1), .res(v));

    assign hit = (u >= 0) && (u <= oa) && (v >= 0) && (v <= oa - u) && (t > 0);
endmodule
