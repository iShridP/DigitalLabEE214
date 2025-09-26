library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity nor_and is
port(a,b: in std_logic; output: out std_logic );
end nor_and;

architecture struct of nor_and is
signal s1,s2: std_logic;
Begin
g1: NOR_2 port map (a,a,s1);
g2: NOR_2 port map (b,b,s2);
g3: NOR_2 port map (s1,s2,output);
end struct;