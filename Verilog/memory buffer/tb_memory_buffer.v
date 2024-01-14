module tb_memory_buffer ();
   reg clk,rst,w,r;
    reg  [15:0] data_in;
    wire[15:0] data_out;

memory_buffer u1(clk,rst,w,r,data_in,data_out);
initial begin 
clk=1'b0;
forever #10 clk=~clk;
end
initial begin 
$monitor("clk=%b ,rst=%b ,w=%b , r=%b,data_in = %b,data_out = %b",clk,rst,w,r,data_in,data_out);
rst=1; 
data_in=16'b0000000000000000;
#20; rst=0;
w=1; r=0;
#20; r=1;w=0;
#20; w=1;r=0;
data_in=16'b1100000000000101;
#20 w=0; r=1;
$stop;
end
endmodule 

