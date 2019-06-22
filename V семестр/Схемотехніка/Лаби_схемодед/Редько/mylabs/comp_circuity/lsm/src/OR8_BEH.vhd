
library IEEE;

use IEEE.STD_LOGIC_1164.all;

architecture OR8_BEH of OR8_SC is
begin
	
	Z <= D(7) or D(6) or D(5) or D(4) or D(3) or D(2) or D(1) or D(0);

end OR8_BEH;