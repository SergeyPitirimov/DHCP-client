LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.Trader_pkg.ALL;

ENTITY Ethernet_frame_updater IS
  PORT( ip_header_checksum_is_valid       :   IN    std_logic;
        ip_header_checksum                :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        udp_checksum_is_valid             :   IN    std_logic;
        udp_length                        :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        udp_checksum                      :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        start                             :   IN    std_logic;
        eth_frame_in                      :   IN    vector_of_std_logic_vector8(0 TO 309);  -- uint8 [310]
        done                              :   OUT   std_logic;
        eth_frame_out                     :   OUT   vector_of_std_logic_vector8(0 TO 309)  -- uint8 [310]
        );
END Ethernet_frame_updater;


ARCHITECTURE rtl OF Ethernet_frame_updater IS

  ATTRIBUTE multstyle : string;

  -- Signals
  SIGNAL ip_header_checksum_unsigned      : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL udp_length_unsigned              : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL udp_checksum_unsigned            : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL eth_frame_in_unsigned            : vector_of_unsigned8(0 TO 309);  -- uint8 [310]
  SIGNAL eth_frame_out_tmp                : vector_of_unsigned8(0 TO 309);  -- uint8 [310]

BEGIN
  ip_header_checksum_unsigned <= unsigned(ip_header_checksum);

  udp_length_unsigned <= unsigned(udp_length);

  udp_checksum_unsigned <= unsigned(udp_checksum);

  outputgen1: FOR k IN 0 TO 309 GENERATE
    eth_frame_in_unsigned(k) <= unsigned(eth_frame_in(k));
  END GENERATE;

  Ethernet_frame_updater_1_output : PROCESS (eth_frame_in_unsigned, ip_header_checksum_is_valid,
       ip_header_checksum_unsigned, start, udp_checksum_is_valid,
       udp_checksum_unsigned, udp_length_unsigned)
    VARIABLE w : unsigned(31 DOWNTO 0);
    VARIABLE temp : unsigned(31 DOWNTO 0);
    VARIABLE temp_0 : unsigned(15 DOWNTO 0);
    VARIABLE w_0 : unsigned(31 DOWNTO 0);
    VARIABLE temp_1 : unsigned(31 DOWNTO 0);
    VARIABLE c : unsigned(31 DOWNTO 0);
    VARIABLE c_0 : unsigned(15 DOWNTO 0);
    VARIABLE c_1 : unsigned(31 DOWNTO 0);
    VARIABLE cast : signed(31 DOWNTO 0);
    VARIABLE cast_0 : signed(31 DOWNTO 0);
  BEGIN
    -- insert the IP header checksum, UDP packet length, UDP checksum into ethernet frame
    temp := ip_header_checksum_unsigned;
    c := temp srl 8;
    w := c;
    temp_0 := udp_length_unsigned;
    c_0 := temp_0 srl 8;
    temp_1 := udp_checksum_unsigned;
    c_1 := temp_1 srl 8;
    w_0 := c_1;
    eth_frame_out_tmp(0 TO 23) <= eth_frame_in_unsigned(0 TO 23);
    eth_frame_out_tmp(24) <= resize(w AND to_unsigned(16#000000FF#, 32), 8);
    eth_frame_out_tmp(25) <= resize(ip_header_checksum_unsigned AND to_unsigned(16#000000FF#, 32), 8);
    eth_frame_out_tmp(26 TO 37) <= eth_frame_in_unsigned(26 TO 37);
    eth_frame_out_tmp(38) <= c_0(7 DOWNTO 0);
    cast := signed(resize(udp_length_unsigned, 32));
    cast_0 := cast AND to_signed(16#000000FF#, 32);
    eth_frame_out_tmp(39) <= unsigned(cast_0(7 DOWNTO 0));
    eth_frame_out_tmp(40) <= resize(w_0 AND to_unsigned(16#000000FF#, 32), 8);
    eth_frame_out_tmp(41) <= resize(udp_checksum_unsigned AND to_unsigned(16#000000FF#, 32), 8);
    eth_frame_out_tmp(42 TO 309) <= eth_frame_in_unsigned(42 TO 309);
    done <= (start AND ip_header_checksum_is_valid) AND udp_checksum_is_valid;
  END PROCESS Ethernet_frame_updater_1_output;


  outputgen: FOR k IN 0 TO 309 GENERATE
    eth_frame_out(k) <= std_logic_vector(eth_frame_out_tmp(k));
  END GENERATE;

END rtl;

