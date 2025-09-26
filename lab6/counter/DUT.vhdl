library ieee;
use ieee.std_logic_1164.all;

entity DUT is
   port(input_vector: in std_logic_vector(1 downto 0);
       	output_vector: out std_logic_vector(2 downto 0));
end entity;

architecture DutWrap of DUT is
	Component down_counter is
		port(CLOCK, RES : in std_logic;
			  Q_A,Q_B,Q_C   : out std_logic);
	end component down_counter;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: down_counter port map (CLOCK => input_vector(1), RES => input_vector(0),
											Q_C => output_vector(2), Q_B => output_vector(1), Q_A => output_vector(0));

end DutWrap;

