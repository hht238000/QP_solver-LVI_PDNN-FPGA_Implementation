library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity mult_32x32 is port (
		a:	in 	std_logic_vector(31 downto 0);
		b:	in 	std_logic_vector(31 downto 0);
		c:	out 	std_logic_vector(31 downto 0);
	clk:	in		std_logic;
	en:	in		std_logic);
end mult_32x32	;

architecture str of mult_32x32 is
	signal temp:  std_logic_vector(61 downto 0);
	signal mark:  std_logic;
	begin
			process(a,b,clk,en)
					begin 
						if(clk'event and clk='1' and en='0') then 
								if(a=0) then
										mark <= '0';
										temp <= a(30 downto 0) * b(30 downto 0);
										c <= mark&temp(46 downto 16);
									elsif (b=0)  then
										mark <= '0';
										temp <= a(30 downto 0) * b(30 downto 0);
										c <= mark&temp(46 downto 16);
									elsif (a=0 and b=0) then
										mark <= '0';
										temp <= a(30 downto 0) * b(30 downto 0);
										c <= mark&temp(46 downto 16);
									else
										mark <= a(31) xor b(31);
										temp <= a(30 downto 0) * b(30 downto 0);
										c <= mark&temp(46 downto 16);
								end if;
						end if;
			end process;
end str;