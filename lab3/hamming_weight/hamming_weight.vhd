library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity hamming_weight is
port(x4,x3,x2,x1,x0 : in std_logic ; y : out std_logic);
end hamming_weight;

architecture struct of hamming_weight is 
signal x14_xor, x23_xor, x14_23_and, term1, x03_xor, not_x2, x1n2_and, x03_12_and, term2, x01_xor, not_x4, x01_4_and, x01_4_3_and, term3, term_12, 
not_x0, x13_xor, x13n0_and, x13n0_2_and, term2_orterm: std_logic;
begin
g1: XOR_2 port map (x1,x4, x14_xor);
g2: XOR_2 port map (x2,x3, x23_xor);
g3: AND_2 port map (x14_xor,x23_xor,x14_23_and);
g4: AND_2 port map (x14_23_and,x0, term1);
g5: XOR_2 port map (x0,x3, x03_xor);
g6: INVERTER port map (x2, not_x2);
g7: AND_2 port map (not_x2, x1, x1n2_and);
g8: AND_2 port map (x1n2_and, x03_xor, x03_12_and);
g9: INVERTER port map (x0, not_x0);
g10: XOR_2 port map (x1,x3,x13_xor);
g11: AND_2 port map (x13_xor, not_x0, x13n0_and);
g12: AND_2 port map (x13n0_and, x2, x13n0_2_and);
g13: OR_2 port map (x03_12_and, x13n0_2_and, term2_orterm);
g14: AND_2 port map (term2_orterm, x4, term2);
g15: XOR_2 port map (x0, x1, x01_xor);
g16: INVERTER port map (x4, not_x4);
g17: AND_2 port map (not_x4, x01_xor, x01_4_and);
g18: AND_2 port map (x01_4_and, x3, x01_4_3_and);
g19: AND_2 port map (x01_4_3_and, x2, term3);
g20: OR_2 port map (term1, term2, term_12);
g21: OR_2 port map (term_12, term3, y);
end struct;