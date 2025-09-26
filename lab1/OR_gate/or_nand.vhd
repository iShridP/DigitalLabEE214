library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity or_nand is
port(a,b : in std_logic ; output: out std_logic);
end or_nand;

architecture struct of or_nand is
signal a_or_temp, b_or_temp : std_logic;
begin 
g1: NAND_2 port map (a,a,a_or_temp);
g2: NAND_2 port map (b,b,b_or_temp);
g3: NAND_2 port map (a_or_temp, b_or_temp, output);
end struct;