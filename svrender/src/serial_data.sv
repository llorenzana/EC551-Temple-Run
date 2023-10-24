module serial_data #(
    parameter integer DATA_L = 27,
    parameter integer ADDR_W = 12
) (
    input wire logic clk,

    input wire logic valid,
    input wire logic [7:0] data,

    output wire logic we,
    output wire logic [DATA_L * 8 - 1 : 0] data_w,
    output wire logic [ADDR_W - 1 : 0] addr_w,

    output wire logic [ADDR_W - 1 : 0] size
);

    localparam integer COUNTER_W = $clog2(DATA_L - 1);

    logic [ADDR_W - 1 : 0] cur_size = 'd36;
    logic [COUNTER_W - 1 : 0] counter = '0;

    logic [ADDR_W - 1 : 0] next_cur_size;
    logic [COUNTER_W - 1 : 0] next_counter;

    logic next_we;
    logic [DATA_L * 8 - 1 : 0] next_data_w;
    logic [ADDR_W - 1 : 0] next_addr_w;

    enum {
        IDLE, READING
    } state = IDLE, next_state;

    always_comb begin
        next_state = state;
        next_cur_size = cur_size;
        next_counter = counter;
        next_we = '0;
        next_data_w = data_w;
        next_addr_w = 'x;

        if (valid) begin
		      next_counter = counter - 'd1;
            case (state)
            IDLE: begin
                case (data)
                8'h01: begin
                    // append
                    next_state = READING;
                    next_counter = COUNTER_W'(DATA_L - 1);
                end
                8'h02: begin
                    // reset
                    next_cur_size = 'd0;
                end
                default: begin
                    // nothing
                end
                endcase
            end
            READING: begin
                next_data_w = { data, next_data_w[DATA_L * 8 - 1 : 8] };

                if (counter == 'd0) begin
                    next_state = IDLE;
                    next_we = '1;
                    next_addr_w = cur_size;
                    next_cur_size = cur_size + 'd1;
                end
            end
            endcase
        end
    end

    always_ff @(posedge clk) begin
        state <= next_state;
        cur_size <= next_cur_size;
        counter <= next_counter;
        we <= next_we;
        data_w <= next_data_w;
        addr_w <= next_addr_w;
    end
    assign size = cur_size;

endmodule
