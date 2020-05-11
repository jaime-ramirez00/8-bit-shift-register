library IEEE;
use IEEE.numeric_bit.all;
entity shiftreg is
port(x: in bit_vector(7 downto 0); sel: in bit_vector(1 downto 0); r,l,clr,clk: in bit; y: inout bit_vector(7 downto 0));
end shiftreg;
architecture behavior of shiftreg is
component 74ls194
port(data: in bit_vector(3 downto 0); sel: in bit_vector(1 downto 0); sr, sl, clr, clk: in bit; q: inout bit_vector(3 downto 0));
end component;
begin
shift0to3: 74ls194 port map(x(3 downto 0), sel, y(4), l, clr, clk, y(3 downto 0));
shift4to7: 74ls194 port map(x(y downto 4), sel, r, y(3), clr, clk, y(7 downto 4));
end behavior;