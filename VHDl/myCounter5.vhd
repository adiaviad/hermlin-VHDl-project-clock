library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
Entity myCounter5 is
Port (
			clock,reset,CE : in std_logic;
			Cout : out std_logic;
			Q : out std_logic_vector(3 downto 0)
);
end entity;
architecture arc_counter of myCounter5 is
begin 
	process(clock, reset)
	variable countTo: std_logic_vector(3 downto 0):="0101";
	variable tempQ: std_logic_vector( 3 downto 0);
	begin 
		if(reset='0') then 
			tempQ:="0000";
			Cout<='0';
		elsif(Rising_edge(clock) and CE='1' ) then 
			if(tempQ=countTo) then 
				tempQ:="0000";
			else
				tempQ:=tempQ+1;
			end if;
		end if;
		if(tempQ=countTo)then 
			Cout<='1';
		end if;
		Q<=tempQ;
	end process;
end architecture;
				
