library ieee;
use ieee.std_logic_1164.all;
Entity  myTemplate is
Port (
		Clock,Reset : in std_logic;
		Y	    : out std_logic
);
End entity;

Architecture arch_template of myTemplate is 
Begin 
	Process(Clock,Reset)
	Begin 
		--no code here
		If (Reset='0') then 
			--reset only
		Elsif (Rising_edge(Clock)) then
			--code here
		End If;
		--only very specific code
	End process;
End Architecture;
