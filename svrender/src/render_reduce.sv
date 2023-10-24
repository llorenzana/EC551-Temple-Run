module render_reduce #(
    parameter integer TOTAL_PREC = 27,
    parameter integer FRAC_BITS = 22,
    parameter integer TOTAL_PREC_ROT = 18,
    parameter integer FRAC_BITS_ROT = 13,
    parameter integer TOTAL_PREC_COMP = 18
) (
    input wire logic clk,
    input wire logic [3:0] but,
    input wire logic wen,
    input wire logic wclk,
    input wire logic [215:0] wdata,
    input wire logic [11:0] waddr,
    input wire logic [11:0] wsize,
    input wire logic reset,
    output logic [19:0] fb_addr_w,
    output logic hit_w,
    output logic [7:0] bri_w,
    output logic valid_w,
    output logic swap
);
    logic [19:0] fb_addr;
    logic [19:0] ofb_addr;
    logic olast_tri;
    logic olast_pix;
    logic hit;
    logic signed [TOTAL_PREC - 1 : 0] oa;
    logic signed [TOTAL_PREC - 1 : 0] t;
    logic [7:0] bri;
    logic signed [TOTAL_PREC_ROT - 1 : 0] q [3:0];
    logic signed [TOTAL_PREC_ROT - 1 : 0] iq [3:0];
    logic signed [TOTAL_PREC_ROT - 1 : 0] a [2:0];
    logic signed [TOTAL_PREC_ROT - 1 : 0] b [2:0];
    logic signed [TOTAL_PREC_ROT - 1 : 0] c [2:0];
    logic signed [TOTAL_PREC_ROT - 1 : 0] n [2:0];
    logic last_tri;
    logic last_pix;
    logic signed [TOTAL_PREC - 1 : 0] dir [2:0];

    button #(
        .TOTAL_PREC(TOTAL_PREC_ROT),
        .FRAC_BITS(FRAC_BITS_ROT)
    ) button_i (.clk(clk), .q(iq), .w(but[3]), .reset, .a(but[2]), .s(but[1]), .d(but[0]));

    scan #(
        .TOTAL_PREC(TOTAL_PREC),
        .FRAC_BITS(FRAC_BITS),
        .TOTAL_PREC_ROT(TOTAL_PREC_ROT),
        .FRAC_BITS_ROT(FRAC_BITS_ROT)
    ) scan_i (
        .clk(clk), .q(iq),
        .fb_addr(fb_addr),.dir(dir), .a(a), .b(b), .c(c), .n(n), .oq(q),
        .last_tri(last_tri), .last_pix(last_pix),
		  .wen(wen),
        .wclk(wclk),
        .wdata(wdata),
        .waddr(waddr),
        .wsize(wsize)
    );

    render #(
        .TOTAL_PREC(TOTAL_PREC),
        .FRAC_BITS(FRAC_BITS),
        .TOTAL_PREC_ROT(TOTAL_PREC_ROT),
        .FRAC_BITS_ROT(FRAC_BITS_ROT)
    ) render_i (
        .clk,
        .fb_addr, .dir, .a, .b, .c, .n, .q,
        .last_tri, .last_pix,
        .ofb_addr, .olast_tri, .olast_pix, .hit, .oa, .t, .bri
    );

    reduce #(
        .TOTAL_PREC(TOTAL_PREC),
        .TOTAL_PREC_COMP(TOTAL_PREC_COMP)
    ) reduce_i (
        .clk,
        .fb_addr(ofb_addr), .last_tri(olast_tri), .last_pix(olast_pix),
        .hit, .oa, .t, .bri,
        .fb_addr_w, .hit_w, .bri_w, .valid_w, .swap
    );

endmodule
