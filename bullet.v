module bullet(clk_25MHz, rst, fire, insert_x, insert_y, direction, hit_reset, x, y, does_appear);

	input clk_25MHz, rst;
	input fire;
	input [9:0] insert_x, insert_y;
	input direction;
	input hit_reset;
	output reg [9:0] x, y;
	output reg does_appear;
	
	reg x_velocity;
	reg y_velocity;
	reg start;
//	reg start_x, start_y;
	
	reg [23:0]counter;
	 
	always@(posedge clk_25MHz or  negedge rst) begin
		if(rst == 1'b0) begin
			y <= insert_x;
			x <= insert_y;
			y_velocity <= 1'b1;
			start <= 1'b0;
		end
		else begin
			if (fire == 1'b0) begin
				counter <= 24'd0;
				does_appear <= 1'b0;
			end else begin
				does_appear <= 1'b0;
				start <= 1'b1;
			end
			
			if(direction == 1'b0 && start == 1'b0) begin
				does_appear <= 1'b1;
				x <= insert_x + 10'd15;
				y <= insert_y - 10'd3;
			end 
			else if(direction == 1'b1 && start == 1'b0) begin
				does_appear <= 1'b1;
				x <= insert_x + 10'd15;
				y <= insert_y + 10'd26;
			end
			else begin
				if(counter >= 24'd100_000 && direction == 1'b0 && start == 1'b1 && ( y >= 10'd32 || hit_reset)) begin
					y <= y - y_velocity;
					counter <= 24'd0;
					if ( (y == 10'd32) || ~hit_reset) begin
						start <= 1'b0;
						does_appear <= 1'b1;
						end
					else begin
						start <= start;
						does_appear <= does_appear;
					end
				end else if(counter >= 24'd200_000 && direction == 1'b1 && start == 1'b1 && ( y <= 10'd479 || hit_reset))begin
					y <= y + y_velocity;
					counter <= 24'd0;
					if ( y == 10'd479 || hit_reset) begin
						does_appear <= 1'b1;
						start <= 1'b0;
						end
					else begin
						start <= start;
						does_appear <= does_appear;
					end
				end
				else begin
				counter <= counter + 1'b1;
				end
			end
		end
	end

endmodule
