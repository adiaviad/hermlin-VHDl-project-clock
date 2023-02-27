library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity VGA_Controller is
port(
    pixel_column,pixel_row : in std_logic_vector(9 downto 0);--reference frame is the edge of the screen 
    wanted_pixel_in_column,wanted_pixel_in_row : in std_logic_vector(9 downto 0); -- reference frame is the edge of the square clock 
    quarter : in std_logic_vector(1 downto 0);-- 10.5 to 1.5 is 0 up ; 1.5 to 4.5 is 1 right ; 4.5 to 7.5 is 2 down ; 7.5 to 10.5 is 3 left; 
    color : out std_logic
);
end entity;

architecture arch_VGA_Controller of VGA_Controller is
constant halfSideOfClockSquare: unsigned(6 downto 0) := to_unsigned(75, 7);
constant centerPixelRow: unsigned(8 downto 0) := to_unsigned(320, 9);
constant centerPixelColumn: unsigned(7 downto 0) := to_unsigned(240, 8);
constant pixelSize: unsigned(1 downto 0) := to_unsigned(3, 2);
 signal insideTheClock : std_logic;
begin
    insideTheClock <= '1' when (unsigned(centerPixelRow-halfSideOfClockSquare) <= unsigned(pixel_row)) and (unsigned(centerPixelRow+halfSideOfClockSquare) > unsigned(pixel_row))
                         and (unsigned(centerPixelColumn-halfSideOfClockSquare) <= unsigned(pixel_column)) and (unsigned(centerPixelColumn+halfSideOfClockSquare) > unsigned(pixel_column))
								else '0';

    color <= '0' when insideTheClock='0' else
             '1' when (quarter="00") and (wanted_pixel_in_row=pixel_row) and (unsigned(pixel_row)>=centerPixelRow) and insideTheClock='1' else
             '1' when (quarter="01") and (wanted_pixel_in_column=pixel_column) and (unsigned(pixel_column)>=centerPixelColumn) and insideTheClock='1' else
             '1' when (quarter="10") and (wanted_pixel_in_row=pixel_row) and (unsigned(pixel_row)<=centerPixelRow) and insideTheClock='1' else
             '1' when (quarter="11") and (wanted_pixel_in_column=pixel_column) and (unsigned(pixel_column)<=centerPixelColumn) and insideTheClock='1' else
             '0';
end architecture;
