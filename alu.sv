`timescale 1ns/1ps
module alu_4_pro(
    input logic [7:0] a,
    input logic [7:0] b;
    input logic [1:0] opcode,
    output logic [7:0] result
);
    always_comb begin 
        case (opcode)
        2'b00 : result = a + b;
        2'b01 : result = a *b ;
        2'b10 : result = a - b;
        2'b11 : result = b;
        endcase
    end
endmodule
