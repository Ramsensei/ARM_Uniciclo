module pll(input logic inclk0, output logic c0);

	always @(posedge inclk0) begin
	c0 <= (c0 === 1'bx) ? 1 : ~c0;
	end
//	assign c0 = (c0 === 1'bx) ? 1 : c0;


endmodule