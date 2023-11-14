module alu_testbench;

    logic [31:0] SrcA;
    logic [31:0] SrcB;
    logic [1:0] ALUControl;
    logic [31:0] ALUResult;
    logic [3:0] ALUFlags;

    alu_1 alu_inst (
        .SrcA(SrcA),
        .SrcB(SrcB),
        .ALUControl(ALUControl),
        .ALUResult(ALUResult),
        .ALUFlags(ALUFlags)
    );

    initial begin
        // Test case 1
        SrcA = 32'h2;
        SrcB = 32'h1;
        ALUControl = 2'b01; // You can set the ALU control value as needed

        // Wait a little bit
        #20;
		  SrcA = 32'h5;
        SrcB = 32'h3;
		  
		  #20;
		  SrcA = 32'h3;
        SrcB = 32'h5;
		  
		  //ALUControl = 2'b10;
		  //#20;
		  
		  ALUControl = 2'b11;
		  #20;
		  
    end

endmodule

// Add a clock and reset generator if your design requires it
// For simplicity, this example doesn't include them

