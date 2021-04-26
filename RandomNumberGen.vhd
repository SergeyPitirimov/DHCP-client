LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY RandomNumberGen IS
  PORT( clk_1                             :   IN    std_logic;
        rxd0                              :   IN    std_logic;
        rxd1                              :   IN    std_logic;
        rxd2                              :   IN    std_logic;
        rxd3                              :   IN    std_logic;
        number                            :   OUT   std_logic_vector(31 DOWNTO 0)  -- uint32
        );
END RandomNumberGen;


ARCHITECTURE rtl OF RandomNumberGen IS

  ATTRIBUTE multstyle : string;

  -- Signals
  SIGNAL number_tmp                       : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL temp                             : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL temp_1                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL temp_2                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL temp_3                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL temp_4                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL c                                : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL c_1                              : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL c_2                              : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL c_3                              : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL c_4                              : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL cast                             : signed(31 DOWNTO 0);  -- int32
  SIGNAL cast_1                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL cast_2                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL cast_3                           : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL cast_4                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL cast_5                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL cast_6                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL cast_7                           : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL cast_8                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL cast_9                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL cast_10                          : signed(31 DOWNTO 0);  -- int32
  SIGNAL cast_11                          : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL cast_12                          : signed(31 DOWNTO 0);  -- int32
  SIGNAL cast_13                          : signed(31 DOWNTO 0);  -- int32
  SIGNAL cast_14                          : signed(31 DOWNTO 0);  -- int32
  SIGNAL cast_15                          : unsigned(7 DOWNTO 0);  -- uint8

BEGIN
  --random_byte = uint8(bitor(uint8(bitor(uint8(bitor(uint8(bitor(uint8(bitsll(uint8(rxd3), uint8(7))), uint8(bitsll(uint8(rxd2), uint8(6))))), uint8(bitsll(uint8(rxd1), uint8(5))))), uint8(bitsll(uint8(rxd0), uint8(4))))), uint8(bitsll(uint8(clk), uint8(3)))));
  --number = uint32(bitor(uint32(bitor(uint32(bitor(uint32(random_byte), uint32(bitsll(uint32(random_byte), uint32(8))))), uint32(bitsll(uint32(random_byte), uint32(16))))), uint32(bitsll(uint32(random_byte), uint32(24)))));
  temp <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & rxd3;
  c <= temp sll 7;
  temp_1 <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & rxd2;
  c_1 <= temp_1 sll 6;
  temp_2 <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & rxd1;
  c_2 <= temp_2 sll 5;
  temp_3 <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & rxd0;
  c_3 <= temp_3 sll 4;
  temp_4 <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & clk_1;
  c_4 <= temp_4 sll 3;
  cast <= signed(resize(c, 32));
  cast_1 <= signed(resize(c_1, 32));
  cast_2 <= cast OR cast_1;
  cast_3 <= unsigned(cast_2(7 DOWNTO 0));
  cast_4 <= signed(resize(cast_3, 32));
  cast_5 <= signed(resize(c_2, 32));
  cast_6 <= cast_4 OR cast_5;
  cast_7 <= unsigned(cast_6(7 DOWNTO 0));
  cast_8 <= signed(resize(cast_7, 32));
  cast_9 <= signed(resize(c_3, 32));
  cast_10 <= cast_8 OR cast_9;
  cast_11 <= unsigned(cast_10(7 DOWNTO 0));
  cast_12 <= signed(resize(cast_11, 32));
  cast_13 <= signed(resize(c_4, 32));
  cast_14 <= cast_12 OR cast_13;
  cast_15 <= unsigned(cast_14(7 DOWNTO 0));
  number_tmp <= resize(cast_15, 32);

  number <= std_logic_vector(number_tmp);

END rtl;

