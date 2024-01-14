module tb_updown_counter4();
reg mode,clk,reset;
wire [3:0]q;
updown_counter4 m1(mode,clk,reset,q);
initial begin
 $monitor("mode=%b,clk=%b,reset=%b,q=%b",mode,clk,reset,q);
clk=0;
 forever #5 clk=~clk;
end
initial begin 
 mode=0;reset=1;
#100; reset=0;
#100;  mode=1;
#100; reset=0;



end
endmodule

