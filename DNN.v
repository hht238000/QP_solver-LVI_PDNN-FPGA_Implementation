  module DNN (clk,en,reset,out1,out2, out3,out4,w011,
                        w012,w021,w022,q1,q2,j1,j2,d,a1,a2,b,
                        e1,e2,e3,e4,r);

      wire en1;
      wire en2;
      wire [6:0]  addr;
      wire[31:0]  dout; 
      wire[31:0]  adder; 
      input en;
      input clk;
      input reset;
      //32位参数输入
      input signed [31:0] w011,w012,w021,w022,q1,q2,
                         j1,j2,d,a1,a2,b,e1,e2,e3,e4;
      //网络收敛速度
       input [31:0] r;
      //x1,x2,u,v输出端口
      output signed [31:0] out1,out2,out3,out4;

      //网络模块中参数连接线

      wire signed [31:0]  w1,w2,w3,w4, w5,w6,w7,w8, w9, w10,
                                    w11,w12,w13,w14,w15,w16,w17,w18,
                                    w19,w20,w21,w22,w23,w24,w25,w26,
                                    w27,w28,w29,w30,w31,w32,w33,w34,
                                    w35,w36,w37,w38,w39,w40,w41,w42,
                                    w43,w44,w45,w46,w47,w48,w49,w50,
                                    w51,w52,w53,w54,w55,w56,w57,w58,
                                    w59,w60,w61,w62,w63,w64,w65,w66,
                                    w67,w68,w69,w70,w71,w72,w73,w74,
                                    w75,w76,w77,w78,w79,we80,sita1,
                                    sita2,sita3,sita4,sita5,sta6,
                                    sita7, sita8,sita9,sita10,sita11,
                                    sita12,sita13,sita14,sita15,sita16,
                                    sita17,sita18,sita19,sita20,sita21,
                                    sita22,sita23,sita24,sita25,sita26,
                                    sita27,sita28,sita29,sita30,sita31,
                                    sita32 ;

    
        wire wen;
        wire ren;

//下面引用网络模块 
ANN_net ann_net(.w1(w1),.w2(w2),.w3(w3),.w4(w4),.w5(w5),
					 .w6(w6),.w7(w7),.w8(w8),.w9(w9),.w10(w10),
					 .w11(w11),.w12(w12),.w13(w13),.w14(w14),.w15(w15),
					 .w16(w16),.w17(w17),.w18(w18),.w19(w19),.w20(w20),
					 .w21(w21),.w22(w22),.w23(w23),.w24(w24),.w25(w25),
					 .w26(w26),.w27(w27),.w28(w28),.w29(w29),.w30(w30),
					 .w31(w31),.w32(w32),.w33(w33),.w34(w34),.w35(w35),
					 .w36(w36),.w37(w37),.w38(w38),.w39(w39),.w40(w40),
					 .w41(w41),.w42(w42),.w43(w43),.w44(w44),.w45(w45),
					 .w46(w46),.w47(w47),.w48(w48),.w49(w49),.w50(w50),
					 .w51(w51),.w52(w52),.w53(w53),.w54(w54),.w55(w55),
					 .w56(w56),.w57(w57),.w58(w58),.w59(w59),.w60(w60),
					 .w61(w61),.w62(w62),.w63(w63),.w64(w64),.w65(w65),
					 .w66(w66),.w67(w67),.w68(w68),.w69(w69),.w70(w70),
					 .w71(w71),.w72(w72),.w73(w73),.w74(w74),.w75(w75),
					 .w76(w76),.w77(w77),.w78(w78),.w79(w79),.w80(w80),
					 .sita1(sita1),.sita2(sita2),.sita3(sita3),.sita4(sita4),.sita5(sita5),
					 .sita6(sita6),.sita7(sita7),.sita8(sita8),.sita9(sita9),.sita10(sita10),
					 .sita11(sita11),.sita12(sita12),.sita13(sita13),.sita14(sita14),.sita15(sita15),
					 .sita16(sita16),.sita17(sita17),.sita18(sita18),.sita19(sita19),.sita20(sita20),
					 .sita21(sita21),.sita22(sita22),.sita23(sita23),.sita24(sita24),.sita25(sita25),
					 .sita26(sita26),.sita27(sita27),.sita28(sita28),.sita29(sita29),.sita30(sita30),.sita31(sita31),.sita32(sita32),
					 .x1(out1),.x2(out2),.u(out3),.v(out4),
					 .clk(clk),.en(en1),.reset(reset),.h(r));

//下面引用参数存储模块
      memery mem   (.w011(w011),.w012(w012),.w021(w021),.w022(w022),
                    .q1(q1),.q2(q2),.j1(j1),.j2(j2),.d(d),.a1(a1),
                    .a2(a2),.b(b),.e1(e1),.e2(e2),.e3(e3),.e4(e4), 
                    .dout(dout),.addr_in(addr),.clk(clk),.en(en2),
                    .wen(wen),.ren(ren));
//下面引用参数分配模块
       mux_1to24 weighdis1 (.clk(clk),.en(ren),.addr(addr),.din(dout),
                                            .line0(w1),.line1(w2),.line2(w3),.line3(w4),
                                            .line4(w5),.line5(w6),.line6(w7),.line7(w8),
                                            .line8(w9),.line9(w10),.line10(w11),.line11(w12),
                                            .line12(w13),.line13(w14),.line14(w15),
                                            .line15(w16),.line16(sita1),.line17(sita2),
                                            .line18(sita3),.line19(sita4),.line20(sita17),
                                            .line21(sita18),.line22(sita19),.line23(sita20));

        mux_1to24 weighdis2 (.clk(clk),.en(ren),.addr(addr),.din(dout),
                                            .line0(w17),.line1(w18),.line2(w19),.line3(w20),
                                            .line4(w21),.line5(w22),.line6(w23),.line7(w24),
                                            .line8(w25),.line9(w26),.line10(w27),.line11(w28),
                                            .line12(w29),.line13(w30),.line14(w31),.line15(w32),
                                            .line16(sita5),.line17(sita6),.line18(sita7),
                                            .line19(sita8),.line20(sita21),.line21(sita22),
                                            .line22(sita23),.line23(sita24));

         mux_1to24 weighdis3 (.clk(clk),.en(ren),.addr(addr),.din(dout),
                                              .line0(w33),.line1(w34),.line2(w35),.line3(w36),
                                              .line4(w37),.line5(w38),.line6(w39),.line7(w40),
                                              .line8(w41),.line9(w42),.line10(w43),.line11(w44),
                                              .line12(w45),.line13(w46),.line14(w47),.line15(w48),
                                              .line16(sita9),.line17(sita10),.line18(sita11),
                                              .line19(sita12),.line20(sita25),.line21(sita26),
                                              .line22(sita27),.line23(sita28));

         mux_1to24 weighdis4 (.clk(clk),.en(ren),.addr(addr),.din(dout),
                                              .line0(w49),.line1(w50),.line2(w51),.line3(w52),
                                              .line4(w53),.line5(w54),.line6(w55),.line7(w56),
                                              .line8(w57),.line9(w58),.line10(w59),.line11(w60),
                                              .line12(w61),.line13(w62),.line14(w63),.line15(w64),
                                              .line16(sita13),.line17(sita14),.line18(sita15),
                                              .line19(sita16),.line20(sita29),.line21(sita30),
                                              .line22(sita31),.line23(sita32));

          mux_1to16 weighdis5 (.clk(clk),.en(ren),.addr(addr),.din(dout),
                                              .line24(w65),.line25(w66),.line26(w67),.line27(w68),
                                              .line28(w69),.line29(w70),.line30(w71),.line31(w72),
                                              .line32(w73),.line33(w74),.line34(w75),.line35(w76),
                                              .line36(w77),.line37(w78),.line38(w79),.line39(w80));
                                
//下面引用地址产生模块
         addr_gen adress  (.clk(clk),.en(en2),.addr(addr));

//下面引用状态控制模块
         state_ctrl control (.clk(clk),.en(en),.reset(reset),.en1(en1),.en2(en2),
                                      .wen(wen),.ren(ren),.adder(adder));
         endmodule


        