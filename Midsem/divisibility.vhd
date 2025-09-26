library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

--define a MUX 2x1 for usage
entity mux_2_1 is
port(A_m,B_m,S_m: in std_logic; O_m: out std_logic);
end mux_2_1;

architecture struct of mux_2_1 is
signal not_S_m, and_1, and_2: std_logic;
begin
g1: entity work.INVERTER port map (S_m, not_S_m);
g2: entity work.AND_2 port map (A_m, not_S_m, and_1);
g3: entity work.AND_2 port map (B_m, S_m, and_2);
g4: entity work.OR_2 port map (and_1,and_2,O_m);
end struct;
--

--define MUX 4x1 for usage
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity mux_4_1 is
port(A_4m, B_4m, C_4m, D_4m, S_1_m, S_2_m: in std_logic; O_4m: out std_logic);
end mux_4_1;

architecture struct of mux_4_1 is
signal mux_temp_1,mux_temp_2: std_logic;

component mux_2_1
	port(
	A_m,B_m,S_m: in std_logic; 
	O_m: out std_logic
	);
end component;

begin
g1: mux_2_1 port map (A_4m, B_4m, S_2_m, mux_temp_1);
g2: mux_2_1 port map (C_4m, D_4m, S_2_m, mux_temp_2);
g3: mux_2_1 port map (mux_temp_1, mux_temp_2, S_1_m, O_4m);
end struct;
--

--Implement divisibility test with above mux-es and gates.
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity divisibility is 
port(F: in std_logic; X: in std_logic_vector(4 downto 0); Y: out std_logic);
end divisibility;

architecture struct of divisibility is
signal not_A,not_B,not_C,not_D,not_E,not_F :std_logic;
signal not_A_and_not_B, a_and_b, not_a_and_b,a_and_not_b: std_logic;
signal not_a_b_mux: std_logic;

signal five_not_e, five_e, five:std_logic;
signal three_not_e,three_e, three:std_logic;

--A = X(4), B = X(3), C = X(2), D = X(1), E = X(0)

component mux_2_1
	port(
	A_m,B_m,S_m: in std_logic; 
	O_m: out std_logic
	);
end component;

component mux_4_1
	port(
	A_4m, B_4m, C_4m, D_4m, S_1_m, S_2_m: in std_logic;
	O_4m: out std_logic
	);
end component;

begin
--take not for use cases later
g1: entity work.INVERTER port map (X(4),not_A);
g2: entity work.INVERTER port map (X(3),not_B);
--and for mux
g3: entity work.AND_2 port map(X(4),X(3),a_and_b);
g4: entity work.AND_2 port map(X(4),not_B,a_and_not_b);
g5: entity work.AND_2 port map(not_A,X(3),not_a_and_b);
g6: entity work.AND_2 port map(not_A,not_B,not_a_and_not_b);
--mux for E = 0 case and E = 1 case for F =0
g7: mux_4_1 port map(not_a_and_not_b, not_a_and_b, a_and_not_b,a_and_b, X(2),X(1),five_not_e);
g8: mux_4_1 port map(a_and_b, '0', not_a_and_not_b, not_a_and_b,X(2),X(1),five_e);
g9: mux_2_1 port map(five_not_e, five_e, X(0),five);
--mux for E = 0 case and E = 1 case for F =1
g10: mux_2_1 port map(not_a,X(4),X(3),not_a_b_mux);
g11: mux_4_1 port map(not_a_b_mux,a_and_not_b,not_a_and_b,not_a_b_mux,X(2),X(1), three_not_e);
g12: mux_4_1 port map(not_a_and_b, not_a_b_mux,a_and_not_b,not_a_and_b,X(2),X(1),three_e);
g13: mux_2_1 port map(three_not_e, three_e, X(0), three);
--finally take mux 2x1 with control bit F
g14: mux_2_1 port map(five,three,F,Y);
end struct;



