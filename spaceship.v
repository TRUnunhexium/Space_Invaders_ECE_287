// This module manages the position of the player's spaceship, collisions with alien rockets, and lives counter
// This module was adapted from nikkatsa7's space invaders game found at
// https://github.com/nikkatsa7/SpaceInvadersFpgaGame/blob/master/Space_Invaders.v

module spaceship(clk_25MHz, rst, left, right, start, start_x, player_x, is_hit, lives);

	input clk_25MHz, rst;
	input start;
	input left;
	input right;
	input [9:0] start_x;
	output reg [9:0] player_x;
	input is_hit;
	output reg [1:0] lives;

	wire [9:0]x_velocity = 10'd1;
	
	reg [23:0] is_hit_counter;

	reg [23:0] counter;
	
	//player movement
	always @(posedge clk_25MHz or negedge rst) begin
		if(rst == 1'b0) begin
			player_x <= start_x;
			counter <= 24'd0;
			end
		else begin
			if(right == 1'b1 && player_x < 10'd575  && left == 1'b0) begin
						if(counter == 24'd300_000) begin
							player_x <= player_x + x_velocity;
							counter <= 24'd0;
						end
						else begin
							player_x <= player_x;
							counter <= counter + 1'b1;
						end
			end
			else if(left == 1'b1 && player_x > 10'd32 && right == 1'b0) begin
						if(counter == 24'd300_000) begin
							player_x <= player_x - x_velocity;
							counter <= 24'd0;
						end
						else begin
							player_x <= player_x;
							counter <= counter + 1'b1;
						end
			end
			else begin
				player_x <= player_x;
			end
		end
	end
	
	
	// plyaer lives counter
	always @ (posedge clk_25MHz or negedge rst)
	if(rst == 1'b0)
		lives <= 2'd0;
	else
		if(is_hit == 1'b1 && lives < 2'd3)
			if(is_hit_counter == 24'd200_000) begin
				lives <= lives + 1'b1;
				is_hit_counter <= 24'd0;
			end
			else
				is_hit_counter <= is_hit_counter + 1'b1;
		else
			lives <= lives;

endmodule
