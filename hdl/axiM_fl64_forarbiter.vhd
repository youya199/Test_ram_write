--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: axi_master_2.vhd
-- File history:
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--
-- <Description here>zan
--
-- Targeted device: <Family::PolarFire> <Die::MPF300TS> <Package::FCG1152>
-- Author: Florian Kreiner
--
--------------------------------------------------------------------------------
library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity aM_fl64_fa is
port (

        --module specific
        i_clk : in std_logic;
        i_rstn : in std_logic;
        i_start_write : in std_logic;
        i_start_read : in std_logic;
        -- r/w addr
        i_rd_addr : in std_logic_vector(31 downto 0);
        i_wrt_addr : in std_logic_vector(31 downto 0);
        -- transfer size-- number of bursts
        i_write_transfer_size : in std_logic_vector(9 downto 0);
        i_read_transfer_size : in std_logic_vector(9 downto 0);
        -- wr data in and data request
        i_data : in std_logic_vector(63 downto 0);
        o_data_req : out std_logic;
        -- r data out and data valid
        o_data : out std_logic_vector(63 downto 0);
        o_data_valid : out std_logic;

        -- basic state out of core
        o_ready : out std_logic;
        
        -- AXI 3
        --axi write address
        AWID : out std_logic_vector(3 downto 0);
        AWADDR : out std_logic_vector(31 downto 0);
        AWLEN : out std_logic_vector(7 downto 0);
        AWSIZE : out std_logic_vector(2 downto 0);
        AWLOCK : out std_logic_vector(1 downto 0);
        AWBURST : out std_logic_vector(1 downto 0);
        AWVALID : out std_logic;
        AWREADY : in std_logic;

        --axi write data
        WSTRB : out std_logic_vector(7 downto 0);
        WLAST : out std_logic;
        WVALID : out std_logic;
        WDATA : out std_logic_vector(63 downto 0);
        WREADY : in std_logic;

        --axi write response channel
        BID : in std_logic_vector(3 downto 0);
        BRESP : in std_logic_vector(1 downto 0);
        BVALID : in std_logic;
        BREADY : out std_logic;

        --axi read address
        ARID : out std_logic_vector(3 downto 0);
        ARADDR : out std_logic_vector(31 downto 0);
        ARLEN : out std_logic_vector(7 downto 0);
        ARSIZE : out std_logic_vector(2 downto 0);
        ARLOCK : out std_logic_vector(1 downto 0);
        ARBURST : out std_logic_vector(1 downto 0);
        ARVALID : out std_logic;
        ARREADY : in std_logic;

        --axi read data
        RDATA : in std_logic_vector(63 downto 0);
        RLAST : in std_logic;
        RVALID : in std_logic;
        RREADY : out std_logic;
        RID : in std_logic_vector(3 downto 0);
        RRESP : in std_logic_vector(1 downto 0);
        
        --usused axi ports
        ARCACHE : out std_logic_vector(3 downto 0);
        ARPROT : out std_logic_vector(2 downto 0);
        AWCACHE : out std_logic_vector(3 downto 0);
        AWPROT : out std_logic_vector(2 downto 0)
);
end aM_fl64_fa;





architecture architecture_aM_fl64_fa of aM_fl64_fa is
    
    type write_fsm_states is (idle, req, wrt, resp);
    signal write_fsm_state : write_fsm_states;
    
    type read_addr_fsm_states is (idle, rd, wait_for_end);
    signal read_addr_fsm_state : read_addr_fsm_states;
    
    type read_data_fsm_states is (idle, rd);
    signal read_data_fsm_state : read_data_fsm_states;
    
    signal s_write_beat_count : integer range 0 to 256;
    signal s_read_transfer_count : integer range 0 to 256;
    signal s_read_transfer_size : integer range 0 to 256;
    signal s_read_transfer_sent : integer range 0 to 256;
    signal s_write_transfer_count : integer range 0 to 256;
    signal s_write_transfer_size : integer range 0 to 256;
    signal s_addr : std_logic_vector(31 downto 0);
    signal s_WDATA : std_logic_vector(63 downto 0);
    
    signal s_read_in_progress : std_logic := '0';
    signal s_write_in_progress : std_logic:= '0';
    
    signal s_data : std_logic_vector(63 downto 0);
    signal s_data_req : std_logic;
    signal s_data_valid : std_logic;
    
begin

write_channel : process(all)
begin
    if rising_edge(i_clk) then
        if i_rstn = '0' then
            AWADDR <= (others => '0');
            WDATA <= (others => '0');
            AWSIZE <= (others => '0');
            AWBURST <= (others => '0');
            WSTRB <= (others => '0');
            s_addr <= (others => '0');
            s_WDATA <= (others => '0');
            
            AWVALID  <= '0';
            WVALID <= '0';
            WLAST <= '0';
            s_write_beat_count <= 0;
            s_write_transfer_count <= 0;
            write_fsm_state <= idle;
            s_write_transfer_size <= 0;
            s_write_in_progress <= '0';
        else
            s_WDATA <= i_data;
            case write_fsm_state is
                when idle =>
                    if i_start_write = '1' then --or ((s_write_transfer_count /= 0) and (s_write_transfer_count /= s_write_transfer_size)) then
                        AWSIZE <= "011";-- 8 bytes per beat, (64bits)
                        AWBURST <= "01";--incrementing address
                        AWADDR <= i_wrt_addr;
                        AWVALID <= '1';
                        s_data_req <= '1';
                        s_write_beat_count <= 1;
                        write_fsm_state <= req;
                        s_write_in_progress <= '1';
                        s_write_transfer_size <= to_integer(unsigned(i_write_transfer_size));
                    else
                        AWSIZE <= (others => '0');
                        AWBURST <= (others => '0');
                        AWADDR <= (others => '0');
                        AWVALID <= '0';
                        s_data_req <= '0';
                        s_write_beat_count <= 0;
                        s_addr <= i_wrt_addr;
                        WDATA <= i_data;
                        write_fsm_state <= idle;
                        s_write_transfer_count <= 0;
                        s_write_in_progress <= '0';
                        s_write_transfer_size <= to_integer(unsigned(i_write_transfer_size));
                    end if;
                when req =>
                    if AWREADY = '1' then
                        AWVALID <= '0';
                        WSTRB <= (others => '1');
                        WVALID <= '1';
                        WLAST <= '1';
                        WDATA <= i_data;
                        s_data_req <= '1';
                        write_fsm_state <= wrt;
                    else
                        s_data_req <= '0';
                        write_fsm_state <= req;
                    end if;
                when wrt =>
                    if WREADY = '1' then
                        --WDATA <= i_data;
                        --s_write_beat_count <= s_write_beat_count + 1;
                        --if s_write_beat_count = 1 then --original 255, changed to 1 on 07022024
                            write_fsm_state <= resp;
                            s_data_req <= '0';
                            --------------------- newly added
                            WVALID <= '0'; --|
                            WLAST <= '0';  --|
                            --------------------- newly added
                        --else
                            --write_fsm_state <= wrt;
                            --s_data_req <= '1';
                        --end if;
                    else
                        s_data_req <= '0';
                    end if;
                when resp =>
                    s_data_req <= '0';
                    --if WREADY = '1' then
                    --    WVALID <= '0';
                    --    WLAST <= '0';
                    --end if;
                    if BVALID = '1' then
                        write_fsm_state <= idle;
                        s_write_transfer_count <= s_write_transfer_count + 1;
                    else
                        write_fsm_state <= resp;
                    end if;
                when others =>
                    s_write_transfer_count <= 0;
                    write_fsm_state <= idle;
            end case;
        end if;
    end if;
end process;

ARLEN <= "00000000"; --change to 1 beat per burst 
AWLEN <= "00000000"; --always burst of length 256 beats of 64 bits --change to 1 beat per burst  
ARLOCK <= (others => '0'); --the ddr core uses axi3 style lock instead of axi4 one bit lock, dont know why
AWLOCK <= (others => '0'); --the ddr core uses axi3 style lock instead of axi4 one bit lock, dont know why, locking not needed
AWID <= (others => '0'); -- always use id 0
ARID <= (others => '0'); -- always use id 0
ARCACHE <= (others => '0'); -- no caching 
ARPROT <= (others => '0'); -- protection unprivileged, secure and data
AWCACHE <= (others => '0'); -- no caching
AWPROT <= (others => '0'); -- protection unprivileged, secure and data
BREADY <= '1';
o_ready <= '1' when s_read_in_progress = '0' and s_write_in_progress = '0' else '0';
o_data <= s_data;
o_data_req <= s_data_req;
o_data_valid <= s_data_valid;

end architecture_aM_fl64_fa;
