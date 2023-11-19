module counter #(parameter N = 8) (input clk, rst, en, output logic [N-1:0] Q);


always_ff @ (negedge clk_or posedge rst):
	if (rst) Q = 8h00;
	else
		if (en) QQ + 1'b1;
endmodule