module videoGen(input logic [9:0] x, y, 
					input logic[31:0] ReadData,
					output logic[7:0] r, g, b,
					output logic[31:0] DataAdr);
//logic pixel, inrect;
// Given y position, choose a character to display
// then look up the pixel value from the character ROM
// and display it in red or blue.Also draw a green rectangle.
//chargenrom chargenromb(y[8:3] + 8'd65, x[2:0], y[2:0], pixel);



//rectgen rectgen(x, y, 10'd120, 10'd150, 10'd200, 10'd230, inrect);
//assign {r, b} = (y[3]==0) ? {{8{pixel}},8'h00} : {8'h00,{8{pixel}}};
//assign g = inrect ? 8'hFF : 8'h00;

always_comb
if(200<x && x<250 && 200<y && y<250) begin
	 DataAdr= (x-200) + (y-200)*50;
	 r=ReadData[7:0];
	 g=ReadData[7:0];
	 b=ReadData[7:0];
end else begin
	 DataAdr=0;
	 r=0;
	 g=0;
	 b=255;
end
	
		




endmodule