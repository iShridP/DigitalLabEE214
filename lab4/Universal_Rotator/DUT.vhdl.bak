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
     port(L,B2,B1,B0,A7,A6,A5,A4,A3,A2,A1,A0: in std_logic;
         S7,S6,S5,S4,S3,S2,S1,S0: out std_logic);
   end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: Universal_Rotator
			port map (
					-- order of inputs B A
					A0 => input_vector(0),
					A1 => input_vector(1),
					A2 => input_vector(2),
					A3 => input_vector(3),
					A4 => input_vector(4),
					A5 => input_vector(5),
					A6 => input_vector(6),
					A7 => input_vector(7),
					B0 => input_vector(8),
					B1 => input_vector(9),
					B2 => input_vector(10),
					L => input_vector(11),
               -- order of output OUTPUT
					S0 => output_vector(0),
					S1 => output_vector(1),
					S2 => output_vector(2),
					S3 => output_vector(3),
					S4 => output_vector(4),
					S5 => output_vector(5),
					S6 => output_vector(6),
					S7 => output_vector(7)
					);
end DutWrap;