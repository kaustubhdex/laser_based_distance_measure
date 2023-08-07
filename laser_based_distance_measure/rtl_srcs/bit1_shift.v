module bit1_shift (Ain, Aout);

	parameter n=16;
	input [n-1:0] Ain;
	output [n-1:0] Aout;
	
	assign Aout = {1'b0,Ain[n-1:1]};

endmodule