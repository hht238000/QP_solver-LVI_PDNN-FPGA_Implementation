module mux_1to16 (clk, en, addr, din, line24, line25, line26, line27,
		line28, line29, line30, line31, line32, line33,
		line34, line35, line36, line37, line38, line39);
input clk, en;
input signed [31:0] din;	//待分配参数输入端口
input [6:0] addr;		//分配地址输入端口

//参数变换后输出端口
output signed [31:0] line24, line25, line26, line27, line28, line29,
		line30, line31, line32, line33, line34, line35,
		line36, line37, line38, line39;
reg signed [31:0] line24, line25, line26, line27, line28, line29,
		line30, line31, line32, line33, line34, line35,
		line36, line37, line38, line39, midmem;
reg [6:0] addr_buf0;
always @ (posedge clk)
if (!en) begin addr_buf0<=addr; end
else begin addr_buf0<=addr_buf0; end
always @ (posedge clk)	//一个16选1的32位多路选择器
if (!en)
begin
	case (addr_buf0)
		6'd25:	line24=din;
		6'd26:	line25=din;
		6'd27:	line26=din;
		6'd28:	line27=din;
		6'd29:	line28=din;
		6'd30:	line29=din;
		6'd31:	line30=din;
		6'd32:	line31=din;
		6'd33:	line32=din;
		6'd34:	line33=din;
		6'd35:	line34=din;
		6'd36:	line35=din;
		6'd37:	line36=din;
		6'd38:	line37=din;
		6'd39:	line38=din;
		6'd40:	line39=din;
		default :	midmem=din;
	endcase
	end
endmodule