module tb_mux4_1();
reg [1:0]in1,in2,in3,in4;
reg sel1,sel2;
wire [1:0]out;
mux4_1 m1(in1,in2,in3,in4,sel1,sel2,out);
initial begin
 $monitor("in1=%b,in2=%b,in3=%b,in4=%b ,sel1=%b,sel2=%b , out=%b",in1,in2,in3,in4,sel1,sel2,out);
 
 in1=2'b00;
 in2=2'b01;
 in3=2'b10;
 in4=2'b11;
 sel1=1'b0;
 sel2=1'b0;
#10;
 in1=2'b00;
 in2=2'b01;
 in3=2'b10;
 in4=2'b11;
 sel1=1'b1;
 sel2=1'b0;

#10;
 in1=2'b00;
 in2=2'b01;
 in3=2'b10;
 in4=2'b11;
 sel1=1'b0;
 sel2=1'b1;

#10;
 in1=2'b00;
 in2=2'b01;
 in3=2'b10;
 in4=2'b11;
 sel1=1'b1;
 sel2=1'b1;




end
endmodule
