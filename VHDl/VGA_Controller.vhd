library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all; 
entity VGA_Controller is
port(
	pixel_column : in std_logic_vector(9 downto 0);
	pixel_row : in std_logic_vector(9 downto 0);
	letter : out std_logic_vector(5 downto 0));
end entity;

architecture arch_VGA_Controller of VGA_Controller is
begin
		letter<=conv_std_logic_vector(8,6) when pixel_column>=80 and pixel_column<88 and pixel_row>=240 and pixel_row<248 else
conv_std_logic_vector(5,6) when pixel_column>=88 and pixel_column<96 and pixel_row>=240 and pixel_row<248 else
conv_std_logic_vector(12,6) when pixel_column>=96 and pixel_column<104 and pixel_row>=240 and pixel_row<248 else
conv_std_logic_vector(12,6) when pixel_column>=104 and pixel_column<112 and pixel_row>=240 and pixel_row<248 else
conv_std_logic_vector(15,6) when pixel_column>=112 and pixel_column<120 and pixel_row>=240 and pixel_row<248 else
conv_std_logic_vector(32,6) when pixel_column>=120 and pixel_column<128 and pixel_row>=240 and pixel_row<248 else
conv_std_logic_vector(7,6) when pixel_column>=128 and pixel_column<136 and pixel_row>=240 and pixel_row<248 else
conv_std_logic_vector(18,6) when pixel_column>=136 and pixel_column<144 and pixel_row>=240 and pixel_row<248 else
conv_std_logic_vector(5,6) when pixel_column>=144 and pixel_column<152 and pixel_row>=240 and pixel_row<248 else
conv_std_logic_vector(7,6) when pixel_column>=152 and pixel_column<160 and pixel_row>=240 and pixel_row<248 else
conv_std_logic_vector(-52,6) when pixel_column>=160 and pixel_column<168 and pixel_row>=240 and pixel_row<248 else
conv_std_logic_vector(32,6) when pixel_column>=168 and pixel_column<176 and pixel_row>=240 and pixel_row<248 else
conv_std_logic_vector(8,6) when pixel_column>=176 and pixel_column<184 and pixel_row>=240 and pixel_row<248 else
conv_std_logic_vector(5,6) when pixel_column>=184 and pixel_column<192 and pixel_row>=240 and pixel_row<248 else
conv_std_logic_vector(12,6) when pixel_column>=192 and pixel_column<200 and pixel_row>=240 and pixel_row<248 else
conv_std_logic_vector(12,6) when pixel_column>=200 and pixel_column<208 and pixel_row>=240 and pixel_row<248 else
conv_std_logic_vector(15,6) when pixel_column>=208 and pixel_column<216 and pixel_row>=240 and pixel_row<248 else
conv_std_logic_vector(32,6) when pixel_column>=216 and pixel_column<224 and pixel_row>=240 and pixel_row<248 else
conv_std_logic_vector(4,6) when pixel_column>=224 and pixel_column<232 and pixel_row>=240 and pixel_row<248 else
conv_std_logic_vector(1,6) when pixel_column>=232 and pixel_column<240 and pixel_row>=240 and pixel_row<248 else
conv_std_logic_vector(14,6) when pixel_column>=240 and pixel_column<248 and pixel_row>=240 and pixel_row<248 else
conv_std_logic_vector(9,6) when pixel_column>=248 and pixel_column<256 and pixel_row>=240 and pixel_row<248 else
conv_std_logic_vector(5,6) when pixel_column>=256 and pixel_column<264 and pixel_row>=240 and pixel_row<248 else
conv_std_logic_vector(12,6) when pixel_column>=264 and pixel_column<272 and pixel_row>=240 and pixel_row<248 else
conv_std_logic_vector(32,6) when pixel_column>=272 and pixel_column<280 and pixel_row>=240 and pixel_row<248 else
 "100000";
end architecture;

		  
						 			 
		 
						