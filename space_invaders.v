module space_invaders(clk, rst, left, right, shoot, vga_output_data);
	
	input clk, rst;
	
	input left, right, shoot;

	output [28:0] vga_output_data;
	
	wire [7:0] r, g, b;
	wire [9:0] x, y;
	
	reg left_flip, right_flip, shoot_flip;
	
	vga disp(clk, rst, r, g, b, x, y, vga_output_data);
	
//FSM
	wire start;
	reg t_start;
	assign start = t_start;
	reg [2:0] lvl;
	reg [1:0]S;
	reg [1:0]NS;
	
	parameter START = 2'd0,
				PLAY = 2'd1,
				WIN = 2'd2,
				LOSE = 2'd3;
	

//	parameter alien_y8 = 64;
	parameter alien_width = 32;
	parameter alien_height = 24;
	
	wire [9:0] alien1_x, alien1_y;
	wire [9:0] alien2_x, alien2_y;
	wire [9:0] alien3_x, alien3_y;
	wire [9:0] alien4_x, alien4_y;
	wire [9:0] alien5_x, alien5_y;
	wire [9:0] alien6_x, alien6_y;
	wire [9:0] alien7_x, alien7_y;
	wire [9:0] alien8_x, alien8_y;
	wire [9:0] alien9_x, alien9_y;
	wire [9:0] alien10_x, alien10_y;
	wire [9:0] alien11_x, alien11_y;
	wire [9:0] alien12_x, alien12_y;
	wire [9:0] alien13_x, alien13_y;
	wire [9:0] alien14_x, alien14_y;
	wire [9:0] alien15_x, alien15_y;
	
	wire bullet1_x, bullet1_y;
	wire bullet2_x, bullet2_y;
	wire bullet3_x, bullet3_y;
	wire bullet4_x, bullet4_y;
	wire bullet5_x, bullet5_y;
	wire bullet6_x, bullet6_y;
	wire bullet7_x, bullet7_y;
	wire bullet8_x, bullet8_y;
	wire bullet9_x, bullet9_y;
	wire bullet10_x, bullet10_y;
	wire bullet11_x, bullet11_y;
	wire bullet12_x, bullet12_y;
	wire bullet13_x, bullet13_y;
	wire bullet14_x, bullet14_y;
	wire bullet15_x, bullet15_y;
	
	wire rocket1, fire1, fire_freq1;
	wire rocket2, fire2, fire_freq2;
	wire rocket3, fire3, fire_freq3;
	wire rocket4, fire4, fire_freq4;
	wire rocket5, fire5, fire_freq5;
	wire rocket6, fire6, fire_freq6;
	wire rocket7, fire7, fire_freq7;
	wire rocket8, fire8, fire_freq8;
	wire rocket9, fire9, fire_freq9;
	wire rocket10, fire10, fire_freq10;
	wire rocket11, fire11, fire_freq11;
	wire rocket12, fire12, fire_freq12;
	wire rocket13, fire13, fire_freq13;
	wire rocket14, fire14, fire_freq14;
	wire rocket15, fire15, fire_freq15;
	
	wire blocked1, alive1, counter1, pass1;
	wire blocked2, alive2, counter2, pass2;
	wire blocked3, alive3, counter3, pass3;
	wire blocked4, alive4, counter4, pass4;
	wire blocked5, alive5, counter5, pass5;
	wire blocked6, alive6, counter6, pass6;
	wire blocked7, alive7, counter7, pass7;
	wire blocked8, alive8, counter8, pass8;
	wire blocked9, alive9, counter9, pass9;
	wire blocked10, alive10, counter10, pass10;
	wire blocked11, alive11, counter11, pass11;
	wire blocked12, alive12, counter12, pass12;
	wire blocked13, alive13, counter13, pass13;
	wire blocked14, alive14, counter14, pass14;
	wire blocked15, alive15, counter15, pass15;
	
	wire [9:0] x_1, y_1;
	wire does_appear;
	wire [9:0] x1, y1; 
	wire does_appear1;
	wire [9:0] x2, y2;
	wire does_appear2;
	wire [9:0] x3, y3;
	wire does_appear3;
	wire [9:0] x4, y4;
	wire does_appear4;
	wire [9:0] x5, y5;
	wire does_appear5;
	wire [9:0] x6, y6;
	wire does_appear6;
	wire [9:0] x7, y7;
	wire does_appear7;
	wire [9:0] x8, y8;
	wire does_appear8;
	wire [9:0] x9, y9;
	wire does_appear9;
	wire [9:0] x10, y10;
	wire does_appear10;
	wire [9:0] x11, y11;
	wire does_appear11;
	wire [9:0] x12, y12;
	wire does_appear12;
	wire [9:0] x13, y13;
	wire does_appear13;
	wire [9:0] x14, y14;
	wire does_appear14;
	wire [9:0] x15, y15;
	wire does_appear15;
	
	wire p_hit;
	wire a1_hit;
	wire a2_hit;
	wire a3_hit;
	wire a4_hit;
	wire a5_hit;
	wire a6_hit;
	wire a7_hit;
	wire a8_hit;
	wire a9_hit;
	wire a10_hit;
	wire a11_hit;
	wire a12_hit;
	wire a13_hit;
	wire a14_hit;
	wire a15_hit;
	
	// top row
	alien alien1(clk, rst, start, 176, 63, alien1_x, alien1_y, x_1, y_1, does_appear1, fire1, 28'b00111001010100000000000000000, (alive6 && alive11), alive1, counter1, pass1, a1_hit);
	alien alien2(clk, rst, start, 240, 63, alien2_x, alien2_y, x_1, y_1, does_appear1, fire2, 28'b00110011110100000000000000000, (alive7 && alive12), alive2, counter2, pass2, a2_hit);
	alien alien3(clk, rst, start, 304, 63, alien3_x, alien3_y, x_1, y_1, does_appear1, fire3, 28'd150000000, (alive8 && alive13), alive3, counter3, pass3, a3_hit);
	alien alien4(clk, rst, start, 368, 63, alien4_x, alien4_y, x_1, y_1, does_appear1, fire4, 28'b00011001010100000000000000000, (alive9 && alive14), alive4, counter4, pass4, a4_hit);
	alien alien5(clk, rst, start, 432, 63, alien5_x, alien5_y, x_1, y_1, does_appear1, fire5, 28'b00001011010100000000000000000, (alive10 && alive12), alive5, counter5, pass5, a5_hit);

	// middle row
	alien alien6(clk, rst, start, 176,127, alien6_x, alien6_y, x_1, y_1, does_appear1, fire6, 28'b00111001010100000000000000000, alive11, alive6, counter6, pass6, a6_hit);
	alien alien7(clk, rst, start, 240, 127, alien7_x, alien7_y, x_1, y_1, does_appear1, fire7, 28'b00110011110100000000000000000, alive12, alive7, counter7, pass7, a7_hit);
	alien alien8(clk, rst, start, 304, 127, alien8_x, alien8_y, x_1, y_1, does_appear1, fire8, 28'd180000000, alive13, alive8, counter8, pass8, a8_hit);
	alien alien9(clk, rst, start, 368, 127, alien9_x, alien9_y, x_1, y_1, does_appear1, fire9, 28'b00011001010100000000000000000, alive14, alive9, counter9, pass9, a9_hit);
	alien alien10(clk, rst, start, 432, 127, alien10_x, alien10_y, x_1, y_1, does_appear1, fire10, 28'b00001011010100000000000000000, alive15, alive10, counter10, pass10, a10_hit);
	
	// bottom row
	alien alien11(clk, rst, start, 176, 191, alien11_x, alien11_y, x_1, y_1, does_appear1, fire11, 28'b00111001010100000000000000000, 1'b1, alive11, counter11, pass11, a11_hit);
	alien alien12(clk, rst, start, 240, 191, alien12_x, alien12_y, x_1, y_1, does_appear1, fire12, 28'b00110011110100000000000000000, 1'b1, alive12, counter12, pass12, a12_hit);
	alien alien13(clk, rst, start, 304, 191, alien13_x, alien13_y, x_1, y_1, does_appear1, fire13, 28'd180000000, 1'b1, alive13, counter13, pass13, a13_hit);
	alien alien14(clk, rst, start, 368, 191, alien14_x, alien14_y, x_1, y_1, does_appear1, fire14, 28'b00011001010100000000000000000, 1'b1, alive14, counter14, pass14, a14_hit);	
	alien alien15(clk, rst, start, 432, 191, alien15_x, alien15_y, x_1, y_1, does_appear1, fire15, 28'b00001011010100000000000000000, 1'b1, alive15, counter15, pass15, a15_hit);
	
	spaceship player(clk, rst, left_flip, right_flip, start, 303, player_x, p_hit, lives);
	
	bullet player_bullet(clk, rst, shoot_flip, player_x, 426, 1'b0, hit_resetP, x_1, y_1, does_appear);
	wire hit_resetP;
	
	assign hit_resetP = ~(a1_hit || a2_hit || a3_hit || a4_hit || a5_hit || a6_hit || a7_hit || a8_hit || a9_hit || a10_hit || a11_hit || a12_hit || a13_hit || a14_hit || a15_hit);
	
	assign pass_check = (pass1 || pass2 || pass3 || pass4 || pass5 || pass6 || pass7 || pass8 || pass9 || pass10 || pass11 || pass12 || pass13 || pass14 || pass15);
	
	wire [1:0]lives;
	
	bullet alien_bullet1(clk, rst, fire1, alien1_x, alien1_y, 1'b1, 1'b0, x1, y1, does_appear1);
	bullet alien_bullet2(clk, rst, fire2, alien2_x, alien1_y, 1'b1, 1'b0, x2, y2, does_appear2);
	bullet alien_bullet3(clk, rst, fire3, alien3_x, alien1_y, 1'b1, 1'b0, x3, y3, does_appear3);
	bullet alien_bullet4(clk, rst, fire4, alien4_x, alien1_y, 1'b1, 1'b0, x4, y4, does_appear4);
	bullet alien_bullet5(clk, rst, fire5, alien5_x, alien1_y, 1'b1, 1'b0, x5, y5, does_appear5);
	 
	bullet alien_bullet6(clk, rst, fire6, alien6_x, alien6_y, 1'b1, 1'b0, x6, y6, does_appear6);
	bullet alien_bullet7(clk, rst, fire7, alien7_x, alien7_y, 1'b1, 1'b0, x7, y7, does_appear7);
	bullet alien_bullet8(clk, rst, fire8, alien8_x, alien8_y, 1'b1, 1'b0, x8, y8, does_appear8);
	bullet alien_bullet9(clk, rst, fire9, alien9_x, alien9_y, 1'b1, 1'b0, x9, y9, does_appear9);
	bullet alien_bullet10(clk, rst, fire10, alien10_x, alien10_y, 1'b1, 1'b0, x10, y10, does_appear10);
	
	bullet alien_bullet11(clk, rst, fire11, alien11_x, alien11_y, 1'b1, 1'b0, x11, y11, does_appear11);

	bullet alien_bullet12(clk, rst, fire12, alien12_x, alien12_y, 1'b1, 1'b0, x12, y12, does_appear12);
	bullet alien_bullet13(clk, rst, fire13, alien13_x, alien13_y, 1'b1, 1'b0, x13, y13, does_appear13);
	bullet alien_bullet14(clk, rst, fire14, alien14_x, alien14_y, 1'b1, 1'b0, x14, y14, does_appear14);
	bullet alien_bullet15(clk, rst, fire15, alien15_x, alien15_y, 1'b1, 1'b0, x15, y15, does_appear15);
	
	collision_player player_colide(clk, rst, player_x, 426, x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 
													 x6, y6, x7, y7, x8, y8, x9, y9, x10, y10,
													 x11, y11, x12, y12, x13, y13, x14, y14, x15, y15,
												    does_appear1, does_appear2, does_appear3, does_appear4, does_appear5,
													 does_appear6, does_appear7, does_appear8, does_appear9, does_appear10,
													 does_appear11, does_appear12, does_appear13, does_appear14, does_appear15, p_hit);
	
	collision_alien pa1(clk, rst, alien1_x, alien1_y, x_1, y_1, alive1, does_appear, a1_hit);
	collision_alien pa2(clk, rst, alien2_x, alien2_y, x_1, y_1, alive2, does_appear, a2_hit);
	collision_alien pa3(clk, rst, alien3_x, alien3_y, x_1, y_1, alive3, does_appear, a3_hit);
	collision_alien pa4(clk, rst, alien4_x, alien4_y, x_1, y_1, alive4, does_appear, a4_hit);
	collision_alien pa5(clk, rst, alien5_x, alien5_y, x_1, y_1, alive5, does_appear, a5_hit);

	collision_alien pa6(clk, rst, alien6_x, alien6_y, x_1, y_1, alive6, does_appear, a6_hit);
	collision_alien pa7(clk, rst, alien7_x, alien7_y, x_1, y_1, alive7, does_appear, a7_hit);
	collision_alien pa8(clk, rst, alien8_x, alien8_y, x_1, y_1, alive8, does_appear, a8_hit);
	collision_alien pa9(clk, rst, alien9_x, alien9_y, x_1, y_1, alive9, does_appear, a9_hit);
	collision_alien pa10(clk, rst, alien10_x, alien10_y, x_1, y_1, alive10, does_appear, a10_hit);
	
	collision_alien pa11(clk, rst, alien11_x, alien11_y, x_1, y_1, alive11, does_appear, a11_hit);
	collision_alien pa12(clk, rst, alien12_x, alien12_y, x_1, y_1, alive12, does_appear, a12_hit);
	collision_alien pa13(clk, rst, alien13_x, alien13_y, x_1, y_1, alive13, does_appear, a13_hit);
	collision_alien pa14(clk, rst, alien14_x, alien14_y, x_1, y_1, alive14, does_appear, a14_hit);
	collision_alien pa15(clk, rst, alien15_x, alien15_y, x_1, y_1, alive15, does_appear, a15_hit);
	

	reg [7:0] r_reg, g_reg, b_reg;
	
	parameter player_y = 426;
	parameter player_width = 32;
	parameter player_height = 16;
	wire [9:0]player_x;
	
	parameter bullet_width = 4;
	parameter bullet_height = 4;
	
	always @ (*) begin
		left_flip = ~left;
		right_flip = ~right;
		shoot_flip = ~shoot;
	end
	
	always @(posedge clk or negedge rst) begin
		if (rst == 1'b0) begin		
			r_reg <= 0;
			g_reg <= 0;
			b_reg <= 0;
		end 
		else begin
			if (S == START) begin
				if (((x >= 95 && y >= 128) && (x < 116 && y < 256)) ||
						  ((x >= 116 && y >= 128) && (x < 138 && y < 149)) ||
						  ((x >= 138 && y >= 128) && (x < 159 && y < 192)) ||
						  ((x >= 223 && y >= 128) && (x < 244 && y < 256)) ||
						  ((x >= 244 && y >= 235) && (x < 286 && y < 256)) ||
						  ((x >= 350 && y >= 128) && (x < 371 && y < 256)) ||
						  ((x >= 371 && y >= 128) && (x < 393 && y < 149)) ||
						  ((x >= 393 && y >= 128) && (x < 414 && y < 256)) ||
						  ((x >= 478 && y >= 128) && (x < 499 && y < 192)) ||
						  ((x >= 499 && y >= 171) && (x < 521 && y < 256)) ||
						  ((x >= 521 && y >= 128) && (x < 542 && y < 192)) ||
						  ((x >= 116 && y >= 171) && (x < 138 && y < 192)) ||
						  ((x >= 371 && y >= 171) && (x < 393 && y < 192))) begin
					r_reg <= 8'hff;
					g_reg <= 8'hff;
					b_reg <= 8'hff;
					end
				else begin
					r_reg <= 8'h00;
					g_reg <= 8'h00;
					b_reg <= 8'h00;
				end
			
			end else if ( S == PLAY) begin
				if( lives <= 2'd2 && (x > 64 && y > 8) && (x < 80 && y < 24)) begin
					r_reg <= 8'h00;
					g_reg <= 8'h00;
					b_reg <= 8'hff;
					end
				else if( lives <= 2'd1 && (x > 96 && y > 8) && (x < 112 && y < 24)) begin
					r_reg <= 8'h00;
					g_reg <= 8'h00;
					b_reg <= 8'hff;
					end
				else if( lives <= 2'd0 && (x > 128 && y > 8) && (x < 144 && y < 24)) begin
					r_reg <= 8'h00;
					g_reg <= 8'h00;
					b_reg <= 8'hff;
					end
				else if((x >= 0 && y >= 0) && (x < 639 && y < 31)) begin
					r_reg <= 8'h00;
					g_reg <= 8'h00;
					b_reg <= 8'h00;
					end
				else if( (~alive1 && (x >= alien1_x && y >= alien1_y) && (x < (alien1_x+alien_width) && y < (alien1_y+alien_height))) ||
							(~alive2 && (x >= alien2_x && y >= alien2_y) && (x < (alien2_x+alien_width) && y < (alien2_y+alien_height))) ||
							(~alive3 && (x >= alien3_x && y >= alien3_y) && (x < (alien3_x+alien_width) && y < (alien3_y+alien_height))) ||
							(~alive4 && (x >= alien4_x && y >= alien4_y) && (x < (alien4_x+alien_width) && y < (alien4_y+alien_height))) ||
							(~alive5 && (x >= alien5_x && y >= alien5_y) && (x < (alien5_x+alien_width) && y < (alien5_y+alien_height))) ||
							(~alive6 && (x >= alien6_x && y >= alien6_y) && (x < (alien6_x+alien_width) && y < (alien6_y+alien_height))) ||
							(~alive7 && (x >= alien7_x && y >= alien7_y) && (x < (alien7_x+alien_width) && y < (alien7_y+alien_height))) ||
							(~alive8 && (x >= alien8_x && y >= alien8_y) && (x < (alien8_x+alien_width) && y < (alien8_y+alien_height))) ||
							(~alive9 && (x >= alien9_x && y >= alien9_y) && (x < (alien9_x+alien_width) && y < (alien9_y+alien_height))) ||
							(~alive10 && (x >= alien10_x && y >= alien10_y) && (x < (alien10_x+alien_width) && y < (alien10_y+alien_height))) ||
							(~alive11 && (x >= alien11_x && y >= alien11_y) && (x < (alien11_x+alien_width) && y < (alien11_y+alien_height))) ||
							(~alive12 && (x >= alien12_x && y >= alien12_y) && (x < (alien12_x+alien_width) && y < (alien12_y+alien_height))) ||
							(~alive13 && (x >= alien13_x && y >= alien13_y) && (x < (alien13_x+alien_width) && y < (alien13_y+alien_height))) ||
							(~alive14 && (x >= alien14_x && y >= alien14_y) && (x < (alien14_x+alien_width) && y < (alien14_y+alien_height))) ||
							(~alive15 && (x >= alien15_x && y >= alien15_y) && (x < (alien15_x+alien_width) && y < (alien15_y+alien_height)))) begin
					r_reg <= 8'h00;
					g_reg <= 8'hff;
					b_reg <= 8'h00;
					end
				else if ((x >= player_x && y >= player_y) && (x < (player_x+player_width) && y < (player_y+player_height))) begin
					r_reg <= 8'hff;
					g_reg <= 8'he1;
					b_reg <= 8'hb8;
				end
				else if( (~does_appear &&  (x >= x_1 && y >= y_1) && (x < (x_1+bullet_width) && y < (y_1+bullet_height))) ||
							(~does_appear1 && (x >= x1 && y >= y1) && (x < (x1+bullet_width) && y < (y1+bullet_height))) ||
							(~does_appear2 &&(x >= x2 && y >= y2) && (x < (x2+bullet_width) && y < (y2+bullet_height))) ||
							(~does_appear3 &&(x >= x3 && y >= y3) && (x < (x3+bullet_width) && y < (y3+bullet_height))) ||
							(~does_appear4 &&(x >= x4 && y >= y4) && (x < (x4+bullet_width) && y < (y4+bullet_height))) ||
							(~does_appear5 &&(x >= x5 && y >= y5) && (x < (x5+bullet_width) && y < (y5+bullet_height))) ||
							(~does_appear6 &&(x >= x6 && y >= y6) && (x < (x6+bullet_width) && y < (y6+bullet_height))) ||
							(~does_appear7 &&(x >= x7 && y >= y7) && (x < (x7+bullet_width) && y < (y7+bullet_height))) ||
							(~does_appear8 &&(x >= x8 && y >= y8) && (x < (x8+bullet_width) && y < (y8+bullet_height))) ||
							(~does_appear9 &&(x >= x9 && y >= y9) && (x < (x9+bullet_width) && y < (y9+bullet_height))) ||
							(~does_appear10 &&(x >= x10 && y >= y10) && (x < (x10+bullet_width) && y < (y10+bullet_height))) ||
							(~does_appear11 &&(x >= x11 && y >= y11) && (x < (x11+bullet_width) && y < (y11+bullet_height))) ||
							(~does_appear12 &&(x >= x12 && y >= y12) && (x < (x12+bullet_width) && y < (y12+bullet_height))) ||
							(~does_appear13 &&(x >= x13 && y >= y13) && (x < (x13+bullet_width) && y < (y13+bullet_height))) ||
							(~does_appear14 &&(x >= x14 && y >= y14) && (x < (x14+bullet_width) && y < (y14+bullet_height))) ||
							(~does_appear15 &&(x >= x15 && y >= y15) && (x < (x15+bullet_width) && y < (y15+bullet_height)))) begin
					r_reg <= 8'hff;
					g_reg <= 8'hff;
					b_reg <= 8'hff;
					end
//					else if(start == 1'b0)begin
//					r_reg <= 8'hff;
//					g_reg <= 8'h00;
//					b_reg <= 8'hff;
//					end
					else begin
					r_reg <= 8'h00;
					g_reg <= 8'h00;
					b_reg <= 8'h00;
					end
				end
			else if(S == WIN) begin
				if (((x >= 95 && y >= 128) && (x < 127 && y < 256)) || //1
				  ((x >= 127 && y >= 224) && (x < 143 && y < 256)) || //2
				  ((x >= 143 && y >= 192) && (x < 175 && y < 224)) || //3
				  ((x >= 175 && y >= 224) && (x < 191 && y < 256)) || //4
				  ((x >= 191 && y >= 128) && (x < 223 && y < 256)) || //5
				  ((x >= 255 && y >= 128) && (x < 383 && y < 160)) || //6
				  ((x >= 255 && y >= 224) && (x < 383 && y < 256)) || //7
				  ((x >= 303 && y >= 128) && (x < 335 && y < 256)) || //8
				  ((x >= 415 && y >= 128) && (x < 447 && y < 256)) || //9
				  ((x >= 447 && y >= 160) && (x < 479 && y < 192)) || //10
				  ((x >= 479 && y >= 192) && (x < 511 && y < 224)) || //11
				  ((x >= 511 && y >= 128) && (x < 543 && y < 256))) begin//12
					r_reg <= 8'hff;
					g_reg <= 8'hff;
					b_reg <= 8'hff;
				end
				else begin
					r_reg <= 8'h00;
					g_reg <= 8'hff;
					b_reg <= 8'h00;
			end
			end
			else if(S == LOSE) begin
				if (((x >= 95 && y >= 128) && (x < 116 && y < 256)) || //1
				  ((x >= 116 && y >= 235) && (x < 159 && y < 256)) || //2
				  ((x >= 223 && y >= 128) && (x < 247 && y < 256)) || //3
				  ((x >= 247 && y >= 128) && (x < 266 && y < 149)) || //4
				  ((x >= 247 && y >= 235) && (x < 266 && y < 256)) || //5
				  ((x >= 266 && y >= 128) && (x < 287 && y < 256)) || //6
				  ((x >= 350 && y >= 128) && (x < 414 && y < 149)) || //7
				  ((x >= 350 && y >= 149) && (x < 371 && y < 181)) || //8
				  ((x >= 350 && y >= 181) && (x < 414 && y < 203)) || //9
				  ((x >= 393 && y >= 203) && (x < 414 && y < 235)) || //10
				  ((x >= 350 && y >= 235) && (x < 414 && y < 256)) || //11
				  ((x >= 478 && y >= 128) && (x < 542 && y < 149)) || //12
				  ((x >= 478 && y >= 149) && (x < 499 && y < 181)) || //13
				  ((x >= 478 && y >= 181) && (x < 521 && y < 203)) || //14
				  ((x >= 478 && y >= 203) && (x < 499 && y < 235)) || //15
				  ((x >= 478 && y >= 235) && (x < 542 && y < 256))) begin //16
					r_reg <= 8'hff;
					g_reg <= 8'hff;
					b_reg <= 8'hff;
					end
				else begin
					r_reg <= 8'h00;
					g_reg <= 8'h00;
					b_reg <= 8'hff;
				end
			end
		end
	end

	
	assign r = r_reg;
	assign g = g_reg;
	assign b = b_reg;
	
	//FSM
				
	always @(posedge clk or negedge rst)
	begin
		if (rst == 1'b0)
		begin
			S <= START;
		end
		else
		begin
			S <= NS;
		end
	end

	always @(*)
	begin
		case (S)
			START: begin
				if (left_flip && right_flip)
					NS = PLAY;
				else
					NS = S;
			end
			PLAY: begin
				if ((alive1 && alive2 && alive3 && alive4 &&
				alive5 && alive6 && alive7 && alive8 &&
				alive9 && alive10 && alive11 && alive12 &&
				alive13 && alive14 && alive15) && lvl < 3'd1) begin
					NS = START;
				end else if (lvl == 3'd1 && lives < 2'd3 && (alive1 && alive2 && alive3 && alive4 &&
				alive5 && alive6 && alive7 && alive8 &&
				alive9 && alive10 && alive11 && alive12 &&
				alive13 && alive14 && alive15)) begin
					NS = WIN;
				end else if (lives == 2'd3 || pass_check == 1'b1) begin
					NS = LOSE;
				end else begin
					NS = S;
				end
			end
			WIN: NS = S;
			LOSE: NS = S;
			default: NS = START;
		endcase
	end
	
	always @(posedge clk or negedge rst)
	begin
		if (rst == 1'b0)
		begin
			lvl <= 3'b0;
		end
		else
			case (S)
				START: begin
					t_start <= 1'b0;
				end
				PLAY: begin
					t_start <= 1'b1;
					if (alive1 && alive2 && alive3 && alive4 &&
						alive5 && alive6 && alive7 && alive8 &&
						alive9 && alive10 && alive11 && alive12 &&
						alive13 && alive14 && alive15) begin
						lvl <= lvl + 1'b1;
					end
				end
				WIN: t_start <= 1'b0;
				LOSE: t_start <= 1'b0;
			endcase
	end
	
endmodule