module tb_rom;
parameter size=8;
parameter  filename="rom.txt";
reg [2:0]address;
reg clk,rst;
wire[size-1:0] data;
rom u1(clk,rst,address,data);
initial begin 
clk=0;
forever #10 clk=~clk;
end
initial begin 
$monitor("clk=%b ,rst=%baddress = %d,data = %x",clk,rst,address,data);
rst=1;
address='d0;
#10 address='d3;
rst=0;
#10 address='d2;
#20 address='d5;
#20 address='d7;
$stop;
end
endmodule

