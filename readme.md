# Computer Architecture 2020

## Project 1 Building Pipelined CPU

team: RISK-V

### Module Explanation

##### Adder.v

* `input` : `data0_in`、`data1_in`

* `output` : `data_o`

把 `data0_in` 和 `data1_in` 加起來之後，`assign` 到 `data_o` 上面。

##### MUX32.v

* `input` : `data0_i`、`data1_i`、`data2_i`、`data3_i`、`select_i`
* `output` : `data_o`

根據 `select_i` `assign` `data_o` 為 `data0_i`、`data1_i`、`data2_i` 或 `data3_i`。

##### Imm_Gen.v

* `input` : `data_i`
* `output` : `data_o`

##### ALU.v

* `input` : `data0_i`、`data1_i`、`ALUCtrl_i`
* `output` : `data_o`

在一個 `always` procedural block 裡面，當 `data0_i`、`data1_i` 或 `ALUCtrl_i` 有改變時，把 `data0_i` 和 `data1_i` 根據 `ALUCtrl_i` 的內容來決定進行何種運算，然後指定給 `data_reg`，在把 `data_reg` `assign` 給 `data_o` 。

##### Control.v

* `input` : `Op_i`、`NoOP`
* `output` :`RegWrite_o`、`MemtoReg_o`、`MemRead_o`、`RegWrite_o`、 `ALUOp_o`、`ALUSrc_o`、`Branch_o`

##### ALU_Control.v

* `input` : `funct`、`ALUOp_i`
* `output` : `ALUOp_i`

##### CPU.v

##### AND.v

##### Forwarding Unit

##### Hazard Detection Unit

##### Pipeline latch IF/ID

##### Pipeline latch ID/EX

##### Pipeline latch EX/MEM

##### Pipeline latch MEM/WB



### Mebers and Teamwork

- B07209016 鐘晨瑋
- B07201022 杜宗顁
- B07902063 陳耕宇



### Difficulties Encountered and Solutions



### Development Environment



teamRISK-V_project1_report

Computer Architecture 2020 Project1 team RISK-V

