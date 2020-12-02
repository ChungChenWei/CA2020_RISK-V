`define AND   4'b0000
`define XOR   4'b0001
`define SLL   4'b0010
`define ADD   4'b0011
`define SUB   4'b0100
`define MUL   4'b0101
`define ADDI  4'b0011
`define SRAI  4'b0111

module ALU
(
    data1_i,
    data2_i,
    ALUCtrl_i,
    data_o
);

// Ports
input  [3:0]  ALUCtrl_i;
input signed [31:0] data1_i, data2_i;
output [31:0] data_o;

// Wires & Registers
reg signed [31:0] data_reg;

assign data_o = data_reg;

always @(data1_i or data2_i or ALUCtrl_i) begin
    case (ALUCtrl_i)
        `AND:    data_reg = data1_i  & data2_i;
        `XOR:    data_reg = data1_i  ^ data2_i;
        `SLL:    data_reg = data1_i << data2_i;
        `ADD:    data_reg = data1_i  + data2_i;
        `SUB:    data_reg = data1_i  - data2_i;
        `MUL:    data_reg = data1_i  * data2_i;
        `ADDI:   data_reg = data1_i  + data2_i;
        // `SRAI:   data_reg = $signed(data1_i) >>> data2_i[4:0];
        `SRAI:   data_reg = data1_i >>> data2_i[4:0];
        default: data_reg = data1_i;
    endcase
end

endmodule
