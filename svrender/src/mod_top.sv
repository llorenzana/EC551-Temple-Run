module mod_top (
    // 时钟、复位
    input  wire clk_100m,           // 100M 输入时钟
    input  wire reset_n,            // 上电复位信号，低有效

    // 开关、LED 等
    input  wire clock_btn,          // 左侧微动开关，推荐作为手动时钟，带消抖电路，按下时为 1
    input  wire reset_btn,          // 右侧微动开关，推荐作为手动复位，带消抖电路，按下时为 1
    input  wire [3:0]  touch_btn,   // 四个按钮开关，按下时为 0
    input  wire [15:0] dip_sw,      // 16 位拨码开关，拨到 “ON” 时为 0
    output wire [31:0] leds,        // 32 位 LED 灯，输出 1 时点亮
    output wire [7: 0] dpy_digit,   // 七段数码管笔段信号
    output wire [7: 0] dpy_segment, // 七段数码管位扫描信号

    // // PS/2 键盘、鼠标接口
    // input  wire        ps2_clock,   // PS/2 时钟信号
    // input  wire        ps2_data,    // PS/2 数据信号

    // // USB 转 TTL 调试串口
    // output wire        uart_txd,    // 串口发送数据
    input  wire        uart_rxd,    // 串口接收数据

    input wire pmod_rx,

    // 4MB SRAM 内存
    inout  wire [31:0] base_ram_data,   // SRAM 数据
    output wire [19:0] base_ram_addr,   // SRAM 地址
    output wire [3: 0] base_ram_be_n,   // SRAM 字节使能，低有效。如果不使用字节使能，请保持为0
    output wire        base_ram_ce_n,   // SRAM 片选，低有效
    output wire        base_ram_oe_n,   // SRAM 读使能，低有效
    output wire        base_ram_we_n,   // SRAM 写使能，低有效

    // HDMI 图像输出
    output wire [7: 0] video_red,   // 红色像素，8位
    output wire [7: 0] video_green, // 绿色像素，8位
    output wire [7: 0] video_blue,  // 蓝色像素，8位
    output wire        video_hsync, // 行同步（水平同步）信号
    output wire        video_vsync, // 场同步（垂直同步）信号
    output wire        video_clk,   // 像素时钟输出
    output wire        video_de     // 行数据有效信号，用于区分消隐区

    // // RS-232 串口
    // input  wire        rs232_rxd,   // 接收数据
    // output wire        rs232_txd,   // 发送数据
    // input  wire        rs232_cts,   // Clear-To-Send 控制信号
    // output wire        rs232_rts,   // Request-To-Send 控制信号

    // // SD 卡（SPI 模式）
    // output wire        sd_sclk,     // SPI 时钟
    // output wire        sd_mosi,
    // input  wire        sd_miso,
    // output wire        sd_cs,       // SPI 片选，低有效
    // input  wire        sd_cd,       // 卡插入检测，0 表示有卡插入
    // input  wire        sd_wp,       // 写保护检测，0 表示写保护状态

    // // SDRAM 内存，信号具体含义请参考数据手册
    // output wire [12:0] sdram_addr,
    // output wire [1: 0] sdram_bank,
    // output wire        sdram_cas_n,
    // output wire        sdram_ce_n,
    // output wire        sdram_cke,
    // output wire        sdram_clk,
    // output wire [15:0] sdram_dq,
    // output wire        sdram_dqmh,
    // output wire        sdram_dqml,
    // output wire        sdram_ras_n,
    // output wire        sdram_we_n,

    // // GMII 以太网接口、MDIO 接口，信号具体含义请参考数据手册
    // output wire        eth_gtx_clk,
    // output wire        eth_rst_n,
    // input  wire        eth_rx_clk,
    // input  wire        eth_rx_dv,
    // input  wire        eth_rx_er,
    // input  wire [7: 0] eth_rxd,
    // output wire        eth_tx_clk,
    // output wire        eth_tx_en,
    // output wire        eth_tx_er,
    // output wire [7: 0] eth_txd,
    // input  wire        eth_col,
    // input  wire        eth_crs,
    // output wire        eth_mdc,
    // inout  wire        eth_mdio

);

    wire clk_in;

    logic [7:0] serial_data;
    logic serial_valid;

	 /*
    rxuart uartrx_i (
       .i_clk(clk_in),
       .i_uart_rx(pmod_rx),
       .o_wr(serial_valid),
       .o_data(serial_data)
    );
	 */
    uartrx uartrx_i (
       .clk(clk_in),
       .rx(uart_rxd),
       .valid(serial_valid),
       .data(serial_data)
    );

	 wire logic we;
    wire logic [27 * 8 - 1 : 0] data_w;
    wire logic [12 - 1 : 0] addr_w;
    wire logic [12 - 1 : 0] size;
	 serial_data serial_data_i (
		  .clk(clk_in),
		  .valid(serial_valid),
        .data(serial_data),
		  .we(we),
		  .data_w(data_w),
		  .addr_w(addr_w),
		  .size(size)
	 );

    // PLL 分频演示，从输入产生不同频率的时钟
    wire clk_vga;
    ip_pll u_ip_pll(
        .inclk0 (clk_100m),
        .c0     (clk_vga ), // 50MHz 像素时钟
        .c1(clk_in)
    );

    // assign base_ram_data = 'z;

    logic [11:0] hdata;
    logic [11:0] vdata;

    logic sram_read;
    logic [18:0] sram_addr;
    logic [31:0] sram_data;

    assign video_clk = clk_vga;

    vga #(12, 800, 856, 976, 1040, 600, 637, 643, 666, 1, 1) vga800x600at75 (
        .clk(clk_vga),
        .hdata(hdata), //横坐标
        .vdata(vdata), //纵坐标
        .hsync(video_hsync),
        .vsync(video_vsync),
        .data_enable(video_de)
    );

    // assign video_red = hdata + vdata;
    // assign video_green = hdata + vdata;
    // assign video_blue = hdata + vdata;

    logic [19:0] fb_addr_i;
    logic hit_i;
    logic [7:0] bri_i;
    logic swap_i;
    logic valid_i;

    logic [19:0] fb_addr_o;
    logic hit_o;
    logic [7:0] bri_o;
    logic swap_o;
    logic valid_o;
    logic ready_o;

    logic last_pixel;

    fb_display fb_display_i (
        .clk(clk_vga),
        .hdata, .vdata,
        .r(video_red), .g(video_green), .b(video_blue),
        .sram_read, .sram_addr, .sram_data, .last_pixel
    );

    sram_fifo sram_fifo_i (
        .clk_i(clk_in),
        .clk_o(clk_vga),

        .fb_addr_i, .hit_i, .bri_i, .swap_i, .valid_i,
        .fb_addr_o, .hit_o, .bri_o, .swap_o, .valid_o, .ready_o
    );

    logic [3:0] btn_deb;

    debounce debounce_i (
        .clk(clk_in),
        .i(~ touch_btn),
        .o(btn_deb)
    );

    logic reset_btn_1 = '0;
    logic reset_btn_2 = '0;

    always_ff @(posedge clk_in) begin
        { reset_btn_2, reset_btn_1 } <= { reset_btn_1, reset_btn };
		  if (valid_i) begin
		      leds <= fb_addr_i;
		  end
    end

	 dpy_scan dpy_scan_i(.clk(clk_in), .number(fb_addr_i), .digit(dpy_digit), .segment(dpy_segment));

    render_reduce render_reduce_i (
        .clk(clk_in),
        .fb_addr_w(fb_addr_i),
        .hit_w(hit_i),
        .bri_w(bri_i),
        .swap(swap_i),
        .valid_w(valid_i),
        .but({ btn_deb[3], btn_deb[1], btn_deb[0], btn_deb[2] }),
		  .wen(we),
        .wclk(clk_in),
        .wdata(data_w),
        .waddr(addr_w),
        .wsize(size),
        .reset(reset_btn_2)
    );

    logic [31:0] base_ram_data_o;
    logic base_ram_data_t;

    assign base_ram_data = base_ram_data_t ? 'z : base_ram_data_o;

    sram_controller sram_controller_i (
        .clk(clk_vga),
        .base_ram_data_i(base_ram_data),
        .base_ram_data_o,
        .base_ram_data_t,
        .base_ram_addr,
        .base_ram_be_n,
        .base_ram_ce_n,
        .base_ram_oe_n,
        .base_ram_we_n,
        .sram_read,
        .sram_addr,
        .sram_data,

        .fb_addr_fifo(fb_addr_o),
        .hit_fifo(hit_o),
        .bri_fifo(bri_o),
        .valid_fifo(valid_o),
        .ready_fifo(ready_o),
        .swap_fifo(swap_o),
        .last_pixel
    );
endmodule
