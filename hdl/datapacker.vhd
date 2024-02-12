library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;

entity data_packer is
    port (
        input_clk : in std_logic;  -- Clock input
        input_reset : in std_logic;  -- Reset input
        input_data : in std_logic_vector(31 downto 0);
        output_data : out std_logic_vector(511 downto 0);
        input_valid : in std_logic;
        address_out : out std_logic_vector(31 downto 0);
        output_ready : out std_logic
    );
end entity data_packer;

architecture Behavioral of data_packer is
    constant PACK_WIDTH : integer := 32;  -- Width of each input data
    constant PACK_limit : integer := 16;  -- Number of inputs to pack into output
    constant OUTPUT_WIDTH : integer := PACK_WIDTH * PACK_limit; -- Width of output data
    signal address : unsigned(31 downto 0) := x"5fffffc0";
    signal output_buffer : std_logic_vector(OUTPUT_WIDTH - 1 downto 0):= (others => '0');
    signal pack_count : unsigned (3 downto 0):= (others => '0');

begin

    packer: process(input_clk, input_reset)
    begin
        if input_reset = '1' then
            pack_count <= (others => '0');
        elsif rising_edge(input_clk) then
            if input_valid = '1' then
                output_buffer((to_integer(pack_count)*PACK_WIDTH + PACK_WIDTH - 1) downto to_integer(pack_count)*PACK_WIDTH) <= input_data;
                pack_count <= pack_count + 1;
            end if;
            
            if pack_count = PACK_limit-1 then
                output_ready <= '1';
            else 
                output_ready <= '0';
            end if;
          
        end if;
    end process;
    
    
    addresser: process(output_ready, input_reset)
    begin
        if input_reset = '1' then  
            address <= x"5fffffc0"; 
        elsif rising_edge(output_ready) then
            address <= address + 64;  
        end if;
    end process;

    output_data <= output_buffer when output_ready = '1' ;
    address_out <= std_logic_vector(address);
end architecture Behavioral;
