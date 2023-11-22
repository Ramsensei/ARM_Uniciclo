module ffT(input logic T, output logic q);

assign q = (q===1'bx) ? 0 : (q | T);

//always @(posedge T) begin
//	if(T)
//		q <= 1;
//	else
//		q <= 0;
//end

endmodule