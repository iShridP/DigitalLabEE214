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
port(L: in std_logic ; b: in std_logic_vector(2 downto 0); a: in std_logic_vector(7 downto 0); s: out std_logic_vector(7 downto 0));
end entity universal_rotator;

architecture struct of universal_rotator is

signal A_r: std_logic_vector(7 downto 0);
signal A_4: std_logic_vector(7 downto 0);
signal A_4_2: std_logic_vector(7 downto 0);
signal A_4_2_1: std_logic_vector(7 downto 0);

--component MUX

component MUX_2_1
    port (
        A, B, S : in  std_logic;
        O       : out std_logic
    );
end component;


begin
--L

reverse1: for i in 0 to 7 generate
check: MUX_2_1 port map(A => a(i), B => a(7-i), S => L, O => A_r(i));
end generate reverse1;

--B2

rot4_bit : for i in 0 to 7 generate
lsb: if i > 3 generate
b2: MUX_2_1 port map(A => A_r(i), B => A_r(i-4), S => b(2), O => A_4(i));
end generate lsb;
msb: if i < 4 generate
b2: MUX_2_1 port map(A => A_r(i), B => A_r(i+4), S => b(2), O => A_4(i));
end generate msb;
end generate;

--B1

rot2_bit : for i in 0 to 7 generate
lsb: if i > 5 generate
b1: MUX_2_1 port map(A => A_4(i), B => A_4(i-6), S => b(1), O => A_4_2(i));
end generate lsb;
msb: if i < 6 generate
b1: MUX_2_1 port map(A => A_4(i), B => A_4(i+2), S => b(1), O => A_4_2(i));
end generate msb;
end generate;

--B0

rot1_bit : for i in 0 to 7 generate
lsb: if i > 6 generate
b0: MUX_2_1 port map(A => A_4_2(i), B => A_4_2(i-7), S => b(0), O => A_4_2_1(i));
end generate lsb;
msb: if i < 7 generate
b0: MUX_2_1 port map(A => A_4_2(i), B => A_4_2(i+1), S => b(0), O => A_4_2_1(i));
end generate msb;
end generate;

--L

reverse2: for i in 0 to 7 generate
check2: MUX_2_1 port map(A => A_4_2_1(i), B => A_4_2_1(7-i), S => L, O => s(i));
end generate reverse2;

end struct;