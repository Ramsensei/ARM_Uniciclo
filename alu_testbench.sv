module alu_testbench;

    logic [31:0] SrcA;
    logic [31:0] SrcB;
    logic [1:0] ALUControl;
    logic [31:0] ALUResult;
    logic [3:0] ALUFlags;

    alu alu_inst (
        .SrcA(SrcA),
        .SrcB(SrcB),
        .ALUControl(ALUControl),
        .ALUResult(ALUResult),
        .ALUFlags(ALUFlags)
    );

    initial begin
        // Test case 1
        SrcA = 32'h7;
        SrcB = 32'h5;
        ALUControl = 2'b00; // You can set the ALU control value as needed

        // Wait a little bit
        #20;
		  ALUControl = 2'b01;
		  
		  #20;
		  ALUControl = 2'b10;
		  
		  //ALUControl = 2'b10;
		  //#20;
		  #20;
		  ALUControl = 2'b11;
		  #20;
		  
    end

endmodule

// Add a clock and reset generator if your design requires it
// For simplicity, this example doesn't include them

