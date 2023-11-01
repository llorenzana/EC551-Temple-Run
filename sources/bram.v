`timescale 1ns / 1ps

module bram(input [9:0] x, input[8:0] y, output reg [11:0] VGA);

	always @(*) begin
		if (x==0 && y==0) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==0 && y==1) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==0 && y==2) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==0 && y==3) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==0 && y==4) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==0 && y==5) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==0 && y==6) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==0 && y==7) begin
			VGA = {4'b1101, 4'b1011, 4'b1011};
		end else if (x==0 && y==8) begin
			VGA = {4'b1011, 4'b1000, 4'b0110};
		end else if (x==0 && y==9) begin
			VGA = {4'b1101, 4'b1001, 4'b0111};
		end else if (x==0 && y==10) begin
			VGA = {4'b1100, 4'b1001, 4'b0111};
		end else if (x==0 && y==11) begin
			VGA = {4'b1100, 4'b1001, 4'b0111};
		end else if (x==0 && y==12) begin
			VGA = {4'b1100, 4'b1001, 4'b0110};
		end else if (x==0 && y==13) begin
			VGA = {4'b1011, 4'b1000, 4'b0110};
		end else if (x==0 && y==14) begin
			VGA = {4'b1010, 4'b0111, 4'b0101};
		end else if (x==0 && y==15) begin
			VGA = {4'b1011, 4'b1000, 4'b0101};
		end else if (x==0 && y==16) begin
			VGA = {4'b1100, 4'b1011, 4'b1011};
		end else if (x==0 && y==17) begin
			VGA = {4'b1100, 4'b1011, 4'b1010};
		end else if (x==0 && y==18) begin
			VGA = {4'b1011, 4'b1001, 4'b1000};
		end else if (x==0 && y==19) begin
			VGA = {4'b1011, 4'b1010, 4'b1001};
		end else if (x==0 && y==20) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==0 && y==21) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==0 && y==22) begin
			VGA = {4'b1111, 4'b1111, 4'b1110};
		end else if (x==0 && y==23) begin
			VGA = {4'b1111, 4'b1111, 4'b1110};
		end else if (x==0 && y==24) begin
			VGA = {4'b1111, 4'b1111, 4'b1110};
		end else if (x==0 && y==25) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==0 && y==26) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==0 && y==27) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==0 && y==28) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==0 && y==29) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==0 && y==30) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==0 && y==31) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==0 && y==32) begin
			VGA = {4'b1111, 4'b1111, 4'b1110};
		end else if (x==0 && y==33) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==0 && y==34) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==0 && y==35) begin
			VGA = {4'b1111, 4'b1111, 4'b1110};
		end else if (x==0 && y==36) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==0 && y==37) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==0 && y==38) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==0 && y==39) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==1 && y==0) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==1 && y==1) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==1 && y==2) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==1 && y==3) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==1 && y==4) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==1 && y==5) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==1 && y==6) begin
			VGA = {4'b1110, 4'b1101, 4'b1100};
		end else if (x==1 && y==7) begin
			VGA = {4'b1100, 4'b1001, 4'b0110};
		end else if (x==1 && y==8) begin
			VGA = {4'b1101, 4'b1001, 4'b0111};
		end else if (x==1 && y==9) begin
			VGA = {4'b1101, 4'b1001, 4'b0111};
		end else if (x==1 && y==10) begin
			VGA = {4'b1011, 4'b1000, 4'b0101};
		end else if (x==1 && y==11) begin
			VGA = {4'b1100, 4'b1001, 4'b0110};
		end else if (x==1 && y==12) begin
			VGA = {4'b1011, 4'b1001, 4'b0111};
		end else if (x==1 && y==13) begin
			VGA = {4'b1100, 4'b1010, 4'b1001};
		end else if (x==1 && y==14) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==1 && y==15) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==1 && y==16) begin
			VGA = {4'b1110, 4'b1110, 4'b1111};
		end else if (x==1 && y==17) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==1 && y==18) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==1 && y==19) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==1 && y==20) begin
			VGA = {4'b1100, 4'b1011, 4'b1011};
		end else if (x==1 && y==21) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==1 && y==22) begin
			VGA = {4'b1110, 4'b1111, 4'b1110};
		end else if (x==1 && y==23) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==1 && y==24) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==1 && y==25) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==1 && y==26) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==1 && y==27) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==1 && y==28) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==1 && y==29) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==1 && y==30) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==1 && y==31) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==1 && y==32) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==1 && y==33) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==1 && y==34) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==1 && y==35) begin
			VGA = {4'b1111, 4'b1111, 4'b1110};
		end else if (x==1 && y==36) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==1 && y==37) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==1 && y==38) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==1 && y==39) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==2 && y==0) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==2 && y==1) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==2 && y==2) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==2 && y==3) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==2 && y==4) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==2 && y==5) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==2 && y==6) begin
			VGA = {4'b1101, 4'b1010, 4'b1000};
		end else if (x==2 && y==7) begin
			VGA = {4'b1100, 4'b1000, 4'b0100};
		end else if (x==2 && y==8) begin
			VGA = {4'b1011, 4'b0111, 4'b0100};
		end else if (x==2 && y==9) begin
			VGA = {4'b1100, 4'b0111, 4'b0100};
		end else if (x==2 && y==10) begin
			VGA = {4'b1100, 4'b1000, 4'b0100};
		end else if (x==2 && y==11) begin
			VGA = {4'b1110, 4'b1101, 4'b1100};
		end else if (x==2 && y==12) begin
			VGA = {4'b1111, 4'b1110, 4'b1111};
		end else if (x==2 && y==13) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==2 && y==14) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==2 && y==15) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==2 && y==16) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==2 && y==17) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==2 && y==18) begin
			VGA = {4'b1110, 4'b1101, 4'b1100};
		end else if (x==2 && y==19) begin
			VGA = {4'b1011, 4'b1010, 4'b1010};
		end else if (x==2 && y==20) begin
			VGA = {4'b1100, 4'b1010, 4'b1010};
		end else if (x==2 && y==21) begin
			VGA = {4'b1110, 4'b1100, 4'b1011};
		end else if (x==2 && y==22) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==2 && y==23) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==2 && y==24) begin
			VGA = {4'b1111, 4'b1111, 4'b1110};
		end else if (x==2 && y==25) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==2 && y==26) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==2 && y==27) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==2 && y==28) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==2 && y==29) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==2 && y==30) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==2 && y==31) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==2 && y==32) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==2 && y==33) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==2 && y==34) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==2 && y==35) begin
			VGA = {4'b1111, 4'b1111, 4'b1110};
		end else if (x==2 && y==36) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==2 && y==37) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==2 && y==38) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==2 && y==39) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==3 && y==0) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==3 && y==1) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==3 && y==2) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==3 && y==3) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==3 && y==4) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==3 && y==5) begin
			VGA = {4'b1101, 4'b1011, 4'b1010};
		end else if (x==3 && y==6) begin
			VGA = {4'b1011, 4'b0111, 4'b0011};
		end else if (x==3 && y==7) begin
			VGA = {4'b1011, 4'b0111, 4'b0100};
		end else if (x==3 && y==8) begin
			VGA = {4'b1011, 4'b0111, 4'b0100};
		end else if (x==3 && y==9) begin
			VGA = {4'b1010, 4'b0111, 4'b0101};
		end else if (x==3 && y==10) begin
			VGA = {4'b1101, 4'b1100, 4'b1010};
		end else if (x==3 && y==11) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==3 && y==12) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==3 && y==13) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==3 && y==14) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==3 && y==15) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==3 && y==16) begin
			VGA = {4'b1100, 4'b1100, 4'b1100};
		end else if (x==3 && y==17) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==3 && y==18) begin
			VGA = {4'b1111, 4'b1111, 4'b1110};
		end else if (x==3 && y==19) begin
			VGA = {4'b1110, 4'b1101, 4'b1100};
		end else if (x==3 && y==20) begin
			VGA = {4'b1101, 4'b1011, 4'b1001};
		end else if (x==3 && y==21) begin
			VGA = {4'b1101, 4'b1010, 4'b1000};
		end else if (x==3 && y==22) begin
			VGA = {4'b1101, 4'b1011, 4'b1001};
		end else if (x==3 && y==23) begin
			VGA = {4'b1101, 4'b1011, 4'b1011};
		end else if (x==3 && y==24) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==3 && y==25) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==3 && y==26) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==3 && y==27) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==3 && y==28) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==3 && y==29) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==3 && y==30) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==3 && y==31) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==3 && y==32) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==3 && y==33) begin
			VGA = {4'b1111, 4'b1111, 4'b1110};
		end else if (x==3 && y==34) begin
			VGA = {4'b1111, 4'b1111, 4'b1110};
		end else if (x==3 && y==35) begin
			VGA = {4'b1111, 4'b1111, 4'b1110};
		end else if (x==3 && y==36) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==3 && y==37) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==3 && y==38) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==3 && y==39) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==4 && y==0) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==4 && y==1) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==4 && y==2) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==4 && y==3) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==4 && y==4) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==4 && y==5) begin
			VGA = {4'b1011, 4'b0111, 4'b0011};
		end else if (x==4 && y==6) begin
			VGA = {4'b1010, 4'b0110, 4'b0010};
		end else if (x==4 && y==7) begin
			VGA = {4'b1010, 4'b0110, 4'b0100};
		end else if (x==4 && y==8) begin
			VGA = {4'b1010, 4'b0111, 4'b0101};
		end else if (x==4 && y==9) begin
			VGA = {4'b1011, 4'b1010, 4'b1001};
		end else if (x==4 && y==10) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==4 && y==11) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==4 && y==12) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==4 && y==13) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==4 && y==14) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==4 && y==15) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==4 && y==16) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==4 && y==17) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==4 && y==18) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==4 && y==19) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==4 && y==20) begin
			VGA = {4'b1101, 4'b1010, 4'b1000};
		end else if (x==4 && y==21) begin
			VGA = {4'b1101, 4'b1010, 4'b0111};
		end else if (x==4 && y==22) begin
			VGA = {4'b1101, 4'b1010, 4'b0111};
		end else if (x==4 && y==23) begin
			VGA = {4'b1101, 4'b1010, 4'b0111};
		end else if (x==4 && y==24) begin
			VGA = {4'b1100, 4'b1001, 4'b0110};
		end else if (x==4 && y==25) begin
			VGA = {4'b1110, 4'b1011, 4'b1000};
		end else if (x==4 && y==26) begin
			VGA = {4'b1110, 4'b1100, 4'b1011};
		end else if (x==4 && y==27) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==4 && y==28) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==4 && y==29) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==4 && y==30) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==4 && y==31) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==4 && y==32) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==4 && y==33) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==4 && y==34) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==4 && y==35) begin
			VGA = {4'b1111, 4'b1111, 4'b1110};
		end else if (x==4 && y==36) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==4 && y==37) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==4 && y==38) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==4 && y==39) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==5 && y==0) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==5 && y==1) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==5 && y==2) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==5 && y==3) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==5 && y==4) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==5 && y==5) begin
			VGA = {4'b1011, 4'b0111, 4'b0100};
		end else if (x==5 && y==6) begin
			VGA = {4'b1010, 4'b0110, 4'b0011};
		end else if (x==5 && y==7) begin
			VGA = {4'b1001, 4'b0110, 4'b0011};
		end else if (x==5 && y==8) begin
			VGA = {4'b1100, 4'b1010, 4'b1001};
		end else if (x==5 && y==9) begin
			VGA = {4'b1110, 4'b1101, 4'b1100};
		end else if (x==5 && y==10) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==5 && y==11) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==5 && y==12) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==5 && y==13) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==5 && y==14) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==5 && y==15) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==5 && y==16) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==5 && y==17) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==5 && y==18) begin
			VGA = {4'b1111, 4'b1111, 4'b1110};
		end else if (x==5 && y==19) begin
			VGA = {4'b1111, 4'b1110, 4'b1101};
		end else if (x==5 && y==20) begin
			VGA = {4'b1100, 4'b1010, 4'b0111};
		end else if (x==5 && y==21) begin
			VGA = {4'b1100, 4'b1001, 4'b0110};
		end else if (x==5 && y==22) begin
			VGA = {4'b1100, 4'b1001, 4'b0110};
		end else if (x==5 && y==23) begin
			VGA = {4'b1100, 4'b1001, 4'b0111};
		end else if (x==5 && y==24) begin
			VGA = {4'b1100, 4'b1000, 4'b0101};
		end else if (x==5 && y==25) begin
			VGA = {4'b1011, 4'b0111, 4'b0011};
		end else if (x==5 && y==26) begin
			VGA = {4'b1110, 4'b1011, 4'b1001};
		end else if (x==5 && y==27) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==5 && y==28) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==5 && y==29) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==5 && y==30) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==5 && y==31) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==5 && y==32) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==5 && y==33) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==5 && y==34) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==5 && y==35) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==5 && y==36) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==5 && y==37) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==5 && y==38) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==5 && y==39) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==6 && y==0) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==6 && y==1) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==6 && y==2) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==6 && y==3) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==6 && y==4) begin
			VGA = {4'b1110, 4'b1101, 4'b1100};
		end else if (x==6 && y==5) begin
			VGA = {4'b1100, 4'b1001, 4'b0111};
		end else if (x==6 && y==6) begin
			VGA = {4'b1001, 4'b0110, 4'b0010};
		end else if (x==6 && y==7) begin
			VGA = {4'b1001, 4'b0101, 4'b0011};
		end else if (x==6 && y==8) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==6 && y==9) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==6 && y==10) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==6 && y==11) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==6 && y==12) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==6 && y==13) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==6 && y==14) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==6 && y==15) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==6 && y==16) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==6 && y==17) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==6 && y==18) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==6 && y==19) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==6 && y==20) begin
			VGA = {4'b1100, 4'b1001, 4'b0111};
		end else if (x==6 && y==21) begin
			VGA = {4'b1100, 4'b1000, 4'b0101};
		end else if (x==6 && y==22) begin
			VGA = {4'b1100, 4'b1000, 4'b0101};
		end else if (x==6 && y==23) begin
			VGA = {4'b1101, 4'b1001, 4'b0111};
		end else if (x==6 && y==24) begin
			VGA = {4'b1100, 4'b1001, 4'b0110};
		end else if (x==6 && y==25) begin
			VGA = {4'b1001, 4'b0101, 4'b0010};
		end else if (x==6 && y==26) begin
			VGA = {4'b1101, 4'b1010, 4'b0110};
		end else if (x==6 && y==27) begin
			VGA = {4'b1110, 4'b1100, 4'b1011};
		end else if (x==6 && y==28) begin
			VGA = {4'b1110, 4'b1101, 4'b1100};
		end else if (x==6 && y==29) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==6 && y==30) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==6 && y==31) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==6 && y==32) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==6 && y==33) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==6 && y==34) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==6 && y==35) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==6 && y==36) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==6 && y==37) begin
			VGA = {4'b1111, 4'b1111, 4'b1110};
		end else if (x==6 && y==38) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==6 && y==39) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==7 && y==0) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==7 && y==1) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==7 && y==2) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==7 && y==3) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==7 && y==4) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==7 && y==5) begin
			VGA = {4'b1100, 4'b1010, 4'b1000};
		end else if (x==7 && y==6) begin
			VGA = {4'b1000, 4'b0101, 4'b0010};
		end else if (x==7 && y==7) begin
			VGA = {4'b1010, 4'b0111, 4'b0100};
		end else if (x==7 && y==8) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==7 && y==9) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==7 && y==10) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==7 && y==11) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==7 && y==12) begin
			VGA = {4'b1011, 4'b1010, 4'b1010};
		end else if (x==7 && y==13) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==7 && y==14) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==7 && y==15) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==7 && y==16) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==7 && y==17) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==7 && y==18) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==7 && y==19) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==7 && y==20) begin
			VGA = {4'b1011, 4'b1000, 4'b0101};
		end else if (x==7 && y==21) begin
			VGA = {4'b1011, 4'b0111, 4'b0100};
		end else if (x==7 && y==22) begin
			VGA = {4'b1011, 4'b0111, 4'b0100};
		end else if (x==7 && y==23) begin
			VGA = {4'b1100, 4'b1000, 4'b0101};
		end else if (x==7 && y==24) begin
			VGA = {4'b1101, 4'b1001, 4'b0110};
		end else if (x==7 && y==25) begin
			VGA = {4'b1000, 4'b0100, 4'b0010};
		end else if (x==7 && y==26) begin
			VGA = {4'b1100, 4'b1001, 4'b0110};
		end else if (x==7 && y==27) begin
			VGA = {4'b1110, 4'b1100, 4'b1010};
		end else if (x==7 && y==28) begin
			VGA = {4'b1110, 4'b1101, 4'b1100};
		end else if (x==7 && y==29) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==7 && y==30) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==7 && y==31) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==7 && y==32) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==7 && y==33) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==7 && y==34) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==7 && y==35) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==7 && y==36) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==7 && y==37) begin
			VGA = {4'b1111, 4'b1111, 4'b1110};
		end else if (x==7 && y==38) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==7 && y==39) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==8 && y==0) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==8 && y==1) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==8 && y==2) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==8 && y==3) begin
			VGA = {4'b1110, 4'b1101, 4'b1100};
		end else if (x==8 && y==4) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==8 && y==5) begin
			VGA = {4'b1011, 4'b0111, 4'b0100};
		end else if (x==8 && y==6) begin
			VGA = {4'b1001, 4'b0101, 4'b0001};
		end else if (x==8 && y==7) begin
			VGA = {4'b1011, 4'b1000, 4'b0111};
		end else if (x==8 && y==8) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==8 && y==9) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==8 && y==10) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==8 && y==11) begin
			VGA = {4'b1011, 4'b1010, 4'b1000};
		end else if (x==8 && y==12) begin
			VGA = {4'b1000, 4'b0110, 4'b0100};
		end else if (x==8 && y==13) begin
			VGA = {4'b1110, 4'b1101, 4'b1100};
		end else if (x==8 && y==14) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==8 && y==15) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==8 && y==16) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==8 && y==17) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==8 && y==18) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==8 && y==19) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==8 && y==20) begin
			VGA = {4'b1001, 4'b0110, 4'b0010};
		end else if (x==8 && y==21) begin
			VGA = {4'b1001, 4'b0101, 4'b0011};
		end else if (x==8 && y==22) begin
			VGA = {4'b1010, 4'b0111, 4'b0100};
		end else if (x==8 && y==23) begin
			VGA = {4'b1100, 4'b1000, 4'b0101};
		end else if (x==8 && y==24) begin
			VGA = {4'b1011, 4'b1000, 4'b0101};
		end else if (x==8 && y==25) begin
			VGA = {4'b0111, 4'b0101, 4'b0010};
		end else if (x==8 && y==26) begin
			VGA = {4'b1101, 4'b1001, 4'b0101};
		end else if (x==8 && y==27) begin
			VGA = {4'b1110, 4'b1100, 4'b1010};
		end else if (x==8 && y==28) begin
			VGA = {4'b1111, 4'b1101, 4'b1011};
		end else if (x==8 && y==29) begin
			VGA = {4'b1110, 4'b1101, 4'b1100};
		end else if (x==8 && y==30) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==8 && y==31) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==8 && y==32) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==8 && y==33) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==8 && y==34) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==8 && y==35) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==8 && y==36) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==8 && y==37) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==8 && y==38) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==8 && y==39) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==9 && y==0) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==9 && y==1) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==9 && y==2) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==9 && y==3) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==9 && y==4) begin
			VGA = {4'b1101, 4'b1011, 4'b1010};
		end else if (x==9 && y==5) begin
			VGA = {4'b1001, 4'b0110, 4'b0010};
		end else if (x==9 && y==6) begin
			VGA = {4'b1001, 4'b0101, 4'b0010};
		end else if (x==9 && y==7) begin
			VGA = {4'b1100, 4'b1011, 4'b1010};
		end else if (x==9 && y==8) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==9 && y==9) begin
			VGA = {4'b1111, 4'b1110, 4'b1101};
		end else if (x==9 && y==10) begin
			VGA = {4'b1101, 4'b1011, 4'b1010};
		end else if (x==9 && y==11) begin
			VGA = {4'b1001, 4'b0110, 4'b0011};
		end else if (x==9 && y==12) begin
			VGA = {4'b1000, 4'b0110, 4'b0011};
		end else if (x==9 && y==13) begin
			VGA = {4'b1110, 4'b1101, 4'b1100};
		end else if (x==9 && y==14) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==9 && y==15) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==9 && y==16) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==9 && y==17) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==9 && y==18) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==9 && y==19) begin
			VGA = {4'b1011, 4'b1001, 4'b0111};
		end else if (x==9 && y==20) begin
			VGA = {4'b1001, 4'b0110, 4'b0011};
		end else if (x==9 && y==21) begin
			VGA = {4'b1010, 4'b0110, 4'b0100};
		end else if (x==9 && y==22) begin
			VGA = {4'b1000, 4'b0100, 4'b0010};
		end else if (x==9 && y==23) begin
			VGA = {4'b1010, 4'b0110, 4'b0100};
		end else if (x==9 && y==24) begin
			VGA = {4'b1100, 4'b1001, 4'b0110};
		end else if (x==9 && y==25) begin
			VGA = {4'b0110, 4'b0011, 4'b0001};
		end else if (x==9 && y==26) begin
			VGA = {4'b1001, 4'b0110, 4'b0010};
		end else if (x==9 && y==27) begin
			VGA = {4'b1101, 4'b1011, 4'b1000};
		end else if (x==9 && y==28) begin
			VGA = {4'b1101, 4'b1011, 4'b1010};
		end else if (x==9 && y==29) begin
			VGA = {4'b1110, 4'b1101, 4'b1011};
		end else if (x==9 && y==30) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==9 && y==31) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==9 && y==32) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==9 && y==33) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==9 && y==34) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==9 && y==35) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==9 && y==36) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==9 && y==37) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==9 && y==38) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==9 && y==39) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==10 && y==0) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==10 && y==1) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==10 && y==2) begin
			VGA = {4'b1100, 4'b1011, 4'b1001};
		end else if (x==10 && y==3) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==10 && y==4) begin
			VGA = {4'b1010, 4'b1000, 4'b0110};
		end else if (x==10 && y==5) begin
			VGA = {4'b1010, 4'b0101, 4'b0001};
		end else if (x==10 && y==6) begin
			VGA = {4'b1001, 4'b0110, 4'b0010};
		end else if (x==10 && y==7) begin
			VGA = {4'b1100, 4'b1011, 4'b1011};
		end else if (x==10 && y==8) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==10 && y==9) begin
			VGA = {4'b1011, 4'b1001, 4'b0111};
		end else if (x==10 && y==10) begin
			VGA = {4'b1001, 4'b0110, 4'b0011};
		end else if (x==10 && y==11) begin
			VGA = {4'b1000, 4'b0100, 4'b0010};
		end else if (x==10 && y==12) begin
			VGA = {4'b1001, 4'b0110, 4'b0100};
		end else if (x==10 && y==13) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==10 && y==14) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==10 && y==15) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==10 && y==16) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==10 && y==17) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==10 && y==18) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==10 && y==19) begin
			VGA = {4'b1000, 4'b0101, 4'b0011};
		end else if (x==10 && y==20) begin
			VGA = {4'b1000, 4'b0101, 4'b0010};
		end else if (x==10 && y==21) begin
			VGA = {4'b1011, 4'b0111, 4'b0100};
		end else if (x==10 && y==22) begin
			VGA = {4'b1010, 4'b0110, 4'b0100};
		end else if (x==10 && y==23) begin
			VGA = {4'b0111, 4'b0011, 4'b0001};
		end else if (x==10 && y==24) begin
			VGA = {4'b1010, 4'b0111, 4'b0101};
		end else if (x==10 && y==25) begin
			VGA = {4'b1000, 4'b0101, 4'b0011};
		end else if (x==10 && y==26) begin
			VGA = {4'b1001, 4'b0110, 4'b0100};
		end else if (x==10 && y==27) begin
			VGA = {4'b1010, 4'b0111, 4'b0100};
		end else if (x==10 && y==28) begin
			VGA = {4'b1111, 4'b1100, 4'b1010};
		end else if (x==10 && y==29) begin
			VGA = {4'b1110, 4'b1100, 4'b1011};
		end else if (x==10 && y==30) begin
			VGA = {4'b1110, 4'b1101, 4'b1100};
		end else if (x==10 && y==31) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==10 && y==32) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==10 && y==33) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==10 && y==34) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==10 && y==35) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==10 && y==36) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==10 && y==37) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==10 && y==38) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==10 && y==39) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==11 && y==0) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==11 && y==1) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==11 && y==2) begin
			VGA = {4'b1100, 4'b1011, 4'b1010};
		end else if (x==11 && y==3) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==11 && y==4) begin
			VGA = {4'b1001, 4'b0101, 4'b0011};
		end else if (x==11 && y==5) begin
			VGA = {4'b1001, 4'b0101, 4'b0001};
		end else if (x==11 && y==6) begin
			VGA = {4'b1001, 4'b0101, 4'b0010};
		end else if (x==11 && y==7) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==11 && y==8) begin
			VGA = {4'b1100, 4'b1011, 4'b1010};
		end else if (x==11 && y==9) begin
			VGA = {4'b1100, 4'b1001, 4'b0111};
		end else if (x==11 && y==10) begin
			VGA = {4'b1000, 4'b0101, 4'b0010};
		end else if (x==11 && y==11) begin
			VGA = {4'b1000, 4'b0101, 4'b0010};
		end else if (x==11 && y==12) begin
			VGA = {4'b1000, 4'b0101, 4'b0100};
		end else if (x==11 && y==13) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==11 && y==14) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==11 && y==15) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==11 && y==16) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==11 && y==17) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==11 && y==18) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==11 && y==19) begin
			VGA = {4'b1000, 4'b0101, 4'b0010};
		end else if (x==11 && y==20) begin
			VGA = {4'b1000, 4'b0101, 4'b0011};
		end else if (x==11 && y==21) begin
			VGA = {4'b1000, 4'b0101, 4'b0010};
		end else if (x==11 && y==22) begin
			VGA = {4'b1010, 4'b0111, 4'b0100};
		end else if (x==11 && y==23) begin
			VGA = {4'b1011, 4'b0111, 4'b0100};
		end else if (x==11 && y==24) begin
			VGA = {4'b1011, 4'b0111, 4'b0101};
		end else if (x==11 && y==25) begin
			VGA = {4'b1011, 4'b0111, 4'b0101};
		end else if (x==11 && y==26) begin
			VGA = {4'b0111, 4'b0100, 4'b0010};
		end else if (x==11 && y==27) begin
			VGA = {4'b0110, 4'b0011, 4'b0001};
		end else if (x==11 && y==28) begin
			VGA = {4'b1110, 4'b1011, 4'b1000};
		end else if (x==11 && y==29) begin
			VGA = {4'b1101, 4'b1011, 4'b1010};
		end else if (x==11 && y==30) begin
			VGA = {4'b1110, 4'b1100, 4'b1010};
		end else if (x==11 && y==31) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==11 && y==32) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==11 && y==33) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==11 && y==34) begin
			VGA = {4'b1111, 4'b1111, 4'b1110};
		end else if (x==11 && y==35) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==11 && y==36) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==11 && y==37) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==11 && y==38) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==11 && y==39) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==12 && y==0) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==12 && y==1) begin
			VGA = {4'b1101, 4'b1110, 4'b1101};
		end else if (x==12 && y==2) begin
			VGA = {4'b1101, 4'b1011, 4'b1010};
		end else if (x==12 && y==3) begin
			VGA = {4'b1011, 4'b1010, 4'b1000};
		end else if (x==12 && y==4) begin
			VGA = {4'b1001, 4'b0101, 4'b0010};
		end else if (x==12 && y==5) begin
			VGA = {4'b1001, 4'b0101, 4'b0001};
		end else if (x==12 && y==6) begin
			VGA = {4'b0111, 4'b0100, 4'b0010};
		end else if (x==12 && y==7) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==12 && y==8) begin
			VGA = {4'b1110, 4'b1101, 4'b1100};
		end else if (x==12 && y==9) begin
			VGA = {4'b1010, 4'b0110, 4'b0100};
		end else if (x==12 && y==10) begin
			VGA = {4'b0110, 4'b0011, 4'b0000};
		end else if (x==12 && y==11) begin
			VGA = {4'b0111, 4'b0100, 4'b0001};
		end else if (x==12 && y==12) begin
			VGA = {4'b1001, 4'b0110, 4'b0100};
		end else if (x==12 && y==13) begin
			VGA = {4'b1001, 4'b0111, 4'b0101};
		end else if (x==12 && y==14) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==12 && y==15) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==12 && y==16) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==12 && y==17) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==12 && y==18) begin
			VGA = {4'b1100, 4'b1100, 4'b1011};
		end else if (x==12 && y==19) begin
			VGA = {4'b1001, 4'b0110, 4'b0011};
		end else if (x==12 && y==20) begin
			VGA = {4'b1000, 4'b0101, 4'b0011};
		end else if (x==12 && y==21) begin
			VGA = {4'b0111, 4'b0100, 4'b0010};
		end else if (x==12 && y==22) begin
			VGA = {4'b1001, 4'b0111, 4'b0101};
		end else if (x==12 && y==23) begin
			VGA = {4'b1100, 4'b1001, 4'b0111};
		end else if (x==12 && y==24) begin
			VGA = {4'b1100, 4'b1001, 4'b0111};
		end else if (x==12 && y==25) begin
			VGA = {4'b1010, 4'b1000, 4'b0101};
		end else if (x==12 && y==26) begin
			VGA = {4'b0100, 4'b0010, 4'b0000};
		end else if (x==12 && y==27) begin
			VGA = {4'b0100, 4'b0001, 4'b0000};
		end else if (x==12 && y==28) begin
			VGA = {4'b1011, 4'b0111, 4'b0101};
		end else if (x==12 && y==29) begin
			VGA = {4'b1101, 4'b1010, 4'b1000};
		end else if (x==12 && y==30) begin
			VGA = {4'b1101, 4'b1100, 4'b1010};
		end else if (x==12 && y==31) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==12 && y==32) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==12 && y==33) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==12 && y==34) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==12 && y==35) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==12 && y==36) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==12 && y==37) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==12 && y==38) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==12 && y==39) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==13 && y==0) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==13 && y==1) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==13 && y==2) begin
			VGA = {4'b1101, 4'b1011, 4'b1010};
		end else if (x==13 && y==3) begin
			VGA = {4'b1001, 4'b1000, 4'b0110};
		end else if (x==13 && y==4) begin
			VGA = {4'b1000, 4'b0101, 4'b0010};
		end else if (x==13 && y==5) begin
			VGA = {4'b1000, 4'b0100, 4'b0001};
		end else if (x==13 && y==6) begin
			VGA = {4'b0110, 4'b0011, 4'b0001};
		end else if (x==13 && y==7) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==13 && y==8) begin
			VGA = {4'b1011, 4'b1001, 4'b0111};
		end else if (x==13 && y==9) begin
			VGA = {4'b1010, 4'b0111, 4'b0100};
		end else if (x==13 && y==10) begin
			VGA = {4'b0100, 4'b0010, 4'b0000};
		end else if (x==13 && y==11) begin
			VGA = {4'b0110, 4'b0011, 4'b0001};
		end else if (x==13 && y==12) begin
			VGA = {4'b1001, 4'b0110, 4'b0100};
		end else if (x==13 && y==13) begin
			VGA = {4'b1000, 4'b0101, 4'b0010};
		end else if (x==13 && y==14) begin
			VGA = {4'b0111, 4'b0101, 4'b0010};
		end else if (x==13 && y==15) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==13 && y==16) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==13 && y==17) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==13 && y==18) begin
			VGA = {4'b1100, 4'b1100, 4'b1011};
		end else if (x==13 && y==19) begin
			VGA = {4'b0110, 4'b0011, 4'b0001};
		end else if (x==13 && y==20) begin
			VGA = {4'b1000, 4'b0101, 4'b0011};
		end else if (x==13 && y==21) begin
			VGA = {4'b0101, 4'b0011, 4'b0010};
		end else if (x==13 && y==22) begin
			VGA = {4'b0100, 4'b0011, 4'b0001};
		end else if (x==13 && y==23) begin
			VGA = {4'b1000, 4'b0101, 4'b0100};
		end else if (x==13 && y==24) begin
			VGA = {4'b1101, 4'b1010, 4'b1000};
		end else if (x==13 && y==25) begin
			VGA = {4'b1011, 4'b1000, 4'b0101};
		end else if (x==13 && y==26) begin
			VGA = {4'b0100, 4'b0010, 4'b0001};
		end else if (x==13 && y==27) begin
			VGA = {4'b0110, 4'b0011, 4'b0001};
		end else if (x==13 && y==28) begin
			VGA = {4'b1010, 4'b0110, 4'b0100};
		end else if (x==13 && y==29) begin
			VGA = {4'b1101, 4'b1010, 4'b1000};
		end else if (x==13 && y==30) begin
			VGA = {4'b1101, 4'b1011, 4'b1001};
		end else if (x==13 && y==31) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==13 && y==32) begin
			VGA = {4'b1110, 4'b1101, 4'b1100};
		end else if (x==13 && y==33) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==13 && y==34) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==13 && y==35) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==13 && y==36) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==13 && y==37) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==13 && y==38) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==13 && y==39) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==14 && y==0) begin
			VGA = {4'b1111, 4'b1110, 4'b1101};
		end else if (x==14 && y==1) begin
			VGA = {4'b1100, 4'b1100, 4'b1100};
		end else if (x==14 && y==2) begin
			VGA = {4'b1101, 4'b1011, 4'b1001};
		end else if (x==14 && y==3) begin
			VGA = {4'b1001, 4'b0111, 4'b0101};
		end else if (x==14 && y==4) begin
			VGA = {4'b1000, 4'b0101, 4'b0010};
		end else if (x==14 && y==5) begin
			VGA = {4'b1000, 4'b0100, 4'b0001};
		end else if (x==14 && y==6) begin
			VGA = {4'b0110, 4'b0011, 4'b0001};
		end else if (x==14 && y==7) begin
			VGA = {4'b1011, 4'b1010, 4'b1001};
		end else if (x==14 && y==8) begin
			VGA = {4'b1101, 4'b1011, 4'b1001};
		end else if (x==14 && y==9) begin
			VGA = {4'b1010, 4'b0111, 4'b0100};
		end else if (x==14 && y==10) begin
			VGA = {4'b0100, 4'b0001, 4'b0000};
		end else if (x==14 && y==11) begin
			VGA = {4'b0110, 4'b0100, 4'b0010};
		end else if (x==14 && y==12) begin
			VGA = {4'b1000, 4'b0101, 4'b0011};
		end else if (x==14 && y==13) begin
			VGA = {4'b0110, 4'b0100, 4'b0010};
		end else if (x==14 && y==14) begin
			VGA = {4'b0110, 4'b0011, 4'b0001};
		end else if (x==14 && y==15) begin
			VGA = {4'b0111, 4'b0101, 4'b0011};
		end else if (x==14 && y==16) begin
			VGA = {4'b1110, 4'b1101, 4'b1100};
		end else if (x==14 && y==17) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==14 && y==18) begin
			VGA = {4'b1100, 4'b1100, 4'b1011};
		end else if (x==14 && y==19) begin
			VGA = {4'b0110, 4'b0100, 4'b0010};
		end else if (x==14 && y==20) begin
			VGA = {4'b0111, 4'b0101, 4'b0011};
		end else if (x==14 && y==21) begin
			VGA = {4'b0010, 4'b0001, 4'b0001};
		end else if (x==14 && y==22) begin
			VGA = {4'b0001, 4'b0001, 4'b0001};
		end else if (x==14 && y==23) begin
			VGA = {4'b0110, 4'b0101, 4'b0101};
		end else if (x==14 && y==24) begin
			VGA = {4'b0101, 4'b0100, 4'b0011};
		end else if (x==14 && y==25) begin
			VGA = {4'b1010, 4'b0111, 4'b0101};
		end else if (x==14 && y==26) begin
			VGA = {4'b0010, 4'b0001, 4'b0000};
		end else if (x==14 && y==27) begin
			VGA = {4'b0100, 4'b0010, 4'b0001};
		end else if (x==14 && y==28) begin
			VGA = {4'b1001, 4'b0101, 4'b0011};
		end else if (x==14 && y==29) begin
			VGA = {4'b1101, 4'b1001, 4'b0111};
		end else if (x==14 && y==30) begin
			VGA = {4'b1100, 4'b1001, 4'b0111};
		end else if (x==14 && y==31) begin
			VGA = {4'b1101, 4'b1011, 4'b1010};
		end else if (x==14 && y==32) begin
			VGA = {4'b1110, 4'b1100, 4'b1011};
		end else if (x==14 && y==33) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==14 && y==34) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==14 && y==35) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==14 && y==36) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==14 && y==37) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==14 && y==38) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==14 && y==39) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==15 && y==0) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==15 && y==1) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==15 && y==2) begin
			VGA = {4'b1101, 4'b1010, 4'b1000};
		end else if (x==15 && y==3) begin
			VGA = {4'b1001, 4'b0110, 4'b0011};
		end else if (x==15 && y==4) begin
			VGA = {4'b1000, 4'b0101, 4'b0010};
		end else if (x==15 && y==5) begin
			VGA = {4'b0111, 4'b0100, 4'b0001};
		end else if (x==15 && y==6) begin
			VGA = {4'b0111, 4'b0101, 4'b0010};
		end else if (x==15 && y==7) begin
			VGA = {4'b1100, 4'b1011, 4'b1001};
		end else if (x==15 && y==8) begin
			VGA = {4'b1101, 4'b1011, 4'b1010};
		end else if (x==15 && y==9) begin
			VGA = {4'b1001, 4'b0110, 4'b0011};
		end else if (x==15 && y==10) begin
			VGA = {4'b0011, 4'b0001, 4'b0000};
		end else if (x==15 && y==11) begin
			VGA = {4'b0101, 4'b0011, 4'b0001};
		end else if (x==15 && y==12) begin
			VGA = {4'b0111, 4'b0100, 4'b0011};
		end else if (x==15 && y==13) begin
			VGA = {4'b0111, 4'b0101, 4'b0011};
		end else if (x==15 && y==14) begin
			VGA = {4'b1001, 4'b0110, 4'b0100};
		end else if (x==15 && y==15) begin
			VGA = {4'b0111, 4'b0100, 4'b0001};
		end else if (x==15 && y==16) begin
			VGA = {4'b1101, 4'b1011, 4'b1010};
		end else if (x==15 && y==17) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==15 && y==18) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==15 && y==19) begin
			VGA = {4'b1000, 4'b0110, 4'b0101};
		end else if (x==15 && y==20) begin
			VGA = {4'b1000, 4'b0101, 4'b0011};
		end else if (x==15 && y==21) begin
			VGA = {4'b0011, 4'b0010, 4'b0010};
		end else if (x==15 && y==22) begin
			VGA = {4'b0000, 4'b0000, 4'b0000};
		end else if (x==15 && y==23) begin
			VGA = {4'b0001, 4'b0001, 4'b0000};
		end else if (x==15 && y==24) begin
			VGA = {4'b0101, 4'b0101, 4'b0101};
		end else if (x==15 && y==25) begin
			VGA = {4'b0101, 4'b0010, 4'b0000};
		end else if (x==15 && y==26) begin
			VGA = {4'b0001, 4'b0000, 4'b0000};
		end else if (x==15 && y==27) begin
			VGA = {4'b0100, 4'b0010, 4'b0000};
		end else if (x==15 && y==28) begin
			VGA = {4'b1010, 4'b0111, 4'b0100};
		end else if (x==15 && y==29) begin
			VGA = {4'b1100, 4'b1000, 4'b0110};
		end else if (x==15 && y==30) begin
			VGA = {4'b1100, 4'b1001, 4'b0111};
		end else if (x==15 && y==31) begin
			VGA = {4'b1100, 4'b1010, 4'b1000};
		end else if (x==15 && y==32) begin
			VGA = {4'b1110, 4'b1100, 4'b1010};
		end else if (x==15 && y==33) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==15 && y==34) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==15 && y==35) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==15 && y==36) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==15 && y==37) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==15 && y==38) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==15 && y==39) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==16 && y==0) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==16 && y==1) begin
			VGA = {4'b1100, 4'b1011, 4'b1011};
		end else if (x==16 && y==2) begin
			VGA = {4'b1011, 4'b0111, 4'b0101};
		end else if (x==16 && y==3) begin
			VGA = {4'b1000, 4'b0101, 4'b0011};
		end else if (x==16 && y==4) begin
			VGA = {4'b0111, 4'b0100, 4'b0001};
		end else if (x==16 && y==5) begin
			VGA = {4'b1000, 4'b0101, 4'b0010};
		end else if (x==16 && y==6) begin
			VGA = {4'b0110, 4'b0011, 4'b0001};
		end else if (x==16 && y==7) begin
			VGA = {4'b1001, 4'b0111, 4'b0110};
		end else if (x==16 && y==8) begin
			VGA = {4'b1011, 4'b1001, 4'b0111};
		end else if (x==16 && y==9) begin
			VGA = {4'b0111, 4'b0100, 4'b0001};
		end else if (x==16 && y==10) begin
			VGA = {4'b0011, 4'b0001, 4'b0000};
		end else if (x==16 && y==11) begin
			VGA = {4'b0100, 4'b0010, 4'b0001};
		end else if (x==16 && y==12) begin
			VGA = {4'b0111, 4'b0101, 4'b0010};
		end else if (x==16 && y==13) begin
			VGA = {4'b1001, 4'b0110, 4'b0100};
		end else if (x==16 && y==14) begin
			VGA = {4'b1000, 4'b0101, 4'b0010};
		end else if (x==16 && y==15) begin
			VGA = {4'b1000, 4'b0100, 4'b0010};
		end else if (x==16 && y==16) begin
			VGA = {4'b1001, 4'b0111, 4'b0110};
		end else if (x==16 && y==17) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==16 && y==18) begin
			VGA = {4'b1100, 4'b1100, 4'b1011};
		end else if (x==16 && y==19) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==16 && y==20) begin
			VGA = {4'b1000, 4'b0101, 4'b0100};
		end else if (x==16 && y==21) begin
			VGA = {4'b0011, 4'b0011, 4'b0010};
		end else if (x==16 && y==22) begin
			VGA = {4'b0010, 4'b0010, 4'b0010};
		end else if (x==16 && y==23) begin
			VGA = {4'b0011, 4'b0011, 4'b0011};
		end else if (x==16 && y==24) begin
			VGA = {4'b0011, 4'b0010, 4'b0010};
		end else if (x==16 && y==25) begin
			VGA = {4'b0111, 4'b0100, 4'b0011};
		end else if (x==16 && y==26) begin
			VGA = {4'b0001, 4'b0000, 4'b0000};
		end else if (x==16 && y==27) begin
			VGA = {4'b0011, 4'b0001, 4'b0000};
		end else if (x==16 && y==28) begin
			VGA = {4'b1001, 4'b0110, 4'b0100};
		end else if (x==16 && y==29) begin
			VGA = {4'b1011, 4'b0111, 4'b0100};
		end else if (x==16 && y==30) begin
			VGA = {4'b1100, 4'b1001, 4'b0110};
		end else if (x==16 && y==31) begin
			VGA = {4'b1101, 4'b1011, 4'b1001};
		end else if (x==16 && y==32) begin
			VGA = {4'b1101, 4'b1010, 4'b1001};
		end else if (x==16 && y==33) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==16 && y==34) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==16 && y==35) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==16 && y==36) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==16 && y==37) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==16 && y==38) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==16 && y==39) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==17 && y==0) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==17 && y==1) begin
			VGA = {4'b1100, 4'b1100, 4'b1011};
		end else if (x==17 && y==2) begin
			VGA = {4'b1000, 4'b0101, 4'b0010};
		end else if (x==17 && y==3) begin
			VGA = {4'b1001, 4'b0101, 4'b0010};
		end else if (x==17 && y==4) begin
			VGA = {4'b0110, 4'b0100, 4'b0001};
		end else if (x==17 && y==5) begin
			VGA = {4'b0111, 4'b0100, 4'b0010};
		end else if (x==17 && y==6) begin
			VGA = {4'b0110, 4'b0011, 4'b0000};
		end else if (x==17 && y==7) begin
			VGA = {4'b1001, 4'b0111, 4'b0101};
		end else if (x==17 && y==8) begin
			VGA = {4'b1010, 4'b0111, 4'b0100};
		end else if (x==17 && y==9) begin
			VGA = {4'b1000, 4'b0101, 4'b0010};
		end else if (x==17 && y==10) begin
			VGA = {4'b0101, 4'b0010, 4'b0001};
		end else if (x==17 && y==11) begin
			VGA = {4'b0010, 4'b0000, 4'b0000};
		end else if (x==17 && y==12) begin
			VGA = {4'b0101, 4'b0011, 4'b0000};
		end else if (x==17 && y==13) begin
			VGA = {4'b1001, 4'b0110, 4'b0100};
		end else if (x==17 && y==14) begin
			VGA = {4'b1001, 4'b0101, 4'b0011};
		end else if (x==17 && y==15) begin
			VGA = {4'b0111, 4'b0100, 4'b0001};
		end else if (x==17 && y==16) begin
			VGA = {4'b1000, 4'b0101, 4'b0011};
		end else if (x==17 && y==17) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==17 && y==18) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==17 && y==19) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==17 && y==20) begin
			VGA = {4'b1100, 4'b1010, 4'b1001};
		end else if (x==17 && y==21) begin
			VGA = {4'b0101, 4'b0100, 4'b0011};
		end else if (x==17 && y==22) begin
			VGA = {4'b0001, 4'b0001, 4'b0000};
		end else if (x==17 && y==23) begin
			VGA = {4'b0010, 4'b0010, 4'b0010};
		end else if (x==17 && y==24) begin
			VGA = {4'b0101, 4'b0100, 4'b0011};
		end else if (x==17 && y==25) begin
			VGA = {4'b1000, 4'b0110, 4'b0100};
		end else if (x==17 && y==26) begin
			VGA = {4'b0001, 4'b0000, 4'b0000};
		end else if (x==17 && y==27) begin
			VGA = {4'b0010, 4'b0001, 4'b0000};
		end else if (x==17 && y==28) begin
			VGA = {4'b1001, 4'b0110, 4'b0100};
		end else if (x==17 && y==29) begin
			VGA = {4'b1011, 4'b1000, 4'b0101};
		end else if (x==17 && y==30) begin
			VGA = {4'b1100, 4'b1001, 4'b0110};
		end else if (x==17 && y==31) begin
			VGA = {4'b1001, 4'b0111, 4'b0101};
		end else if (x==17 && y==32) begin
			VGA = {4'b1100, 4'b1001, 4'b0111};
		end else if (x==17 && y==33) begin
			VGA = {4'b1110, 4'b1101, 4'b1100};
		end else if (x==17 && y==34) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==17 && y==35) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==17 && y==36) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==17 && y==37) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==17 && y==38) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==17 && y==39) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==18 && y==0) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==18 && y==1) begin
			VGA = {4'b1100, 4'b1100, 4'b1011};
		end else if (x==18 && y==2) begin
			VGA = {4'b0111, 4'b0100, 4'b0001};
		end else if (x==18 && y==3) begin
			VGA = {4'b0111, 4'b0100, 4'b0001};
		end else if (x==18 && y==4) begin
			VGA = {4'b0110, 4'b0011, 4'b0001};
		end else if (x==18 && y==5) begin
			VGA = {4'b0110, 4'b0100, 4'b0010};
		end else if (x==18 && y==6) begin
			VGA = {4'b0110, 4'b0011, 4'b0000};
		end else if (x==18 && y==7) begin
			VGA = {4'b1001, 4'b0110, 4'b0100};
		end else if (x==18 && y==8) begin
			VGA = {4'b1001, 4'b0101, 4'b0011};
		end else if (x==18 && y==9) begin
			VGA = {4'b1000, 4'b0101, 4'b0011};
		end else if (x==18 && y==10) begin
			VGA = {4'b0101, 4'b0011, 4'b0000};
		end else if (x==18 && y==11) begin
			VGA = {4'b0001, 4'b0000, 4'b0000};
		end else if (x==18 && y==12) begin
			VGA = {4'b0100, 4'b0010, 4'b0000};
		end else if (x==18 && y==13) begin
			VGA = {4'b1000, 4'b0101, 4'b0011};
		end else if (x==18 && y==14) begin
			VGA = {4'b0101, 4'b0010, 4'b0001};
		end else if (x==18 && y==15) begin
			VGA = {4'b1000, 4'b0101, 4'b0011};
		end else if (x==18 && y==16) begin
			VGA = {4'b0111, 4'b0100, 4'b0010};
		end else if (x==18 && y==17) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==18 && y==18) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==18 && y==19) begin
			VGA = {4'b1110, 4'b1101, 4'b1100};
		end else if (x==18 && y==20) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==18 && y==21) begin
			VGA = {4'b0110, 4'b0100, 4'b0011};
		end else if (x==18 && y==22) begin
			VGA = {4'b0101, 4'b0100, 4'b0100};
		end else if (x==18 && y==23) begin
			VGA = {4'b0011, 4'b0010, 4'b0010};
		end else if (x==18 && y==24) begin
			VGA = {4'b1010, 4'b1000, 4'b0110};
		end else if (x==18 && y==25) begin
			VGA = {4'b1001, 4'b0110, 4'b0100};
		end else if (x==18 && y==26) begin
			VGA = {4'b0100, 4'b0010, 4'b0010};
		end else if (x==18 && y==27) begin
			VGA = {4'b0010, 4'b0000, 4'b0000};
		end else if (x==18 && y==28) begin
			VGA = {4'b0111, 4'b0100, 4'b0010};
		end else if (x==18 && y==29) begin
			VGA = {4'b1011, 4'b0111, 4'b0100};
		end else if (x==18 && y==30) begin
			VGA = {4'b1011, 4'b1000, 4'b0101};
		end else if (x==18 && y==31) begin
			VGA = {4'b1100, 4'b1001, 4'b0111};
		end else if (x==18 && y==32) begin
			VGA = {4'b1001, 4'b0110, 4'b0011};
		end else if (x==18 && y==33) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==18 && y==34) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==18 && y==35) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==18 && y==36) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==18 && y==37) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==18 && y==38) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==18 && y==39) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==19 && y==0) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==19 && y==1) begin
			VGA = {4'b1110, 4'b1101, 4'b1100};
		end else if (x==19 && y==2) begin
			VGA = {4'b0111, 4'b0100, 4'b0001};
		end else if (x==19 && y==3) begin
			VGA = {4'b0110, 4'b0011, 4'b0001};
		end else if (x==19 && y==4) begin
			VGA = {4'b0101, 4'b0011, 4'b0000};
		end else if (x==19 && y==5) begin
			VGA = {4'b0101, 4'b0011, 4'b0001};
		end else if (x==19 && y==6) begin
			VGA = {4'b0110, 4'b0011, 4'b0000};
		end else if (x==19 && y==7) begin
			VGA = {4'b1010, 4'b0111, 4'b0100};
		end else if (x==19 && y==8) begin
			VGA = {4'b1000, 4'b0101, 4'b0010};
		end else if (x==19 && y==9) begin
			VGA = {4'b1000, 4'b0101, 4'b0010};
		end else if (x==19 && y==10) begin
			VGA = {4'b0111, 4'b0100, 4'b0010};
		end else if (x==19 && y==11) begin
			VGA = {4'b0011, 4'b0010, 4'b0001};
		end else if (x==19 && y==12) begin
			VGA = {4'b0011, 4'b0001, 4'b0000};
		end else if (x==19 && y==13) begin
			VGA = {4'b0111, 4'b0100, 4'b0011};
		end else if (x==19 && y==14) begin
			VGA = {4'b0000, 4'b0000, 4'b0000};
		end else if (x==19 && y==15) begin
			VGA = {4'b0010, 4'b0001, 4'b0000};
		end else if (x==19 && y==16) begin
			VGA = {4'b0101, 4'b0011, 4'b0001};
		end else if (x==19 && y==17) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==19 && y==18) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==19 && y==19) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==19 && y==20) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==19 && y==21) begin
			VGA = {4'b1001, 4'b0110, 4'b0101};
		end else if (x==19 && y==22) begin
			VGA = {4'b0110, 4'b0100, 4'b0011};
		end else if (x==19 && y==23) begin
			VGA = {4'b0111, 4'b0101, 4'b0100};
		end else if (x==19 && y==24) begin
			VGA = {4'b1011, 4'b1001, 4'b1000};
		end else if (x==19 && y==25) begin
			VGA = {4'b1001, 4'b0110, 4'b0100};
		end else if (x==19 && y==26) begin
			VGA = {4'b0101, 4'b0011, 4'b0001};
		end else if (x==19 && y==27) begin
			VGA = {4'b0010, 4'b0000, 4'b0000};
		end else if (x==19 && y==28) begin
			VGA = {4'b0100, 4'b0010, 4'b0000};
		end else if (x==19 && y==29) begin
			VGA = {4'b1011, 4'b0111, 4'b0100};
		end else if (x==19 && y==30) begin
			VGA = {4'b1011, 4'b1000, 4'b0101};
		end else if (x==19 && y==31) begin
			VGA = {4'b1010, 4'b1000, 4'b0101};
		end else if (x==19 && y==32) begin
			VGA = {4'b1011, 4'b1000, 4'b0110};
		end else if (x==19 && y==33) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==19 && y==34) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==19 && y==35) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==19 && y==36) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==19 && y==37) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==19 && y==38) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==19 && y==39) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==20 && y==0) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==20 && y==1) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==20 && y==2) begin
			VGA = {4'b0111, 4'b0011, 4'b0001};
		end else if (x==20 && y==3) begin
			VGA = {4'b0110, 4'b0011, 4'b0000};
		end else if (x==20 && y==4) begin
			VGA = {4'b0101, 4'b0010, 4'b0000};
		end else if (x==20 && y==5) begin
			VGA = {4'b0101, 4'b0010, 4'b0001};
		end else if (x==20 && y==6) begin
			VGA = {4'b0110, 4'b0011, 4'b0000};
		end else if (x==20 && y==7) begin
			VGA = {4'b1010, 4'b0111, 4'b0100};
		end else if (x==20 && y==8) begin
			VGA = {4'b0111, 4'b0100, 4'b0001};
		end else if (x==20 && y==9) begin
			VGA = {4'b1000, 4'b0101, 4'b0011};
		end else if (x==20 && y==10) begin
			VGA = {4'b1001, 4'b0110, 4'b0100};
		end else if (x==20 && y==11) begin
			VGA = {4'b0110, 4'b0011, 4'b0001};
		end else if (x==20 && y==12) begin
			VGA = {4'b0001, 4'b0000, 4'b0000};
		end else if (x==20 && y==13) begin
			VGA = {4'b0110, 4'b0011, 4'b0010};
		end else if (x==20 && y==14) begin
			VGA = {4'b0000, 4'b0000, 4'b0000};
		end else if (x==20 && y==15) begin
			VGA = {4'b1001, 4'b1001, 4'b1000};
		end else if (x==20 && y==16) begin
			VGA = {4'b0011, 4'b0001, 4'b0000};
		end else if (x==20 && y==17) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==20 && y==18) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==20 && y==19) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==20 && y==20) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==20 && y==21) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==20 && y==22) begin
			VGA = {4'b1100, 4'b1011, 4'b1010};
		end else if (x==20 && y==23) begin
			VGA = {4'b1001, 4'b0111, 4'b0101};
		end else if (x==20 && y==24) begin
			VGA = {4'b1011, 4'b1001, 4'b0110};
		end else if (x==20 && y==25) begin
			VGA = {4'b1001, 4'b0101, 4'b0011};
		end else if (x==20 && y==26) begin
			VGA = {4'b0101, 4'b0011, 4'b0001};
		end else if (x==20 && y==27) begin
			VGA = {4'b0010, 4'b0000, 4'b0000};
		end else if (x==20 && y==28) begin
			VGA = {4'b0100, 4'b0010, 4'b0000};
		end else if (x==20 && y==29) begin
			VGA = {4'b1100, 4'b1000, 4'b0101};
		end else if (x==20 && y==30) begin
			VGA = {4'b1100, 4'b1001, 4'b0110};
		end else if (x==20 && y==31) begin
			VGA = {4'b1001, 4'b0110, 4'b0100};
		end else if (x==20 && y==32) begin
			VGA = {4'b1010, 4'b0111, 4'b0101};
		end else if (x==20 && y==33) begin
			VGA = {4'b1101, 4'b1011, 4'b1010};
		end else if (x==20 && y==34) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==20 && y==35) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==20 && y==36) begin
			VGA = {4'b1111, 4'b1111, 4'b1110};
		end else if (x==20 && y==37) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==20 && y==38) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==20 && y==39) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==21 && y==0) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==21 && y==1) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==21 && y==2) begin
			VGA = {4'b0110, 4'b0100, 4'b0010};
		end else if (x==21 && y==3) begin
			VGA = {4'b0101, 4'b0010, 4'b0000};
		end else if (x==21 && y==4) begin
			VGA = {4'b0100, 4'b0010, 4'b0000};
		end else if (x==21 && y==5) begin
			VGA = {4'b0100, 4'b0010, 4'b0001};
		end else if (x==21 && y==6) begin
			VGA = {4'b0111, 4'b0100, 4'b0010};
		end else if (x==21 && y==7) begin
			VGA = {4'b1010, 4'b0110, 4'b0100};
		end else if (x==21 && y==8) begin
			VGA = {4'b0111, 4'b0011, 4'b0000};
		end else if (x==21 && y==9) begin
			VGA = {4'b0111, 4'b0100, 4'b0010};
		end else if (x==21 && y==10) begin
			VGA = {4'b1000, 4'b0101, 4'b0011};
		end else if (x==21 && y==11) begin
			VGA = {4'b1000, 4'b0101, 4'b0010};
		end else if (x==21 && y==12) begin
			VGA = {4'b0011, 4'b0001, 4'b0001};
		end else if (x==21 && y==13) begin
			VGA = {4'b0011, 4'b0010, 4'b0001};
		end else if (x==21 && y==14) begin
			VGA = {4'b0010, 4'b0010, 4'b0010};
		end else if (x==21 && y==15) begin
			VGA = {4'b0110, 4'b0110, 4'b0110};
		end else if (x==21 && y==16) begin
			VGA = {4'b0011, 4'b0010, 4'b0001};
		end else if (x==21 && y==17) begin
			VGA = {4'b1011, 4'b1010, 4'b1010};
		end else if (x==21 && y==18) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==21 && y==19) begin
			VGA = {4'b1111, 4'b1111, 4'b1110};
		end else if (x==21 && y==20) begin
			VGA = {4'b1111, 4'b1111, 4'b1110};
		end else if (x==21 && y==21) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==21 && y==22) begin
			VGA = {4'b1110, 4'b1101, 4'b1100};
		end else if (x==21 && y==23) begin
			VGA = {4'b1101, 4'b1100, 4'b1010};
		end else if (x==21 && y==24) begin
			VGA = {4'b1100, 4'b1010, 4'b1000};
		end else if (x==21 && y==25) begin
			VGA = {4'b1001, 4'b0111, 4'b0101};
		end else if (x==21 && y==26) begin
			VGA = {4'b0110, 4'b0011, 4'b0010};
		end else if (x==21 && y==27) begin
			VGA = {4'b0010, 4'b0001, 4'b0000};
		end else if (x==21 && y==28) begin
			VGA = {4'b0100, 4'b0001, 4'b0000};
		end else if (x==21 && y==29) begin
			VGA = {4'b1001, 4'b0101, 4'b0011};
		end else if (x==21 && y==30) begin
			VGA = {4'b1100, 4'b1001, 4'b0110};
		end else if (x==21 && y==31) begin
			VGA = {4'b1100, 4'b1001, 4'b0111};
		end else if (x==21 && y==32) begin
			VGA = {4'b1001, 4'b0111, 4'b0100};
		end else if (x==21 && y==33) begin
			VGA = {4'b1100, 4'b1010, 4'b1000};
		end else if (x==21 && y==34) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==21 && y==35) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==21 && y==36) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==21 && y==37) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==21 && y==38) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==21 && y==39) begin
			VGA = {4'b1111, 4'b1111, 4'b1111};
		end else if (x==22 && y==0) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==22 && y==1) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==22 && y==2) begin
			VGA = {4'b0110, 4'b0100, 4'b0011};
		end else if (x==22 && y==3) begin
			VGA = {4'b0101, 4'b0010, 4'b0000};
		end else if (x==22 && y==4) begin
			VGA = {4'b0100, 4'b0010, 4'b0000};
		end else if (x==22 && y==5) begin
			VGA = {4'b0100, 4'b0010, 4'b0000};
		end else if (x==22 && y==6) begin
			VGA = {4'b1000, 4'b0101, 4'b0011};
		end else if (x==22 && y==7) begin
			VGA = {4'b1001, 4'b0110, 4'b0011};
		end else if (x==22 && y==8) begin
			VGA = {4'b0111, 4'b0100, 4'b0001};
		end else if (x==22 && y==9) begin
			VGA = {4'b0110, 4'b0011, 4'b0000};
		end else if (x==22 && y==10) begin
			VGA = {4'b0110, 4'b0100, 4'b0001};
		end else if (x==22 && y==11) begin
			VGA = {4'b1000, 4'b0100, 4'b0011};
		end else if (x==22 && y==12) begin
			VGA = {4'b0101, 4'b0011, 4'b0000};
		end else if (x==22 && y==13) begin
			VGA = {4'b0000, 4'b0000, 4'b0000};
		end else if (x==22 && y==14) begin
			VGA = {4'b0001, 4'b0000, 4'b0001};
		end else if (x==22 && y==15) begin
			VGA = {4'b1000, 4'b1000, 4'b1000};
		end else if (x==22 && y==16) begin
			VGA = {4'b0011, 4'b0010, 4'b0001};
		end else if (x==22 && y==17) begin
			VGA = {4'b1100, 4'b1011, 4'b1010};
		end else if (x==22 && y==18) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==22 && y==19) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==22 && y==20) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==22 && y==21) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==22 && y==22) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==22 && y==23) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==22 && y==24) begin
			VGA = {4'b1111, 4'b1110, 4'b1110};
		end else if (x==22 && y==25) begin
			VGA = {4'b1010, 4'b1000, 4'b0111};
		end else if (x==22 && y==26) begin
			VGA = {4'b0111, 4'b0100, 4'b0011};
		end else if (x==22 && y==27) begin
			VGA = {4'b0011, 4'b0001, 4'b0000};
		end else if (x==22 && y==28) begin
			VGA = {4'b0100, 4'b0010, 4'b0000};
		end else if (x==22 && y==29) begin
			VGA = {4'b1001, 4'b0101, 4'b0010};
		end else if (x==22 && y==30) begin
			VGA = {4'b1011, 4'b1000, 4'b0101};
		end else if (x==22 && y==31) begin
			VGA = {4'b1100, 4'b1001, 4'b0111};
		end else if (x==22 && y==32) begin
			VGA = {4'b1001, 4'b0110, 4'b0100};
		end else if (x==22 && y==33) begin
			VGA = {4'b1100, 4'b1010, 4'b1000};
		end else if (x==22 && y==34) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==22 && y==35) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==22 && y==36) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==22 && y==37) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==22 && y==38) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==22 && y==39) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==23 && y==0) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==23 && y==1) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==23 && y==2) begin
			VGA = {4'b0110, 4'b0100, 4'b0011};
		end else if (x==23 && y==3) begin
			VGA = {4'b0100, 4'b0010, 4'b0000};
		end else if (x==23 && y==4) begin
			VGA = {4'b0100, 4'b0001, 4'b0000};
		end else if (x==23 && y==5) begin
			VGA = {4'b0100, 4'b0001, 4'b0000};
		end else if (x==23 && y==6) begin
			VGA = {4'b1000, 4'b0110, 4'b0011};
		end else if (x==23 && y==7) begin
			VGA = {4'b1010, 4'b0111, 4'b0011};
		end else if (x==23 && y==8) begin
			VGA = {4'b0110, 4'b0011, 4'b0001};
		end else if (x==23 && y==9) begin
			VGA = {4'b0110, 4'b0011, 4'b0000};
		end else if (x==23 && y==10) begin
			VGA = {4'b0101, 4'b0011, 4'b0001};
		end else if (x==23 && y==11) begin
			VGA = {4'b1001, 4'b0101, 4'b0100};
		end else if (x==23 && y==12) begin
			VGA = {4'b0111, 4'b0101, 4'b0010};
		end else if (x==23 && y==13) begin
			VGA = {4'b0000, 4'b0000, 4'b0000};
		end else if (x==23 && y==14) begin
			VGA = {4'b0011, 4'b0001, 4'b0001};
		end else if (x==23 && y==15) begin
			VGA = {4'b0011, 4'b0001, 4'b0001};
		end else if (x==23 && y==16) begin
			VGA = {4'b0011, 4'b0001, 4'b0000};
		end else if (x==23 && y==17) begin
			VGA = {4'b1100, 4'b1100, 4'b1011};
		end else if (x==23 && y==18) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==23 && y==19) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==23 && y==20) begin
			VGA = {4'b1110, 4'b1101, 4'b1100};
		end else if (x==23 && y==21) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==23 && y==22) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==23 && y==23) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==23 && y==24) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==23 && y==25) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==23 && y==26) begin
			VGA = {4'b0111, 4'b0100, 4'b0010};
		end else if (x==23 && y==27) begin
			VGA = {4'b0010, 4'b0001, 4'b0000};
		end else if (x==23 && y==28) begin
			VGA = {4'b0101, 4'b0011, 4'b0000};
		end else if (x==23 && y==29) begin
			VGA = {4'b1001, 4'b0101, 4'b0010};
		end else if (x==23 && y==30) begin
			VGA = {4'b1101, 4'b1010, 4'b0111};
		end else if (x==23 && y==31) begin
			VGA = {4'b1100, 4'b1010, 4'b1000};
		end else if (x==23 && y==32) begin
			VGA = {4'b1010, 4'b0111, 4'b0101};
		end else if (x==23 && y==33) begin
			VGA = {4'b1100, 4'b1001, 4'b0111};
		end else if (x==23 && y==34) begin
			VGA = {4'b1101, 4'b1011, 4'b1011};
		end else if (x==23 && y==35) begin
			VGA = {4'b1100, 4'b1100, 4'b1100};
		end else if (x==23 && y==36) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==23 && y==37) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==23 && y==38) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==23 && y==39) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==24 && y==0) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==24 && y==1) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==24 && y==2) begin
			VGA = {4'b0111, 4'b0101, 4'b0011};
		end else if (x==24 && y==3) begin
			VGA = {4'b0100, 4'b0010, 4'b0000};
		end else if (x==24 && y==4) begin
			VGA = {4'b0100, 4'b0001, 4'b0000};
		end else if (x==24 && y==5) begin
			VGA = {4'b0011, 4'b0000, 4'b0000};
		end else if (x==24 && y==6) begin
			VGA = {4'b1001, 4'b0110, 4'b0100};
		end else if (x==24 && y==7) begin
			VGA = {4'b1001, 4'b0101, 4'b0011};
		end else if (x==24 && y==8) begin
			VGA = {4'b0101, 4'b0011, 4'b0001};
		end else if (x==24 && y==9) begin
			VGA = {4'b0110, 4'b0011, 4'b0001};
		end else if (x==24 && y==10) begin
			VGA = {4'b0101, 4'b0011, 4'b0001};
		end else if (x==24 && y==11) begin
			VGA = {4'b1001, 4'b0110, 4'b0100};
		end else if (x==24 && y==12) begin
			VGA = {4'b1000, 4'b0101, 4'b0011};
		end else if (x==24 && y==13) begin
			VGA = {4'b0100, 4'b0011, 4'b0010};
		end else if (x==24 && y==14) begin
			VGA = {4'b0011, 4'b0010, 4'b0001};
		end else if (x==24 && y==15) begin
			VGA = {4'b0101, 4'b0011, 4'b0001};
		end else if (x==24 && y==16) begin
			VGA = {4'b0100, 4'b0010, 4'b0001};
		end else if (x==24 && y==17) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==24 && y==18) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==24 && y==19) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==24 && y==20) begin
			VGA = {4'b0111, 4'b0110, 4'b0110};
		end else if (x==24 && y==21) begin
			VGA = {4'b1000, 4'b1000, 4'b0111};
		end else if (x==24 && y==22) begin
			VGA = {4'b1101, 4'b1011, 4'b1001};
		end else if (x==24 && y==23) begin
			VGA = {4'b1110, 4'b1111, 4'b1111};
		end else if (x==24 && y==24) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==24 && y==25) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==24 && y==26) begin
			VGA = {4'b1000, 4'b0111, 4'b0101};
		end else if (x==24 && y==27) begin
			VGA = {4'b0011, 4'b0001, 4'b0000};
		end else if (x==24 && y==28) begin
			VGA = {4'b0101, 4'b0011, 4'b0001};
		end else if (x==24 && y==29) begin
			VGA = {4'b1011, 4'b1000, 4'b0101};
		end else if (x==24 && y==30) begin
			VGA = {4'b1100, 4'b1001, 4'b0110};
		end else if (x==24 && y==31) begin
			VGA = {4'b1100, 4'b1001, 4'b0111};
		end else if (x==24 && y==32) begin
			VGA = {4'b1010, 4'b0111, 4'b0101};
		end else if (x==24 && y==33) begin
			VGA = {4'b1011, 4'b1001, 4'b0111};
		end else if (x==24 && y==34) begin
			VGA = {4'b1101, 4'b1011, 4'b1010};
		end else if (x==24 && y==35) begin
			VGA = {4'b1100, 4'b1100, 4'b1100};
		end else if (x==24 && y==36) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==24 && y==37) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==24 && y==38) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==24 && y==39) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==25 && y==0) begin
			VGA = {4'b1100, 4'b1100, 4'b1011};
		end else if (x==25 && y==1) begin
			VGA = {4'b1100, 4'b1100, 4'b1010};
		end else if (x==25 && y==2) begin
			VGA = {4'b1000, 4'b0111, 4'b0101};
		end else if (x==25 && y==3) begin
			VGA = {4'b0011, 4'b0001, 4'b0000};
		end else if (x==25 && y==4) begin
			VGA = {4'b0100, 4'b0001, 4'b0000};
		end else if (x==25 && y==5) begin
			VGA = {4'b0010, 4'b0000, 4'b0000};
		end else if (x==25 && y==6) begin
			VGA = {4'b1000, 4'b0101, 4'b0011};
		end else if (x==25 && y==7) begin
			VGA = {4'b1010, 4'b0111, 4'b0100};
		end else if (x==25 && y==8) begin
			VGA = {4'b0011, 4'b0001, 4'b0000};
		end else if (x==25 && y==9) begin
			VGA = {4'b0110, 4'b0011, 4'b0000};
		end else if (x==25 && y==10) begin
			VGA = {4'b0100, 4'b0010, 4'b0000};
		end else if (x==25 && y==11) begin
			VGA = {4'b1000, 4'b0110, 4'b0100};
		end else if (x==25 && y==12) begin
			VGA = {4'b0101, 4'b0010, 4'b0000};
		end else if (x==25 && y==13) begin
			VGA = {4'b0100, 4'b0010, 4'b0000};
		end else if (x==25 && y==14) begin
			VGA = {4'b0010, 4'b0001, 4'b0000};
		end else if (x==25 && y==15) begin
			VGA = {4'b0101, 4'b0011, 4'b0001};
		end else if (x==25 && y==16) begin
			VGA = {4'b0101, 4'b0011, 4'b0010};
		end else if (x==25 && y==17) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==25 && y==18) begin
			VGA = {4'b1000, 4'b1000, 4'b1000};
		end else if (x==25 && y==19) begin
			VGA = {4'b0100, 4'b0100, 4'b0011};
		end else if (x==25 && y==20) begin
			VGA = {4'b0101, 4'b0101, 4'b0101};
		end else if (x==25 && y==21) begin
			VGA = {4'b0111, 4'b0111, 4'b0111};
		end else if (x==25 && y==22) begin
			VGA = {4'b1100, 4'b1010, 4'b1001};
		end else if (x==25 && y==23) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==25 && y==24) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==25 && y==25) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==25 && y==26) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==25 && y==27) begin
			VGA = {4'b0011, 4'b0001, 4'b0000};
		end else if (x==25 && y==28) begin
			VGA = {4'b0101, 4'b0011, 4'b0001};
		end else if (x==25 && y==29) begin
			VGA = {4'b0110, 4'b0011, 4'b0001};
		end else if (x==25 && y==30) begin
			VGA = {4'b1011, 4'b1000, 4'b0101};
		end else if (x==25 && y==31) begin
			VGA = {4'b1011, 4'b1000, 4'b0110};
		end else if (x==25 && y==32) begin
			VGA = {4'b1100, 4'b1001, 4'b0110};
		end else if (x==25 && y==33) begin
			VGA = {4'b1010, 4'b0111, 4'b0101};
		end else if (x==25 && y==34) begin
			VGA = {4'b1101, 4'b1011, 4'b1010};
		end else if (x==25 && y==35) begin
			VGA = {4'b1100, 4'b1011, 4'b1011};
		end else if (x==25 && y==36) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==25 && y==37) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==25 && y==38) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==25 && y==39) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==26 && y==0) begin
			VGA = {4'b1100, 4'b1011, 4'b1010};
		end else if (x==26 && y==1) begin
			VGA = {4'b1100, 4'b1011, 4'b1001};
		end else if (x==26 && y==2) begin
			VGA = {4'b1010, 4'b1001, 4'b1000};
		end else if (x==26 && y==3) begin
			VGA = {4'b0110, 4'b0100, 4'b0011};
		end else if (x==26 && y==4) begin
			VGA = {4'b0110, 4'b0100, 4'b0011};
		end else if (x==26 && y==5) begin
			VGA = {4'b0011, 4'b0010, 4'b0001};
		end else if (x==26 && y==6) begin
			VGA = {4'b1000, 4'b0101, 4'b0011};
		end else if (x==26 && y==7) begin
			VGA = {4'b0111, 4'b0100, 4'b0010};
		end else if (x==26 && y==8) begin
			VGA = {4'b0100, 4'b0010, 4'b0001};
		end else if (x==26 && y==9) begin
			VGA = {4'b1000, 4'b0100, 4'b0010};
		end else if (x==26 && y==10) begin
			VGA = {4'b0101, 4'b0011, 4'b0001};
		end else if (x==26 && y==11) begin
			VGA = {4'b0100, 4'b0001, 4'b0000};
		end else if (x==26 && y==12) begin
			VGA = {4'b0110, 4'b0011, 4'b0010};
		end else if (x==26 && y==13) begin
			VGA = {4'b0101, 4'b0010, 4'b0001};
		end else if (x==26 && y==14) begin
			VGA = {4'b0101, 4'b0011, 4'b0001};
		end else if (x==26 && y==15) begin
			VGA = {4'b0010, 4'b0001, 4'b0000};
		end else if (x==26 && y==16) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==26 && y==17) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==26 && y==18) begin
			VGA = {4'b0011, 4'b0011, 4'b0010};
		end else if (x==26 && y==19) begin
			VGA = {4'b0010, 4'b0001, 4'b0001};
		end else if (x==26 && y==20) begin
			VGA = {4'b0001, 4'b0001, 4'b0001};
		end else if (x==26 && y==21) begin
			VGA = {4'b0100, 4'b0100, 4'b0100};
		end else if (x==26 && y==22) begin
			VGA = {4'b1100, 4'b1100, 4'b1011};
		end else if (x==26 && y==23) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==26 && y==24) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==26 && y==25) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==26 && y==26) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==26 && y==27) begin
			VGA = {4'b0110, 4'b0101, 4'b0101};
		end else if (x==26 && y==28) begin
			VGA = {4'b0100, 4'b0010, 4'b0001};
		end else if (x==26 && y==29) begin
			VGA = {4'b0100, 4'b0001, 4'b0000};
		end else if (x==26 && y==30) begin
			VGA = {4'b1011, 4'b0111, 4'b0101};
		end else if (x==26 && y==31) begin
			VGA = {4'b1011, 4'b1000, 4'b0110};
		end else if (x==26 && y==32) begin
			VGA = {4'b1011, 4'b1000, 4'b0101};
		end else if (x==26 && y==33) begin
			VGA = {4'b1010, 4'b0111, 4'b0101};
		end else if (x==26 && y==34) begin
			VGA = {4'b1100, 4'b1010, 4'b1000};
		end else if (x==26 && y==35) begin
			VGA = {4'b1010, 4'b1010, 4'b1010};
		end else if (x==26 && y==36) begin
			VGA = {4'b1100, 4'b1011, 4'b1010};
		end else if (x==26 && y==37) begin
			VGA = {4'b1011, 4'b1011, 4'b1010};
		end else if (x==26 && y==38) begin
			VGA = {4'b1100, 4'b1100, 4'b1011};
		end else if (x==26 && y==39) begin
			VGA = {4'b1100, 4'b1100, 4'b1011};
		end else if (x==27 && y==0) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==27 && y==1) begin
			VGA = {4'b1100, 4'b1100, 4'b1011};
		end else if (x==27 && y==2) begin
			VGA = {4'b1100, 4'b1011, 4'b1010};
		end else if (x==27 && y==3) begin
			VGA = {4'b1011, 4'b1011, 4'b1010};
		end else if (x==27 && y==4) begin
			VGA = {4'b1011, 4'b1010, 4'b1001};
		end else if (x==27 && y==5) begin
			VGA = {4'b1011, 4'b1010, 4'b1001};
		end else if (x==27 && y==6) begin
			VGA = {4'b1001, 4'b0110, 4'b0011};
		end else if (x==27 && y==7) begin
			VGA = {4'b0110, 4'b0100, 4'b0001};
		end else if (x==27 && y==8) begin
			VGA = {4'b0110, 4'b0011, 4'b0001};
		end else if (x==27 && y==9) begin
			VGA = {4'b1000, 4'b0101, 4'b0011};
		end else if (x==27 && y==10) begin
			VGA = {4'b0111, 4'b0101, 4'b0011};
		end else if (x==27 && y==11) begin
			VGA = {4'b0010, 4'b0000, 4'b0000};
		end else if (x==27 && y==12) begin
			VGA = {4'b1010, 4'b0111, 4'b0100};
		end else if (x==27 && y==13) begin
			VGA = {4'b0100, 4'b0001, 4'b0000};
		end else if (x==27 && y==14) begin
			VGA = {4'b0111, 4'b0101, 4'b0011};
		end else if (x==27 && y==15) begin
			VGA = {4'b1001, 4'b1000, 4'b0110};
		end else if (x==27 && y==16) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==27 && y==17) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==27 && y==18) begin
			VGA = {4'b0010, 4'b0001, 4'b0001};
		end else if (x==27 && y==19) begin
			VGA = {4'b0001, 4'b0001, 4'b0001};
		end else if (x==27 && y==20) begin
			VGA = {4'b0000, 4'b0000, 4'b0000};
		end else if (x==27 && y==21) begin
			VGA = {4'b0000, 4'b0000, 4'b0000};
		end else if (x==27 && y==22) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==27 && y==23) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==27 && y==24) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==27 && y==25) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==27 && y==26) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==27 && y==27) begin
			VGA = {4'b1001, 4'b1001, 4'b1000};
		end else if (x==27 && y==28) begin
			VGA = {4'b0100, 4'b0010, 4'b0001};
		end else if (x==27 && y==29) begin
			VGA = {4'b0111, 4'b0100, 4'b0010};
		end else if (x==27 && y==30) begin
			VGA = {4'b1011, 4'b0111, 4'b0100};
		end else if (x==27 && y==31) begin
			VGA = {4'b1100, 4'b1001, 4'b0111};
		end else if (x==27 && y==32) begin
			VGA = {4'b1011, 4'b1000, 4'b0110};
		end else if (x==27 && y==33) begin
			VGA = {4'b1001, 4'b0110, 4'b0100};
		end else if (x==27 && y==34) begin
			VGA = {4'b1100, 4'b1001, 4'b1000};
		end else if (x==27 && y==35) begin
			VGA = {4'b1011, 4'b1010, 4'b1001};
		end else if (x==27 && y==36) begin
			VGA = {4'b1010, 4'b1010, 4'b1000};
		end else if (x==27 && y==37) begin
			VGA = {4'b1001, 4'b1001, 4'b1000};
		end else if (x==27 && y==38) begin
			VGA = {4'b1010, 4'b1010, 4'b1001};
		end else if (x==27 && y==39) begin
			VGA = {4'b1011, 4'b1011, 4'b1010};
		end else if (x==28 && y==0) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==28 && y==1) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==28 && y==2) begin
			VGA = {4'b1100, 4'b1100, 4'b1011};
		end else if (x==28 && y==3) begin
			VGA = {4'b1100, 4'b1100, 4'b1011};
		end else if (x==28 && y==4) begin
			VGA = {4'b1101, 4'b1011, 4'b1011};
		end else if (x==28 && y==5) begin
			VGA = {4'b1011, 4'b1010, 4'b1001};
		end else if (x==28 && y==6) begin
			VGA = {4'b1001, 4'b0110, 4'b0011};
		end else if (x==28 && y==7) begin
			VGA = {4'b0101, 4'b0010, 4'b0000};
		end else if (x==28 && y==8) begin
			VGA = {4'b0101, 4'b0011, 4'b0001};
		end else if (x==28 && y==9) begin
			VGA = {4'b0111, 4'b0100, 4'b0010};
		end else if (x==28 && y==10) begin
			VGA = {4'b0110, 4'b0100, 4'b0010};
		end else if (x==28 && y==11) begin
			VGA = {4'b0011, 4'b0001, 4'b0000};
		end else if (x==28 && y==12) begin
			VGA = {4'b0111, 4'b0100, 4'b0011};
		end else if (x==28 && y==13) begin
			VGA = {4'b0111, 4'b0100, 4'b0010};
		end else if (x==28 && y==14) begin
			VGA = {4'b0110, 4'b0011, 4'b0001};
		end else if (x==28 && y==15) begin
			VGA = {4'b0111, 4'b0101, 4'b0100};
		end else if (x==28 && y==16) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==28 && y==17) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==28 && y==18) begin
			VGA = {4'b0010, 4'b0001, 4'b0001};
		end else if (x==28 && y==19) begin
			VGA = {4'b0001, 4'b0000, 4'b0000};
		end else if (x==28 && y==20) begin
			VGA = {4'b0010, 4'b0010, 4'b0010};
		end else if (x==28 && y==21) begin
			VGA = {4'b0010, 4'b0010, 4'b0010};
		end else if (x==28 && y==22) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==28 && y==23) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==28 && y==24) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==28 && y==25) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==28 && y==26) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==28 && y==27) begin
			VGA = {4'b0101, 4'b0101, 4'b0100};
		end else if (x==28 && y==28) begin
			VGA = {4'b0100, 4'b0010, 4'b0001};
		end else if (x==28 && y==29) begin
			VGA = {4'b0110, 4'b0100, 4'b0010};
		end else if (x==28 && y==30) begin
			VGA = {4'b1010, 4'b0110, 4'b0011};
		end else if (x==28 && y==31) begin
			VGA = {4'b1011, 4'b1000, 4'b0101};
		end else if (x==28 && y==32) begin
			VGA = {4'b1010, 4'b0111, 4'b0101};
		end else if (x==28 && y==33) begin
			VGA = {4'b1010, 4'b0111, 4'b0101};
		end else if (x==28 && y==34) begin
			VGA = {4'b1100, 4'b1000, 4'b0110};
		end else if (x==28 && y==35) begin
			VGA = {4'b1101, 4'b1011, 4'b1001};
		end else if (x==28 && y==36) begin
			VGA = {4'b1001, 4'b1000, 4'b0110};
		end else if (x==28 && y==37) begin
			VGA = {4'b0111, 4'b0111, 4'b0101};
		end else if (x==28 && y==38) begin
			VGA = {4'b1001, 4'b1000, 4'b0111};
		end else if (x==28 && y==39) begin
			VGA = {4'b1010, 4'b1001, 4'b1000};
		end else if (x==29 && y==0) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==29 && y==1) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==29 && y==2) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==29 && y==3) begin
			VGA = {4'b1100, 4'b1100, 4'b1011};
		end else if (x==29 && y==4) begin
			VGA = {4'b1100, 4'b1100, 4'b1011};
		end else if (x==29 && y==5) begin
			VGA = {4'b1011, 4'b1011, 4'b1010};
		end else if (x==29 && y==6) begin
			VGA = {4'b1000, 4'b0101, 4'b0011};
		end else if (x==29 && y==7) begin
			VGA = {4'b0100, 4'b0010, 4'b0000};
		end else if (x==29 && y==8) begin
			VGA = {4'b0101, 4'b0010, 4'b0001};
		end else if (x==29 && y==9) begin
			VGA = {4'b0111, 4'b0101, 4'b0010};
		end else if (x==29 && y==10) begin
			VGA = {4'b0100, 4'b0001, 4'b0000};
		end else if (x==29 && y==11) begin
			VGA = {4'b0010, 4'b0001, 4'b0000};
		end else if (x==29 && y==12) begin
			VGA = {4'b0100, 4'b0010, 4'b0001};
		end else if (x==29 && y==13) begin
			VGA = {4'b0110, 4'b0100, 4'b0010};
		end else if (x==29 && y==14) begin
			VGA = {4'b0101, 4'b0010, 4'b0000};
		end else if (x==29 && y==15) begin
			VGA = {4'b0101, 4'b0010, 4'b0001};
		end else if (x==29 && y==16) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==29 && y==17) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==29 && y==18) begin
			VGA = {4'b0101, 4'b0101, 4'b0100};
		end else if (x==29 && y==19) begin
			VGA = {4'b0001, 4'b0001, 4'b0001};
		end else if (x==29 && y==20) begin
			VGA = {4'b0001, 4'b0000, 4'b0000};
		end else if (x==29 && y==21) begin
			VGA = {4'b0110, 4'b0110, 4'b0101};
		end else if (x==29 && y==22) begin
			VGA = {4'b1100, 4'b1100, 4'b1011};
		end else if (x==29 && y==23) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==29 && y==24) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==29 && y==25) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==29 && y==26) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==29 && y==27) begin
			VGA = {4'b0110, 4'b0101, 4'b0101};
		end else if (x==29 && y==28) begin
			VGA = {4'b0011, 4'b0010, 4'b0001};
		end else if (x==29 && y==29) begin
			VGA = {4'b0011, 4'b0001, 4'b0000};
		end else if (x==29 && y==30) begin
			VGA = {4'b0111, 4'b0100, 4'b0010};
		end else if (x==29 && y==31) begin
			VGA = {4'b1001, 4'b0110, 4'b0100};
		end else if (x==29 && y==32) begin
			VGA = {4'b0111, 4'b0101, 4'b0010};
		end else if (x==29 && y==33) begin
			VGA = {4'b1010, 4'b1000, 4'b0101};
		end else if (x==29 && y==34) begin
			VGA = {4'b1001, 4'b0110, 4'b0100};
		end else if (x==29 && y==35) begin
			VGA = {4'b1011, 4'b1001, 4'b0111};
		end else if (x==29 && y==36) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==29 && y==37) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==29 && y==38) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==29 && y==39) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==30 && y==0) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==30 && y==1) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==30 && y==2) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==30 && y==3) begin
			VGA = {4'b1100, 4'b1100, 4'b1100};
		end else if (x==30 && y==4) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==30 && y==5) begin
			VGA = {4'b1100, 4'b1011, 4'b1010};
		end else if (x==30 && y==6) begin
			VGA = {4'b1100, 4'b1010, 4'b1000};
		end else if (x==30 && y==7) begin
			VGA = {4'b1010, 4'b1000, 4'b0110};
		end else if (x==30 && y==8) begin
			VGA = {4'b1000, 4'b0110, 4'b0100};
		end else if (x==30 && y==9) begin
			VGA = {4'b0111, 4'b0101, 4'b0011};
		end else if (x==30 && y==10) begin
			VGA = {4'b0110, 4'b0100, 4'b0010};
		end else if (x==30 && y==11) begin
			VGA = {4'b0100, 4'b0001, 4'b0001};
		end else if (x==30 && y==12) begin
			VGA = {4'b0011, 4'b0001, 4'b0000};
		end else if (x==30 && y==13) begin
			VGA = {4'b0110, 4'b0011, 4'b0010};
		end else if (x==30 && y==14) begin
			VGA = {4'b0101, 4'b0011, 4'b0001};
		end else if (x==30 && y==15) begin
			VGA = {4'b0101, 4'b0010, 4'b0000};
		end else if (x==30 && y==16) begin
			VGA = {4'b1100, 4'b1011, 4'b1010};
		end else if (x==30 && y==17) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==30 && y==18) begin
			VGA = {4'b1100, 4'b1011, 4'b1011};
		end else if (x==30 && y==19) begin
			VGA = {4'b0011, 4'b0011, 4'b0010};
		end else if (x==30 && y==20) begin
			VGA = {4'b0001, 4'b0001, 4'b0000};
		end else if (x==30 && y==21) begin
			VGA = {4'b1001, 4'b1000, 4'b0111};
		end else if (x==30 && y==22) begin
			VGA = {4'b1011, 4'b1011, 4'b1010};
		end else if (x==30 && y==23) begin
			VGA = {4'b1100, 4'b1100, 4'b1011};
		end else if (x==30 && y==24) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==30 && y==25) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==30 && y==26) begin
			VGA = {4'b1100, 4'b1100, 4'b1100};
		end else if (x==30 && y==27) begin
			VGA = {4'b0010, 4'b0010, 4'b0010};
		end else if (x==30 && y==28) begin
			VGA = {4'b0011, 4'b0011, 4'b0011};
		end else if (x==30 && y==29) begin
			VGA = {4'b0010, 4'b0001, 4'b0000};
		end else if (x==30 && y==30) begin
			VGA = {4'b0110, 4'b0100, 4'b0010};
		end else if (x==30 && y==31) begin
			VGA = {4'b1000, 4'b0110, 4'b0100};
		end else if (x==30 && y==32) begin
			VGA = {4'b0101, 4'b0100, 4'b0011};
		end else if (x==30 && y==33) begin
			VGA = {4'b1010, 4'b1001, 4'b1000};
		end else if (x==30 && y==34) begin
			VGA = {4'b1100, 4'b1100, 4'b1011};
		end else if (x==30 && y==35) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==30 && y==36) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==30 && y==37) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==30 && y==38) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==30 && y==39) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==31 && y==0) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==31 && y==1) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==31 && y==2) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==31 && y==3) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==31 && y==4) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==31 && y==5) begin
			VGA = {4'b1110, 4'b1101, 4'b1100};
		end else if (x==31 && y==6) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==31 && y==7) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==31 && y==8) begin
			VGA = {4'b1100, 4'b1011, 4'b1010};
		end else if (x==31 && y==9) begin
			VGA = {4'b1100, 4'b1011, 4'b1001};
		end else if (x==31 && y==10) begin
			VGA = {4'b0110, 4'b0100, 4'b0010};
		end else if (x==31 && y==11) begin
			VGA = {4'b0111, 4'b0110, 4'b0100};
		end else if (x==31 && y==12) begin
			VGA = {4'b0110, 4'b0100, 4'b0010};
		end else if (x==31 && y==13) begin
			VGA = {4'b0111, 4'b0101, 4'b0100};
		end else if (x==31 && y==14) begin
			VGA = {4'b0111, 4'b0110, 4'b0101};
		end else if (x==31 && y==15) begin
			VGA = {4'b0111, 4'b0101, 4'b0100};
		end else if (x==31 && y==16) begin
			VGA = {4'b0100, 4'b0011, 4'b0010};
		end else if (x==31 && y==17) begin
			VGA = {4'b1100, 4'b1011, 4'b1010};
		end else if (x==31 && y==18) begin
			VGA = {4'b1011, 4'b1011, 4'b1010};
		end else if (x==31 && y==19) begin
			VGA = {4'b1010, 4'b1010, 4'b1001};
		end else if (x==31 && y==20) begin
			VGA = {4'b0101, 4'b0100, 4'b0011};
		end else if (x==31 && y==21) begin
			VGA = {4'b1001, 4'b1000, 4'b1000};
		end else if (x==31 && y==22) begin
			VGA = {4'b1011, 4'b1010, 4'b1001};
		end else if (x==31 && y==23) begin
			VGA = {4'b1011, 4'b1011, 4'b1010};
		end else if (x==31 && y==24) begin
			VGA = {4'b1100, 4'b1011, 4'b1011};
		end else if (x==31 && y==25) begin
			VGA = {4'b1011, 4'b1011, 4'b1011};
		end else if (x==31 && y==26) begin
			VGA = {4'b1011, 4'b1011, 4'b1011};
		end else if (x==31 && y==27) begin
			VGA = {4'b1100, 4'b1100, 4'b1100};
		end else if (x==31 && y==28) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==31 && y==29) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==31 && y==30) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==31 && y==31) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==31 && y==32) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==31 && y==33) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==31 && y==34) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==31 && y==35) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==31 && y==36) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==31 && y==37) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==31 && y==38) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==31 && y==39) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==32 && y==0) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==32 && y==1) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==32 && y==2) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==32 && y==3) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==32 && y==4) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==32 && y==5) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==32 && y==6) begin
			VGA = {4'b1100, 4'b1100, 4'b1011};
		end else if (x==32 && y==7) begin
			VGA = {4'b1100, 4'b1100, 4'b1011};
		end else if (x==32 && y==8) begin
			VGA = {4'b1100, 4'b1100, 4'b1011};
		end else if (x==32 && y==9) begin
			VGA = {4'b1100, 4'b1100, 4'b1011};
		end else if (x==32 && y==10) begin
			VGA = {4'b1110, 4'b1101, 4'b1100};
		end else if (x==32 && y==11) begin
			VGA = {4'b1100, 4'b1100, 4'b1011};
		end else if (x==32 && y==12) begin
			VGA = {4'b1100, 4'b1100, 4'b1011};
		end else if (x==32 && y==13) begin
			VGA = {4'b1100, 4'b1011, 4'b1010};
		end else if (x==32 && y==14) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==32 && y==15) begin
			VGA = {4'b1100, 4'b1100, 4'b1100};
		end else if (x==32 && y==16) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==32 && y==17) begin
			VGA = {4'b1110, 4'b1101, 4'b1100};
		end else if (x==32 && y==18) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==32 && y==19) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==32 && y==20) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==32 && y==21) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==32 && y==22) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==32 && y==23) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==32 && y==24) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==32 && y==25) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==32 && y==26) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==32 && y==27) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==32 && y==28) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==32 && y==29) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==32 && y==30) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==32 && y==31) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==32 && y==32) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==32 && y==33) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==32 && y==34) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==32 && y==35) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==32 && y==36) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==32 && y==37) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==32 && y==38) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==32 && y==39) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==33 && y==0) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==33 && y==1) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==33 && y==2) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==33 && y==3) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==33 && y==4) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==33 && y==5) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==33 && y==6) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==33 && y==7) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==33 && y==8) begin
			VGA = {4'b1100, 4'b1100, 4'b1011};
		end else if (x==33 && y==9) begin
			VGA = {4'b1100, 4'b1100, 4'b1011};
		end else if (x==33 && y==10) begin
			VGA = {4'b1100, 4'b1100, 4'b1011};
		end else if (x==33 && y==11) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==33 && y==12) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==33 && y==13) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==33 && y==14) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==33 && y==15) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==33 && y==16) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==33 && y==17) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==33 && y==18) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==33 && y==19) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==33 && y==20) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==33 && y==21) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==33 && y==22) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==33 && y==23) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==33 && y==24) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==33 && y==25) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==33 && y==26) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==33 && y==27) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==33 && y==28) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==33 && y==29) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==33 && y==30) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==33 && y==31) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==33 && y==32) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==33 && y==33) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==33 && y==34) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==33 && y==35) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==33 && y==36) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==33 && y==37) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==33 && y==38) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==33 && y==39) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==34 && y==0) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==34 && y==1) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==34 && y==2) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==34 && y==3) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==34 && y==4) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==34 && y==5) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==34 && y==6) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==34 && y==7) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==34 && y==8) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==34 && y==9) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==34 && y==10) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==34 && y==11) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==34 && y==12) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==34 && y==13) begin
			VGA = {4'b1100, 4'b1100, 4'b1011};
		end else if (x==34 && y==14) begin
			VGA = {4'b1100, 4'b1100, 4'b1010};
		end else if (x==34 && y==15) begin
			VGA = {4'b1100, 4'b1100, 4'b1011};
		end else if (x==34 && y==16) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==34 && y==17) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==34 && y==18) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==34 && y==19) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==34 && y==20) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==34 && y==21) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==34 && y==22) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==34 && y==23) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==34 && y==24) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==34 && y==25) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==34 && y==26) begin
			VGA = {4'b1110, 4'b1101, 4'b1100};
		end else if (x==34 && y==27) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==34 && y==28) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==34 && y==29) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==34 && y==30) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==34 && y==31) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==34 && y==32) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==34 && y==33) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==34 && y==34) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==34 && y==35) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==34 && y==36) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==34 && y==37) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==34 && y==38) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==34 && y==39) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==35 && y==0) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==35 && y==1) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==35 && y==2) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==35 && y==3) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==35 && y==4) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==35 && y==5) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==35 && y==6) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==35 && y==7) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==35 && y==8) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==35 && y==9) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==35 && y==10) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==35 && y==11) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==35 && y==12) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==35 && y==13) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==35 && y==14) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==35 && y==15) begin
			VGA = {4'b1100, 4'b1100, 4'b1011};
		end else if (x==35 && y==16) begin
			VGA = {4'b1100, 4'b1100, 4'b1011};
		end else if (x==35 && y==17) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==35 && y==18) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==35 && y==19) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==35 && y==20) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==35 && y==21) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==35 && y==22) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==35 && y==23) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==35 && y==24) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==35 && y==25) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==35 && y==26) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==35 && y==27) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==35 && y==28) begin
			VGA = {4'b1101, 4'b1101, 4'b1011};
		end else if (x==35 && y==29) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==35 && y==30) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==35 && y==31) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==35 && y==32) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==35 && y==33) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==35 && y==34) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==35 && y==35) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==35 && y==36) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==35 && y==37) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==35 && y==38) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==35 && y==39) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==36 && y==0) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==36 && y==1) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==36 && y==2) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==36 && y==3) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==36 && y==4) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==36 && y==5) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==36 && y==6) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==36 && y==7) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==36 && y==8) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==36 && y==9) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==36 && y==10) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==36 && y==11) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==36 && y==12) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==36 && y==13) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==36 && y==14) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==36 && y==15) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==36 && y==16) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==36 && y==17) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==36 && y==18) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==36 && y==19) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==36 && y==20) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==36 && y==21) begin
			VGA = {4'b1011, 4'b1011, 4'b1010};
		end else if (x==36 && y==22) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==36 && y==23) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==36 && y==24) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==36 && y==25) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==36 && y==26) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==36 && y==27) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==36 && y==28) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==36 && y==29) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==36 && y==30) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==36 && y==31) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==36 && y==32) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==36 && y==33) begin
			VGA = {4'b1100, 4'b1100, 4'b1100};
		end else if (x==36 && y==34) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==36 && y==35) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==36 && y==36) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==36 && y==37) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==36 && y==38) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==36 && y==39) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==37 && y==0) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==37 && y==1) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==37 && y==2) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==37 && y==3) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==37 && y==4) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==37 && y==5) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==37 && y==6) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==37 && y==7) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==37 && y==8) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==37 && y==9) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==37 && y==10) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==37 && y==11) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==37 && y==12) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==37 && y==13) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==37 && y==14) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==37 && y==15) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==37 && y==16) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==37 && y==17) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==37 && y==18) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==37 && y==19) begin
			VGA = {4'b1100, 4'b1100, 4'b1011};
		end else if (x==37 && y==20) begin
			VGA = {4'b1101, 4'b1100, 4'b1011};
		end else if (x==37 && y==21) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==37 && y==22) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==37 && y==23) begin
			VGA = {4'b1110, 4'b1101, 4'b1100};
		end else if (x==37 && y==24) begin
			VGA = {4'b1110, 4'b1101, 4'b1100};
		end else if (x==37 && y==25) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==37 && y==26) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==37 && y==27) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==37 && y==28) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==37 && y==29) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==37 && y==30) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==37 && y==31) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==37 && y==32) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==37 && y==33) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==37 && y==34) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==37 && y==35) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==37 && y==36) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==37 && y==37) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==37 && y==38) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==37 && y==39) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==38 && y==0) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==38 && y==1) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==38 && y==2) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==38 && y==3) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==38 && y==4) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==38 && y==5) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==38 && y==6) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==38 && y==7) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==38 && y==8) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==38 && y==9) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==38 && y==10) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==38 && y==11) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==38 && y==12) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==38 && y==13) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==38 && y==14) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==38 && y==15) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==38 && y==16) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==38 && y==17) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==38 && y==18) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==38 && y==19) begin
			VGA = {4'b1101, 4'b1100, 4'b1100};
		end else if (x==38 && y==20) begin
			VGA = {4'b1100, 4'b1100, 4'b1011};
		end else if (x==38 && y==21) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==38 && y==22) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==38 && y==23) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==38 && y==24) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==38 && y==25) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==38 && y==26) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==38 && y==27) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==38 && y==28) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==38 && y==29) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==38 && y==30) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==38 && y==31) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==38 && y==32) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==38 && y==33) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==38 && y==34) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==38 && y==35) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==38 && y==36) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==38 && y==37) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==38 && y==38) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==38 && y==39) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==39 && y==0) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==39 && y==1) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==39 && y==2) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==39 && y==3) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==39 && y==4) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==39 && y==5) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==39 && y==6) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==39 && y==7) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==39 && y==8) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==39 && y==9) begin
			VGA = {4'b1101, 4'b1101, 4'b1100};
		end else if (x==39 && y==10) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==39 && y==11) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==39 && y==12) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==39 && y==13) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==39 && y==14) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==39 && y==15) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==39 && y==16) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==39 && y==17) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==39 && y==18) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==39 && y==19) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==39 && y==20) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==39 && y==21) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==39 && y==22) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==39 && y==23) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==39 && y==24) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==39 && y==25) begin
			VGA = {4'b1110, 4'b1110, 4'b1110};
		end else if (x==39 && y==26) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==39 && y==27) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==39 && y==28) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==39 && y==29) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==39 && y==30) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==39 && y==31) begin
			VGA = {4'b1110, 4'b1110, 4'b1101};
		end else if (x==39 && y==32) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==39 && y==33) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==39 && y==34) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==39 && y==35) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==39 && y==36) begin
			VGA = {4'b1110, 4'b1101, 4'b1101};
		end else if (x==39 && y==37) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==39 && y==38) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end else if (x==39 && y==39) begin
			VGA = {4'b1101, 4'b1101, 4'b1101};
		end 
	end
endmodule