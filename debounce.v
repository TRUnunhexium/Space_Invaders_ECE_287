module debounce(

	input clk_50MHz,
	input btn_in,
	output btn_out
	);
	
	reg r1, r2, r3;
	
	always @(posedge clk_50MHz) begin
		r1 <= btn_in;
		r2 <= r1;
		r3 <= r2;
	end
	
	assign btn_out = r3;

endmodule