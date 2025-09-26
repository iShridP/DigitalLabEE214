library ieee;
use ieee.std_logic_1164.all;

entity down_counter is
port(clock, res : in std_logic; Q_c,Q_b,Q_a : out std_logic);
end down_counter;

architecture struct of down_counter is
signal Qa, Qb, Qc: std_logic;
signal Da, Db, Dc: std_logic;

begin

g1: entity work.D_flip_flop port map (clk => clock, set => '0', reset => res, D => Da, Q => Qa, Qbar => Da);
g2: entity work.D_flip_flop port map (clk => Qa, set => '0', reset => res, D => Db, Q => Qb, Qbar => Db);
g3: entity work.D_flip_flop port map (clk => Qb, set => '0', reset => res, D => Dc, Q => Qc, Qbar => Dc);
Q_a <= Qa;
Q_b <= Qb;
Q_c <= Qc;
end struct;
