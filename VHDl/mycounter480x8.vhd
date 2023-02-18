library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; 
entity mycounter480x8 is
port(
	clock,reset,CE : in std_logic;
	Q :out std_logic_vector(9 downto 0)
);
end entity;

architecture arch_counter7 of mycounter480x8 is
Begin 
	Process(Clock, reset)
	variable tempQ: std_logic_vector(9 downto 0);
	--how many clocks should will it take the counter to from start to finish.
	--	when counting up the counter will count to this number; when down to this number.
	Begin 
			if(reset='1')then 
				tempQ:="0000000000";
			elsif(rising_edge(clock) and CE='1') then 
					tempQ:=tempQ+8;
					if(tempQ>480) then 
						tempQ:="0000000000";
					end if;
			end if;
			Q<=tempQ;
	end Process;
end architecture;	
	
				