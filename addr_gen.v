module addr_gen(clk,en,addr);
input clk,en;
output [6:0] addr;
reg	[6:0]	addr;

always @ (posedge clk)
begin
	if (!en)
		begin
			if	(addr==42)//加法计数器，计数范围为0~42
				addr=0;
			else
				addr<=addr+1;
			end
	else
	addr<=0;
	end
endmodule
