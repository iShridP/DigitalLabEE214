library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity full_adder is
port (a,b,c : in std_logic ; sum,carry : out std_logic);
end full_adder;

architecture struct of full_adder is
signal carry_signal, sum_signal,and_carry_signal : std_logic;
begin
g1: XOR_2 port map (a,b,sum_signal);
g2: XOR_2 port map (sum_signal,c,sum);
g3: NAND_2 port map (a,b,and_carry_signal);
g4: NAND_2 port map (sum_signal, c, carry_signal);
g5: NAND_2 port map (and_carry_signal, carry_signal, carry);
end struct;