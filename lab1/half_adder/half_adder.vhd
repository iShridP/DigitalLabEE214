library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity half_adder is
port (a,b : in std_logic ; sum,carry : out std_logic);
end half_adder;

architecture struct of half_adder is
signal carry_signal : std_logic;
begin
g1: XOR_2 port map (a,b,sum);
g2: NAND_2 port map (a,b,carry_signal);
g3: NAND_2 port map (carry_signal, carry_signal, carry);
end struct;