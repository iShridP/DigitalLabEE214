library ieee;
use ieee.std_logic_1164.all;

entity D_flip_flop is
    Port (clk, set, reset, D: in  std_logic;  Q,Qbar: out std_logic);
end D_flip_flop;

architecture struct of D_flip_flop is
    signal Q_int : std_logic := '0';
begin
    process(clk, reset, set) --whenever smthing here changes trigger the process
    begin
        if (reset = '1') then
            Q_int <= '1'; -- force Q 0
        elsif (set = '1') then
            Q_int <= '1'; -- force Q 1
        elsif rising_edge(clk) then
            Q_int <= D; -- rising edge and set reset both 0 then set Q to D
        end if;
    end process;
    Q    <= Q_int;
    Qbar <= not Q_int;
end struct;
