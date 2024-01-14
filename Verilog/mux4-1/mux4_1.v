module mux4_1(input [1:0]in1,in2,in3,in4,input sel1,sel2,output[1:0] out);

wire [1:0] out1,out2;
mux2_1 dut1(in1,in2,sel1,out1);
mux2_1 dut2(in3,in4,sel1,out2);
mux2_1 dut3(out1,out2,sel2,out);


endmodule
