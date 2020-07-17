module function3 (e,f,clk,en);
input clk,en;					//时钟信号clk和低电平使能信号en
input signed [31:0] e;		//累加器的累加结果输入
output signed [31:0] f;		//激活函数的输出
reg signed [31:0] f;
always @ (posedge clk)
begin if (!en) f<=fun(e);	//en低电平使能
        else   f<=f;			//en高电平锁存
end
function [31:0] fun;
input signed [31:0] x;
begin 
if(x<0)
fun=0;
else
fun=x;
end
endfunction
endmodule