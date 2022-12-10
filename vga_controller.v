// VGA controller for DE2-115 FPGA Development board

// adapted from FPGA Discovery (Learning How to Work with FPGAs) on youtube
// and mika burmester's DE2-115 vga template

module vga_controller(
	
	input clk_50MHz, // from the DE2-115
	input rst, // system reset
	output video_on, // ON while pixel count for x and y is within display area
	output hsync, // horizontal sync
	output vsync, // vertical sync
	output p_tick, // the 25MHz pixel/second rate signal, pixel tick
	output blank,
	output sync,
	output [9:0] x, // pixel count/ position of pixel x, max 0-799
	output [9:0] y // pixel count/ position of pixel y, max 0-524
	);

	// Based on VGA standards found at vesa.org for 640x480 resolution
	// Total horizontal width of screen = 800 partitioned into sections
	parameter HD = 640;					// horizontal dispay area width in pixels
	parameter HF = 48;					// horizontal front porch width in pixels
	parameter HB = 16;					// horizontal back porch width in pixels
	parameter HR = 96;					// horizontal retrace width in pixels
	parameter HMAX = HD+HF+HB+HR-1;	// max value of horizontal counter = 799
	// Total vertical width of screen = 800 partitioned into sections
	parameter VD = 480;					// vertical dispay area width in pixels
	parameter VF = 10;					// vertical front porch width in pixels
	parameter VB = 33;					// vertical back porch width in pixels
	parameter VR = 2;					// vertical retrace width in pixels
	parameter VMAX = VD+VF+VB+VR-1;	// max value of vertical counter = 524
	
	// Generate 25MHz from 50MHz
	reg r_25MHz;
	wire w_25MHz;
	
	always @(posedge clk_50MHz or negedge rst)
		if(~rst)
			r_25MHz <= 1'b0;
		else
			r_25MHz <= r_25MHz + 1'b1;
			
	assign w_25MHz = (r_25MHz == 0) ? 1 : 0; // assert tick 1/2 of the time
	
	// Counter Registers, two each for buffering to avoid glitches
	reg [9:0] h_count_reg, h_count_next;
	reg [9:0] v_count_reg, v_count_next;
	
	// Output Buffers
	reg v_sync_reg, h_sync_reg;
	wire v_sync_next, h_sync_next;
	
	
	// Register Control
	always @(posedge clk_50MHz or negedge rst)
		if (~rst) begin
			v_count_reg <= 10'd0;
			h_count_reg <= 10'd0;
			v_sync_reg <= 1'b0;
			h_sync_reg <= 1'b0;
		end
		else begin
			v_count_reg <= v_count_next;
			h_count_reg <= h_count_next;
			v_sync_reg <= v_sync_next;
			h_sync_reg <= h_sync_next;
		end
	
	// Logic for horizontal counter
	always @(posedge w_25MHz or negedge rst)
		if (~rst)
			h_count_next <= 0;
		else
			if(h_count_reg == HMAX)
				h_count_next <= 0;
			else
				h_count_next <= h_count_reg + 1;
				
	// Logic for vertical scan
	always @(posedge w_25MHz or negedge rst)
		if(~rst)
			v_count_next <= 0;
		else
			if(h_count_reg == HMAX)
				if (v_count_reg == VMAX)
					v_count_next <= 0;
				else
					v_count_next <= v_count_next + 1;
		
	// h_sync_next asserted within the horizontal retrace area
	assign h_sync_next = (h_count_reg >= (HD+HB) && h_count_reg <= (HD+HB+HR-1));
				
	// v_sync_next asserted within the vertical retrace area
	assign v_sync_next = (v_count_reg >= (VD+VB) && v_count_reg <= (VD+VB+VR-1));
	
	// Video ON/OFF - only ON when pixel counts are within the display area
	assign video_on = (h_count_reg < HD) && (v_count_reg < VD); // 0-639 and 0-479 respectively
			
	
	// Outputs
	assign hsync = h_sync_reg;
	assign vsync = v_sync_reg;
	assign x = h_count_reg;
	assign y = v_count_reg;
	assign p_tick = w_25MHz;
	assign blank = ~video_on;
	assign sync = 1'b0;
	
endmodule