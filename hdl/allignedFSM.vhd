--------------------------------------------------------------------------------

-- Author: Yan Gao
-- alligned FSM
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity read_control is
    Port ( 
        clk : in STD_LOGIC;
        enable : in STD_LOGIC;
        test_in : in STD_LOGIC_VECTOR(7 downto 0);
        test_out : out STD_LOGIC_VECTOR(7 downto 0)
    );
end read_control;

architecture Behavioral of read_control is
    type T_STATE is (idle, busy);
    signal State : T_STATE := idle;
    signal NextState : T_STATE := idle;
  
begin
    process(clk)
begin
  if rising_edge(clk) then
        State  <= NextState;
  end if;
end process;

process(State, enable)
begin
  case State is
    when idle =>
        test_out <=  (others => '0');    
        if (enable = '1') then
            NextState <= busy;
        end if;

    when busy =>
        test_out <=  test_in;    
  end case;
end process;

end Behavioral;
