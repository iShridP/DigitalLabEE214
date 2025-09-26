-- A DUT entity is used to wrap your design so that we can combine it with testbench.
-- This example shows how you can do this for the OR Gate

library ieee;
use ieee.std_logic_1164.all;
-- two input two output
entity DUT is
    port(input_vector: in std_logic_vector(3 downto 0);
       	output_vector: out std_logic_vector(2 downto 0));
end entity;

architecture DutWrap of DUT is
   component four_two_priority_encoder is
     port(A,B,C,D: in std_logic;
         y1,y0,v: out std_logic);
   end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: four_two_priority_encoder 
			port map (
					-- order of inputs B A
					D => input_vector(0),
					C => input_vector(1),
					B => input_vector(2),
					A => input_vector(3),
               -- order of output
					y1 => output_vector(2),
					y0 => output_vector(1),
					v => output_vector(0));
end DutWrap;