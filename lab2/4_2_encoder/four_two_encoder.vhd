library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity four_two_encoder is
port(a,b,c,d,en: in std_logic ; y0,y1 : out std_logic);
end four_two_encoder;

architecture struct of four_two_encoder is
signal b_signal,c_signal : std_logic;
begin 
g1: OR_2 port map (a,b,b_signal);
g2: OR_2 port map (a,c,c_signal);
g3: AND_2 port map (b_signal,en,y1);
g4: AND_2 port map (c_signal,en,y0);
end struct;
