--------------------------------------------------------------------------------

-- Author: Yan
-- displaced FSM
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity AXI_MASTER_IF is
    Port (
        clk : in STD_LOGIC;
        enable : in STD_LOGIC;
        test_in : in STD_LOGIC_VECTOR(7 downto 0);
        test_out : out STD_LOGIC_VECTOR(7 downto 0)
    );
end AXI_MASTER_IF;

architecture Behavioral of AXI_MASTER_IF is

    type T_STATE is (idle, busy);
    signal State : T_STATE := idle;
begin

    process (clk, enable)--write process
    begin
       
        case State is
            when idle =>
            test_out <=  (others => '0');    

            if (enable = '1') then
                State <= busy;
            end if;

            when busy =>
            test_out <=  test_in;    

        end case;
    end process;


end Behavioral;
