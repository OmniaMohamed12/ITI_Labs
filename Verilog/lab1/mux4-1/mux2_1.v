module mux2_1 (input [1:0] in1,in2,input sel,output[1:0] out);

assign out= (sel==0)? in1:
            (sel==1)? in2:1'bx;

endmodule
