library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity memery is port (
w011, w012,w021,w022	:		in std_logic_vector (31 downto 0);
q1,q2,j1,j2,d,a1,a2	:		in std_logic_vector (31 downto 0);
b,e1,e2,e3,e4			:		in std_logic_vector (31 downto 0);
addr_in					:		in std_logic_vector (6 downto 0);
clk, en,wen, ren		:		in std_logic;
dout						:		out std_logic_vector (31 downto 0)
			);
end memery;

architecture str of memery is
type meme is array (39 downto 0) of std_logic_vector (31 downto 0);
signal mem: meme;
signal addr_buf: std_logic_vector (6 downto 0);

	begin
		process (w011,w012,w021,w022,q1,q2,j1,j2,d,a1,a2,b,e1,e2,e3,
			e4, addr_in,clk,en,wen,ren)
		begin
			if (clk'event and clk='1' and en='0')  then
			addr_buf <= addr_in;
			if(wen ='0' and ren ='1')  then

mem(0)<='1' &(w011(30 downto 0) - "0000000000000010000000000000000" );
mem(1)<=not w012(31) & w012(30 downto 0);
mem(2)<=j1;
mem(3)<=not a1(31) & a1(30 downto 0);
mem(4)<=not w021(31) & w021(30 downto 0) ;
mem(5)<='1' & (w022(30 downto 0) -"0000000000000010000000000000000" );
mem(6)<=j2;
mem(7)<=not a2(31) & a2(30 downto 0);
mem(8)<=not j1(31) & j1(30 downto 0);
mem(9)<=not j2(31) & J2(30 downto 0);
mem(10)<="00000000000000010000000000000000";
mem(11)<="00000000000000000000000000000000";
mem(12)<=a1;
mem(13)<=a2;
mem(14)<="00000000000000000000000000000000";
mem(15)<="00000000000000010000000000000000";
mem(16)<=q1;
mem(17)<=q2;
mem(18)<=not d(31) & d(30 downto 0);
mem(19)<=b;
mem(20)<=e1; 
mem(21)<=e2; 
mem(22)<=e3; 
mem(23)<=e4;

mem(24)<='0' & (w011(30 downto 0) +"0000000000000010000000000000000" );
mem(25)<=w021;
mem(26)<=j1;
mem(27)<=not a1(31) & a1(30 downto 0);
mem(28)<=w012;
mem(29)<='0' &(w022(30 downto 0) +"0000000000000010000000000000000");
mem(30)<=j2;
mem(31)<=not a2(31) & a2 (30 downto 0);
mem(32)<=not j1(31) & j1(30 downto 0);
mem(33)<=not j2(31) & j2(30 downto 0);
mem(34)<="00000000000000010000000000000000";
mem(35)<="00000000000000000000000000000000";
mem(36)<=a1;
mem(37)<=a2;
mem(38)<="00000000000000000000000000000000";
mem(39)<="00000000000000010000000000000000";
	elsif (wen ='1' and ren = '0') then
		if (conv_integer (addr_buf)<40) then
		  dout<=mem(conv_integer (addr_buf));
		else
		  null;
		end if;
	else
		null;
	end if;
    end if;
  end process;
end str;
