-- A DUT entity is used to wrap your design so that we can combine it with testbench.
-- This example shows how you can do this for the OR Gate

library ieee;
use ieee.std_logic_1164.all;

entity DUT is
    port(input_vector: in std_logic_vector(11 downto 0);
       	output_vector: out std_logic_vector(7 downto 0));
end entity;

architecture DutWrap of DUT is
   component Universal_Rotator is
     port(
			L: in std_logic;
			B: in std_logic_vector(2 downto 0);
			A: in std_logic_vector(7 downto 0);
         S: out std_logic_vector(7 downto 0)
			);
   end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: Universal_Rotator
			port map (
					-- order of inputs B A
					A(0) => input_vector(0),
					A(1) => input_vector(1),
					A(2) => input_vector(2),
					A(3) => input_vector(3),
					A(4) => input_vector(4),
					A(5) => input_vector(5),
					A(6) => input_vector(6),
					A(7) => input_vector(7),
					B(0) => input_vector(8),
					B(1) => input_vector(9),
					B(2) => input_vector(10),
					L => input_vector(11),
               -- order of output OUTPUT
					S(0) => output_vector(0),
					S(1) => output_vector(1),
					S(2) => output_vector(2),
					S(3) => output_vector(3),
					S(4) => output_vector(4),
					S(5) => output_vector(5),
					S(6) => output_vector(6),
					S(7) => output_vector(7)
					);
end DutWrap;