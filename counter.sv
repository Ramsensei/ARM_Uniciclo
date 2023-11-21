module counter #(parameter N = 8) (input clk, rst, en, output logic [N-1:0] Q);


always_ff @ (negedge clk or posedge rst) begin
	if (rst) Q = 8'h00;
	else
		if (en) QQ + 1'b1;
		
end
endmodule