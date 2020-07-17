module function2 (e,f,clk,en);
input clk,en;				//时钟信号clk和低电平使能信号e
input signed [31:0] e;	//累加器的累加结果输入
output signed [31:0] f;	//激活函数的输出
reg signed [31:0] f;

always @ (posedge clk)
begin if (!en) f<=function2(e);	//en为低电平时function2输出
        else   f<=f;					//en为高电平时输出锁存
end

function [31:0] function2;			//函数定义
input signed [31:0] x;
begin 
function2=x;
end
endfunction
endmodule

