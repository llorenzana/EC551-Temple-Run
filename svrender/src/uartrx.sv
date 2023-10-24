module uartrx #(
    parameter integer SAMPLE = 781 // 115200 baud at 95MHz
) (
    input wire logic clk,
    input wire logic rx,

    output logic valid,
    output logic [7:0] data
);
    localparam integer SAMPLE_FIRST = SAMPLE + SAMPLE / 2;
    localparam COUNTER_W = $clog2(SAMPLE_FIRST);

    logic rx2;
    logic rx1;
    logic rx0;

    always_ff @(posedge clk) begin
        { rx2, rx1, rx0 } <= { rx1, rx0, rx };
    end

    logic [7:0] sr;
    logic [7:0] next_sr;
    logic [2:0] bit_counter;
    logic [2:0] next_bit_counter;

    logic [COUNTER_W - 1 : 0] counter = '0;
    logic [COUNTER_W - 1 : 0] next_counter;

    enum {
        IDLE, FIND, SEND
    } state = IDLE, next_state;

    always_comb begin
        next_state = state;
        next_counter = counter - 'd1;
        next_bit_counter = bit_counter;
        next_sr = sr;
        valid = '0;

        case (state)
        IDLE: begin
            if (rx2 && ! rx1) begin
                next_counter = SAMPLE_FIRST;
                next_state = FIND;
                next_bit_counter = 'd7;
            end
        end
        FIND: begin
            if (counter == 'd0) begin
                next_sr = { rx2, sr[7:1] };
                next_counter = SAMPLE;
                next_bit_counter = bit_counter - 'd1;
                next_state = (bit_counter == 'd0) ? SEND : FIND;
            end
        end
        SEND: begin
            if (counter == 'd0) begin
                valid = rx2;
                next_state = IDLE;
            end
        end
        endcase
    end

    assign data = sr;

    always_ff @(posedge clk) begin
        state <= next_state;
        counter <= next_counter;
        bit_counter <= next_bit_counter;
        sr <= next_sr;
    end
endmodule
