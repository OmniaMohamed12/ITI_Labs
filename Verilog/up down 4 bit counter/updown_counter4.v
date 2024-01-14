module updown_counter4(input mode,clk,reset,output reg [3:0] q);

always@(posedge clk) begin
 if(reset==1) q<=0;
 else begin
  if(mode==0) begin //down counter
   if(q !=0) q<=q-1;
   else q<=4'b1111;
  end
  else begin
  if (q!=4'b1111) q<=q+1;
  else q<=0;
 end
 end
end
endmodule
