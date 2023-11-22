module imem(input logic clk,
				input logic [31:0] a,
				output logic [31:0] rd);
				
logic [31:0] RAM[63:0];

initial
	//rom rom_instance_0(a[15:0],clk,rd[7:0]);
	//rom rom_instance_1(a[15:0]+1,clk,rd[15:8]);
	//rom rom_instance_2(a[15:0]+2,clk,rd[23:16]);
	//rom rom_instance_3(a[15:0]+3,clk,rd[31:24]);
	$readmemh("memfile.dat",RAM);
	
	assign rd = RAM[a[31:2]]; // word aligned
endmodule