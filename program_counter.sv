`timescale  1ns/1ps
module program_counter (
    input logic clk,
    input  logic rst,
    input logic pc_inc,
    output logic [7:0] pc_out
);
    always_ff @(posedge clk or posedge rst) begin 
        if (rst) begin 
            pc_out <= 8'h00;
        end else if (pc_inc) begin
            pc_inc <= pc_inc + 1'b1;
        end
    end
endmodule
