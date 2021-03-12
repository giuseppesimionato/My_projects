---------------------------------------------------------------------------------$
---------------------------------------------------------------------------------$
-----                           MY FIR FILTER                                    $
---------------------------------------------------------------------------------$
---------------------------------------------------------------------------------$

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

---------------------------------------------------------------------------------$

entity fir_my is
    port (
	      x                   : in  std_logic_vector(7 downto 0);
        valid_in            : in  std_logic;
        valid_out           : out std_logic;
        y                   : out std_logic_vector(7 downto 0));
end entity fir_my;

---------------------------------------------------------------------------------$

architecture ar_fir of fir_my is

  type prod_t      is array (0 to 4) of signed(11 downto 0);

  --set the coefficients
  signal c0   : signed(3 downto 0):=to_signed(1, 4);
  signal c1   : signed(3 downto 0):=to_signed(-4, 4);
  signal c2   : signed(3 downto 0):=to_signed(7, 4);
  signal c3   : signed(3 downto 0):=to_signed(-4, 4);
  signal c4   : signed(3 downto 0):=to_signed(1, 4);

  --signals for the input data
  signal x0   : signed(7 downto 0):=(others=>'0');
  signal x1   : signed(7 downto 0):=(others=>'0');
  signal x2   : signed(7 downto 0):=(others=>'0');
  signal x3   : signed(7 downto 0):=(others=>'0');
  signal x4   : signed(7 downto 0):=(others=>'0');

  signal add3 : signed(10+4  downto 0):=(others=>'0');
  signal prod : prod_t:=(others => (others => '0'));

  --auxiliary signals to compute the valid_out--
  signal pvo  : std_logic:='0';
  signal pvo2 : std_logic:='0';

begin

  valid_out <= valid_in;

  main : process(valid_in) is
  begin
    if rising_edge(valid_in) then
      -- set the data input
      x0 <= signed(x);
      x1 <= x0;
      x2 <= x1;
      x3 <= x2;
      x4 <= x3;
    end if;
  end process main;

  --compute the products
  multipl: process (x0,x1,x2,x3,x4) is
  begin
    prod(0) <= x0*c0;
    prod(1) <= x1*c1;
    prod(2) <= x2*c2;
    prod(3) <= x3*c3;
    prod(4) <= x4*c4;
  end process multipl;

  --compute the sums
  add: process (prod) is
  begin
    add3 <= resize(prod(0),15) + resize(prod(1),15) + resize(prod(2),15) + resize(prod(3),15) + resize(prod(4),15);   
  end process add;

  --provide the outputs
  output: process (add3) is
  begin
    y <= std_logic_vector(add3(14) & add3(10 downto 4));
  end process output;

end architecture ar_fir;