library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity MUX_2_1 is 
port(A,B,S : in std_logic ; O : out std_logic);
end entity MUX_2_1;

architecture logic of MUX_2_1 is
begin
O <= (A and (not S)) or (B and S);
end architecture logic;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity universal_rotator is
port(L, B2, B1, B0, A7, A6, A5, A4, A3, A2, A1, A0: in std_logic ; S7, S6, S5, S4, S3, S2, S1, S0: out std_logic);
end entity universal_rotator;

architecture struct of universal_rotator is
signal A7_1, A6_1, A5_1, A4_1, A3_1, A2_1, A1_1, A0_1, 
A7_4, A6_4, A5_4, A4_4, A3_4, A2_4, A1_4, A0_4,
A7_4_2, A6_4_2, A5_4_2, A4_4_2, A3_4_2, A2_4_2, A1_4_2, A0_4_2,
A7_4_2_1, A6_4_2_1, A5_4_2_1, A4_4_2_1, A3_4_2_1, A2_4_2_1, A1_4_2_1, A0_4_2_1: std_logic;

--component MUX

component MUX_2_1
    port (
        A, B, S : in  std_logic;
        O       : out std_logic
    );
end component;


begin
--L
g1: MUX_2_1 port map (A => A7, B => A0, S => L, O => A7_1);
g2: MUX_2_1 port map (A => A6, B => A1, S => L, O => A6_1);
g3: MUX_2_1 port map (A => A5, B => A2, S => L, O => A5_1);
g4: MUX_2_1 port map (A => A4, B => A3, S => L, O => A4_1);
g5: MUX_2_1 port map (A => A3, B => A4, S => L, O => A3_1);
g6: MUX_2_1 port map (A => A2, B => A5, S => L, O => A2_1);
g7: MUX_2_1 port map (A => A1, B => A6, S => L, O => A1_1);
g8: MUX_2_1 port map (A => A0, B => A7, S => L, O => A0_1);
--B2
g9: MUX_2_1 port map (A => A7_1, B => A3_1, S => B2, O => A7_4);
g10: MUX_2_1 port map (A => A6_1, B => A2_1, S => B2, O => A6_4);
g11: MUX_2_1 port map (A => A5_1, B => A1_1, S => B2, O => A5_4);
g12: MUX_2_1 port map (A => A4_1, B => A0_1, S => B2, O => A4_4);
g13: MUX_2_1 port map (A => A3_1, B => A7_1, S => B2, O => A3_4);
g14: MUX_2_1 port map (A => A2_1, B => A6_1, S => B2, O => A2_4);
g15: MUX_2_1 port map (A => A1_1, B => A5_1, S => B2, O => A1_4);
g16: MUX_2_1 port map (A => A0_1, B => A4_1, S => B2, O => A0_4);
--B1
g17: MUX_2_1 port map (A => A7_4, B => A1_4, S => B1, O => A7_4_2);
g18: MUX_2_1 port map (A => A6_4, B => A0_4, S => B1, O => A6_4_2);
g19: MUX_2_1 port map (A => A5_4, B => A7_4, S => B1, O => A5_4_2);
g20: MUX_2_1 port map (A => A4_4, B => A6_4, S => B1, O => A4_4_2);
g21: MUX_2_1 port map (A => A3_4, B => A5_4, S => B1, O => A3_4_2);
g22: MUX_2_1 port map (A => A2_4, B => A4_4, S => B1, O => A2_4_2);
g23: MUX_2_1 port map (A => A1_4, B => A3_4, S => B1, O => A1_4_2);
g24: MUX_2_1 port map (A => A0_4, B => A2_4, S => B1, O => A0_4_2);
--B0
g25: MUX_2_1 port map (A => A7_4_2, B => A0_4_2, S => B0, O => A7_4_2_1);
g26: MUX_2_1 port map (A => A6_4_2, B => A7_4_2, S => B0, O => A6_4_2_1);
g27: MUX_2_1 port map (A => A5_4_2, B => A6_4_2, S => B0, O => A5_4_2_1);
g28: MUX_2_1 port map (A => A4_4_2, B => A5_4_2, S => B0, O => A4_4_2_1);
g29: MUX_2_1 port map (A => A3_4_2, B => A4_4_2, S => B0, O => A3_4_2_1);
g30: MUX_2_1 port map (A => A2_4_2, B => A3_4_2, S => B0, O => A2_4_2_1);
g31: MUX_2_1 port map (A => A1_4_2, B => A2_4_2, S => B0, O => A1_4_2_1);
g32: MUX_2_1 port map (A => A0_4_2, B => A1_4_2, S => B0, O => A0_4_2_1);
--L
g33: MUX_2_1 port map (A => A7_4_2_1, B => A0_4_2_1, S => L, O => S7);
g34: MUX_2_1 port map (A => A6_4_2_1, B => A1_4_2_1, S => L, O => S6);
g35: MUX_2_1 port map (A => A5_4_2_1, B => A2_4_2_1, S => L, O => S5);
g36: MUX_2_1 port map (A => A4_4_2_1, B => A3_4_2_1, S => L, O => S4);
g37: MUX_2_1 port map (A => A3_4_2_1, B => A4_4_2_1, S => L, O => S3);
g38: MUX_2_1 port map (A => A2_4_2_1, B => A5_4_2_1, S => L, O => S2);
g39: MUX_2_1 port map (A => A1_4_2_1, B => A6_4_2_1, S => L, O => S1);
g40: MUX_2_1 port map (A => A0_4_2_1, B => A7_4_2_1, S => L, O => S0);
end struct;