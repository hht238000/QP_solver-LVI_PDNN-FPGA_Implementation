library ieee;
use ieee.std_logic_1164.all	;
use ieee.std_logic_arith.all	;
use ieee.std_logic_signed.all	;

entity Integrator is port(
	data_in:		in		std_logic_vector(31 downto 0);
	data_out:	out	std_logic_vector(31 downto 0);
	clk:			in		std_logic							;
	en:			in		std_logic							;
	reset:		in		std_logic							);
end Integrator													;

architecture str of Integrator is
	begin
	process(reset,data_in,clk,en)
		variable tempout	: 	std_logic_vector(31 downto 0)	;
		variable	temp		:	std_logic_vector(30 downto 0)	;
		variable mark		:	std_logic							;
		begin
			if (reset='0') then
				data_out <= "00000000000000000000000000000000";
				tempout	:=	"00000000000000000000000000000000";
			elsif(clk'event and clk='1' and en='0') then
				if (tempout(31) xor data_in(31))='0' then
					mark :=data_in(31);
					temp :=data_in(30 downto 0) + tempout(30 downto 0);
				elsif data_in(30 downto 0)>tempout(30 downto 0) then
					mark :=data_in(31);
					temp :=data_in(30 downto 0) - tempout(30 downto 0);
				elsif data_in(30 downto 0)<tempout(30 downto 0) then
					mark :=tempout(31);
					temp :=tempout(30 downto 0) - data_in(30 downto 0);
				elsif data_in(30 downto 0)=tempout(30 downto 0) then
					mark :='0';
					temp :=(others=>'0');
				else
					mark :='0';
					temp :="0000000000001000000000000000000";
				end if;
				tempout:=mark&temp;
				data_out<=tempout;
			end if;
	end process;
end str;
