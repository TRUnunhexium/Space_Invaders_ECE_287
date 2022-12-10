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

//	(spaceshipX,spaceshipY,btnL,btnR,clk,rst,
//    alienrocketX1,alienrocketY1,
//    alienrocketX2,alienrocketY2,
//    alienrocketX3,alienrocketY3,
//    alienrocketX4,alienrocketY4,
//    alienrocketX5,alienrocketY5,
//    alienrocketX6,alienrocketY6,
//    alienrocket1,alienrocket2,
//    alienrocket3,alienrocket4,
//    alienrocket5,alienrocket6,
//    alienhit,liveminus);
//	 
//	 
//    input btnL,btnR;
//    input clk,rst;
//    output reg [9:0]spaceshipX;
//    output reg [9:0]spaceshipY;
//    output reg alienhit,liveminus;
//    input alienrocket1,alienrocket2,alienrocket3,alienrocket4,alienrocket5,alienrocket6;
//    input [9:0]alienrocketX1,alienrocketX2,alienrocketX3,alienrocketX4,alienrocketX5,alienrocketX6;
//    input [9:0]alienrocketY1,alienrocketY2,alienrocketY3,alienrocketY4,alienrocketY5,alienrocketY6;  
//     
//    always@(posedge clk or posedge rst)
//    begin
//        if(rst)
//        begin
//            spaceshipX <= 10'd310;
//            spaceshipY <= 10'd400;
//            alienhit <= 0;
//            liveminus <= 0;
//        end
//        else begin
//            if(btnL) begin
//                spaceshipX <= (spaceshipX > 11)? (spaceshipX - 10'd1):spaceshipX;
//            end 
//            else if(btnR) begin
//                spaceshipX <= (spaceshipX < 598)? (spaceshipX + 10'd1):spaceshipX;
//            end
//            if ((alienrocket1 &&(((alienrocketX1 >= spaceshipX -2)&&(alienrocketX1 <= spaceshipX + 33))&&(alienrocketY1 == spaceshipY)))  ||  
//                (alienrocket2 &&(((alienrocketX2 >= spaceshipX -2)&&(alienrocketX2 <= spaceshipX + 33))&&(alienrocketY2 == spaceshipY)))  ||
//                (alienrocket3 &&(((alienrocketX3 >= spaceshipX -2)&&(alienrocketX3 <= spaceshipX + 33))&&(alienrocketY3 == spaceshipY)))  ||
//                (alienrocket4 &&(((alienrocketX4 >= spaceshipX -2)&&(alienrocketX4 <= spaceshipX + 33))&&(alienrocketY4 == spaceshipY)))  ||
//                (alienrocket5 &&(((alienrocketX5 >= spaceshipX -2)&&(alienrocketX5 <= spaceshipX + 33))&&(alienrocketY5 == spaceshipY)))  ||
//                (alienrocket6 &&(((alienrocketX6 >= spaceshipX -2)&&(alienrocketX6 <= spaceshipX + 33))&&(alienrocketY6 == spaceshipY)))) 
//            begin
//                alienhit <= 1'b1;
//                liveminus <= 1'b1;
//            end else begin
//                alienhit <= 0;
//                liveminus <= 0;
//            end
//        end
//    end
//endmodule