library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all; 
entity VGA_Controller is
port(
	pixel_column : in std_logic_vector(9 downto 0);
	pixel_row : in std_logic_vector(9 downto 0);
	digit1,digit2,digit3,digit4 : in std_logic_vector(3 downto 0);
	i,j: in std_logic_vector(9 downto 0);
	letter : out std_logic_vector(5 downto 0));
	
end entity;

architecture arch_VGA_Controller of VGA_Controller is
begin
		letter<=
		   (digit1 xor conv_std_logic_vector(48,6)) when pixel_column>=(0+i) and pixel_column<(8+i)  and pixel_row>=(0+j) and pixel_row<(8+j) else
			(digit2 xor conv_std_logic_vector(48,6)) when pixel_column>=(8+i) and pixel_column<(16+i)  and pixel_row>=(0+j) and pixel_row<(8+j) else
			"111111" when pixel_column>=(16+i) and pixel_column<(24+i)  and pixel_row>=(0+j) and pixel_row<(8+j) else
			(digit3 xor conv_std_logic_vector(48,6)) when pixel_column>=(24+i) and pixel_column<(32+i)  and pixel_row>=(0+j) and pixel_row<(8+j) else
			(digit4 xor conv_std_logic_vector(48,6)) when pixel_column>=(32+i) and pixel_column<(40+i)  and pixel_row>=(0+j) and pixel_row<(8+j) else
			"100000";
end architecture;

		  
						 			 
		 
						