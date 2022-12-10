module alien(clk_25MHz, rst, start, alien_start_x, alien_start_y, alien_x, alien_y, bullet_x, bullet_y, rocket, fire, fire_freq, blocked, alive, count, pass, is_hit);

	input clk_25MHz, rst;
	input start;
	input [9:0] alien_start_x;
	input [9:0] alien_start_y;
	output reg [9:0] alien_x;
	output reg [9:0] alien_y;
	input [9:0] bullet_x;
	input [9:0] bullet_y;
	input [27:0] fire_freq;
	input blocked;
	input rocket;
	output reg fire;
	output reg alive;
	output count;
	output reg pass;
	input is_hit;

	reg x_velocity;
	reg y_velocity;
	reg direction;

	reg [9:0] alien_x_reg, alien_y_reg;
	

	reg [23:0] counter;
	reg [27:0] fire_counter;
	
	always @ (posedge clk_25MHz or negedge rst)
		if(rst == 1'b0) begin
			fire <= 1'b0;
			fire_counter <= 28'd0;
		end
		else begin
			if((fire_counter >= fire_freq) && blocked && ~alive && start == 1'b1) begin
				fire <= 1'b1;
				fire_counter <= 28'd0;
			end
			else begin
				fire <= 1'b0;
				fire_counter <= fire_counter + 1'b1;
			end
		end
				
	
	always @ (posedge clk_25MHz or negedge rst) begin
		if(rst == 1'b0)
			alive <= 1'b0;
		else begin
			case(start)
				1'b1: begin
					if(is_hit == 1'b1)
						alive <= 1'b1;
					else
						alive <= alive;
				end
				1'b0: alive <= 1'b0;
				default: alive <= alive;
			endcase
		end
	end
	
	//alien movement
	always @(posedge clk_25MHz or negedge rst) begin
		if(rst == 1'b0) begin
			alien_x <= alien_start_x;
			end
		else
		case(start)
			1'b1: begin
				if(counter == 24'd400_000 && direction == 1'b1) begin
					alien_x <= alien_x + x_velocity;
					counter <= 24'd0;
				end
				else if(counter == 24'd400_000 && direction == 1'b0) begin
					alien_x <= alien_x - x_velocity;
					counter <= 24'd0;
				end
				else begin
					alien_x <= alien_x;
					counter <= counter + 1'b1;
				end
			end
			1'b0: begin
				alien_x <= alien_start_x;
			end
			default: alien_x <= alien_x;
		endcase
	end
	
	// hit scan
    always@(posedge clk_25MHz or negedge rst)begin
        if(rst == 1'b0)
        begin
            direction <= 1'b1;
            alien_y <= alien_start_y;
				x_velocity <= 1'b1;
				pass <= 1'b0;
        end else begin
			  case(start)
					1'b1: begin
						if(alien_x == alien_start_x - 10'd144 && direction == 1'b0) begin
							 direction <= 1'b1;
							// y_velocity <= 3'd4;
							 alien_y <= alien_y + 10'd16;
						end else if(alien_x == alien_start_x + 10'd144 && direction == 1'b1)begin
							 direction <= 1'b0;
							// y_velocity <= 3'd4;
							 alien_y <= alien_y + 10'd16;
						end
						else if(alien_y >= 10'd391 && ~alive) begin
							pass <= 1'd1;
							x_velocity <= 1'b0;
							y_velocity <= 1'b0;
						end	
						else
							pass <= 1'd0;
				end
				1'b0: alien_y <= alien_start_y;
				default: alien_y <= alien_y;
			endcase
		  end
    end
	

endmodule