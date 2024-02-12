library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;

entity dummypacker is
    port (
        input_clk : in std_logic;  -- Clock input
        input_reset : in std_logic;  -- Reset input
        input_valid : in std_logic;  
        address_out : out std_logic_vector(31 downto 0);
        output_ready : out std_logic
    );
end entity dummypacker;

architecture Behavioral of dummypacker is

    signal address : unsigned(31 downto 0) := x"5fffffc0";
    signal output_buffer : std_logic_vector(63 downto 0):= x"0123456789abcdef";

begin

    
    addresser: process(output_ready, input_reset)
    begin
        if input_reset = '1' then  
            address <= x"5fffffc0"; 
        elsif rising_edge(output_ready) then
            address <= address + 64;  
        end if;
    end process;
    
    
    address_out <= std_logic_vector(address);
end architecture Behavioral;
