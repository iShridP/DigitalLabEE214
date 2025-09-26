library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
use work.F2E.all; --4 to 2 encoder

entity eight_three_encoder_new is
port(y0,y1,y2,y3,y4,y5,y6,y7,en: in std_logic; a2,a1,a0: out std_logic);
end eight_three_encoder_new;

architecture struct of eight_three_encoder_new is
signal enable_high_1,enable_high_2,enable_high,a0_low,a1_low,a0_high,a1_high,a2_e,w2 : std_logic;
begin

g4: OR_2 port map (y4,y5,enable_high_1);
g5: OR_2 port map (enable_high_1,y6,enable_high_2);
g6: OR_2 port map (enable_high_2,y7,a2_e);
g7: FOUR_TWO_ENCODER port map (y3,y2,y1,y0,en,a0_low,a1_low);
g8: FOUR_TWO_ENCODER port map (y7,y6,y5,y4,en,a0_high,a1_high);
g10: OR_2 port map (a0_low,a0_high,a0);
g11: OR_2 port map (a1_low,a1_high,a1);
g14: FOUR_TWO_ENCODER port map ('0','0',a2_e,'0',en,a2,w2);
end struct;