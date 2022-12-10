module collision_player(clk, rst, x, y, x_1, y_1, x_2, y_2, x_3, y_3, x_4, y_4, x_5, y_5, 
													 x_6, y_6, x_7, y_7, x_8, y_8, x_9, y_9, x_10, y_10,
													 x_11, y_11, x_12, y_12, x_13, y_13, x_14, y_14, x_15, y_15,
												    r1, r2, r3, r4, r5,
													 r6, r7, r8, r9, r10,
													 r11, r12, r13, r14, r15, is_hit);

input clk, rst;
input [9:0] x, y;
input [9:0] x_1, y_1;
input [9:0] x_2, y_2;
input [9:0] x_3, y_3;
input [9:0] x_4, y_4;
input [9:0] x_5, y_5;
input [9:0] x_6, y_6;
input [9:0] x_7, y_7;
input [9:0] x_8, y_8;
input [9:0] x_9, y_9;
input [9:0] x_10, y_10;
input [9:0] x_11, y_11;
input [9:0] x_12, y_12;
input [9:0] x_13, y_13;
input [9:0] x_14, y_14;
input [9:0] x_15, y_15;
input r1, r2, r3, r4, r5;
input r6, r7, r8, r9, r10;
input r11, r12, r13, r14, r15;
output is_hit;

reg [23:0] buffer;
reg hit_buffer;

assign is_hit = hit_buffer;

always @(posedge clk or negedge rst)
begin
	if (rst == 1'b0) begin
		hit_buffer <= 1'b0;
		buffer <= 24'd0;
	end else begin
		if ((~r1 && (((x_1 >= x - 10'd3) && (x_1 <= x + 10'd31)) && (y == y_1 + 10'd3))) ||
			(~r2 && (((x_2 >= x - 10'd3) && (x_2 <= x + 10'd31)) && (y == y_2 + 10'd3))) ||
			(~r3 && (((x_3 >= x - 10'd3) && (x_3 <= x + 10'd31)) && (y == y_3 + 10'd3))) ||
			(~r4 && (((x_4 >= x - 10'd3) && (x_4 <= x + 10'd31)) && (y == y_4 + 10'd3))) ||
			(~r5 && (((x_5 >= x - 10'd3) && (x_5 <= x + 10'd31)) && (y == y_5 + 10'd3))) ||
			(~r6 && (((x_6 >= x - 10'd3) && (x_6 <= x + 10'd31)) && (y == y_6 + 10'd3))) ||
			(~r7 && (((x_7 >= x - 10'd3) && (x_7 <= x + 10'd31)) && (y == y_7 + 10'd3))) ||
			(~r8 && (((x_8 >= x - 10'd3) && (x_8 <= x + 10'd31)) && (y == y_8 + 10'd3))) ||
			(~r9 && (((x_9 >= x - 10'd3) && (x_9 <= x + 10'd31)) && (y == y_9 + 10'd3))) ||
			(~r10 && (((x_10 >= x - 10'd3) && (x_10 <= x + 10'd31)) && (y == y_10 + 10'd3))) ||
			(~r11 && (((x_11 >= x - 10'd3) && (x_11 <= x + 10'd31)) && (y == y_11 + 10'd3))) ||
			(~r12 && (((x_12 >= x - 10'd3) && (x_12 <= x + 10'd31)) && (y == y_12 + 10'd3))) ||
			(~r13 && (((x_13 >= x - 10'd3) && (x_13 <= x + 10'd31)) && (y == y_13 + 10'd3))) ||
			(~r14 && (((x_14 >= x - 10'd3) && (x_14 <= x + 10'd31)) && (y == y_14 + 10'd3))) ||
			(~r15 && (((x_15 >= x - 10'd3) && (x_15 <= x + 10'd31)) && (y == y_15 + 10'd3)))) begin
				hit_buffer <= 1'b1;
		end else begin
			if(buffer == 24'd0) begin
				hit_buffer <= 1'd0;
				buffer <= 1'b0;
			end
			else begin
				hit_buffer <= hit_buffer;
				buffer <= buffer + 1'b1;
			end
		end
	end


end
endmodule  
