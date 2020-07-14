module ANN_net(w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,
	             w13,w14,w15,w16,w17,w18,w19,w20,w21,w22,
	             w23,w24,w25,w26,w27,w28,w29,w30,w31,w32,
	             w33,w34,w35,w36,w37,w38,w39,w40,w41,w42,
	             w43,w44,w45,w46,w47,w48,w49,w50,w51,w52,
	             w53,w54,w55,w56,w57,w58,w59,w60,w61,w62,
	             w63,w64,sita1,sita2,sita3,sita4,sita5,
	             sita6,sita7,sita8,sita9,sita10,sita11,
	             sita12,sita13,sita14,sita15,sita16,sita17,
	             sita18,sita19,sita20,sita21,sita22,sita23,
	             sita24,sita25,sita26,sita27,sita28,sita29,
	             sita30,sita31,sita32,w65,w66,w67,w68,w69,
	             w70,w71,w72,w73,w74,w75,w76,w77,w78,w79,
	             w80,x1,x2,u,v,clk,en,reset,h);

input clk;		//clk为时钟信号
input en;		//en为网络模块使能信号
input reset;	//reset为置位信号
inout signed [31:0]x1,x2,u,v; 		//双向端口

//参数输入端口
input signed[31:0] w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,
	             w13,w14,w15,w16,w17,w18,w19,w20,w21,w22,
	             w23,w24,w25,w26,w27,w28,w29,w30,w31,w32,
	             w33,w34,w35,w36,w37,w38,w39,w40,w41,w42,
	             w43,w44,w45,w46,w47,w48,w49,w50,w51,w52,
	             w53,w54,w55,w56,w57,w58,w59,w60,w61,w62,
	             w63,w64,w65,w66,w67,w68,w69,w70,w71,w72,
	             w73,w74,w75,w76,w77,w78,w79,w80,sita1,
	             sita2,sita3,sita4,sita5,sita6,sita7,sita8,
	             sita9,sita10,sita11,sita12,sita13,sita14,
	             sita15,sita16,sita17,sita18,sita19,sita20,
	             sita21,sita22,sita23,sita24,sita25,sita26,
	             sita27,sita28,sita29,sita30,sita31,sita32,
	             h;
wire [6:0] adder;

//下面是网络模块内部模块间的连接线
wire signed [31:0] z101,z102,z103,z104,z105,z106,z107,z108,z109,
	             z110,z111,z112,z113,z114,z115,z116,z117,z118,
	             z119,z120,z121,z122,z123,z124,z125,z126,z127,
	             z128,z129,z130,z131,z132,z133,z134,z135,z136,
	             z137,z138,z139,z140,z141,z142,z143,z144,z145,
	             z146,z147,z148,z149,z150,z151,z152,z153,z154,
	             z155,z156,z157,z158,z159,z160,z161,z162,z163,
	             z164;

wire signed [31:0] u1,u2,u3,u4,u5,u6,u7,u8,u9,u10,u11,u12,u13,u14,
	             u15,u16,u17,u18,u19,u20,u21,u22,u23,u24,u25,u26,
	             u27,u28,u29,u30,u31,u32,j1,j2,j3,j4,j5,j6,j7,j8,
	             j9,j10,j11,j12,j13,j14,j15,j16,k1,k2,k3,k4,k5,k6,
	             k7,k8,v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11,v12,v13,
	             v14,v15,v16;
wire signed [31:0] z201,z202,z203,z204,z205,z206,z207,z208,z209,z210,
	             z211,z212,z213,z214,z215,z216,
	             z301,z302,z303,z304,z305,z306,z307,z308,z309,z310,
	             z311,z312,z313,z314,z315,z316,z401,z402,z403,z404,
	             z405,z406,z407,z408,z409,z410,z411,z412,z413,z414,
	             z415,z416,z51,z52,z53,z54,z61,z62,z63,z64;

wire en00,en01,en02,en03,en04,en05,en06,en07,en08,en09,en10;
wire signed [6:0] addder;

//例化乘法器模块
mult_32x32 m1 (.a(x1),.b(w1),.c(z101),.clk(clk),.en(en01));
mult_32x32 m2 (.a(x2),.b(w2),.c(z102),.clk(clk),.en(en01));
mult_32x32 m3 (.a(u),.b(w3),.c(z103),.clk(clk),.en(en01));
mult_32x32 m4 (.a(v),.b(w4),.c(z104),.clk(clk),.en(en01));
mult_32x32 m5 (.a(x1),.b(w5),.c(z105),.clk(clk),.en(en01));
mult_32x32 m6 (.a(x2),.b(w6),.c(z106),.clk(clk),.en(en01));
mult_32x32 m7 (.a(u),.b(w7),.c(z107),.clk(clk),.en(en01));
mult_32x32 m8 (.a(v),.b(w8),.c(z108),.clk(clk),.en(en01));
mult_32x32 m9 (.a(x1),.b(w9),.c(z109),.clk(clk),.en(en01));
mult_32x32 m10 (.a(x2),.b(w10),.c(z110),.clk(clk),.en(en01));
mult_32x32 m11 (.a(u),.b(w11),.c(z111),.clk(clk),.en(en01));
mult_32x32 m12 (.a(v),.b(w12),.c(z112),.clk(clk),.en(en01));
mult_32x32 m13 (.a(x1),.b(w13),.c(z113),.clk(clk),.en(en01));
mult_32x32 m14 (.a(x2),.b(w14),.c(z114),.clk(clk),.en(en01));
mult_32x32 m15 (.a(u),.b(w15),.c(z115),.clk(clk),.en(en01));
mult_32x32 m16 (.a(v),.b(w16),.c(z116),.clk(clk),.en(en01));

mult_32x32 m17 (.a(x1),.b(w17),.c(z117),.clk(clk),.en(en01));
mult_32x32 m18 (.a(x2),.b(w18),.c(z118),.clk(clk),.en(en01));
mult_32x32 m19 (.a(u),.b(w19),.c(z119),.clk(clk),.en(en01));
mult_32x32 m20 (.a(v),.b(w20),.c(z120),.clk(clk),.en(en01));
mult_32x32 m21 (.a(x1),.b(w21),.c(z121),.clk(clk),.en(en01));
mult_32x32 m22 (.a(x2),.b(w22),.c(z122),.clk(clk),.en(en01));
mult_32x32 m23 (.a(u),.b(w23),.c(z123),.clk(clk),.en(en01));
mult_32x32 m24 (.a(v),.b(w24),.c(z124),.clk(clk),.en(en01));
mult_32x32 m25 (.a(x1),.b(w25),.c(z125),.clk(clk),.en(en01));
mult_32x32 m26 (.a(x2),.b(w26),.c(z126),.clk(clk),.en(en01));
mult_32x32 m27 (.a(u),.b(w27),.c(z127),.clk(clk),.en(en01));
mult_32x32 m28 (.a(v),.b(w28),.c(z128),.clk(clk),.en(en01));
mult_32x32 m29 (.a(x1),.b(w29),.c(z129),.clk(clk),.en(en01));
mult_32x32 m30 (.a(x2),.b(w30),.c(z130),.clk(clk),.en(en01));
mult_32x32 m31 (.a(u),.b(w31),.c(z131),.clk(clk),.en(en01));
mult_32x32 m32 (.a(v),.b(w32),.c(z132),.clk(clk),.en(en01));


mult_32x32 m33 (.a(x1),.b(w33),.c(z133),.clk(clk),.en(en01));
mult_32x32 m34 (.a(x2),.b(w34),.c(z134),.clk(clk),.en(en01));
mult_32x32 m35 (.a(u),.b(w35),.c(z135),.clk(clk),.en(en01));
mult_32x32 m36 (.a(v),.b(w36),.c(z136),.clk(clk),.en(en01));
mult_32x32 m37 (.a(x1),.b(w37),.c(z137),.clk(clk),.en(en01));
mult_32x32 m38 (.a(x2),.b(w38),.c(z138),.clk(clk),.en(en01));
mult_32x32 m39 (.a(u),.b(w39),.c(z139),.clk(clk),.en(en01));
mult_32x32 m40 (.a(v),.b(w40),.c(z140),.clk(clk),.en(en01));
mult_32x32 m41 (.a(x1),.b(w41),.c(z141),.clk(clk),.en(en01));
mult_32x32 m42 (.a(x2),.b(w42),.c(z142),.clk(clk),.en(en01));
mult_32x32 m43 (.a(u),.b(w43),.c(z143),.clk(clk),.en(en01));
mult_32x32 m44 (.a(v),.b(w44),.c(z144),.clk(clk),.en(en01));
mult_32x32 m45 (.a(x1),.b(w45),.c(z145),.clk(clk),.en(en01));
mult_32x32 m46 (.a(x2),.b(w46),.c(z146),.clk(clk),.en(en01));
mult_32x32 m47 (.a(u),.b(w47),.c(z147),.clk(clk),.en(en01));
mult_32x32 m48 (.a(v),.b(w48),.c(z148),.clk(clk),.en(en01));


mult_32x32 m49 (.a(x1),.b(w49),.c(z149),.clk(clk),.en(en01));
mult_32x32 m50 (.a(x2),.b(w50),.c(z150),.clk(clk),.en(en01));
mult_32x32 m51 (.a(u),.b(w51),.c(z151),.clk(clk),.en(en01));
mult_32x32 m52 (.a(v),.b(w52),.c(z152),.clk(clk),.en(en01));
mult_32x32 m53 (.a(x1),.b(w53),.c(z153),.clk(clk),.en(en01));
mult_32x32 m54 (.a(x2),.b(w54),.c(z154),.clk(clk),.en(en01));
mult_32x32 m55 (.a(u),.b(w55),.c(z155),.clk(clk),.en(en01));
mult_32x32 m56 (.a(v),.b(w56),.c(z156),.clk(clk),.en(en01));
mult_32x32 m57 (.a(x1),.b(w57),.c(z157),.clk(clk),.en(en01));
mult_32x32 m58 (.a(x2),.b(w58),.c(z158),.clk(clk),.en(en01));
mult_32x32 m59 (.a(u),.b(w59),.c(z159),.clk(clk),.en(en01));
mult_32x32 m60 (.a(v),.b(w60),.c(z160),.clk(clk),.en(en01));
mult_32x32 m61 (.a(x1),.b(w61),.c(z161),.clk(clk),.en(en01));
mult_32x32 m62 (.a(x2),.b(w62),.c(z162),.clk(clk),.en(en01));
mult_32x32 m63 (.a(u),.b(w63),.c(z163),.clk(clk),.en(en01));
mult_32x32 m64 (.a(v),.b(w64),.c(z164),.clk(clk),.en(en01));

//例化加法器模块
note_adder a1 (.a(z101),.b(z102),.c(u1),.clk(clk),.en(en02));
note_adder a2 (.a(z103),.b(z104),.c(u2),.clk(clk),.en(en02));
note_adder a3 (.a(z105),.b(z106),.c(u3),.clk(clk),.en(en02));
note_adder a4 (.a(z107),.b(z108),.c(u4),.clk(clk),.en(en02));
note_adder a5 (.a(z109),.b(z110),.c(u5),.clk(clk),.en(en02));
note_adder a6 (.a(z111),.b(z112),.c(u6),.clk(clk),.en(en02));
note_adder a7 (.a(z113),.b(z114),.c(u7),.clk(clk),.en(en02));
note_adder a8 (.a(z115),.b(z116),.c(u8),.clk(clk),.en(en02));
note_adder a9 (.a(z117),.b(z118),.c(u9),.clk(clk),.en(en02));
note_adder a10 (.a(z119),.b(z120),.c(u10),.clk(clk),.en(en02));
note_adder a11 (.a(z121),.b(z122),.c(u11),.clk(clk),.en(en02));
note_adder a12 (.a(z123),.b(z124),.c(u12),.clk(clk),.en(en02));
note_adder a13 (.a(z125),.b(z126),.c(u13),.clk(clk),.en(en02));
note_adder a14 (.a(z127),.b(z128),.c(u14),.clk(clk),.en(en02));
note_adder a15 (.a(z129),.b(z130),.c(u15),.clk(clk),.en(en02));
note_adder a16 (.a(z131),.b(z132),.c(u16),.clk(clk),.en(en02));

note_adder a17 (.a(z133),.b(z134),.c(u17),.clk(clk),.en(en02));
note_adder a18 (.a(z135),.b(z136),.c(u18),.clk(clk),.en(en02));
note_adder a19 (.a(z137),.b(z138),.c(u19),.clk(clk),.en(en02));
note_adder a20 (.a(z139),.b(z140),.c(u20),.clk(clk),.en(en02));
note_adder a21 (.a(z141),.b(z142),.c(u21),.clk(clk),.en(en02));
note_adder a22 (.a(z143),.b(z144),.c(u22),.clk(clk),.en(en02));
note_adder a23 (.a(z145),.b(z146),.c(u23),.clk(clk),.en(en02));
note_adder a24 (.a(z147),.b(z148),.c(u24),.clk(clk),.en(en02));
note_adder a25 (.a(z149),.b(z150),.c(u25),.clk(clk),.en(en02));
note_adder a26 (.a(z151),.b(z152),.c(u26),.clk(clk),.en(en02));
note_adder a27 (.a(z153),.b(z154),.c(u27),.clk(clk),.en(en02));
note_adder a28 (.a(z155),.b(z156),.c(u28),.clk(clk),.en(en02));
note_adder a29 (.a(z157),.b(z158),.c(u29),.clk(clk),.en(en02));
note_adder a30 (.a(z159),.b(z160),.c(u30),.clk(clk),.en(en02));
note_adder a31 (.a(z161),.b(z162),.c(u31),.clk(clk),.en(en02));
note_adder a32 (.a(z163),.b(z164),.c(u32),.clk(clk),.en(en02));


note_adder a33 (.a(u1),.b(u2),.c(j1),.clk(clk),.en(en03));
note_adder a34 (.a(u3),.b(u4),.c(j2),.clk(clk),.en(en03));
note_adder a35 (.a(u5),.b(u6),.c(j3),.clk(clk),.en(en03));
note_adder a36 (.a(u7),.b(u8),.c(j4),.clk(clk),.en(en03));
note_adder a37 (.a(u9),.b(u10),.c(j5),.clk(clk),.en(en03));
note_adder a38 (.a(u11),.b(u12),.c(j6),.clk(clk),.en(en03));
note_adder a39 (.a(u13),.b(u14),.c(j7),.clk(clk),.en(en03));
note_adder a40 (.a(u15),.b(u16),.c(j8),.clk(clk),.en(en03));
note_adder a41 (.a(u17),.b(u18),.c(j9),.clk(clk),.en(en03));
note_adder a42 (.a(u19),.b(u20),.c(j10),.clk(clk),.en(en03));
note_adder a43 (.a(u21),.b(u22),.c(j11),.clk(clk),.en(en03));
note_adder a44 (.a(u23),.b(u24),.c(j12),.clk(clk),.en(en03));
note_adder a45 (.a(u25),.b(u26),.c(j13),.clk(clk),.en(en03));
note_adder a46 (.a(u27),.b(u28),.c(j14),.clk(clk),.en(en03));
note_adder a47 (.a(u29),.b(u30),.c(j15),.clk(clk),.en(en03));
note_adder a48 (.a(u31),.b(u32),.c(j16),.clk(clk),.en(en03));


//例化减法器模块
note_sub s1 (.a(j1),.b(sita1),.c(v1),.clk(clk),.en(en04));
note_sub s2 (.a(j2),.b(sita2),.c(v2),.clk(clk),.en(en04));
note_sub s3 (.a(j3),.b(sita3),.c(v3),.clk(clk),.en(en04));
note_sub s4 (.a(j4),.b(sita4),.c(v4),.clk(clk),.en(en04));
note_sub s5 (.a(j5),.b(sita5),.c(v5),.clk(clk),.en(en04));
note_sub s6 (.a(j6),.b(sita6),.c(v6),.clk(clk),.en(en04));
note_sub s7 (.a(j7),.b(sita7),.c(v7),.clk(clk),.en(en04));
note_sub s8 (.a(j8),.b(sita8),.c(v8),.clk(clk),.en(en04));
note_sub s9 (.a(j9),.b(sita9),.c(v9),.clk(clk),.en(en04));
note_sub s10 (.a(j10),.b(sita10),.c(v10),.clk(clk),.en(en04));
note_sub s11 (.a(j11),.b(sita11),.c(v11),.clk(clk),.en(en04));
note_sub s12 (.a(j12),.b(sita12),.c(v12),.clk(clk),.en(en04));
note_sub s13 (.a(j13),.b(sita13),.c(v13),.clk(clk),.en(en04));
note_sub s14 (.a(j14),.b(sita14),.c(v14),.clk(clk),.en(en04));
note_sub s15 (.a(j15),.b(sita15),.c(v15),.clk(clk),.en(en04));
note_sub s16 (.a(j16),.b(sita16),.c(v16),.clk(clk),.en(en04));


//例化激活函数模块
function1 f1 (.e(v1),.r1(sita17),.r2(sita18),.f(z201),.clk(clk),.en(en05));
function1 f2 (.e(v2),.r1(sita19),.r2(sita20),.f(z202),.clk(clk),.en(en05));
function2 f3 (.e(v3),.f(z203),.clk(clk),.en(en05));
function3 f4 (.e(v4),.f(z204),.clk(clk),.en(en05));
function1 f5 (.e(v5),.r1(sita21),.r2(sita22),.f(z205),.clk(clk),.en(en05));
function1 f6 (.e(v6),.r1(sita23),.r2(sita24),.f(z206),.clk(clk),.en(en05));
function2 f7 (.e(v7),.f(z207),.clk(clk),.en(en05));
function3 f8 (.e(v8),.f(z208),.clk(clk),.en(en05));
function1 f9 (.e(v9),.r1(sita25),.r2(sita26),.f(z209),.clk(clk),.en(en05));
function1 f10 (.e(v10),.r1(sita27),.r2(sita28),.f(z210),.clk(clk),.en(en05));
function2 f11 (.e(v11),.f(z211),.clk(clk),.en(en05));
function3 f12 (.e(v12),.f(z212),.clk(clk),.en(en05));
function1 f13 (.e(v13),.r1(sita29),.r2(sita30),.f(z213),.clk(clk),.en(en05));
function1 f14 (.e(v14),.r1(sita31),.r2(sita32),.f(z214),.clk(clk),.en(en05));
function2 f15 (.e(v15),.f(z215),.clk(clk),.en(en05));
function3 f16 (.e(v16),.f(z216),.clk(clk),.en(en05));

//例化减法模块
note_sub s17 (.a(z201),.b(x1),.c(z301),.clk(clk),.en(en06));
note_sub s18 (.a(z202),.b(x2),.c(z302),.clk(clk),.en(en06));
note_sub s19 (.a(z203),.b(u),.c(z303),.clk(clk),.en(en06));
note_sub s20 (.a(z204),.b(v),	.c(z304),.clk(clk),.en(en06));
note_sub s21 (.a(z205),.b(x1),.c(z305),.clk(clk),.en(en06));
note_sub s22 (.a(z206),.b(x2),.c(z306),.clk(clk),.en(en06));
note_sub s23 (.a(z207),.b(u),.c(z307),.clk(clk),.en(en06));
note_sub s24 (.a(z208),.b(v),.c(z308),.clk(clk),.en(en06));
note_sub s25 (.a(z209),.b(x1),.c(z309),.clk(clk),.en(en06));
note_sub s26 (.a(z210),.b(x2),.c(z310),.clk(clk),.en(en06));
note_sub s27 (.a(z211),.b(u),.c(z311),.clk(clk),.en(en06));
note_sub s28 (.a(z212),.b(v),.c(z312),.clk(clk),.en(en06));
note_sub s29 (.a(z213),.b(x1),.c(z313),.clk(clk),.en(en06));
note_sub s30 (.a(z214),.b(x2),.c(z314),.clk(clk),.en(en06));
note_sub s31 (.a(z215),.b(u),.c(z315),.clk(clk),.en(en06));
note_sub s32 (.a(z216),.b(v),.c(z316),.clk(clk),.en(en06));


//例化乘法器模块
mult_32x32 m65 (.a(z301),.b(w65),.c(z401),.clk(clk),.en(en07));
mult_32x32 m66 (.a(z302),.b(w66),.c(z402),.clk(clk),.en(en07));
mult_32x32 m67 (.a(z303),.b(w67),.c(z403),.clk(clk),.en(en07));
mult_32x32 m68 (.a(z304),.b(w68),.c(z404),.clk(clk),.en(en07));
mult_32x32 m69 (.a(z305),.b(w69),.c(z405),.clk(clk),.en(en07));
mult_32x32 m70 (.a(z306),.b(w70),.c(z406),.clk(clk),.en(en07));
mult_32x32 m71 (.a(z307),.b(w71),.c(z407),.clk(clk),.en(en07));
mult_32x32 m72 (.a(z308),.b(w72),.c(z408),.clk(clk),.en(en07));
mult_32x32 m73 (.a(z309),.b(w73),.c(z409),.clk(clk),.en(en07));
mult_32x32 m74 (.a(z310),.b(w74),.c(z410),.clk(clk),.en(en07));
mult_32x32 m75 (.a(z311),.b(w75),.c(z411),.clk(clk),.en(en07));
mult_32x32 m76 (.a(z312),.b(w76),.c(z412),.clk(clk),.en(en07));
mult_32x32 m77 (.a(z313),.b(w77),.c(z413),.clk(clk),.en(en07));
mult_32x32 m78 (.a(z314),.b(w78),.c(z414),.clk(clk),.en(en07));
mult_32x32 m79 (.a(z315),.b(w79),.c(z415),.clk(clk),.en(en07));
mult_32x32 m80 (.a(z316),.b(w80),.c(z416),.clk(clk),.en(en07));

//例化加法器模块
note_adder a49 (.a(z401),.b(z402),.c(k1),.clk(clk),.en(en08));
note_adder a50 (.a(z403),.b(z404),.c(k2),.clk(clk),.en(en08));
note_adder a51 (.a(k1),    .b(k2),.c(z51),.clk(clk),.en(en09));
note_adder a52 (.a(z405),.b(z406),.c(k3),.clk(clk),.en(en08));
note_adder a53 (.a(z407),.b(z408),.c(k4),.clk(clk),.en(en08));
note_adder a54 (.a(k3),    .b(k4),.c(z52),.clk(clk),.en(en09));
note_adder a55 (.a(z409),.b(z410),.c(k5),.clk(clk),.en(en08));
note_adder a56 (.a(z411),.b(z412),.c(k6),.clk(clk),.en(en08));
note_adder a57 (.a(k5),    .b(k6),.c(z53),.clk(clk),.en(en09));
note_adder a58 (.a(z413),.b(z414),.c(k7),.clk(clk),.en(en08));
note_adder a59 (.a(z415),.b(z416),.c(k8),.clk(clk),.en(en08));
note_adder a60 (.a(k7),    .b(k8),.c(z54),.clk(clk),.en(en09));

//例化乘法器模块
mult_32x32 m81 (.a(z51),.b(h),.c(z61),.clk(clk),.en(en10));
mult_32x32 m82 (.a(z52),.b(h),.c(z62),.clk(clk),.en(en10));
mult_32x32 m83 (.a(z53),.b(h),.c(z63),.clk(clk),.en(en10));
mult_32x32 m84 (.a(z54),.b(h),.c(z64),.clk(clk),.en(en10));


//例化积分器模块
Integrator Integrator_1 (.data_in(z61),.data_out(x1),.en(en00),.clk(clk),.reset(reset));
Integrator Integrator_2 (.data_in(z62),.data_out(x2),.en(en00),.clk(clk),.reset(reset));
Integrator Integrator_3 (.data_in(z63),.data_out(u),.en(en00),.clk(clk),.reset(reset));
Integrator Integrator_4 (.data_in(z64),.data_out(v),.en(en00),.clk(clk),.reset(reset));


//例化状态控制器模块
net_state_ctrl ctr1 (.clk(clk),.en(en),.reset(reset),.en00(en00),
	.en01(en01),.en02(en02),.en03(en03),.en04(en04),
	.en05(en05),.en06(en06),.en07(en07),.en08(en08),
	.en09(en09),.en10(en10),.addder(addder));

endmodule

