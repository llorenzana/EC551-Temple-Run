module render #(
    parameter integer TOTAL_PREC = 27,
    parameter integer FRAC_BITS = 22,
    parameter integer TOTAL_PREC_ROT = 18,
    parameter integer FRAC_BITS_ROT = 13
) (
    input wire logic clk,
    input wire logic [19:0] fb_addr,
    input wire logic signed [TOTAL_PREC - 1 : 0] dir [2:0],
    input wire logic signed [TOTAL_PREC_ROT - 1 : 0] a [2:0],
    input wire logic signed [TOTAL_PREC_ROT - 1 : 0] b [2:0],
    input wire logic signed [TOTAL_PREC_ROT - 1 : 0] c [2:0],
    input wire logic signed [TOTAL_PREC_ROT - 1 : 0] n [2:0],
    input wire logic signed [TOTAL_PREC_ROT - 1 : 0] q [3:0],
    input wire logic last_tri,
    input wire logic last_pix,
    output logic [19:0] ofb_addr,
    output logic olast_tri,
    output logic olast_pix,
    output logic hit,
    output logic signed [TOTAL_PREC - 1 : 0] oa,
    output logic signed [TOTAL_PREC - 1 : 0] t,
    output logic [7:0] bri
);
    logic signed [TOTAL_PREC_ROT - 1 : 0] ra [2:0];
    logic signed [TOTAL_PREC_ROT - 1 : 0] rb [2:0];
    logic signed [TOTAL_PREC_ROT - 1 : 0] rc [2:0];
    logic signed [TOTAL_PREC_ROT - 1 : 0] rn [2:0];
    rotation #(.TOTAL_PREC(TOTAL_PREC_ROT), .FRAC_BITS(FRAC_BITS_ROT)) rt0(.clk(clk), .a(a), .b(b), .c(c), .n(n), .q(q), .oa(ra), .ob(rb), .oc(rc), .on(rn));

    logic signed [TOTAL_PREC - 1 : 0] ddir [7:0] [2:0];
    assign ddir[0] = dir;
    always_ff @(posedge clk) begin
        ddir[7:1] <= ddir[6:0];
    end

    logic signed [TOTAL_PREC - 1 : 0] la [2:0];
    logic signed [TOTAL_PREC - 1 : 0] lb [2:0];
    logic signed [TOTAL_PREC - 1 : 0] lc [2:0];
    logic signed [TOTAL_PREC - 1 : 0] ln [2:0];
    assign la[0][TOTAL_PREC - 1 : TOTAL_PREC - TOTAL_PREC_ROT] =  ra[0];
    assign la[0][TOTAL_PREC - TOTAL_PREC_ROT - 1 : 0] = 0;
    assign la[1][TOTAL_PREC - 1 : TOTAL_PREC - TOTAL_PREC_ROT] =  ra[1];
    assign la[1][TOTAL_PREC - TOTAL_PREC_ROT - 1 : 0] = 0;
    assign la[2][TOTAL_PREC - 1 : TOTAL_PREC - TOTAL_PREC_ROT] =  ra[2];
    assign la[2][TOTAL_PREC - TOTAL_PREC_ROT - 1 : 0] = 0;
    assign lb[0][TOTAL_PREC - 1 : TOTAL_PREC - TOTAL_PREC_ROT] =  rb[0];
    assign lb[0][TOTAL_PREC - TOTAL_PREC_ROT - 1 : 0] = 0;
    assign lb[1][TOTAL_PREC - 1 : TOTAL_PREC - TOTAL_PREC_ROT] =  rb[1];
    assign lb[1][TOTAL_PREC - TOTAL_PREC_ROT - 1 : 0] = 0;
    assign lb[2][TOTAL_PREC - 1 : TOTAL_PREC - TOTAL_PREC_ROT] =  rb[2];
    assign lb[2][TOTAL_PREC - TOTAL_PREC_ROT - 1 : 0] = 0;
    assign lc[0][TOTAL_PREC - 1 : TOTAL_PREC - TOTAL_PREC_ROT] =  rc[0];
    assign lc[0][TOTAL_PREC - TOTAL_PREC_ROT - 1 : 0] = 0;
    assign lc[1][TOTAL_PREC - 1 : TOTAL_PREC - TOTAL_PREC_ROT] =  rc[1];
    assign lc[1][TOTAL_PREC - TOTAL_PREC_ROT - 1 : 0] = 0;
    assign lc[2][TOTAL_PREC - 1 : TOTAL_PREC - TOTAL_PREC_ROT] =  rc[2];
    assign lc[2][TOTAL_PREC - TOTAL_PREC_ROT - 1 : 0] = 0;
    assign ln[0][TOTAL_PREC - 1 : TOTAL_PREC - TOTAL_PREC_ROT] =  rn[0];
    assign ln[0][TOTAL_PREC - TOTAL_PREC_ROT - 1 : 0] = 0;
    assign ln[1][TOTAL_PREC - 1 : TOTAL_PREC - TOTAL_PREC_ROT] =  rn[1];
    assign ln[1][TOTAL_PREC - TOTAL_PREC_ROT - 1 : 0] = 0;
    assign ln[2][TOTAL_PREC - 1 : TOTAL_PREC - TOTAL_PREC_ROT] =  rn[2];
    assign ln[2][TOTAL_PREC - TOTAL_PREC_ROT - 1 : 0] = 0;
    triangle_intersect #(.TOTAL_PREC(TOTAL_PREC), .FRAC_BITS(FRAC_BITS)) ti0(.clk(clk), .a(la), .b(lb), .c(lc), .n(ln), .dir(ddir[7]), .oa(oa), .t(t), .hit(hit)); 

    logic [7:0] dbri [4:0];
    always_ff @(posedge clk) begin
        dbri[4:1] <= dbri[3:0];
    end
    assign bri = dbri[4];
    brightness #(.TOTAL_PREC(TOTAL_PREC), .FRAC_BITS(FRAC_BITS)) br0(.tnorm(ln), .dir(ddir[7]), .clk(clk), .res(dbri[0]));
    
    logic [19:0] dfb_addr [16:0];
    logic dlast_tri [16:0];
    logic dlast_pix [16:0];
    assign dfb_addr[0] = fb_addr;
    assign dlast_tri[0] = last_tri;
    assign dlast_pix[0] = last_pix;
    always_ff @(posedge clk) begin
        dfb_addr[16:1] <= dfb_addr[15:0];
        dlast_tri[16:1] <= dlast_tri[15:0];
        dlast_pix[16:1] <= dlast_pix[15:0];
    end
    assign ofb_addr = dfb_addr[16];
    assign olast_tri = dlast_tri[16];
    assign olast_pix = dlast_pix[16];
endmodule
