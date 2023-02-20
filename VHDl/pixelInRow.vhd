library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pixelInRow is
port(
		pixelColomn: in std_logic_vector(9 downto 0); --used to know the distance from center
		currentTime: in std_logic_vector(5 downto 0); -- needs to be up to 15 (quarter of an hour/minute). the center of time is the start of a quarter 
		pixelPlacement: out std_logic_vector(9+16 downto 0)
);
end entity;
-- here we will preform a fixed point multiplaction with 16 bits
-- currentTime/15
architecture a of pixelInRow is
constant one_over_timeOfOneSide : unsigned(15 downto 0):=to_unsigned(4369,16);-- 2**16 / 15
constant centerPixel: unsigned(8 downto 0):=to_unsigned(320,8); -- half of the width of the screen (640p)
begin 
	pixelPlacement<= 
	std_logic_vector(
		to_unsigned(
			unsigned(shift_left(unsigned(pixelColomn)-unsigned(centerPixel),1)+1)
			*unsigned(currentTime)
			*one_over_timeOfOneSide
			,pixelPlacement'length
			)
	);
end architecture;
	