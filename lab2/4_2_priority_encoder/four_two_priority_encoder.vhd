library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity four_two_priority_encoder is
port(a,b,c,d : in std_logic ; y0,y1,v : out std_logic);
end four_two_priority_encoder;

architecture struct of four_two_priority_encoder is 
signal v_signal_1, v_signal_2, y0_signal_1,y0_signal_2 : std_logic;
begin
g1: OR_2 port map (a,b,v_signal_1);
g2: OR_2 port map (v_signal_1,c,v_signal_2);
g3: OR_2 port map (v_signal_2,d,v);
g4: NOR_2 port map (a,b,y0_signal_1);
g5: AND_2 port map (y0_signal_1,c,y0_signal_2);
g6: OR_2 port map (y0_signal_2,a,y0);
g7: OR_2 port map (a,b,y1);
end struct;
 
