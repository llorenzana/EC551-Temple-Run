module sram_fifo (
    input wire logic clk_i,
    input wire logic clk_o,

    input wire logic [19:0] fb_addr_i,
    input wire logic hit_i,
    input wire logic [7:0] bri_i,
    input wire logic swap_i,
    input wire logic valid_i,

    output logic [19:0] fb_addr_o,
    output logic hit_o,
    output logic [7:0] bri_o,
    output logic swap_o,
    output logic valid_o,
    input wire logic ready_o
);

    logic rdempty;

    assign valid_o = ! rdempty;

    logic [19:0] fb_addr_d;
    logic hit_d;
    logic [7:0] bri_d;
    logic swap_d;
    logic valid_d = '0;

    always_ff @(posedge clk_i) begin
        fb_addr_d <= fb_addr_i;
        hit_d <= hit_i;
        bri_d <= bri_i;
        swap_d <= swap_i;
        valid_d <= valid_i;
    end

	dcfifo #(
        .intended_device_family("Cyclone IV E"),
		.lpm_numwords(4),
		.lpm_showahead("ON"),
		.lpm_type("dcfifo"),
		.lpm_width(30),
		.lpm_widthu(2),
		.overflow_checking("ON"),
		.rdsync_delaypipe(4),
		.underflow_checking("ON"),
		.use_eab("ON"),
		.wrsync_delaypipe(5)
    ) dcfifo_component (
        .q ({ fb_addr_o, hit_o, bri_o, swap_o }),
        .rdclk (clk_o),
        .rdreq (ready_o),
        .rdempty (rdempty),

        .data ({ fb_addr_d, hit_d, bri_d, swap_d }),
        .wrclk (clk_i),
        .wrreq (valid_d),
        .wrfull (),

        .aclr (),
        .eccstatus (),
        .rdfull (),
        .rdusedw (),
        .wrempty (),
        .wrusedw ()
    );

endmodule
