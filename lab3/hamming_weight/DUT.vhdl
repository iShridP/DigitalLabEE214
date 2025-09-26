-- A DUT entity is used to wrap your design so that we can combine it with testbench.
-- This example shows how you can do this for the OR Gate

library ieee;
use ieee.std_logic_1164.all;

entity DUT is
    port(input_vector: in std_logic_vector(4 downto 0);
       	output_vector: out std_logic_vector(0 downto 0));
end entity;

architecture DutWrap of DUT is
   component hamming_weight is
     port(X4,X3,X2,X1,X0: in std_logic;
         Y: out std_logic);
   end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: hamming_weight
			port map (
					-- order of inputs B A
					X0 => input_vector(0),
					X1 => input_vector(1),
					X2 => input_vector(2),
					X3 => input_vector(3),
					X4 => input_vector(4),
               -- order of output OUTPUT
					Y => output_vector(0));
end DutWrap;