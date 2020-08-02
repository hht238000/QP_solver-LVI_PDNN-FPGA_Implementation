module net_state_ctrl(clk,en,reset,en00,en01,en02,en03,en04,
							en05,en06,en07,en08,en09,en10,addder);
input clk,en,reset;
output en00,en01,en02,en03,en04,en05,en06,en07,en08,en09,en10;

/*en00为积分器模块使能信号，en01为网络模块最前端乘法器模块使能信号
  en02为五输入累加器模块中第一级加法器模块使能信号，en03为五输入累
  加器模块中第二级加法器模块使能信号，en04为五输入累加器模块中减法器
  模块使能信号，en05为激活函数模块使能信号，en06为减法器模块使能信号，
  en07为网络模块后端乘法器模块使能信号，en08为四输入累加器模块中第一
  级加法器使能信号，en09四输入累加器模块中第二级加法器使能信号，en10
  为积分器前乘法器模块使能信号*/
output [6:0] addder;					//输出一个7位计数器
reg [10:0] state;						//定义一个11位状态寄存器
reg [6:0] addder;
always @ (posedge clk)
begin
	if (!reset)
		addder<=0;
	else if (!en)
		begin
			if(addder==21)
				addder<=1;
			else
				addder<=addder+1'b1;
			end
	else addder<=0;
	end
	
assign {en00,en01,en02,en03,en04,en05,en06,en07,
		en08,en09,en10}=state;			//设置标志寄存器
always @ (addder,state)
begin
	case (addder)
	
	6'd0	:	state = 11'b111_111_111_11;	//所有模块都不工作
	6'd1	:	state = 11'b011_111_111_11;	//积分器模块工作
	6'd2	:	state = 11'b101_111_111_11;	//网络模块最前端乘法器工作
	6'd4	:	state = 11'b110_111_111_11;	//5输入累加器第一级加法器工作
	6'd6	:	state = 11'b111_011_111_11;	//5输入累加器第二级加法器工作
	6'd8	:	state = 11'b111_101_111_11;	//5输入累加器减法器工作
	6'd11	:	state = 11'b111_110_111_11;	//激活函数工作
	6'd12	:	state = 11'b111_111_011_11;	//减法器工作
	6'd14	:	state = 11'b111_111_101_11;	//乘法器模块工作
	6'd16	:	state = 11'b111_111_110_11;	//4输入累加器第一级加法器工作
	6'd18	:	state = 11'b111_111_111_01;	//4输入累加器第二级加法器工作
	6'd20	:	state = 11'b111_111_111_10;	//积分器前乘法器模块工作
	
	
	default :state = state;
	endcase
end
endmodule