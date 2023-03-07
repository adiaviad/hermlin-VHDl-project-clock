library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity pixelInRow is
port(
		pixelRow: in std_logic_vector(9 downto 0); --used to know the distance from center
		currentTime: in std_logic_vector(3 downto 0); -- needs to be up to 15 (quarter of an hour/minute). the center of time is the start of a quarter 
		pixelPlacement: out std_logic_vector(9 downto 0)
);
end entity;

-- here we will perform a fixed point multiplication with 16 bits
-- currentTime/15
architecture a of pixelInRow is
    constant one_over_timeOfOneSide : unsigned(15 downto 0) := to_unsigned(4369,16); -- 2**16 / 15
    constant centerPixel : unsigned(7 downto 0) := to_unsigned(320,8); -- half of the width of the screen (640p),
	 signal result : unsigned(29 downto 0);
	 signal pixelFromStartOfRow: unsigned(7 downto 0);
begin 
   result <= unsigned(shift_left(unsigned(pixelRow) - unsigned(centerPixel), 1) + 1) * unsigned(currentTime) *one_over_timeOfOneSide;
   pixelFromStartOfRow <= unsigned(result(29 downto 20)) ;
	pixelPlacement<=std_logic_vector(result(29 downto 20) +unsigned(centerPixel));
	--pixelPlacement<=pixelRow;
end architecture;
