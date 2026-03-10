`timescale 1ns/1ps
module instrution_register (
    input logic clk,
    input logic rst,
    input logic ir_full,
    input logic [7:0] bus_data,
    output logic [1:0] opcode,
    output logic [1:0] dest_reg,
    output logic [1:0] src_reg,
    output logic [1:0] immediate

);
    logic [7:0] ir_reg ;
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            ir_reg <= 8'h00;
        end else if (ir_full) begin
            ir_reg <= bus_data;
        end
    end
    assign opcode = ir_reg[7:6];
    assign dest_reg = ir_reg[5:4];
    assign src_reg = ir_reg[3:2];
    assign immediate = ir_reg[1:0];
endmodule

