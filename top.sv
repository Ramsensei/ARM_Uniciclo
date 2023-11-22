module top(input logic clk, reset,
				output logic [31:0] WriteData, DataAdr,
				output logic MemWrite,
				output logic vgaclk, // 25.175 MHz VGA clock
				output logic hsync, vsync,
				output logic sync_b, blank_b,
				output logic [7:0] r, g, b);
//				output logic [31:0] ReadData);
//);
				
logic [31:0] PC, Instr, ReadData, VGAAddr, ARMAddr;
// WriteData, DataAdr;
//logic MemWrite;
logic cs, AddrSel;
// instantiate processor and memories
arm arm(clk, reset, PC, Instr, MemWrite, ARMAddr,
			WriteData, ReadData, cs);
ffT flipCs(cs, AddrSel);
imem imem(clk,PC, Instr);
dmem dmem(clk, MemWrite, DataAdr, WriteData, ReadData);
mux2 #(32) addr_mux(ARMAddr, VGAAddr, AddrSel, DataAdr);
vga vga(clk,ReadData,VGAAddr,vgaclk,hsync,vsync,sync_b,blank_b,r,g,b);

endmodule