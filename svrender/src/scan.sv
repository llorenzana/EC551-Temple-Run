module scan #(
  /* verilator lint_off UNUSED */
    parameter integer TOTAL_PREC = 27,
    parameter integer FRAC_BITS = 22,
    parameter integer TOTAL_PREC_ROT = 18,
    parameter integer FRAC_BITS_ROT = 13,
    parameter integer TOTAL_PREC_SCAN = 27,
    parameter integer FRAC_BITS_SCAN = 22
  /* verilator lint_on UNUSED */
) (
    input wire logic clk,
    input wire logic signed [TOTAL_PREC_ROT - 1 : 0] q [3:0],
    input wire logic wen,
    input wire logic wclk,
    input wire logic [215:0] wdata,
    input wire logic [11:0] waddr,
/* verilator lint_off UNUSED */
    input wire logic [11:0] wsize,
/* verilator lint_on UNUSED */
    output logic [19:0] fb_addr,
    output logic signed [TOTAL_PREC - 1 : 0] dir [2:0],
    output logic signed [TOTAL_PREC_ROT - 1 : 0] a [2:0],
    output logic signed [TOTAL_PREC_ROT - 1 : 0] b [2:0],
    output logic signed [TOTAL_PREC_ROT - 1 : 0] c [2:0],
    output logic signed [TOTAL_PREC_ROT - 1 : 0] n [2:0],
    output logic signed [TOTAL_PREC_ROT - 1 : 0] oq [3:0],
    output logic last_tri,
    output logic last_pix
);
    logic [19:0] fb_addr_counter;
	 logic [11:0] vb_size = 36;
    logic [11:0] vb_addr_counter;
    logic [11:0] x_counter;
    logic [19:0] fb_addr_d;
    logic [215:0] data;
    logic signed [TOTAL_PREC_SCAN - 1 : 0] dird [2:0];
    logic signed [TOTAL_PREC_SCAN - 1 : 0] dirdd [2:0];
    logic signed [TOTAL_PREC_ROT - 1 : 0] oqd [3:0];
    logic last_tri_d;
    logic last_pix_d;
    vbuffer vb(.q(data),.data(wdata), .write_clock(wclk), .we(wen),.write_addr(waddr), .read_clock(clk), .read_addr(vb_addr_counter));
    initial begin
     dird[0] = -1 << FRAC_BITS_SCAN - 1;
     dird[1] = -1 << FRAC_BITS_SCAN - 1;
     dird[2] = -1 << FRAC_BITS_SCAN;
    end

    always_ff @(posedge clk) begin
        if ((vb_addr_counter + 1) >= vb_size)
        begin
          if (fb_addr_counter >= 360000 - 1)
          begin
            oqd <= q;
            fb_addr_counter <= 0;
				vb_size <= wsize;
          end else begin
            fb_addr_counter <= fb_addr_counter + 1;
          end
          vb_addr_counter <= 0;
     if (x_counter >= 600 - 1)
     begin
       x_counter <= 0;
       dird[0] <= -1 << FRAC_BITS_SCAN - 1;
       if (fb_addr_counter >= 360000 - 1)
       begin
         dird[1] <= -1 << FRAC_BITS_SCAN - 1;
       end else begin
         dird[1] <= dird[1] + 'b1101101001111;
       end
     end else begin
       dird[0] <= dird[0] + 'b1101101001111;
       x_counter <= x_counter + 1;
     end
        end else begin
          vb_addr_counter <= vb_addr_counter + 1;
        end
        oq <= oqd;
        last_tri_d <= (vb_addr_counter + 1) >= vb_size;
        last_pix_d <= fb_addr_counter >= 360000 - 1;
        last_tri <= last_tri_d;
        last_pix <= last_pix_d;
        fb_addr_d <= fb_addr_counter;
        fb_addr <= fb_addr_d;
     dirdd <= dird;
     dir[0] <= dirdd[0][TOTAL_PREC_SCAN -1: TOTAL_PREC_SCAN - TOTAL_PREC];
     dir[1] <= dirdd[1][TOTAL_PREC_SCAN -1: TOTAL_PREC_SCAN - TOTAL_PREC];
     dir[2] <= dirdd[2][TOTAL_PREC_SCAN -1: TOTAL_PREC_SCAN - TOTAL_PREC];
     {a[0],a[1],a[2]} <= data[215:162];
     {b[0],b[1],b[2]} <= data[161:108];
     {c[0],c[1],c[2]} <= data[107:54];
     {n[0],n[1],n[2]} <= data[53:0];
    end
endmodule
