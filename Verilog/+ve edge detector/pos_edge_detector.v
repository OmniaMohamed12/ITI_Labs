module pos_edge_detector(input clk,sig,output pe);
reg delayed_sig;
always@(posedge clk) begin
delayed_sig<=sig;
end

assign pe=sig & ~delayed_sig;
endmodule
