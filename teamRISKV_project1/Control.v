`define ALUSrc_imm 7'b0010011
`define ALUop_addi 7'b0010011

module Control
(
    Op_i,
    ALUOp_o,
    ALUSrc_o,
    RegWrite_o
);

// Ports
input   [6:0] Op_i;
output  [1:0] ALUOp_o;
output        ALUSrc_o, RegWrite_o;

assign ALUOp_o  = (Op_i == `ALUop_addi) ? 2'b00 : 2'b10;
assign ALUSrc_o = (Op_i == `ALUSrc_imm) ? 1'b1  : 1'b0;
assign RegWrite_o = 1'b1;

endmodule
