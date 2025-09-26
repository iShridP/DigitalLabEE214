library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

package F2E is
	--custom 4-2 encoder:
  component FOUR_TWO_ENCODER is 
  port(a,b,c,d,en: in std_logic ; y0,y1 : out std_logic);
  end component FOUR_TWO_ENCODER;
  
end package F2E;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity FOUR_TWO_ENCODER is
port(a,b,c,d,en: in std_logic ; y0,y1 : out std_logic);
end FOUR_TWO_ENCODER;

architecture Equations of FOUR_TWO_ENCODER is
begin
   y0 <= en and (a or c);
	y1 <= en and (a or b);
end Equations;