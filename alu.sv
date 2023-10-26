module alu(
  input logic [31:0] SrcA, SrcB,
  input logic [1:0] ALUControl,
  output logic [31:0] ALUResult, 
  output logic [3:0] ALUFlags
);
  logic [32:0] A, B, Res;
  always @(ALUControl) begin
    A <= {SrcA[31], SrcA};
    B <= {SrcB[31], SrcB};
    case (ALUControl)
      00: Res <= A + B;
      01: Res <= A - B;
      10: Res <= A && B;
      11: Res <= A || B;
    endcase
    ALUResult <= Res[31:0];
    ALUFlags[3] <= Res[31];
    ALUFlags[2] <= Res == 0;
    ALUFlags[1] <= ~ALUControl[1] && Res[32];
    ALUFlags[0] <= ~ALUControl[1] && (Res[31] ^ A[31]) && ~(ALUControl[1]^A[31]^B[31]);
  end
endmodule
