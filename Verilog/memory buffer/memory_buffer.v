module memory_buffer (
    input  clk,rst,w,r,
    input  [15:0] data_in,
    output reg[15:0] data_out);
    reg [15:0] memory [0:15];
    reg [3:0] write_ptr,read_ptr = 4'b0000;
    always @(posedge clk) begin
        if (rst) begin
            write_ptr <= 4'b0000;
            read_ptr <= 4'b0000;
        end else begin
            if (w) begin
                memory[write_ptr] <= data_in;
                write_ptr <= write_ptr + 1;
            end
            if (r) begin
                data_out <= memory[read_ptr];
                read_ptr <= read_ptr + 1;
            end
        end
    end
endmodule

