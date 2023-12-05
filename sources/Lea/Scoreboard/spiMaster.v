`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2023 10:32:06 AM
// Design Name: 
// Module Name: spiMaster
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module spiMaster(
    input clk,                 // 4MHz
    input miso,                 // master in
	output sclk,				// 1MHz
    output reg mosi = 1'b0,     // master out
    output reg cs = 1'b1,       // slave chip select
    output [4:0] acl_data     //  5 bit x- axis
    );
    
    // Control sclk output for spi mode
	reg sclk_control = 1'b0;		
	
	// Create a 1MHz signal from a 4MHz signal
	// For a 50% duty cycle
	// 4 x 10^6 / 1 x 10^6 / 2 = 2
	reg clk_counter = 1'b0;
	reg clk_reg = 1'b1;	
	
	always @(posedge clk) begin
		clk_counter <= clk_counter + 1;
		if(clk_counter == 1'b1)
			clk_reg <= ~clk_reg;         // this is sclk
	end
	
	
	reg [7:0] write_instr   = 8'h0A;			// Sensor write instruction
	reg [7:0] mode_reg_addr = 8'h2D;			// Mode register address
	reg [7:0] mode_wr_data  = 8'h02;			// Data to write to mode register
    reg [7:0] read_instr    = 8'h0B;			// Sensor read instruction
    reg [7:0] x_LSB_addr    = 8'h0E;			// X data LSB address, auto-increments to following 5 data registers
    reg [4:0] temp_DATA    = 5'b0;			// 5 bits for X axis		
    reg [15:0] X = 15'b0;						// X data MSB and LSB from sensor
    reg [31:0] counter = 32'b0;         		// State machine sync counter - 4000 ticks per ms at 4MHz
    wire latch_data;
    
    // 93 states for state machine
    localparam [5:0] POWER_UP    = 6'h00,		// Wait 6ms, CS = 0, SCLK = idle = 0
                     // SPI WRITE
					 BEGIN_SPIW  = 6'h01,		
                     // Send write instruction 0x0A
					 SEND_WCMD7   = 6'h02,		 
					 SEND_WCMD6   = 6'h03,
					 SEND_WCMD5   = 6'h04,
					 SEND_WCMD4   = 6'h05,
					 SEND_WCMD3   = 6'h06,
					 SEND_WCMD2   = 6'h07,
					 SEND_WCMD1   = 6'h08,
					 SEND_WCMD0   = 6'h09,
                     // Send register address to write to 0x2D
					 SEND_WADDR7  = 6'h0A,		
					 SEND_WADDR6  = 6'h0B,
					 SEND_WADDR5  = 6'h0C,
					 SEND_WADDR4  = 6'h0D,
					 SEND_WADDR3  = 6'h0E,
					 SEND_WADDR2  = 6'h0F,
					 SEND_WADDR1  = 6'h10,
					 SEND_WADDR0  = 6'h11,
                     // Send byte to put into measurement mode 0x02
					 SEND_BYTE7  = 6'h12,		
					 SEND_BYTE6  = 6'h13,
					 SEND_BYTE5  = 6'h14,
					 SEND_BYTE4  = 6'h15,
					 SEND_BYTE3  = 6'h16,
					 SEND_BYTE2  = 6'h17,
					 SEND_BYTE1  = 6'h18,
					 SEND_BYTE0  = 6'h19,
                     // Wait for first valid data after init measurement mode = 40ms
					 WAIT        = 6'h1A,
					 // SPI READ
					 BEGIN_SPIR  = 6'h1B,
					 // Send read instruction 0x0B
					 SEND_RCMD7  = 6'h1C,		
					 SEND_RCMD6  = 6'h1D,
					 SEND_RCMD5  = 6'h1E,
					 SEND_RCMD4  = 6'h1F,
					 SEND_RCMD3  = 6'h20,
					 SEND_RCMD2  = 6'h21,
                     SEND_RCMD1  = 6'h22,
					 SEND_RCMD0  = 6'h23,
					 // Send X data LSB register address 0x0E
					 SEND_RADDR7 = 6'h24,		
					 SEND_RADDR6 = 6'h25,
					 SEND_RADDR5 = 6'h26,
					 SEND_RADDR4 = 6'h27,
					 SEND_RADDR3 = 6'h28,
					 SEND_RADDR2 = 6'h29,
                     SEND_RADDR1 = 6'h2A,
                     SEND_RADDR0 = 6'h2B,
					 // Receive X data LSB from 0x0E
					 REC_XLSB7	 = 6'h2C,
					 REC_XLSB6	 = 6'h2D,
					 REC_XLSB5	 = 6'h2E,
					 REC_XLSB4	 = 6'h2F,
					 REC_XLSB3	 = 6'h30,
					 REC_XLSB2	 = 6'h31,
					 REC_XLSB1	 = 6'h32,
					 REC_XLSB0	 = 6'h33,
					 // Receive X data MSB from 0x0F
					 REC_XMSB7	 = 6'h34,
					 REC_XMSB6	 = 6'h35,
					 REC_XMSB5	 = 6'h36,
					 REC_XMSB4	 = 6'h37,
					 REC_XMSB3	 = 6'h38,
					 REC_XMSB2	 = 6'h39,
					 REC_XMSB1	 = 6'h3A,
					 REC_XMSB0	 = 6'h3B,
					 // End SPI communications
					 END_SPI	 = 6'h3C;	// Wait 10ms, loop back to BEGIN_SPIR
					 
					 
    // State Register              
    reg [5:0] state_reg = POWER_UP;         // Initial state of state register
                                   
    always @(posedge clk) begin   
        counter <= counter + 1;                             // Increment state machine sync counter
        case(state_reg)
            POWER_UP    : begin
                            if(counter == 32'd23999)		// Wait for 6ms, for sensor to reach standby mode
                                state_reg <= BEGIN_SPIW;
			end
			
	// Begin SPI write communication with sensor by sending CS line low
			
			BEGIN_SPIW	: begin						// 24000
							if(counter == 32'd24001) begin
								state_reg <= SEND_WCMD7;
								cs <= 1'b0;			// 24002								
							end	
			end
			
	// Send the write command to initiate a write sequence
			
            SEND_WCMD7    : begin					// 24002
							sclk_control <= 1'b1;	// 24003	satisfy CPHA = 0, first edge is posedge of SCLK
							mosi <= write_instr[7];	// 24003
							if(counter == 32'd24005)
								state_reg <= SEND_WCMD6;
            end
			SEND_WCMD6    : begin					// 24006
							mosi <= write_instr[6];	// 24007
							if(counter == 32'd24009)
								state_reg <= SEND_WCMD5;
            end
			SEND_WCMD5    : begin					// 24010
							mosi <= write_instr[5];	// 24011
							if(counter == 32'd24013)
								state_reg <= SEND_WCMD4;
            end
			SEND_WCMD4    : begin					// 24014
							mosi <= write_instr[4];	// 24015
							if(counter == 32'd24017)
								state_reg <= SEND_WCMD3;
            end
			SEND_WCMD3    : begin					// 24018
							mosi <= write_instr[3];	// 24019
							if(counter == 32'd24021)
								state_reg <= SEND_WCMD2;
            end
			SEND_WCMD2    : begin					// 24022
							mosi <= write_instr[2];	// 24023
							if(counter == 32'd24025)
								state_reg <= SEND_WCMD1;
            end
			SEND_WCMD1    : begin					// 24026
							mosi <= write_instr[1];	// 24027
							if(counter == 32'd24029)
								state_reg <= SEND_WCMD0;
            end
			SEND_WCMD0    : begin					// 24030
							mosi <= write_instr[0];	// 24031
							if(counter == 32'd24033)
								state_reg <= SEND_WADDR7;
            end
			
	// Send the address to write to, in this case the 0x2D register, to configure sensor to measurement mode
			
            SEND_WADDR7   : begin						// 24034
							mosi <= mode_reg_addr[7];	// 24035
							if(counter == 32'd24037)
								state_reg <= SEND_WADDR6;							
            end
			SEND_WADDR6   : begin						// 24038
							mosi <= mode_reg_addr[6];	// 24039
							if(counter == 32'd24041)
								state_reg <= SEND_WADDR5;
            end
			SEND_WADDR5   : begin						// 24042
							mosi <= mode_reg_addr[5];	// 24043
							if(counter == 32'd24045)
								state_reg <= SEND_WADDR4;
            end
			SEND_WADDR4   : begin						// 24046
							mosi <= mode_reg_addr[4];	// 24047
							if(counter == 32'd24049)
								state_reg <= SEND_WADDR3;
            end
			SEND_WADDR3   : begin						// 24050
							mosi <= mode_reg_addr[3];	// 24051
							if(counter == 32'd24053)
								state_reg <= SEND_WADDR2;
            end
			SEND_WADDR2   : begin						// 24054
							mosi <= mode_reg_addr[2];	// 24055
							if(counter == 32'd24057)
								state_reg <= SEND_WADDR1;
            end
			SEND_WADDR1   : begin						// 24058
							mosi <= mode_reg_addr[1];	// 24059
							if(counter == 32'd24061)
								state_reg <= SEND_WADDR0;
            end
			SEND_WADDR0   : begin						// 24062
							mosi <= mode_reg_addr[0];	// 24063
							if(counter == 32'd24065)
								state_reg <= SEND_BYTE7;
            end
			
	// Send the value to write to the 0x2D register, in this case 0x02, for measurement mode		
			
			SEND_BYTE7	: begin							// 24066
							mosi <= mode_wr_data[7];	// 24067
							if(counter == 32'd24069)
								state_reg <= SEND_BYTE6;
			end
			SEND_BYTE6	: begin							// 24070
							mosi <= mode_wr_data[6];	// 24071
							if(counter == 32'd24073)
								state_reg <= SEND_BYTE5;
			
			end
			SEND_BYTE5	: begin							// 24074
							mosi <= mode_wr_data[5];	// 24075
							if(counter == 32'd24077)
								state_reg <= SEND_BYTE4;
			
			end
            SEND_BYTE4	: begin							// 24078
							mosi <= mode_wr_data[4];	// 24079
							if(counter == 32'd24081)
								state_reg <= SEND_BYTE3;
			
			end
            SEND_BYTE3	: begin							// 24082
							mosi <= mode_wr_data[3];	// 24083
							if(counter == 32'd24085)
								state_reg <= SEND_BYTE2;
			
			end
            SEND_BYTE2	: begin							// 24086
							mosi <= mode_wr_data[2];	// 24087
							if(counter == 32'd24089)
								state_reg <= SEND_BYTE1;
			
			end
			SEND_BYTE1	: begin							// 24090
							mosi <= mode_wr_data[1];	// 24091
							if(counter == 32'd24093)
								state_reg <= SEND_BYTE0;
			
			end
            SEND_BYTE0	: begin							// 24094
							mosi <= mode_wr_data[0];	// 24095
							if(counter == 32'd24097) begin
								state_reg <= WAIT;
								counter <= 32'd0;
								cs <= 1'b1;			// Turn OFF CS
								sclk_control <= 1'b0;	// Turn OFF SCLK
							end
			
			end
			
	// Wait for 40ms after setting measurement mode to allow first valid data, 160,000 ticks + 3 to line up SCLK
			
			WAIT		: begin							// 0
							if(counter == 32'd160002) begin
								counter <= 32'd0;
								state_reg <= BEGIN_SPIR;
								end
			end
			
	// Begin SPI read communication with sensor by sending CS low
			
			BEGIN_SPIR	: begin							// 0
							if(counter == 32'd1) begin
								state_reg <= SEND_RCMD7;
								cs <= 1'b0;				// 2
								sclk_control <= 1'b1;	// 2
							end
			
			end
			
	// Send the read command to initiate a read sequence
	
			SEND_RCMD7 	: begin							// 2
							mosi <= read_instr[7];		// 3
							if(counter == 32'd4)
								state_reg <= SEND_RCMD6;
			end
			SEND_RCMD6 	: begin							// 5
							mosi <= read_instr[6];		// 6
							if(counter == 32'd8)
								state_reg <= SEND_RCMD5;
			end 
			SEND_RCMD5 	: begin							// 9
							mosi <= read_instr[5];		// 10
							if(counter == 32'd12)
								state_reg <= SEND_RCMD4;
			end 
			SEND_RCMD4 	: begin							// 13
							mosi <= read_instr[4];		// 14
							if(counter == 32'd16)
								state_reg <= SEND_RCMD3;
			end 
			SEND_RCMD3 	: begin							// 17
							mosi <= read_instr[3];		// 18
							if(counter == 32'd20)
								state_reg <= SEND_RCMD2;
			end 
			SEND_RCMD2 	: begin							// 21
							mosi <= read_instr[2];		// 22
							if(counter == 32'd24)
								state_reg <= SEND_RCMD1;
			end 
			SEND_RCMD1 	: begin							// 25
							mosi <= read_instr[1];		// 26
							if(counter == 32'd28)
								state_reg <= SEND_RCMD0;
			end 
			SEND_RCMD0 	: begin							// 29
							mosi <= read_instr[0];		// 30
							if(counter == 32'd32)
								state_reg <= SEND_RADDR7;
			end 

	// Send register address to read from, in this case 0x0E, the x data LSB 

			SEND_RADDR7 : begin							// 33
							mosi <= x_LSB_addr[7];		// 34
							if(counter == 32'd36)
								state_reg <= SEND_RADDR6;
			end
			SEND_RADDR6 : begin							// 37
							mosi <= x_LSB_addr[6];		// 38
							if(counter == 32'd40)
								state_reg <= SEND_RADDR5;
			end
			SEND_RADDR5 : begin							// 41
							mosi <= x_LSB_addr[5];		// 42
							if(counter == 32'd44)
								state_reg <= SEND_RADDR4;
			end
			SEND_RADDR4 : begin							// 45
							mosi <= x_LSB_addr[4];		// 46
							if(counter == 32'd48)
								state_reg <= SEND_RADDR3;
			end
			SEND_RADDR3 : begin							// 49
							mosi <= x_LSB_addr[3];		// 50
							if(counter == 32'd52)
								state_reg <= SEND_RADDR2;
			end
			SEND_RADDR2 : begin							// 53
							mosi <= x_LSB_addr[2];		// 54
							if(counter == 32'd56)
								state_reg <= SEND_RADDR1;
			end
			SEND_RADDR1 : begin							// 57
							mosi <= x_LSB_addr[1];		// 58
							if(counter == 32'd60)
								state_reg <= SEND_RADDR0;
			end
			SEND_RADDR0 : begin							// 61
							mosi <= x_LSB_addr[0];		// 62
							if(counter == 32'd64)
								state_reg <= REC_XLSB7;
			end

	// Receive x data LSB[7:0], store in LSB of X data reg

			REC_XLSB7 	: begin							// 65
							X[7] <= miso;				// 66
							if(counter == 32'd68)
								state_reg <= REC_XLSB6;
			end	
			REC_XLSB6 	: begin							// 69
							X[6] <= miso;				// 70
							if(counter == 32'd72)
								state_reg <= REC_XLSB5;
			end	
			REC_XLSB5 	: begin							// 73
							X[5] <= miso;				// 74
							if(counter == 32'd76)
								state_reg <= REC_XLSB4;
			end	
			REC_XLSB4 	: begin							// 77
							X[4] <= miso;				// 78
							if(counter == 32'd80)
								state_reg <= REC_XLSB3;
			end	
			REC_XLSB3 	: begin							// 81
							X[3] <= miso;				// 82
							if(counter == 32'd84)
								state_reg <= REC_XLSB2;
			end	
			REC_XLSB2 	: begin							// 85
							X[2] <= miso;				// 86
							if(counter == 32'd88)
								state_reg <= REC_XLSB1;
			end	
			REC_XLSB1 	: begin							// 89
							X[1] <= miso;				// 90
							if(counter == 32'd92)
								state_reg <= REC_XLSB0;
			end	
			REC_XLSB0 	: begin							// 93
							X[0] <= miso;				// 94
							if(counter == 32'd96)
								state_reg <= REC_XMSB7;
			end	

	// Receive x data MSB[7:0], store in MSB of X data reg

			REC_XMSB7 	: begin							// 97
							X[15] <= miso;				// 98
							if(counter == 32'd100)
								state_reg <= REC_XMSB6;
			end	
			REC_XMSB6 	: begin							// 101
							X[14] <= miso;				// 102
							if(counter == 32'd104)
								state_reg <= REC_XMSB5;
			end	
			REC_XMSB5 	: begin							// 105
							X[13] <= miso;				// 106
							if(counter == 32'd108)
								state_reg <= REC_XMSB4;
			end	
			REC_XMSB4 	: begin							// 109
							X[12] <= miso;				// 110
							if(counter == 32'd112)
								state_reg <= REC_XMSB3;
			end	
			REC_XMSB3 	: begin							// 113
							X[11] <= miso;				// 114
							if(counter == 32'd116)
								state_reg <= REC_XMSB2;
			end	
			REC_XMSB2 	: begin							// 117
							X[10] <= miso;				// 118
							if(counter == 32'd120)
								state_reg <= REC_XMSB1;
			end	
			REC_XMSB1 	: begin							// 121
							X[9] <= miso;				// 122
							if(counter == 32'd124)
								state_reg <= REC_XMSB0;
			end	
			REC_XMSB0 	: begin							// 125
							X[8] <= miso;				// 126
							if(counter == 32'd128)
								state_reg <= END_SPI;
			end	
							
	       // End read communications, wait 10ms for 100Hz data rate = 40,000 ticks
			default 	: begin							// 129
							if(counter == 32'd40259) begin
								counter <= 32'd0;				// reset counter
								state_reg <= BEGIN_SPIR;		// Loop back to initiate another read operation
							end
			end		
        endcase
    end
    
    // Data Buffer
    always @(negedge clk)
        if(latch_data) begin		// latch 1&1/2 tick after entering state END_SPI
            temp_DATA <= X[11:7];   // latch sign bit + 4 data bits each axis
		end
    
    // Output accelerometer data
    assign acl_data = temp_DATA;
	
	assign latch_data = ((state_reg == END_SPI) && (counter == 32'd130)) ? 1 : 0;
	assign sclk = (sclk_control) ? clk_reg : 0;
    
endmodule
