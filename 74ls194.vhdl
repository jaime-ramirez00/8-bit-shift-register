library IEEE;
use IEEE.numeric_bit.all;
entity 74ls194 is
port(data: in bit_vector(3 downto 0); sel: in bit_vector(1 downto 0); sr, sl, clr, clk: in bit; q: inout bit_vector(3 downto 0));
end 74ls194;
architecture behavior of 74ls194 is
begin
process(clk,clr)
if clr ='0' then q<="0000";
elsif clk='1' and clk'event then
case sel is
when "00" => q<=q;
when "01" => q <= q(2 downto 0) & sl;
when "10" => q<= sr & q(3 downto 1);
when "11" => q<=data;
end case;
end if;
end process;
end behavior;