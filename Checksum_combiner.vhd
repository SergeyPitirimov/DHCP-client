LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.Trader_pkg.ALL;

ENTITY Checksum_combiner IS
  PORT( start                             :   IN    std_logic;
        checksum                          :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        eth_frame                         :   IN    vector_of_std_logic_vector8(0 TO 309);  -- uint8 [310]
        done                              :   OUT   std_logic;
        complete_eth_frame                :   OUT   vector_of_std_logic_vector8(0 TO 321)  -- uint8 [322]
        );
END Checksum_combiner;


ARCHITECTURE rtl OF Checksum_combiner IS

  ATTRIBUTE multstyle : string;

  -- Signals
  SIGNAL checksum_unsigned                : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL eth_frame_unsigned               : vector_of_unsigned8(0 TO 309);  -- uint8 [310]
  SIGNAL complete_eth_frame_tmp           : vector_of_unsigned8(0 TO 321);  -- uint8 [322]

BEGIN
  checksum_unsigned <= unsigned(checksum);

  outputgen1: FOR k IN 0 TO 309 GENERATE
    eth_frame_unsigned(k) <= unsigned(eth_frame(k));
  END GENERATE;

  Checksum_combiner_1_output : PROCESS (checksum_unsigned, eth_frame_unsigned, start)
    VARIABLE w : unsigned(31 DOWNTO 0);
    VARIABLE temp : unsigned(31 DOWNTO 0);
    VARIABLE temp_0 : unsigned(31 DOWNTO 0);
    VARIABLE temp_1 : unsigned(31 DOWNTO 0);
    VARIABLE c : unsigned(31 DOWNTO 0);
    VARIABLE c_0 : unsigned(31 DOWNTO 0);
    VARIABLE c_1 : unsigned(31 DOWNTO 0);
    VARIABLE cast : signed(31 DOWNTO 0);
    VARIABLE cast_0 : unsigned(31 DOWNTO 0);
    VARIABLE cast_1 : signed(31 DOWNTO 0);
  BEGIN
    -- Complete ethernet frame = preamble (0x55 * 7 bytes) + self frame delimiter (0xD5) + ethernet frame data (310 bytes) + checksum CRC-32 (4 bytes)
    temp := checksum_unsigned;
    c := temp srl 8;
    w := c;
    temp_0 := checksum_unsigned;
    c_0 := temp_0 srl 16;
    temp_1 := checksum_unsigned;
    c_1 := temp_1 srl 24;
    done <= start;
    complete_eth_frame_tmp(0) <= to_unsigned(16#55#, 8);
    complete_eth_frame_tmp(1) <= to_unsigned(16#55#, 8);
    complete_eth_frame_tmp(2) <= to_unsigned(16#55#, 8);
    complete_eth_frame_tmp(3) <= to_unsigned(16#55#, 8);
    complete_eth_frame_tmp(4) <= to_unsigned(16#55#, 8);
    complete_eth_frame_tmp(5) <= to_unsigned(16#55#, 8);
    complete_eth_frame_tmp(6) <= to_unsigned(16#55#, 8);
    complete_eth_frame_tmp(7) <= to_unsigned(16#D5#, 8);
    complete_eth_frame_tmp(8 TO 317) <= eth_frame_unsigned(0 TO 309);
    complete_eth_frame_tmp(318) <= resize(checksum_unsigned AND to_unsigned(16#000000FF#, 32), 8);
    complete_eth_frame_tmp(319) <= resize(w AND to_unsigned(16#000000FF#, 32), 8);
    cast := signed(c_0);
    cast_0 := unsigned(cast);
    complete_eth_frame_tmp(320) <= resize(cast_0 AND to_unsigned(16#000000FF#, 32), 8);
    cast_1 := signed(c_1);
    complete_eth_frame_tmp(321) <= unsigned(cast_1(7 DOWNTO 0));
  END PROCESS Checksum_combiner_1_output;


  outputgen: FOR k IN 0 TO 321 GENERATE
    complete_eth_frame(k) <= std_logic_vector(complete_eth_frame_tmp(k));
  END GENERATE;

END rtl;

