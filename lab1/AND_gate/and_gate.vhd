library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity nand_gate is 
port(a,b :in std_logic; output: out std_logic);
end nand_gate;

architecture struct of nand_gate is
signal nand_val : std_logic;
begin
g1: NAND_2 port map (a,b,nand_val);
g2: NAND_2 port map (nand_val, nand_val, output);
end struct;
