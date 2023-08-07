module lbdm_controller (Lc, Sc, Bc, clk, Dreg_clr, Dreg_ld, Dctr_clr, Dctr_cnt);

	input Bc,Sc, clk;
	output reg Lc, Dreg_clr, Dreg_ld, Dctr_clr, Dctr_cnt;
	// Quartus Prime Verilog Template
// 4-State Mealy state machine

// A Mealy machine has outputs that depend on both the state and 
// the inputs.  When the inputs change, the outputs are updated
// immediately, without waiting for a clock edge.  The outputs
// can be written more than once per state or per clock cycle.


	// Declare state register
	reg		[4:0] state;

	// Declare states
	parameter S0 = 5'b00001;
	parameter S1 = 5'b00010;
	parameter S2 = 5'b00100;
	parameter S3 = 5'b01000;
	parameter S4 = 5'b10000;

	// Determine the next state synchronously, based on the
	// current state and the input
	always @ (posedge clk) begin
			case (state)
				S0:
					begin
						state <= S1;
						Lc <= 1'b0;
						Dreg_clr <= 1'b1;
						Dreg_ld <= 1'b0;
						Dctr_clr <= 1'b0;
						Dctr_cnt <= 1'b0;
					end
				S1:
					begin
					Lc <= 1'b0;
						Dreg_clr <= 1'b0;
						Dreg_ld <= 1'b0;
						Dctr_clr <= 1'b1;
						Dctr_cnt <= 1'b0;
					if (Bc)
					begin
						state <= S2;
					end
					else if (~Bc)
					begin
						state <= S1;
					end
					end
				S2:
					begin
						state <= S3;
						Lc <= 1'b1;
						Dreg_clr <= 1'b0;
						Dreg_ld <= 1'b0;
						Dctr_clr <= 1'b0;
						Dctr_cnt <= 1'b0;
					end
				S3:
					begin
					Lc <= 1'b0;
						Dreg_clr <= 1'b0;
						Dreg_ld <= 1'b0;
						Dctr_clr <= 1'b0;
						Dctr_cnt <= 1'b1;
					if (Sc)
					begin
						state <= S4;
					end
					else if (~Sc)
					begin
						state <= S3;
					end
					end
				S4: 
					begin
						state <= S1;
						Lc <= 1'b0;
						Dreg_clr <= 1'b0;
						Dreg_ld <= 1'b1;
						Dctr_clr <= 1'b0;
						Dctr_cnt <= 1'b0;
						
					end
			endcase
	end
endmodule
