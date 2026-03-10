`timescale 1ns/1ps
module reg_file(
    input logic clk,
    input logic rst,
    input logic write_enable,
    input logic [1:0] wr_addr,
    input logic [1:0] rd_addr,
    input logic [7:0] data_in,
    output logic [7:0] data_out
);
    logic [7:0] registers [3:0];

    assign data_out = registers[rd_addr];

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin 
            registers[0] <= 8'b0;
            registers[1] <= 8'b0;
            registers[2] <= 8'b0;
            registers[3] <= 8'b0;
        end else if (write_enable) begin 
            registers[wr_addr] = data_in;
        end
    end
    endmodule
