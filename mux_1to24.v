module mux_1to24 (clk, en, addr, din, line0, line1, line2, line3,
					line4, line5, line6, line7, line8, line9, line10,
					line11, line12, line13, line14, line15, line16,
					line17, line18, line19, line20, line21, line22,
					line23);
input clk,en;
input signed [31:0] din;	//待分配参数变换后输入端口
input [6:0] addr;		// 7位地址总线
//32位输出端口
output signed [31:0] line0, line1, line2, line3, line4, line5, line6,
		line7, line8, line9, line10, line11, line12,
		line13, line14, line15, line16, line17, line18,
		line19, line20, line21, line22, line23;
reg 	signed [31:0] line0, line1, line2, line3, line4, line5, line6,
		line7, line8, line9, line10, line11, line12,
		line13, line14, line15, line16, line17, line18,
		line19, line20, line21, line22, line23, midmem;
reg [6:0] addr_buf0;		// 7位地址缓冲器
always @ (posedge clk)
if (!en) 
	begin addr_buf0<=addr; 
	end
else 
	begin addr_buf0<=addr_buf0; 
	end
always @ (posedge clk)	//一个24选1的32位多路选择器
if (!en)
	begin
	case (addr_buf0)
		6'd1	:	line0=din;
		6'd2	:	line1=din;
		6'd3	:	line2=din;
		6'd4	:	line3=din;
		6'd5	:	line4=din;
		6'd6	:	line5=din;
		6'd7	:	line6=din;
		6'd8	:	line7=din;
		6'd9	:	line8=din;
		6'd10	:	line9=din;
		6'd11	:	line10=din;
		6'd12	:	line11=din;
		6'd13	:	line12=din;
		6'd14	:	line13=din;
		6'd15	:	line14=din;
		6'd16	:	line15=din;
		6'd17	:	line16=din;
		6'd18	:	line17=din;
		6'd19	:	line18=din;	
		6'd20	:	line19=din;
		6'd21	:	line20=din;
		6'd22	:	line21=din;
		6'd23	:	line22=din;
		6'd24	:	line23=din;
		default :	midmem=din;
		endcase
	end
endmodule
