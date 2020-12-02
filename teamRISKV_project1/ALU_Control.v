`define AND  3'b000
`define XOR  3'b001
`define SLL  3'b010
`define ADD  3'b011
`define SUB  3'b100
`define MUL  3'b101
`define ADDI 3'b110
`define SRAI 3'b111

`define func_AND  {7'b0000000, 3'b111}
`define func_XOR  {7'b0000000, 3'b100}
`define func_SLL  {7'b0000000, 3'b001}
`define func_ADD  {7'b0000000, 3'b000}
`define func_SUB  {7'b0100000, 3'b000}
`define func_MUL  {7'b0000001, 3'b000}
`define func_SRAI {7'b0100000, 3'b101}

module ALU_Control
(
    funct,
    ALUOp_i,
    ALUCtrl_o
);

// Ports
input  [9:0] funct;
input  [1:0] ALUOp_i;
output [2:0] ALUCtrl_o;

// If ALUop == 00, use add
//    ALUop == 01, use sub
assign ALUCtrl_o = (ALUOp_i == 2'b00 & funct[2:0] == 3'b000) ? `ADDI : 
                   (ALUOp_i == 2'b01) ? `SUB  :          
                   (funct == `func_AND)  ? `AND  : 
                   (funct == `func_XOR)  ? `XOR  : 
                   (funct == `func_SLL)  ? `SLL  : 
                   (funct == `func_ADD)  ? `ADD  : 
                   (funct == `func_SUB)  ? `SUB  :
                   (funct == `func_MUL)  ? `MUL  : 
                   (funct == `func_SRAI) ? `SRAI : 3'bx; 

endmodule
