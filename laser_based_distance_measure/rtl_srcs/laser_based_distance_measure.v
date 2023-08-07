module laser_based_distance_measure (B, L, D, S, clk);

	input B, S, clk;
	output [15:0] D;
	output L;
	wire Dreg_clr, Dreg_ld, Dctr_clr, Dctr_cnt;
	lbdm_datapath dut1 (Dreg_clr, Dreg_ld, Dctr_clr, Dctr_cnt, clk, D);
	lbdm_controller dut2 (L, S, B, clk, Dreg_clr, Dreg_ld, Dctr_clr, Dctr_cnt);
	
endmodule