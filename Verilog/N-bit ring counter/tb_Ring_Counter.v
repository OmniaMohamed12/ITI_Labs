module tb_Ring_Counter;
parameter N=4;
reg clk,rst;
wire [N-1:0] q;

Ring_Counter #(N) u1(clk,rst,q);
initial begin 
clk=0;
forever #5 clk=~clk;
end
initial begin 
$monitor("clk=%b ,rst=%b , q = %b",clk,rst,q);
rst=0;
#20 rst=1;
#100;

end
endmodule
