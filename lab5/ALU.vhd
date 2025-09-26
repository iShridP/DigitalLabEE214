library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is
	port (
		S : in std_logic_vector(1 downto 0);
		A : in std_logic_vector(3 downto 0);
		B : in std_logic_vector(3 downto 0);
		Y : out std_logic_vector(7 downto 0)
	);
end entity;

architecture arch of alu is

	function Shift(A, B : std_logic_vector(3 downto 0)) return std_logic_vector is
		variable A_extended : std_logic_vector(7 downto 0) := (others => '0'); -- extend A to 8 bits
		variable shift_amount : integer := to_integer(unsigned(B(2 downto 0))); -- shift amount = first 3 bits of B
		variable result : std_logic_vector(7 downto 0); --return result
			
	begin
		A_extended(3 downto 0) := A;
		if B(3) = '0' then -- left shift condition
			result := std_logic_vector(shift_left(unsigned(A_extended), shift_amount));
			
		elsif B(3) = '1' then --right shift condition
			result := std_logic_vector(shift_right(unsigned(A_extended), shift_amount));
			
		end if;
		return result;
	end function;


begin
    process(S, A, B)
        variable ab_con   : std_logic_vector(7 downto 0);
        variable prod     : unsigned(7 downto 0);
        variable temp_A       : unsigned(7 downto 0);
        variable temp_B       : unsigned(3 downto 0);
        variable sum     : integer;
        variable ones_value, tens_value  : unsigned(3 downto 0);
    begin
	 
        if S = "00" then --shift functions
            Y <= Shift(A, B);

        elsif S = "01" then --concatenate and then twos complement (negative of signed form)
            ab_con := A & B;
            Y <= std_logic_vector(-signed(ab_con));

        elsif S = "10" then
            
            sum := to_integer(unsigned(A)) + to_integer(unsigned(B));
            ones_value := to_unsigned(sum mod 10, 4);
            tens_value := to_unsigned(sum / 10, 4);

            Y <= std_logic_vector(tens_value & ones_value); --Y = concatenate tens and ones value

        elsif S = "11" then
            -- in each step add temp_A if the ith position B is 1.
            prod := (others => '0');
            temp_A   := unsigned("0000" & A);--A to 8 bits
            temp_B   := unsigned(B);

            for i in 0 to 3 loop
                if temp_B(i) = '1' then
                    prod := prod + shift_left(temp_A, i);
                end if;
            end loop;
            Y <= std_logic_vector(prod);
			end if;
    end process;
end architecture;
 