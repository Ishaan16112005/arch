`timescale 1ps/1ps
module control_unit(
    input logic [1:0] opcode
    input logic clk,
    input logic rst,
    output logic ir_full,
    output logic reg_write,
    output logic pc_inc,
    output logic [1:0] bus_sel // 0: memory, 1: reg, 2: ALU, 4: ir_immediate
    
);
    typedef enum logic [1:0] {fetch, decode, execute} trans_state;
    trans_state current_state, next_state;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            current_state <= fetch;
        end else begin 
            current_state <= next_state;
        end
    end

    always_comb begin
        ir_full =0; reg_write = 0; pc_inc = 0; bus_sel = 0;
        next_state = fetch;

        case (current_state) 
            fetch : begin
                ir_full = 1;
                bus_sel = 2'b00;
                next_state = decode
            end

            decode : begin
                bus_sel = ( opcode == 2'b11) ? 2'b11 : 2'b01;
                next_state = execute;
            end 

            execute : begin
                reg_write = 1;
                bus_sel = 2'b10;
                pc_inc = 1;
                next_state = fetch;
            end
        endcase
    end
endmodule

