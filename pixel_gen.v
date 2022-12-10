module pixel_gen(

	input clk,
	input rst,
//	input left,
//	input right,
//	input shoot,
	input [9:0] x,
	input [9:0] y,
	output reg [7:0] red,
	output reg [7:0] green,
	output reg [7:0] blue
	);
	
	// maximum x, y values in display area
	parameter X_MAX = 639;
	parameter Y_MAX = 479;
	
	// create 60Hz refresh tick
//	wire refresh_tick;
//	assign refresh_tick = ((y == 481) && (x == 0)) ? 1 : 0; // start of vsync(vertical retrace)
	
	
	// color parameters
	parameter BLACK = 24'h000000;
	parameter WHITE = 24'hffffff;
//
//	wire white_on;
//	
//	assign white_on = ((x>=0) && (x<640) && (y>= 0) && (y<480));
//	
//	always @ (*)
//		if(~video_on)
//			begin
//				red = BLACK[23:16];
//				green = BLACK[15:8];
//				blue = BLACK[7:0];
//			end
//		else
//			begin
//			red = WHITE[23:16];
//			green = WHITE[15:8];
//			blue = WHITE[7:0];
//			end
	always @ (*)
	if(x < X_MAX && y < Y_MAX)
			begin
			red = WHITE[23:16];
			green = WHITE[15:8];
			blue = WHITE[7:0];
			end
		else
			begin
			red = BLACK[23:16];
			green = BLACK[15:8];
			blue = BLACK[7:0];
			end

endmodule