`timescale 1 ps / 1 ps

module testbench();
	logic clk;
	logic reset;
	logic vgaclk; // 25.175 MHz VGA clock
	logic hsync, vsync;
	logic sync_b, blank_b;
	logic [7:0] r, g, b;
//	logic [31:0] WriteData, DataAdr;
//	logic MemWrite;
	// instantiate device to be tested
//	top dut(clk, reset, WriteData, DataAdr, MemWrite);
top dut(clk, reset, vgaclk, hsync, vsync, sync_b, blank_b, r, g, b);
	// initialize test
	initial
	begin
		reset <= 1; # 22; reset <= 0;
	end
	// generate clock to sequence tests
	always
		begin
		clk <= 1; # 5; clk <= 0; # 5;
		// check that 7 gets written to address 0x64
	end
	// at end of program
//	always @(negedge clk)
//		begin
//		if(MemWrite) begin
//			if(DataAdr === 100 & WriteData === 7) begin
//				$display("Simulation succeeded");
//				$stop;
//			end else if (DataAdr !== 96) begin
//				$display("Simulation failed");
//				$stop;
//			end
//		end
//	end
endmodule