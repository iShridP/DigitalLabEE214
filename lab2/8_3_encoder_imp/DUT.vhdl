-- A DUT entity is used to wrap your design so that we can combine it with testbench.
-- This example shows how you can do this for the OR Gate

library ieee;
use ieee.std_logic_1164.all;
-- two input two output
entity DUT is
    port(input_vector: in std_logic_vector(8 downto 0);
       	output_vector: out std_logic_vector(2 downto 0));
end entity;

architecture DutWrap of DUT is
   component eight_three_encoder_new is
     port(y7,y6,y5,y4,y3,y2,y1,y0,en: in std_logic;
         a2,a1,a0: out std_logic);
   end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: eight_three_encoder_new
			port map (
					-- order of inputs B A
					en => input_vector(0),
					y0 => input_vector(1),
					y1 => input_vector(2),
					y2 => input_vector(3),
					y3 => input_vector(4),
					y4 => input_vector(5),
					y5 => input_vector(6),
					y6 => input_vector(7),
					y7 => input_vector(8),
               -- order of output
					a2 => output_vector(2),
					a1 => output_vector(1),
					a0 => output_vector(0));
end DutWrap;