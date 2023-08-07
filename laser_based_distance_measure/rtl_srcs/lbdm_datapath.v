module lbdm_datapath (Dreg_clr, Dreg_ld, Dctr_clr, Dctr_cnt, clk, Dout);

	input Dreg_clr, Dreg_ld, Dctr_clr, Dctr_cnt, clk;
	output [15:0] Dout;
	reg [15:0] Q_count; 
	wire [15:0] shifted_Q;
	reg [15:0] Dreg;
	always@(clk, Dctr_cnt)begin
			if (Dctr_clr) begin
				Q_count <= 16'd0;
			end else begin
				Q_count <= Q_count + 16'd1;
			end
		end
	always@(clk, Dreg_ld) begin
		if (Dreg_clr) begin
			Dreg <= 16'd0;
		end else begin
			Dreg <= shifted_Q;
		end
	end
	
	bit1_shift dut0 (Q_count, shifted_Q);
	
endmodule
		
		