library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_tb is
end entity top_tb;


architecture test of top_tb is

  constant c_CLKS_PER_BIT : integer := 867;
  constant c_BIT_PERIOD   : time    := 8670 ns;

  signal CLK100MHZ    : std_logic := '0';
  signal uart_txd_in  : std_logic := '1';
  signal uart_rxd_out : std_logic;
  signal data         : std_logic_vector(7 downto 0);

  procedure UART_WRITE_BYTE (
    i_data_in       : in  std_logic_vector(7 downto 0);
    signal o_serial : out std_logic) is
  begin
 
    -- Send Start Bit
    o_serial <= '0';
    wait for c_BIT_PERIOD;
 
    -- Send Data Byte
    for ii in 0 to 7 loop
      o_serial <= i_data_in(ii);
      wait for c_BIT_PERIOD;
    end loop;  -- ii
 
    -- Send Stop Bit
    o_serial <= '1';
    wait for c_BIT_PERIOD;
    
  end UART_WRITE_BYTE;

begin  -- architecture test

  DUT : entity work.top
    port map (
      CLK100MHZ    => CLK100MHZ,
      uart_txd_in    => uart_txd_in,
      uart_rxd_out => uart_rxd_out);
      
  -- clock generation
  CLK100MHZ <= not CLK100MHZ after 5 ns;
  
  process is
  begin
 
    wait until rising_edge(CLK100MHZ);
    data<=std_logic_vector(to_signed(5,8));
    wait for c_BIT_PERIOD;
    UART_WRITE_BYTE(data, uart_txd_in);
    wait for c_BIT_PERIOD;
    data<=std_logic_vector(to_signed(-2,8));
    wait for c_BIT_PERIOD;
    UART_WRITE_BYTE(data, uart_txd_in);
    wait for c_BIT_PERIOD;
    data<=std_logic_vector(to_signed(9,8));
    wait for c_BIT_PERIOD;
    UART_WRITE_BYTE(data, uart_txd_in);
    wait for c_BIT_PERIOD;
    data<=std_logic_vector(to_signed(8,8));
    wait for c_BIT_PERIOD;
    UART_WRITE_BYTE(data, uart_txd_in);
    wait for c_BIT_PERIOD;
    data<=std_logic_vector(to_signed(25,8));
    wait for c_BIT_PERIOD;
    UART_WRITE_BYTE(data, uart_txd_in);
    wait for c_BIT_PERIOD;
    data<=std_logic_vector(to_signed(-122,8));
    wait for c_BIT_PERIOD;
    UART_WRITE_BYTE(data, uart_txd_in);
    wait for c_BIT_PERIOD;
    data<=std_logic_vector(to_signed(1,8));
    wait for c_BIT_PERIOD;
    UART_WRITE_BYTE(data, uart_txd_in);
    wait for c_BIT_PERIOD;
    data<=std_logic_vector(to_signed(1,8));
    wait for c_BIT_PERIOD;
    UART_WRITE_BYTE(data, uart_txd_in);
    wait for c_BIT_PERIOD;
    wait for 300 us;

end process;

end architecture test;


