library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity function1 is port(
       e:in  std_logic_vector(31 downto 0);
       r1:in std_logic_vector(31 downto 0);
       r2:in std_logic_vector(31 downto 0);
       clk:in std_logic;
       en:in std_logic;
       f:out std_logic_vector(31 downto 0));
end function1;

architecture str of function1 is
begin
     process(e,r1,r2,clk,en)
          begin
          if(clk'event and clk='1'and en='0')then
					if (r2(31) xor r1(31))='1' then
						if e(31)='0' then
							if e(30 downto 0)<r2(30 downto 0) then
								f<=e;
							else
								f<=r2;
							end if;
						else --e(31)=1
							if e(30 downto 0)<r1(30 downto 0) then
								f<=e;
							else
								f<=r1;
							end if;
						end if;
					else --(r2(31) xor r1(31))='0'
						if r2(31)='1' then
							if e(31)='1' then
								if e(30 downto 0)<r2(30 downto 0) then
									f<=r2;
								elsif e(30 downto 0)>r1(30 downto 0) then
									f<=r1;
								else
									f<=e;
								end if;
							else --e(31)=o
								f<=r2;
							end if;
						else --r1(31)=0
							if e(31)='0' then
								if e(30 downto 0)<r1(30 downto 0) then
									f<=r1;
								elsif e(30 downto 0)>r2(30 downto 0) then
									f<=r2;
								else
									f<=e;
								end if;
							else --e(31)=1
								f<=r1;
							end if;
						end if;
					end if;
			 end if; 
     end process;
 end str;
