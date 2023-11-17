module alu(input logic [31:0] SrcA, SrcB,
			  input logic [1:0] ALUControl,
			  output logic [31:0] ALUResult, 
			  output logic [3:0] ALUFlags);
			  
			  logic [31:0] mux_output;
			  logic [31:0] sum_output;
			  logic [31:0] mux4_output;
			  logic [31:0] A_or_B;
			  logic [31:0] A_and_B;
			  logic cout;
			  
			  mux2 #(32) mux2(SrcB,~SrcB,ALUControl[0],mux_output);
			  alu_adder sum(SrcA,mux_output,ALUControl[0],sum_output,cout);
			  assign A_or_B = SrcA | SrcB;
			  assign A_and_B = SrcA & SrcB;
			  mux4 #(32) mux4(sum_output,A_and_B,A_or_B,ALUControl,mux4_output);
			  
			  assign ALUFlags[0] =  ~ALUControl[1] && (sum_output[31]||SrcA[31]) && ~(ALUControl[0]||SrcA[31]||SrcB[31]);
			  assign ALUFlags[1] = 	~ALUControl[1] && cout;
			  assign ALUFlags[2] =  &(~mux4_output);
			  assign ALUFlags[3] = mux4_output[31];
			  
			  assign ALUResult = mux4_output;
			  
			  initial begin
			   #10;
			   $display("sum = %h" ,sum_output);
				$display("cou = %h" ,cout);
				$display("mux2 = %h" ,mux_output);
				$display("mux4 = %h" ,mux4_output);
				$display("ALU = %h" ,ALUResult);
				end
				
			  endmodule