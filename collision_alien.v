module collision_alien(clk, rst, x_a, y_a, x_r, y_r, alive, rocket, is_hit);

input clk, rst;
input [9:0] x_a, y_a, x_r, y_r;
input alive, rocket;
output is_hit;

reg hit_buffer;

reg [23:0] buffer;

assign is_hit = hit_buffer;

always @(posedge clk or negedge rst)
begin
	if (rst == 1'b0) begin
		hit_buffer <= 1'b0;
	end else begin
		if (~rocket && ~alive && (((x_r >= x_a - 10'd3) && (x_r <= x_a + 10'd31)) && ((y_r <= y_a + 10'd23) && (y_r >= y_a)))) begin
			hit_buffer <= 1'd1;
		end 
		else
			if(buffer == 24'd1000_000) begin
				hit_buffer <= 1'd0;
				buffer <= 1'b0;
			end
			else begin
				hit_buffer <= hit_buffer;
				buffer <= buffer + 1'b1;
			end
	end
end
endmodule  