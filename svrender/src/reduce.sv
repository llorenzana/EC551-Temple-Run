module reduce #(
    parameter integer TOTAL_PREC = 27,
    parameter integer TOTAL_PREC_COMP = 18
) (
    input wire logic clk,
    input wire logic [19:0] fb_addr,
    input wire logic last_tri,
    input wire logic last_pix,
    input wire logic hit,
    input wire logic signed [TOTAL_PREC - 1 : 0] oa,
    input wire logic signed [TOTAL_PREC - 1 : 0] t,
    input wire logic [7:0] bri,

    output logic [19:0] fb_addr_w,
    output logic hit_w,
    output logic [7:0] bri_w,
    output logic valid_w,
    output logic swap
);
    logic [19:0] fb_addr_d;
    logic last_tri_d;
    logic last_pix_d;
    logic hit_d;
    logic signed [TOTAL_PREC_COMP - 1 : 0] oa_d;
    logic signed [TOTAL_PREC_COMP - 1 : 0] t_d;
    logic [7:0] bri_d;

    always_ff @(posedge clk) begin
        fb_addr_d <= fb_addr;
        last_tri_d <= last_tri;
        last_pix_d <= last_pix;
        hit_d <= hit;
        oa_d <= oa[TOTAL_PREC - 1 : TOTAL_PREC - TOTAL_PREC_COMP];
        t_d <= t[TOTAL_PREC - 1 : TOTAL_PREC - TOTAL_PREC_COMP];
        bri_d <= bri;
    end

    logic _unused;
    assign _unused = |({ oa[TOTAL_PREC - TOTAL_PREC_COMP - 1 : 0], t[TOTAL_PREC - TOTAL_PREC_COMP - 1 : 0] });

    logic cur_hit;
    logic [7:0] cur_bri;
    logic signed [TOTAL_PREC_COMP - 1 : 0] cur_oa;
    logic signed [TOTAL_PREC_COMP - 1 : 0] cur_t;

    logic next_hit;
    logic [7:0] next_bri;
    logic signed [TOTAL_PREC_COMP - 1 : 0] next_oa;
    logic signed [TOTAL_PREC_COMP - 1 : 0] next_t;

    logic signed [TOTAL_PREC_COMP * 2 - 1 : 0] t_d_cur_oa;
    logic signed [TOTAL_PREC_COMP * 2 - 1 : 0] cur_t_oa_d;

    assign t_d_cur_oa = t_d * cur_oa;
    assign cur_t_oa_d = cur_t * oa_d;

    logic better;
    // t_d / oa_d < cur_t / cur_oa
    assign better = (t_d_cur_oa < cur_t_oa_d) ^ (oa_d < 0) ^ (cur_oa < 0);

    always_comb begin
        if (hit_d && (! cur_hit || better)) begin
            next_hit = '1;
            next_bri = bri_d;
            next_oa = oa_d;
            next_t = t_d;
        end else begin
            next_hit = cur_hit;
            next_bri = cur_bri;
            next_oa = cur_oa;
            next_t = cur_t;
        end
    end

    always_ff @(posedge clk) begin
        cur_bri <= next_bri;
        cur_oa <= next_oa;
        cur_t <= next_t;
    end

    always_ff @(posedge clk) begin
        if (last_tri_d) begin
            cur_hit <= '0;
        end else begin
            cur_hit <= next_hit;
        end
    end

    assign fb_addr_w = fb_addr_d;
    assign hit_w = next_hit;
    assign bri_w = next_bri;
    assign valid_w = last_tri_d;
    assign swap = last_pix_d;
endmodule
