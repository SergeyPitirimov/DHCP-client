LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.Trader_pkg.ALL;

ENTITY Receiver IS
  PORT( phy_ready                         :   IN    std_logic;
        mac_addr1                         :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        mac_addr2                         :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        mac_addr3                         :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        dhcp_port                         :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        data_port                         :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        rxd0                              :   IN    std_logic;
        rxd1                              :   IN    std_logic;
        rxd2                              :   IN    std_logic;
        rxd3                              :   IN    std_logic;
        rx_dv                             :   IN    std_logic;
        rx_crs                            :   IN    std_logic;
        rx_err                            :   IN    std_logic;
        rx_col                            :   IN    std_logic;
        rx_fifo_empty                     :   IN    std_logic;
        source_mac_addr1_in               :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        source_mac_addr2_in               :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        source_mac_addr3_in               :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        source_ip_in                      :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        dest_ip_in                        :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        source_port_in                    :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        dest_port_in                      :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        udp_frame_in                      :   IN    vector_of_std_logic_vector8(0 TO 109);  -- uint8 [110]
        udp_frame_in_ready                :   IN    std_logic;
        state_in                          :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        ip_length_in                      :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        nibble_counter_in                 :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        preamble_in                       :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        byte_in                           :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        options_counter_in                :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        source_mac_addr1_tmp_in           :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        source_mac_addr2_tmp_in           :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        source_mac_addr3_tmp_in           :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        source_ip_tmp_in                  :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        dest_ip_tmp_in                    :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        source_port_tmp_in                :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        dest_port_tmp_in                  :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        ip_length_tmp_in                  :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        rx_clk_fifo_out                   :   OUT   std_logic;
        source_mac_addr1_out              :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
        source_mac_addr2_out              :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
        source_mac_addr3_out              :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
        source_ip_out                     :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        dest_ip_out                       :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        source_port_out                   :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
        dest_port_out                     :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
        udp_frame_out                     :   OUT   vector_of_std_logic_vector8(0 TO 109);  -- uint8 [110]
        udp_frame_out_ready               :   OUT   std_logic;
        state_out                         :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
        ip_length_out                     :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
        nibble_counter_out                :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
        preamble_out                      :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        byte_out                          :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
        options_counter_out               :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
        source_mac_addr1_tmp_out          :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
        source_mac_addr2_tmp_out          :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
        source_mac_addr3_tmp_out          :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
        source_ip_tmp_out                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        dest_ip_tmp_out                   :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        source_port_tmp_out               :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
        dest_port_tmp_out                 :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
        ip_length_tmp_out                 :   OUT   std_logic_vector(15 DOWNTO 0)  -- uint16
        );
END Receiver;


ARCHITECTURE rtl OF Receiver IS

  ATTRIBUTE multstyle : string;

  -- Signals
  SIGNAL mac_addr1_unsigned               : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL mac_addr2_unsigned               : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL mac_addr3_unsigned               : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL dhcp_port_unsigned               : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL data_port_unsigned               : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL source_mac_addr1_in_unsigned     : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL source_mac_addr2_in_unsigned     : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL source_mac_addr3_in_unsigned     : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL source_ip_in_unsigned            : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL dest_ip_in_unsigned              : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL source_port_in_unsigned          : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL dest_port_in_unsigned            : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL udp_frame_in_unsigned            : vector_of_unsigned8(0 TO 109);  -- uint8 [110]
  SIGNAL state_in_unsigned                : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL ip_length_in_unsigned            : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL nibble_counter_in_unsigned       : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL preamble_in_unsigned             : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL byte_in_unsigned                 : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL options_counter_in_unsigned      : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL source_mac_addr1_tmp_in_unsigned : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL source_mac_addr2_tmp_in_unsigned : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL source_mac_addr3_tmp_in_unsigned : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL source_ip_tmp_in_unsigned        : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL dest_ip_tmp_in_unsigned          : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL source_port_tmp_in_unsigned      : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL dest_port_tmp_in_unsigned        : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL ip_length_tmp_in_unsigned        : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL source_mac_addr1_out_tmp         : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL source_mac_addr2_out_tmp         : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL source_mac_addr3_out_tmp         : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL source_ip_out_tmp                : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL dest_ip_out_tmp                  : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL source_port_out_tmp              : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL dest_port_out_tmp                : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL udp_frame_out_tmp                : vector_of_unsigned8(0 TO 109);  -- uint8 [110]
  SIGNAL state_out_tmp                    : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL ip_length_out_tmp                : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL nibble_counter_out_tmp           : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL preamble_out_tmp                 : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL byte_out_tmp                     : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL options_counter_out_tmp          : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL source_mac_addr1_tmp_out_tmp     : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL source_mac_addr2_tmp_out_tmp     : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL source_mac_addr3_tmp_out_tmp     : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL source_ip_tmp_out_tmp            : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL dest_ip_tmp_out_tmp              : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL source_port_tmp_out_tmp          : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL dest_port_tmp_out_tmp            : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL ip_length_tmp_out_tmp            : unsigned(15 DOWNTO 0);  -- uint16

BEGIN
  mac_addr1_unsigned <= unsigned(mac_addr1);

  mac_addr2_unsigned <= unsigned(mac_addr2);

  mac_addr3_unsigned <= unsigned(mac_addr3);

  dhcp_port_unsigned <= unsigned(dhcp_port);

  data_port_unsigned <= unsigned(data_port);

  source_mac_addr1_in_unsigned <= unsigned(source_mac_addr1_in);

  source_mac_addr2_in_unsigned <= unsigned(source_mac_addr2_in);

  source_mac_addr3_in_unsigned <= unsigned(source_mac_addr3_in);

  source_ip_in_unsigned <= unsigned(source_ip_in);

  dest_ip_in_unsigned <= unsigned(dest_ip_in);

  source_port_in_unsigned <= unsigned(source_port_in);

  dest_port_in_unsigned <= unsigned(dest_port_in);

  outputgen1: FOR k IN 0 TO 109 GENERATE
    udp_frame_in_unsigned(k) <= unsigned(udp_frame_in(k));
  END GENERATE;

  state_in_unsigned <= unsigned(state_in);

  ip_length_in_unsigned <= unsigned(ip_length_in);

  nibble_counter_in_unsigned <= unsigned(nibble_counter_in);

  preamble_in_unsigned <= unsigned(preamble_in);

  byte_in_unsigned <= unsigned(byte_in);

  options_counter_in_unsigned <= unsigned(options_counter_in);

  source_mac_addr1_tmp_in_unsigned <= unsigned(source_mac_addr1_tmp_in);

  source_mac_addr2_tmp_in_unsigned <= unsigned(source_mac_addr2_tmp_in);

  source_mac_addr3_tmp_in_unsigned <= unsigned(source_mac_addr3_tmp_in);

  source_ip_tmp_in_unsigned <= unsigned(source_ip_tmp_in);

  dest_ip_tmp_in_unsigned <= unsigned(dest_ip_tmp_in);

  source_port_tmp_in_unsigned <= unsigned(source_port_tmp_in);

  dest_port_tmp_in_unsigned <= unsigned(dest_port_tmp_in);

  ip_length_tmp_in_unsigned <= unsigned(ip_length_tmp_in);

  Receiver_1_output : PROCESS (byte_in_unsigned, data_port_unsigned, dest_ip_in_unsigned,
       dest_ip_tmp_in_unsigned, dest_port_in_unsigned,
       dest_port_tmp_in_unsigned, dhcp_port_unsigned, ip_length_in_unsigned,
       ip_length_tmp_in_unsigned, mac_addr1_unsigned, mac_addr2_unsigned,
       mac_addr3_unsigned, nibble_counter_in_unsigned,
       options_counter_in_unsigned, phy_ready, preamble_in_unsigned, rx_col,
       rx_crs, rx_dv, rx_err, rx_fifo_empty, rxd0, rxd1, rxd2, rxd3,
       source_ip_in_unsigned, source_ip_tmp_in_unsigned,
       source_mac_addr1_in_unsigned, source_mac_addr1_tmp_in_unsigned,
       source_mac_addr2_in_unsigned, source_mac_addr2_tmp_in_unsigned,
       source_mac_addr3_in_unsigned, source_mac_addr3_tmp_in_unsigned,
       source_port_in_unsigned, source_port_tmp_in_unsigned, state_in_unsigned,
       udp_frame_in_ready, udp_frame_in_unsigned)
    VARIABLE temp : unsigned(7 DOWNTO 0);
    VARIABLE temp_0 : unsigned(31 DOWNTO 0);
    VARIABLE w : unsigned(31 DOWNTO 0);
    VARIABLE temp_1 : unsigned(31 DOWNTO 0);
    VARIABLE w_0 : unsigned(31 DOWNTO 0);
    VARIABLE temp_2 : unsigned(31 DOWNTO 0);
    VARIABLE w_1 : unsigned(31 DOWNTO 0);
    VARIABLE temp_3 : unsigned(31 DOWNTO 0);
    VARIABLE w_2 : unsigned(31 DOWNTO 0);
    VARIABLE temp_4 : unsigned(31 DOWNTO 0);
    VARIABLE temp_5 : unsigned(7 DOWNTO 0);
    VARIABLE temp_6 : unsigned(7 DOWNTO 0);
    VARIABLE temp_7 : unsigned(7 DOWNTO 0);
    VARIABLE temp_8 : unsigned(7 DOWNTO 0);
    VARIABLE temp_9 : unsigned(15 DOWNTO 0);
    VARIABLE temp_10 : unsigned(15 DOWNTO 0);
    VARIABLE temp_11 : unsigned(15 DOWNTO 0);
    VARIABLE temp_12 : unsigned(15 DOWNTO 0);
    VARIABLE temp_13 : unsigned(15 DOWNTO 0);
    VARIABLE temp_14 : unsigned(15 DOWNTO 0);
    VARIABLE temp_15 : unsigned(15 DOWNTO 0);
    VARIABLE temp_16 : unsigned(15 DOWNTO 0);
    VARIABLE w_3 : unsigned(31 DOWNTO 0);
    VARIABLE temp_17 : unsigned(31 DOWNTO 0);
    VARIABLE w_4 : unsigned(31 DOWNTO 0);
    VARIABLE temp_18 : unsigned(31 DOWNTO 0);
    VARIABLE temp_19 : unsigned(31 DOWNTO 0);
    VARIABLE w_5 : unsigned(31 DOWNTO 0);
    VARIABLE temp_20 : unsigned(31 DOWNTO 0);
    VARIABLE w_6 : unsigned(31 DOWNTO 0);
    VARIABLE temp_21 : unsigned(31 DOWNTO 0);
    VARIABLE temp_22 : unsigned(31 DOWNTO 0);
    VARIABLE temp_23 : unsigned(15 DOWNTO 0);
    VARIABLE temp_24 : unsigned(15 DOWNTO 0);
    VARIABLE temp_25 : unsigned(15 DOWNTO 0);
    VARIABLE c : unsigned(31 DOWNTO 0);
    VARIABLE c_0 : unsigned(31 DOWNTO 0);
    VARIABLE c_1 : unsigned(7 DOWNTO 0);
    VARIABLE c_2 : unsigned(7 DOWNTO 0);
    VARIABLE c_3 : unsigned(31 DOWNTO 0);
    VARIABLE c_4 : unsigned(7 DOWNTO 0);
    VARIABLE c_5 : unsigned(15 DOWNTO 0);
    VARIABLE c_6 : unsigned(15 DOWNTO 0);
    VARIABLE c_7 : unsigned(15 DOWNTO 0);
    VARIABLE c_8 : unsigned(15 DOWNTO 0);
    VARIABLE c_9 : unsigned(15 DOWNTO 0);
    VARIABLE c_10 : unsigned(15 DOWNTO 0);
    VARIABLE c_11 : unsigned(15 DOWNTO 0);
    VARIABLE c_12 : unsigned(31 DOWNTO 0);
    VARIABLE c_13 : unsigned(7 DOWNTO 0);
    VARIABLE c_14 : unsigned(15 DOWNTO 0);
    VARIABLE c_15 : unsigned(31 DOWNTO 0);
    VARIABLE c_16 : unsigned(31 DOWNTO 0);
    VARIABLE c_17 : unsigned(31 DOWNTO 0);
    VARIABLE c_18 : unsigned(31 DOWNTO 0);
    VARIABLE c_19 : unsigned(31 DOWNTO 0);
    VARIABLE c_20 : unsigned(31 DOWNTO 0);
    VARIABLE c_21 : unsigned(15 DOWNTO 0);
    VARIABLE c_22 : unsigned(15 DOWNTO 0);
    VARIABLE c_23 : unsigned(15 DOWNTO 0);
    VARIABLE c_24 : unsigned(31 DOWNTO 0);
    VARIABLE c_25 : unsigned(7 DOWNTO 0);
    VARIABLE guard1 : std_logic;
    VARIABLE cast : signed(31 DOWNTO 0);
    VARIABLE cast_0 : signed(31 DOWNTO 0);
    VARIABLE cast_1 : unsigned(15 DOWNTO 0);
    VARIABLE add_temp : unsigned(16 DOWNTO 0);
    VARIABLE cast_2 : signed(31 DOWNTO 0);
    VARIABLE cast_3 : signed(31 DOWNTO 0);
    VARIABLE cast_4 : signed(31 DOWNTO 0);
    VARIABLE cast_5 : signed(31 DOWNTO 0);
    VARIABLE cast_6 : unsigned(7 DOWNTO 0);
    VARIABLE cast_7 : signed(31 DOWNTO 0);
    VARIABLE cast_8 : signed(31 DOWNTO 0);
    VARIABLE cast_9 : signed(31 DOWNTO 0);
    VARIABLE cast_10 : unsigned(7 DOWNTO 0);
    VARIABLE cast_11 : signed(31 DOWNTO 0);
    VARIABLE cast_12 : signed(31 DOWNTO 0);
    VARIABLE cast_13 : signed(31 DOWNTO 0);
    VARIABLE cast_14 : unsigned(7 DOWNTO 0);
    VARIABLE cast_15 : signed(31 DOWNTO 0);
    VARIABLE cast_16 : signed(31 DOWNTO 0);
    VARIABLE add_temp_0 : unsigned(16 DOWNTO 0);
    VARIABLE sub_cast : signed(16 DOWNTO 0);
    VARIABLE sub_temp : signed(16 DOWNTO 0);
    VARIABLE sub_cast_0 : unsigned(15 DOWNTO 0);
    VARIABLE sub_cast_1 : signed(31 DOWNTO 0);
    VARIABLE cast_17 : signed(31 DOWNTO 0);
    VARIABLE cast_18 : signed(31 DOWNTO 0);
    VARIABLE cast_19 : signed(31 DOWNTO 0);
    VARIABLE cast_20 : unsigned(15 DOWNTO 0);
    VARIABLE cast_21 : signed(31 DOWNTO 0);
    VARIABLE cast_22 : signed(31 DOWNTO 0);
    VARIABLE cast_23 : signed(31 DOWNTO 0);
    VARIABLE cast_24 : signed(31 DOWNTO 0);
    VARIABLE cast_25 : unsigned(15 DOWNTO 0);
    VARIABLE cast_26 : signed(31 DOWNTO 0);
    VARIABLE cast_27 : signed(31 DOWNTO 0);
    VARIABLE cast_28 : signed(31 DOWNTO 0);
    VARIABLE cast_29 : signed(31 DOWNTO 0);
    VARIABLE cast_30 : unsigned(15 DOWNTO 0);
    VARIABLE cast_31 : signed(31 DOWNTO 0);
    VARIABLE add_temp_1 : unsigned(16 DOWNTO 0);
    VARIABLE cast_32 : signed(31 DOWNTO 0);
    VARIABLE cast_33 : signed(31 DOWNTO 0);
    VARIABLE cast_34 : signed(31 DOWNTO 0);
    VARIABLE cast_35 : signed(31 DOWNTO 0);
    VARIABLE cast_36 : signed(31 DOWNTO 0);
    VARIABLE cast_37 : signed(31 DOWNTO 0);
    VARIABLE cast_38 : signed(31 DOWNTO 0);
    VARIABLE cast_39 : signed(31 DOWNTO 0);
    VARIABLE cast_40 : signed(31 DOWNTO 0);
    VARIABLE cast_41 : signed(31 DOWNTO 0);
    VARIABLE cast_42 : signed(31 DOWNTO 0);
    VARIABLE cast_43 : signed(31 DOWNTO 0);
    VARIABLE cast_44 : signed(31 DOWNTO 0);
    VARIABLE cast_45 : signed(31 DOWNTO 0);
    VARIABLE cast_46 : signed(31 DOWNTO 0);
    VARIABLE cast_47 : signed(31 DOWNTO 0);
    VARIABLE cast_48 : signed(31 DOWNTO 0);
    VARIABLE add_temp_2 : unsigned(16 DOWNTO 0);
    VARIABLE sub_cast_2 : unsigned(15 DOWNTO 0);
    VARIABLE sub_cast_3 : signed(31 DOWNTO 0);
    VARIABLE cast_49 : signed(31 DOWNTO 0);
    VARIABLE cast_50 : signed(31 DOWNTO 0);
    VARIABLE cast_51 : signed(31 DOWNTO 0);
    VARIABLE cast_52 : signed(31 DOWNTO 0);
    VARIABLE cast_53 : signed(31 DOWNTO 0);
    VARIABLE cast_54 : unsigned(31 DOWNTO 0);
    VARIABLE cast_55 : signed(31 DOWNTO 0);
    VARIABLE cast_56 : signed(31 DOWNTO 0);
    VARIABLE cast_57 : signed(31 DOWNTO 0);
    VARIABLE cast_58 : signed(31 DOWNTO 0);
    VARIABLE cast_59 : unsigned(31 DOWNTO 0);
    VARIABLE cast_60 : signed(31 DOWNTO 0);
    VARIABLE cast_61 : signed(31 DOWNTO 0);
    VARIABLE cast_62 : signed(31 DOWNTO 0);
    VARIABLE cast_63 : signed(31 DOWNTO 0);
    VARIABLE cast_64 : signed(31 DOWNTO 0);
    VARIABLE cast_65 : signed(31 DOWNTO 0);
    VARIABLE cast_66 : signed(31 DOWNTO 0);
    VARIABLE cast_67 : signed(31 DOWNTO 0);
    VARIABLE cast_68 : signed(31 DOWNTO 0);
    VARIABLE cast_69 : signed(31 DOWNTO 0);
    VARIABLE cast_70 : signed(31 DOWNTO 0);
    VARIABLE cast_71 : signed(31 DOWNTO 0);
  BEGIN
    -- Receiving sequence: ethernet frame(1st = first byte to receive) -> ... -> ethernet frame(314th = last byte to receive),
    -- D0D1D2D3 -> D5D6D7D8 (least 4 bits and then most 4 bits in each byte)
    CASE state_in_unsigned IS
      WHEN "00000000" =>
        IF ( NOT phy_ready) = '1' THEN 
          state_out_tmp <= state_in_unsigned;
          rx_clk_fifo_out <= '0';
        ELSE 
          state_out_tmp <= to_unsigned(16#01#, 8);
          rx_clk_fifo_out <= '1';
        END IF;
        source_mac_addr1_out_tmp <= to_unsigned(16#0000#, 16);
        source_mac_addr2_out_tmp <= to_unsigned(16#0000#, 16);
        source_mac_addr3_out_tmp <= to_unsigned(16#0000#, 16);
        source_ip_out_tmp <= to_unsigned(16#00000000#, 32);
        dest_ip_out_tmp <= to_unsigned(16#00000000#, 32);
        source_port_out_tmp <= to_unsigned(16#0000#, 16);
        dest_port_out_tmp <= to_unsigned(16#0000#, 16);
        udp_frame_out_tmp <= (OTHERS => to_unsigned(16#00#, 8));
        udp_frame_out_ready <= '0';
        ip_length_out_tmp <= to_unsigned(16#0000#, 16);
        nibble_counter_out_tmp <= to_unsigned(16#0000#, 16);
        preamble_out_tmp <= to_unsigned(16#00000000#, 32);
        byte_out_tmp <= to_unsigned(16#00#, 8);
        options_counter_out_tmp <= to_unsigned(16#0000#, 16);
        source_mac_addr1_tmp_out_tmp <= to_unsigned(16#0000#, 16);
        source_mac_addr2_tmp_out_tmp <= to_unsigned(16#0000#, 16);
        source_mac_addr3_tmp_out_tmp <= to_unsigned(16#0000#, 16);
        source_ip_tmp_out_tmp <= to_unsigned(16#00000000#, 32);
        dest_ip_tmp_out_tmp <= to_unsigned(16#00000000#, 32);
        source_port_tmp_out_tmp <= to_unsigned(16#0000#, 16);
        dest_port_tmp_out_tmp <= to_unsigned(16#0000#, 16);
        ip_length_tmp_out_tmp <= to_unsigned(16#0000#, 16);
      WHEN "00000001" =>
        IF (((rx_dv AND rx_crs) AND ( NOT rx_err)) AND ( NOT rx_col)) = '1' THEN 
          IF ( NOT rx_fifo_empty) = '1' THEN 
            temp_1 := '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & rxd3;
            c_0 := temp_1 sll 31;
            w := c_0;
            temp_2 := '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & rxd2;
            c_3 := temp_2 sll 30;
            w_0 := c_3;
            temp_3 := '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & rxd1;
            c_12 := temp_3 sll 29;
            w_1 := c_12;
            temp_4 := '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & rxd0;
            c_24 := temp_4 sll 28;
            w_2 := c_24;
            preamble_out_tmp <= preamble_in_unsigned OR (((w OR w_0) OR w_1) OR w_2);
            add_temp_1 := resize(nibble_counter_in_unsigned, 17) + to_unsigned(16#00001#, 17);
            IF add_temp_1(16) /= '0' THEN 
              nibble_counter_out_tmp <= X"FFFF";
            ELSE 
              nibble_counter_out_tmp <= add_temp_1(15 DOWNTO 0);
            END IF;
            state_out_tmp <= to_unsigned(16#02#, 8);
          ELSE 
            preamble_out_tmp <= preamble_in_unsigned;
            nibble_counter_out_tmp <= nibble_counter_in_unsigned;
            state_out_tmp <= to_unsigned(16#08#, 8);
          END IF;
        ELSE 
          preamble_out_tmp <= to_unsigned(16#00000000#, 32);
          state_out_tmp <= to_unsigned(16#07#, 8);
          nibble_counter_out_tmp <= to_unsigned(16#0000#, 16);
        END IF;
        rx_clk_fifo_out <= '0';
        source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
        source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
        source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
        source_ip_out_tmp <= source_ip_in_unsigned;
        dest_ip_out_tmp <= dest_ip_in_unsigned;
        source_port_out_tmp <= source_port_in_unsigned;
        dest_port_out_tmp <= dest_port_in_unsigned;
        udp_frame_out_tmp <= udp_frame_in_unsigned;
        udp_frame_out_ready <= udp_frame_in_ready;
        ip_length_out_tmp <= ip_length_in_unsigned;
        byte_out_tmp <= to_unsigned(16#00#, 8);
        options_counter_out_tmp <= to_unsigned(16#0000#, 16);
        source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
        source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
        source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
        source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
        dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
        source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
        dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
        ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
      WHEN "00000010" =>
        IF nibble_counter_in_unsigned <= to_unsigned(16#00000010#, 16) THEN 
          -- check on valid preamble pattern here to catch up the valid ethernet frame
          IF preamble_in_unsigned = unsigned'("11010101010101010101010101010101") THEN 
            state_out_tmp <= to_unsigned(16#03#, 8);
            preamble_out_tmp <= to_unsigned(16#00000000#, 32);
            nibble_counter_out_tmp <= to_unsigned(16#0000#, 16);
          ELSE 
            state_out_tmp <= to_unsigned(16#01#, 8);
            temp_0 := preamble_in_unsigned;
            c := temp_0 srl 4;
            preamble_out_tmp <= c;
            nibble_counter_out_tmp <= nibble_counter_in_unsigned;
          END IF;
        ELSE 
          preamble_out_tmp <= to_unsigned(16#00000000#, 32);
          nibble_counter_out_tmp <= to_unsigned(16#0000#, 16);
          state_out_tmp <= to_unsigned(16#07#, 8);
        END IF;
        rx_clk_fifo_out <= '1';
        source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
        source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
        source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
        source_ip_out_tmp <= source_ip_in_unsigned;
        dest_ip_out_tmp <= dest_ip_in_unsigned;
        source_port_out_tmp <= source_port_in_unsigned;
        dest_port_out_tmp <= dest_port_in_unsigned;
        udp_frame_out_tmp <= udp_frame_in_unsigned;
        udp_frame_out_ready <= udp_frame_in_ready;
        ip_length_out_tmp <= ip_length_in_unsigned;
        byte_out_tmp <= to_unsigned(16#00#, 8);
        options_counter_out_tmp <= to_unsigned(16#0000#, 16);
        source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
        source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
        source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
        source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
        dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
        source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
        dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
        ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
      WHEN "00000011" =>
        IF (((rx_dv AND rx_crs) AND ( NOT rx_err)) AND ( NOT rx_col)) = '1' THEN 
          IF ( NOT rx_fifo_empty) = '1' THEN 
            temp_5 := '0' & '0' & '0' & '0' & '0' & '0' & '0' & rxd3;
            c_1 := temp_5 sll 7;
            temp_6 := '0' & '0' & '0' & '0' & '0' & '0' & '0' & rxd2;
            c_4 := temp_6 sll 6;
            temp_7 := '0' & '0' & '0' & '0' & '0' & '0' & '0' & rxd1;
            c_13 := temp_7 sll 5;
            temp_8 := '0' & '0' & '0' & '0' & '0' & '0' & '0' & rxd0;
            c_25 := temp_8 sll 4;
            cast_2 := signed(resize(byte_in_unsigned, 32));
            cast_3 := signed(resize(c_1, 32));
            cast_4 := signed(resize(c_4, 32));
            cast_5 := cast_3 OR cast_4;
            cast_6 := unsigned(cast_5(7 DOWNTO 0));
            cast_7 := signed(resize(cast_6, 32));
            cast_8 := signed(resize(c_13, 32));
            cast_9 := cast_7 OR cast_8;
            cast_10 := unsigned(cast_9(7 DOWNTO 0));
            cast_11 := signed(resize(cast_10, 32));
            cast_12 := signed(resize(c_25, 32));
            cast_13 := cast_11 OR cast_12;
            cast_14 := unsigned(cast_13(7 DOWNTO 0));
            cast_15 := signed(resize(cast_14, 32));
            cast_16 := cast_2 OR cast_15;
            byte_out_tmp <= unsigned(cast_16(7 DOWNTO 0));
            add_temp_0 := resize(nibble_counter_in_unsigned, 17) + to_unsigned(16#00001#, 17);
            IF add_temp_0(16) /= '0' THEN 
              nibble_counter_out_tmp <= X"FFFF";
            ELSE 
              nibble_counter_out_tmp <= add_temp_0(15 DOWNTO 0);
            END IF;
            state_out_tmp <= to_unsigned(16#04#, 8);
          ELSE 
            byte_out_tmp <= byte_in_unsigned;
            nibble_counter_out_tmp <= nibble_counter_in_unsigned;
            state_out_tmp <= to_unsigned(16#09#, 8);
          END IF;
        ELSE 
          state_out_tmp <= to_unsigned(16#07#, 8);
          nibble_counter_out_tmp <= to_unsigned(16#0000#, 16);
          byte_out_tmp <= to_unsigned(16#00#, 8);
        END IF;
        rx_clk_fifo_out <= '0';
        preamble_out_tmp <= to_unsigned(16#00000000#, 32);
        source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
        source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
        source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
        source_ip_out_tmp <= source_ip_in_unsigned;
        dest_ip_out_tmp <= dest_ip_in_unsigned;
        source_port_out_tmp <= source_port_in_unsigned;
        dest_port_out_tmp <= dest_port_in_unsigned;
        udp_frame_out_tmp <= udp_frame_in_unsigned;
        udp_frame_out_ready <= udp_frame_in_ready;
        ip_length_out_tmp <= ip_length_in_unsigned;
        options_counter_out_tmp <= options_counter_in_unsigned;
        source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
        source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
        source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
        source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
        dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
        source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
        dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
        ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
      WHEN "00000100" =>
        cast := signed(resize(nibble_counter_in_unsigned, 32));
        cast_0 := cast AND to_signed(16#00000001#, 32);
        cast_1 := unsigned(cast_0(15 DOWNTO 0));
        IF cast_1 /= to_unsigned(16#00000000#, 16) THEN 
          temp := byte_in_unsigned;
          c_2 := temp srl 4;
          byte_out_tmp <= c_2;
          source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
          source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
          source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
          source_ip_out_tmp <= source_ip_in_unsigned;
          dest_ip_out_tmp <= dest_ip_in_unsigned;
          source_port_out_tmp <= source_port_in_unsigned;
          dest_port_out_tmp <= dest_port_in_unsigned;
          udp_frame_out_tmp <= udp_frame_in_unsigned;
          udp_frame_out_ready <= udp_frame_in_ready;
          state_out_tmp <= to_unsigned(16#03#, 8);
          ip_length_out_tmp <= ip_length_in_unsigned;
          options_counter_out_tmp <= options_counter_in_unsigned;
          source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
          source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
          source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
          source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
          dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
          source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
          dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
          ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
        ELSE 
          byte_out_tmp <= to_unsigned(16#00#, 8);
          guard1 := '0';
          CASE nibble_counter_in_unsigned IS
            WHEN "0000000000000000" =>
              source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
              source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
              source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
              source_ip_out_tmp <= source_ip_in_unsigned;
              dest_ip_out_tmp <= dest_ip_in_unsigned;
              source_port_out_tmp <= source_port_in_unsigned;
              dest_port_out_tmp <= dest_port_in_unsigned;
              udp_frame_out_tmp <= udp_frame_in_unsigned;
              udp_frame_out_ready <= udp_frame_in_ready;
              state_out_tmp <= to_unsigned(16#03#, 8);
              ip_length_out_tmp <= ip_length_in_unsigned;
              options_counter_out_tmp <= to_unsigned(16#0000#, 16);
              source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
              source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
              source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
              source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
              dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
              source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
              dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
              ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
            WHEN "0000000000000010" =>
              source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
              source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
              source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
              source_ip_out_tmp <= source_ip_in_unsigned;
              dest_ip_out_tmp <= dest_ip_in_unsigned;
              source_port_out_tmp <= source_port_in_unsigned;
              dest_port_out_tmp <= dest_port_in_unsigned;
              udp_frame_out_tmp <= udp_frame_in_unsigned;
              udp_frame_out_ready <= udp_frame_in_ready;
              temp_11 := mac_addr1_unsigned;
              c_7 := temp_11 srl 8;
              cast_32 := signed(resize(byte_in_unsigned, 32));
              cast_33 := signed(resize(c_7, 32));
              IF (cast_32 = cast_33) OR (byte_in_unsigned = to_unsigned(16#000000FF#, 8)) THEN 
                state_out_tmp <= to_unsigned(16#03#, 8);
              ELSE 
                state_out_tmp <= to_unsigned(16#05#, 8);
              END IF;
              ip_length_out_tmp <= ip_length_in_unsigned;
              options_counter_out_tmp <= to_unsigned(16#0000#, 16);
              source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
              source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
              source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
              source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
              dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
              source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
              dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
              ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
            WHEN "0000000000000100" =>
              source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
              source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
              source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
              source_ip_out_tmp <= source_ip_in_unsigned;
              dest_ip_out_tmp <= dest_ip_in_unsigned;
              source_port_out_tmp <= source_port_in_unsigned;
              dest_port_out_tmp <= dest_port_in_unsigned;
              udp_frame_out_tmp <= udp_frame_in_unsigned;
              udp_frame_out_ready <= udp_frame_in_ready;
              cast_17 := signed(resize(byte_in_unsigned, 32));
              cast_18 := signed(resize(mac_addr1_unsigned, 32));
              cast_19 := cast_18 AND to_signed(16#000000FF#, 32);
              cast_20 := unsigned(cast_19(15 DOWNTO 0));
              cast_21 := signed(resize(cast_20, 32));
              IF (cast_17 = cast_21) OR (byte_in_unsigned = to_unsigned(16#000000FF#, 8)) THEN 
                state_out_tmp <= to_unsigned(16#03#, 8);
              ELSE 
                state_out_tmp <= to_unsigned(16#05#, 8);
              END IF;
              ip_length_out_tmp <= ip_length_in_unsigned;
              options_counter_out_tmp <= to_unsigned(16#0000#, 16);
              source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
              source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
              source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
              source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
              dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
              source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
              dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
              ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
            WHEN "0000000000000110" =>
              source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
              source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
              source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
              source_ip_out_tmp <= source_ip_in_unsigned;
              dest_ip_out_tmp <= dest_ip_in_unsigned;
              source_port_out_tmp <= source_port_in_unsigned;
              dest_port_out_tmp <= dest_port_in_unsigned;
              udp_frame_out_tmp <= udp_frame_in_unsigned;
              udp_frame_out_ready <= udp_frame_in_ready;
              temp_12 := mac_addr2_unsigned;
              c_8 := temp_12 srl 8;
              cast_34 := signed(resize(byte_in_unsigned, 32));
              cast_35 := signed(resize(c_8, 32));
              IF (cast_34 = cast_35) OR (byte_in_unsigned = to_unsigned(16#000000FF#, 8)) THEN 
                state_out_tmp <= to_unsigned(16#03#, 8);
              ELSE 
                state_out_tmp <= to_unsigned(16#05#, 8);
              END IF;
              ip_length_out_tmp <= ip_length_in_unsigned;
              options_counter_out_tmp <= to_unsigned(16#0000#, 16);
              source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
              source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
              source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
              source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
              dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
              source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
              dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
              ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
            WHEN "0000000000001000" =>
              source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
              source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
              source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
              source_ip_out_tmp <= source_ip_in_unsigned;
              dest_ip_out_tmp <= dest_ip_in_unsigned;
              source_port_out_tmp <= source_port_in_unsigned;
              dest_port_out_tmp <= dest_port_in_unsigned;
              udp_frame_out_tmp <= udp_frame_in_unsigned;
              udp_frame_out_ready <= udp_frame_in_ready;
              cast_22 := signed(resize(byte_in_unsigned, 32));
              cast_23 := signed(resize(mac_addr2_unsigned, 32));
              cast_24 := cast_23 AND to_signed(16#000000FF#, 32);
              cast_25 := unsigned(cast_24(15 DOWNTO 0));
              cast_26 := signed(resize(cast_25, 32));
              IF (cast_22 = cast_26) OR (byte_in_unsigned = to_unsigned(16#000000FF#, 8)) THEN 
                state_out_tmp <= to_unsigned(16#03#, 8);
              ELSE 
                state_out_tmp <= to_unsigned(16#05#, 8);
              END IF;
              ip_length_out_tmp <= ip_length_in_unsigned;
              options_counter_out_tmp <= to_unsigned(16#0000#, 16);
              source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
              source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
              source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
              source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
              dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
              source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
              dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
              ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
            WHEN "0000000000001010" =>
              source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
              source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
              source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
              source_ip_out_tmp <= source_ip_in_unsigned;
              dest_ip_out_tmp <= dest_ip_in_unsigned;
              source_port_out_tmp <= source_port_in_unsigned;
              dest_port_out_tmp <= dest_port_in_unsigned;
              udp_frame_out_tmp <= udp_frame_in_unsigned;
              udp_frame_out_ready <= udp_frame_in_ready;
              temp_13 := mac_addr3_unsigned;
              c_9 := temp_13 srl 8;
              cast_36 := signed(resize(byte_in_unsigned, 32));
              cast_37 := signed(resize(c_9, 32));
              IF (cast_36 = cast_37) OR (byte_in_unsigned = to_unsigned(16#000000FF#, 8)) THEN 
                state_out_tmp <= to_unsigned(16#03#, 8);
              ELSE 
                state_out_tmp <= to_unsigned(16#05#, 8);
              END IF;
              ip_length_out_tmp <= ip_length_in_unsigned;
              options_counter_out_tmp <= to_unsigned(16#0000#, 16);
              source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
              source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
              source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
              source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
              dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
              source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
              dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
              ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
            WHEN "0000000000001100" =>
              source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
              source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
              source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
              source_ip_out_tmp <= source_ip_in_unsigned;
              dest_ip_out_tmp <= dest_ip_in_unsigned;
              source_port_out_tmp <= source_port_in_unsigned;
              dest_port_out_tmp <= dest_port_in_unsigned;
              udp_frame_out_tmp <= udp_frame_in_unsigned;
              udp_frame_out_ready <= udp_frame_in_ready;
              cast_27 := signed(resize(byte_in_unsigned, 32));
              cast_28 := signed(resize(mac_addr3_unsigned, 32));
              cast_29 := cast_28 AND to_signed(16#000000FF#, 32);
              cast_30 := unsigned(cast_29(15 DOWNTO 0));
              cast_31 := signed(resize(cast_30, 32));
              IF (cast_27 = cast_31) OR (byte_in_unsigned = to_unsigned(16#000000FF#, 8)) THEN 
                state_out_tmp <= to_unsigned(16#03#, 8);
              ELSE 
                state_out_tmp <= to_unsigned(16#05#, 8);
              END IF;
              ip_length_out_tmp <= ip_length_in_unsigned;
              options_counter_out_tmp <= to_unsigned(16#0000#, 16);
              source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
              source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
              source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
              source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
              dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
              source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
              dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
              ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
            WHEN "0000000000001110" =>
              source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
              source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
              source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
              source_ip_out_tmp <= source_ip_in_unsigned;
              dest_ip_out_tmp <= dest_ip_in_unsigned;
              source_port_out_tmp <= source_port_in_unsigned;
              dest_port_out_tmp <= dest_port_in_unsigned;
              udp_frame_out_tmp <= udp_frame_in_unsigned;
              udp_frame_out_ready <= udp_frame_in_ready;
              state_out_tmp <= to_unsigned(16#03#, 8);
              ip_length_out_tmp <= ip_length_in_unsigned;
              options_counter_out_tmp <= to_unsigned(16#0000#, 16);
              temp_14 := resize(byte_in_unsigned, 16);
              c_10 := temp_14 sll 8;
              cast_44 := signed(resize(c_10, 32));
              cast_45 := cast_44 AND to_signed(16#0000FF00#, 32);
              source_mac_addr1_tmp_out_tmp <= unsigned(cast_45(15 DOWNTO 0));
              source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
              source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
              source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
              dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
              source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
              dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
              ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
            WHEN "0000000000010000" =>
              source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
              source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
              source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
              source_ip_out_tmp <= source_ip_in_unsigned;
              dest_ip_out_tmp <= dest_ip_in_unsigned;
              source_port_out_tmp <= source_port_in_unsigned;
              dest_port_out_tmp <= dest_port_in_unsigned;
              udp_frame_out_tmp <= udp_frame_in_unsigned;
              udp_frame_out_ready <= udp_frame_in_ready;
              state_out_tmp <= to_unsigned(16#03#, 8);
              ip_length_out_tmp <= ip_length_in_unsigned;
              options_counter_out_tmp <= to_unsigned(16#0000#, 16);
              cast_38 := signed(resize(byte_in_unsigned, 32));
              cast_39 := signed(resize(source_mac_addr1_tmp_in_unsigned, 32));
              cast_40 := cast_38 OR cast_39;
              source_mac_addr1_tmp_out_tmp <= unsigned(cast_40(15 DOWNTO 0));
              source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
              source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
              source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
              dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
              source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
              dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
              ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
            WHEN "0000000000010010" =>
              source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
              source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
              source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
              source_ip_out_tmp <= source_ip_in_unsigned;
              dest_ip_out_tmp <= dest_ip_in_unsigned;
              source_port_out_tmp <= source_port_in_unsigned;
              dest_port_out_tmp <= dest_port_in_unsigned;
              udp_frame_out_tmp <= udp_frame_in_unsigned;
              udp_frame_out_ready <= udp_frame_in_ready;
              state_out_tmp <= to_unsigned(16#03#, 8);
              ip_length_out_tmp <= ip_length_in_unsigned;
              options_counter_out_tmp <= to_unsigned(16#0000#, 16);
              source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
              temp_15 := resize(byte_in_unsigned, 16);
              c_11 := temp_15 sll 8;
              cast_49 := signed(resize(c_11, 32));
              cast_50 := cast_49 AND to_signed(16#0000FF00#, 32);
              source_mac_addr2_tmp_out_tmp <= unsigned(cast_50(15 DOWNTO 0));
              source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
              source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
              dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
              source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
              dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
              ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
            WHEN "0000000000010100" =>
              source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
              source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
              source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
              source_ip_out_tmp <= source_ip_in_unsigned;
              dest_ip_out_tmp <= dest_ip_in_unsigned;
              source_port_out_tmp <= source_port_in_unsigned;
              dest_port_out_tmp <= dest_port_in_unsigned;
              udp_frame_out_tmp <= udp_frame_in_unsigned;
              udp_frame_out_ready <= udp_frame_in_ready;
              state_out_tmp <= to_unsigned(16#03#, 8);
              ip_length_out_tmp <= ip_length_in_unsigned;
              options_counter_out_tmp <= to_unsigned(16#0000#, 16);
              source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
              cast_41 := signed(resize(byte_in_unsigned, 32));
              cast_42 := signed(resize(source_mac_addr2_tmp_in_unsigned, 32));
              cast_43 := cast_41 OR cast_42;
              source_mac_addr2_tmp_out_tmp <= unsigned(cast_43(15 DOWNTO 0));
              source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
              source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
              dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
              source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
              dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
              ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
            WHEN "0000000000010110" =>
              source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
              source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
              source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
              source_ip_out_tmp <= source_ip_in_unsigned;
              dest_ip_out_tmp <= dest_ip_in_unsigned;
              source_port_out_tmp <= source_port_in_unsigned;
              dest_port_out_tmp <= dest_port_in_unsigned;
              udp_frame_out_tmp <= udp_frame_in_unsigned;
              udp_frame_out_ready <= udp_frame_in_ready;
              state_out_tmp <= to_unsigned(16#03#, 8);
              ip_length_out_tmp <= ip_length_in_unsigned;
              options_counter_out_tmp <= to_unsigned(16#0000#, 16);
              source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
              source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
              temp_16 := resize(byte_in_unsigned, 16);
              c_14 := temp_16 sll 8;
              cast_51 := signed(resize(c_14, 32));
              cast_52 := cast_51 AND to_signed(16#0000FF00#, 32);
              source_mac_addr3_tmp_out_tmp <= unsigned(cast_52(15 DOWNTO 0));
              source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
              dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
              source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
              dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
              ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
            WHEN "0000000000011000" =>
              source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
              source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
              source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
              source_ip_out_tmp <= source_ip_in_unsigned;
              dest_ip_out_tmp <= dest_ip_in_unsigned;
              source_port_out_tmp <= source_port_in_unsigned;
              dest_port_out_tmp <= dest_port_in_unsigned;
              udp_frame_out_tmp <= udp_frame_in_unsigned;
              udp_frame_out_ready <= udp_frame_in_ready;
              state_out_tmp <= to_unsigned(16#03#, 8);
              ip_length_out_tmp <= ip_length_in_unsigned;
              options_counter_out_tmp <= to_unsigned(16#0000#, 16);
              source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
              source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
              cast_46 := signed(resize(byte_in_unsigned, 32));
              cast_47 := signed(resize(source_mac_addr3_tmp_in_unsigned, 32));
              cast_48 := cast_46 OR cast_47;
              source_mac_addr3_tmp_out_tmp <= unsigned(cast_48(15 DOWNTO 0));
              source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
              dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
              source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
              dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
              ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
            WHEN "0000000000011010" =>
              source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
              source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
              source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
              source_ip_out_tmp <= source_ip_in_unsigned;
              dest_ip_out_tmp <= dest_ip_in_unsigned;
              source_port_out_tmp <= source_port_in_unsigned;
              dest_port_out_tmp <= dest_port_in_unsigned;
              udp_frame_out_tmp <= udp_frame_in_unsigned;
              udp_frame_out_ready <= udp_frame_in_ready;
              IF byte_in_unsigned = to_unsigned(16#00000008#, 8) THEN 
                state_out_tmp <= to_unsigned(16#03#, 8);
              ELSE 
                state_out_tmp <= to_unsigned(16#05#, 8);
              END IF;
              ip_length_out_tmp <= ip_length_in_unsigned;
              options_counter_out_tmp <= to_unsigned(16#0000#, 16);
              source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
              source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
              source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
              source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
              dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
              source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
              dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
              ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
            WHEN "0000000000011100" =>
              source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
              source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
              source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
              source_ip_out_tmp <= source_ip_in_unsigned;
              dest_ip_out_tmp <= dest_ip_in_unsigned;
              source_port_out_tmp <= source_port_in_unsigned;
              dest_port_out_tmp <= dest_port_in_unsigned;
              udp_frame_out_tmp <= udp_frame_in_unsigned;
              udp_frame_out_ready <= udp_frame_in_ready;
              IF byte_in_unsigned = to_unsigned(16#00000000#, 8) THEN 
                state_out_tmp <= to_unsigned(16#03#, 8);
              ELSE 
                state_out_tmp <= to_unsigned(16#05#, 8);
              END IF;
              ip_length_out_tmp <= ip_length_in_unsigned;
              options_counter_out_tmp <= to_unsigned(16#0000#, 16);
              source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
              source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
              source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
              source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
              dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
              source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
              dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
              ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
            WHEN "0000000000011110" =>
              source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
              source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
              source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
              source_ip_out_tmp <= source_ip_in_unsigned;
              dest_ip_out_tmp <= dest_ip_in_unsigned;
              source_port_out_tmp <= source_port_in_unsigned;
              dest_port_out_tmp <= dest_port_in_unsigned;
              udp_frame_out_tmp <= udp_frame_in_unsigned;
              udp_frame_out_ready <= udp_frame_in_ready;
              IF byte_in_unsigned = to_unsigned(16#00000045#, 8) THEN 
                state_out_tmp <= to_unsigned(16#03#, 8);
              ELSE 
                state_out_tmp <= to_unsigned(16#05#, 8);
              END IF;
              ip_length_out_tmp <= ip_length_in_unsigned;
              options_counter_out_tmp <= to_unsigned(16#0000#, 16);
              source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
              source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
              source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
              source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
              dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
              source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
              dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
              ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
            WHEN "0000000000100010" =>
              source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
              source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
              source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
              source_ip_out_tmp <= source_ip_in_unsigned;
              dest_ip_out_tmp <= dest_ip_in_unsigned;
              source_port_out_tmp <= source_port_in_unsigned;
              dest_port_out_tmp <= dest_port_in_unsigned;
              udp_frame_out_tmp <= udp_frame_in_unsigned;
              udp_frame_out_ready <= udp_frame_in_ready;
              state_out_tmp <= to_unsigned(16#03#, 8);
              ip_length_out_tmp <= ip_length_in_unsigned;
              options_counter_out_tmp <= to_unsigned(16#0000#, 16);
              source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
              source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
              source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
              source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
              dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
              source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
              dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
              temp_25 := resize(byte_in_unsigned, 16);
              c_23 := temp_25 sll 8;
              cast_70 := signed(resize(c_23, 32));
              cast_71 := cast_70 AND to_signed(16#0000FF00#, 32);
              ip_length_tmp_out_tmp <= unsigned(cast_71(15 DOWNTO 0));
            WHEN "0000000000100100" =>
              source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
              source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
              source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
              source_ip_out_tmp <= source_ip_in_unsigned;
              dest_ip_out_tmp <= dest_ip_in_unsigned;
              source_port_out_tmp <= source_port_in_unsigned;
              dest_port_out_tmp <= dest_port_in_unsigned;
              udp_frame_out_tmp <= udp_frame_in_unsigned;
              udp_frame_out_ready <= udp_frame_in_ready;
              state_out_tmp <= to_unsigned(16#03#, 8);
              ip_length_out_tmp <= ip_length_in_unsigned;
              options_counter_out_tmp <= to_unsigned(16#0000#, 16);
              source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
              source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
              source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
              source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
              dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
              source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
              dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
              cast_63 := signed(resize(byte_in_unsigned, 32));
              cast_64 := signed(resize(ip_length_tmp_in_unsigned, 32));
              cast_65 := cast_63 OR cast_64;
              ip_length_tmp_out_tmp <= unsigned(cast_65(15 DOWNTO 0));
            WHEN "0000000000110000" =>
              source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
              source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
              source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
              source_ip_out_tmp <= source_ip_in_unsigned;
              dest_ip_out_tmp <= dest_ip_in_unsigned;
              source_port_out_tmp <= source_port_in_unsigned;
              dest_port_out_tmp <= dest_port_in_unsigned;
              udp_frame_out_tmp <= udp_frame_in_unsigned;
              udp_frame_out_ready <= udp_frame_in_ready;
              IF byte_in_unsigned = to_unsigned(16#00000011#, 8) THEN 
                state_out_tmp <= to_unsigned(16#03#, 8);
              ELSE 
                state_out_tmp <= to_unsigned(16#05#, 8);
              END IF;
              ip_length_out_tmp <= ip_length_in_unsigned;
              options_counter_out_tmp <= to_unsigned(16#0000#, 16);
              source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
              source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
              source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
              source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
              dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
              source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
              dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
              ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
            WHEN "0000000000110110" =>
              source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
              source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
              source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
              source_ip_out_tmp <= source_ip_in_unsigned;
              dest_ip_out_tmp <= dest_ip_in_unsigned;
              source_port_out_tmp <= source_port_in_unsigned;
              dest_port_out_tmp <= dest_port_in_unsigned;
              udp_frame_out_tmp <= udp_frame_in_unsigned;
              udp_frame_out_ready <= udp_frame_in_ready;
              state_out_tmp <= to_unsigned(16#03#, 8);
              ip_length_out_tmp <= ip_length_in_unsigned;
              options_counter_out_tmp <= to_unsigned(16#0000#, 16);
              source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
              source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
              source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
              temp_17 := resize(byte_in_unsigned, 32);
              c_15 := temp_17 sll 24;
              w_3 := c_15;
              source_ip_tmp_out_tmp <= w_3 AND unsigned'("11111111000000000000000000000000");
              dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
              source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
              dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
              ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
            WHEN "0000000000111000" =>
              source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
              source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
              source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
              source_ip_out_tmp <= source_ip_in_unsigned;
              dest_ip_out_tmp <= dest_ip_in_unsigned;
              source_port_out_tmp <= source_port_in_unsigned;
              dest_port_out_tmp <= dest_port_in_unsigned;
              udp_frame_out_tmp <= udp_frame_in_unsigned;
              udp_frame_out_ready <= udp_frame_in_ready;
              state_out_tmp <= to_unsigned(16#03#, 8);
              ip_length_out_tmp <= ip_length_in_unsigned;
              options_counter_out_tmp <= to_unsigned(16#0000#, 16);
              source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
              source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
              source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
              temp_18 := resize(byte_in_unsigned, 32);
              c_16 := temp_18 sll 16;
              w_4 := c_16;
              source_ip_tmp_out_tmp <= w_4 OR source_ip_tmp_in_unsigned;
              dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
              source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
              dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
              ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
            WHEN "0000000000111010" =>
              source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
              source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
              source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
              source_ip_out_tmp <= source_ip_in_unsigned;
              dest_ip_out_tmp <= dest_ip_in_unsigned;
              source_port_out_tmp <= source_port_in_unsigned;
              dest_port_out_tmp <= dest_port_in_unsigned;
              udp_frame_out_tmp <= udp_frame_in_unsigned;
              udp_frame_out_ready <= udp_frame_in_ready;
              state_out_tmp <= to_unsigned(16#03#, 8);
              ip_length_out_tmp <= ip_length_in_unsigned;
              options_counter_out_tmp <= to_unsigned(16#0000#, 16);
              source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
              source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
              source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
              temp_19 := resize(byte_in_unsigned, 32);
              c_17 := temp_19 sll 8;
              cast_53 := signed(c_17);
              cast_54 := unsigned(cast_53);
              source_ip_tmp_out_tmp <= cast_54 OR source_ip_tmp_in_unsigned;
              dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
              source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
              dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
              ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
            WHEN "0000000000111100" =>
              source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
              source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
              source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
              source_ip_out_tmp <= source_ip_in_unsigned;
              dest_ip_out_tmp <= dest_ip_in_unsigned;
              source_port_out_tmp <= source_port_in_unsigned;
              dest_port_out_tmp <= dest_port_in_unsigned;
              udp_frame_out_tmp <= udp_frame_in_unsigned;
              udp_frame_out_ready <= udp_frame_in_ready;
              state_out_tmp <= to_unsigned(16#03#, 8);
              ip_length_out_tmp <= ip_length_in_unsigned;
              options_counter_out_tmp <= to_unsigned(16#0000#, 16);
              source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
              source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
              source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
              source_ip_tmp_out_tmp <= resize(byte_in_unsigned, 32) OR source_ip_tmp_in_unsigned;
              dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
              source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
              dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
              ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
            WHEN "0000000000111110" =>
              source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
              source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
              source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
              source_ip_out_tmp <= source_ip_in_unsigned;
              dest_ip_out_tmp <= dest_ip_in_unsigned;
              source_port_out_tmp <= source_port_in_unsigned;
              dest_port_out_tmp <= dest_port_in_unsigned;
              udp_frame_out_tmp <= udp_frame_in_unsigned;
              udp_frame_out_ready <= udp_frame_in_ready;
              state_out_tmp <= to_unsigned(16#03#, 8);
              ip_length_out_tmp <= ip_length_in_unsigned;
              options_counter_out_tmp <= to_unsigned(16#0000#, 16);
              source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
              source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
              source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
              source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
              temp_20 := resize(byte_in_unsigned, 32);
              c_18 := temp_20 sll 24;
              w_5 := c_18;
              dest_ip_tmp_out_tmp <= w_5 AND unsigned'("11111111000000000000000000000000");
              source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
              dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
              ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
            WHEN "0000000001000000" =>
              source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
              source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
              source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
              source_ip_out_tmp <= source_ip_in_unsigned;
              dest_ip_out_tmp <= dest_ip_in_unsigned;
              source_port_out_tmp <= source_port_in_unsigned;
              dest_port_out_tmp <= dest_port_in_unsigned;
              udp_frame_out_tmp <= udp_frame_in_unsigned;
              udp_frame_out_ready <= udp_frame_in_ready;
              state_out_tmp <= to_unsigned(16#03#, 8);
              ip_length_out_tmp <= ip_length_in_unsigned;
              options_counter_out_tmp <= to_unsigned(16#0000#, 16);
              source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
              source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
              source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
              source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
              temp_21 := resize(byte_in_unsigned, 32);
              c_19 := temp_21 sll 16;
              w_6 := c_19;
              dest_ip_tmp_out_tmp <= w_6 OR dest_ip_tmp_in_unsigned;
              source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
              dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
              ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
            WHEN "0000000001000010" =>
              source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
              source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
              source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
              source_ip_out_tmp <= source_ip_in_unsigned;
              dest_ip_out_tmp <= dest_ip_in_unsigned;
              source_port_out_tmp <= source_port_in_unsigned;
              dest_port_out_tmp <= dest_port_in_unsigned;
              udp_frame_out_tmp <= udp_frame_in_unsigned;
              udp_frame_out_ready <= udp_frame_in_ready;
              state_out_tmp <= to_unsigned(16#03#, 8);
              ip_length_out_tmp <= ip_length_in_unsigned;
              options_counter_out_tmp <= to_unsigned(16#0000#, 16);
              source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
              source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
              source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
              source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
              temp_22 := resize(byte_in_unsigned, 32);
              c_20 := temp_22 sll 8;
              cast_58 := signed(c_20);
              cast_59 := unsigned(cast_58);
              dest_ip_tmp_out_tmp <= cast_59 OR dest_ip_tmp_in_unsigned;
              source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
              dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
              ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
            WHEN "0000000001000100" =>
              source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
              source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
              source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
              source_ip_out_tmp <= source_ip_in_unsigned;
              dest_ip_out_tmp <= dest_ip_in_unsigned;
              source_port_out_tmp <= source_port_in_unsigned;
              dest_port_out_tmp <= dest_port_in_unsigned;
              udp_frame_out_tmp <= udp_frame_in_unsigned;
              udp_frame_out_ready <= udp_frame_in_ready;
              state_out_tmp <= to_unsigned(16#03#, 8);
              ip_length_out_tmp <= ip_length_in_unsigned;
              options_counter_out_tmp <= to_unsigned(16#0000#, 16);
              source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
              source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
              source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
              source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
              dest_ip_tmp_out_tmp <= resize(byte_in_unsigned, 32) OR dest_ip_tmp_in_unsigned;
              source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
              dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
              ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
            WHEN "0000000001000110" =>
              source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
              source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
              source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
              source_ip_out_tmp <= source_ip_in_unsigned;
              dest_ip_out_tmp <= dest_ip_in_unsigned;
              source_port_out_tmp <= source_port_in_unsigned;
              dest_port_out_tmp <= dest_port_in_unsigned;
              udp_frame_out_tmp <= udp_frame_in_unsigned;
              udp_frame_out_ready <= udp_frame_in_ready;
              state_out_tmp <= to_unsigned(16#03#, 8);
              ip_length_out_tmp <= ip_length_in_unsigned;
              options_counter_out_tmp <= to_unsigned(16#0000#, 16);
              source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
              source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
              source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
              source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
              dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
              temp_23 := resize(byte_in_unsigned, 16);
              c_21 := temp_23 sll 8;
              cast_66 := signed(resize(c_21, 32));
              cast_67 := cast_66 AND to_signed(16#0000FF00#, 32);
              source_port_tmp_out_tmp <= unsigned(cast_67(15 DOWNTO 0));
              dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
              ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
            WHEN "0000000001001000" =>
              source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
              source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
              source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
              source_ip_out_tmp <= source_ip_in_unsigned;
              dest_ip_out_tmp <= dest_ip_in_unsigned;
              source_port_out_tmp <= source_port_in_unsigned;
              dest_port_out_tmp <= dest_port_in_unsigned;
              udp_frame_out_tmp <= udp_frame_in_unsigned;
              udp_frame_out_ready <= udp_frame_in_ready;
              state_out_tmp <= to_unsigned(16#03#, 8);
              ip_length_out_tmp <= ip_length_in_unsigned;
              options_counter_out_tmp <= to_unsigned(16#0000#, 16);
              source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
              source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
              source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
              source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
              dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
              cast_55 := signed(resize(byte_in_unsigned, 32));
              cast_56 := signed(resize(source_port_tmp_in_unsigned, 32));
              cast_57 := cast_55 OR cast_56;
              source_port_tmp_out_tmp <= unsigned(cast_57(15 DOWNTO 0));
              dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
              ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
            WHEN "0000000001001010" =>
              source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
              source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
              source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
              source_ip_out_tmp <= source_ip_in_unsigned;
              dest_ip_out_tmp <= dest_ip_in_unsigned;
              source_port_out_tmp <= source_port_in_unsigned;
              dest_port_out_tmp <= dest_port_in_unsigned;
              udp_frame_out_tmp <= udp_frame_in_unsigned;
              udp_frame_out_ready <= udp_frame_in_ready;
              state_out_tmp <= to_unsigned(16#03#, 8);
              ip_length_out_tmp <= ip_length_in_unsigned;
              options_counter_out_tmp <= to_unsigned(16#0000#, 16);
              source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
              source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
              source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
              source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
              dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
              source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
              temp_24 := resize(byte_in_unsigned, 16);
              c_22 := temp_24 sll 8;
              cast_68 := signed(resize(c_22, 32));
              cast_69 := cast_68 AND to_signed(16#0000FF00#, 32);
              dest_port_tmp_out_tmp <= unsigned(cast_69(15 DOWNTO 0));
              ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
            WHEN "0000000001001100" =>
              source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
              source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
              source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
              source_ip_out_tmp <= source_ip_in_unsigned;
              dest_ip_out_tmp <= dest_ip_in_unsigned;
              source_port_out_tmp <= source_port_in_unsigned;
              dest_port_out_tmp <= dest_port_in_unsigned;
              udp_frame_out_tmp <= udp_frame_in_unsigned;
              udp_frame_out_ready <= udp_frame_in_ready;
              state_out_tmp <= to_unsigned(16#03#, 8);
              ip_length_out_tmp <= ip_length_in_unsigned;
              options_counter_out_tmp <= to_unsigned(16#0000#, 16);
              source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
              source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
              source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
              source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
              dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
              source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
              cast_60 := signed(resize(byte_in_unsigned, 32));
              cast_61 := signed(resize(dest_port_tmp_in_unsigned, 32));
              cast_62 := cast_60 OR cast_61;
              dest_port_tmp_out_tmp <= unsigned(cast_62(15 DOWNTO 0));
              ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
            WHEN "0000000001001110" =>
              -- check the destination port
              IF (dest_port_tmp_in_unsigned = dhcp_port_unsigned) OR (dest_port_tmp_in_unsigned = data_port_unsigned) THEN 
                state_out_tmp <= to_unsigned(16#03#, 8);
                udp_frame_out_tmp <= (OTHERS => to_unsigned(16#00#, 8));
                udp_frame_out_ready <= '0';
                source_mac_addr1_out_tmp <= source_mac_addr1_tmp_in_unsigned;
                source_mac_addr2_out_tmp <= source_mac_addr2_tmp_in_unsigned;
                source_mac_addr3_out_tmp <= source_mac_addr3_tmp_in_unsigned;
                source_ip_out_tmp <= source_ip_tmp_in_unsigned;
                dest_ip_out_tmp <= dest_ip_tmp_in_unsigned;
                source_port_out_tmp <= source_port_tmp_in_unsigned;
                dest_port_out_tmp <= dest_port_tmp_in_unsigned;
                ip_length_out_tmp <= ip_length_tmp_in_unsigned;
              ELSE 
                state_out_tmp <= to_unsigned(16#05#, 8);
                udp_frame_out_tmp <= udp_frame_in_unsigned;
                udp_frame_out_ready <= udp_frame_in_ready;
                source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
                source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
                source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
                source_ip_out_tmp <= source_ip_in_unsigned;
                dest_ip_out_tmp <= dest_ip_in_unsigned;
                source_port_out_tmp <= source_port_in_unsigned;
                dest_port_out_tmp <= dest_port_in_unsigned;
                ip_length_out_tmp <= ip_length_in_unsigned;
              END IF;
              options_counter_out_tmp <= to_unsigned(16#0000#, 16);
              source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
              source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
              source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
              source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
              dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
              source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
              dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
              ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
            WHEN "0000000001010110" =>
              guard1 := '1';
            WHEN "0000000001011000" =>
              guard1 := '1';
            WHEN "0000000001011010" =>
              guard1 := '1';
            WHEN "0000000001011100" =>
              guard1 := '1';
            WHEN "0000000001011110" =>
              guard1 := '1';
            WHEN "0000000001100000" =>
              guard1 := '1';
            WHEN "0000000001100010" =>
              guard1 := '1';
            WHEN "0000000001100100" =>
              guard1 := '1';
            WHEN "0000000001100110" =>
              guard1 := '1';
            WHEN "0000000001101000" =>
              guard1 := '1';
            WHEN "0000000001101010" =>
              guard1 := '1';
            WHEN "0000000001101100" =>
              guard1 := '1';
            WHEN "0000000001101110" =>
              guard1 := '1';
            WHEN "0000000001110000" =>
              guard1 := '1';
            WHEN "0000000001110010" =>
              guard1 := '1';
            WHEN "0000000001110100" =>
              guard1 := '1';
            WHEN "0000000001110110" =>
              guard1 := '1';
            WHEN "0000000001111000" =>
              guard1 := '1';
            WHEN "0000000001111010" =>
              guard1 := '1';
            WHEN "0000000001111100" =>
              guard1 := '1';
            WHEN "0000000001111110" =>
              guard1 := '1';
            WHEN "0000000010000000" =>
              guard1 := '1';
            WHEN "0000000010000010" =>
              guard1 := '1';
            WHEN "0000000010000100" =>
              guard1 := '1';
            WHEN "0000000010000110" =>
              guard1 := '1';
            WHEN "0000000010001000" =>
              guard1 := '1';
            WHEN "0000000010001010" =>
              guard1 := '1';
            WHEN "0000000010001100" =>
              guard1 := '1';
            WHEN "0000000010001110" =>
              guard1 := '1';
            WHEN "0000000010010000" =>
              guard1 := '1';
            WHEN "0000000010010010" =>
              guard1 := '1';
            WHEN "0000000010010100" =>
              guard1 := '1';
            WHEN "0000000010010110" =>
              guard1 := '1';
            WHEN "0000000010011000" =>
              guard1 := '1';
            WHEN "0000000010011010" =>
              guard1 := '1';
            WHEN "0000000010011100" =>
              guard1 := '1';
            WHEN "0000000010011110" =>
              guard1 := '1';
            WHEN "0000000010100000" =>
              guard1 := '1';
            WHEN "0000000010100010" =>
              guard1 := '1';
            WHEN "0000000010100100" =>
              guard1 := '1';
            WHEN "0000000010100110" =>
              guard1 := '1';
            WHEN "0000000010101000" =>
              guard1 := '1';
            WHEN "0000000010101010" =>
              guard1 := '1';
            WHEN "0000000010101100" =>
              guard1 := '1';
            WHEN OTHERS => 
              udp_frame_out_tmp <= udp_frame_in_unsigned;
              IF nibble_counter_in_unsigned < to_unsigned(16#000000AE#, 16) THEN 
                state_out_tmp <= to_unsigned(16#03#, 8);
                udp_frame_out_ready <= udp_frame_in_ready;
                options_counter_out_tmp <= to_unsigned(16#0000#, 16);
              ELSE 
                add_temp := resize(ip_length_in_unsigned, 17) + to_unsigned(16#0000E#, 17);
                IF add_temp(16) /= '0' THEN 
                  temp_9 := X"FFFF";
                ELSE 
                  temp_9 := add_temp(15 DOWNTO 0);
                END IF;
                c_5 := temp_9 sll 1;
                IF nibble_counter_in_unsigned < c_5 THEN 
                  -- write the magic cookie and all other bytes after it to the udp_frame(45 ....)
                  IF (byte_in_unsigned = to_unsigned(16#00000063#, 8)) AND (options_counter_in_unsigned = to_unsigned(16#00000000#, 16)) THEN 
                    udp_frame_out_tmp(44) <= to_unsigned(16#63#, 8);
                  END IF;
                  IF ((byte_in_unsigned = to_unsigned(16#00000082#, 8)) AND (udp_frame_in_unsigned(44) = to_unsigned(16#00000063#, 8))) AND (options_counter_in_unsigned = to_unsigned(16#00000000#, 16)) THEN 
                    udp_frame_out_tmp(45) <= to_unsigned(16#82#, 8);
                  END IF;
                  IF (((byte_in_unsigned = to_unsigned(16#00000053#, 8)) AND (udp_frame_in_unsigned(44) = to_unsigned(16#00000063#, 8))) AND (udp_frame_in_unsigned(45) = to_unsigned(16#00000082#, 8))) AND (options_counter_in_unsigned = to_unsigned(16#00000000#, 16)) THEN 
                    udp_frame_out_tmp(46) <= to_unsigned(16#53#, 8);
                  END IF;
                  IF ((((byte_in_unsigned = to_unsigned(16#00000063#, 8)) AND (udp_frame_in_unsigned(44) = to_unsigned(16#00000063#, 8))) AND (udp_frame_in_unsigned(45) = to_unsigned(16#00000082#, 8))) AND (udp_frame_in_unsigned(46) = to_unsigned(16#00000053#, 8))) AND (options_counter_in_unsigned = to_unsigned(16#00000000#, 16)) THEN 
                    udp_frame_out_tmp(47) <= to_unsigned(16#63#, 8);
                  END IF;
                  IF (((udp_frame_in_unsigned(44) = to_unsigned(16#00000063#, 8)) AND (udp_frame_in_unsigned(45) = to_unsigned(16#00000082#, 8))) AND (udp_frame_in_unsigned(46) = to_unsigned(16#00000053#, 8))) AND (udp_frame_in_unsigned(47) = to_unsigned(16#00000063#, 8)) THEN 
                    add_temp_2 := resize(options_counter_in_unsigned, 17) + to_unsigned(16#00031#, 17);
                    IF add_temp_2(16) /= '0' THEN 
                      sub_cast_2 := X"FFFF";
                    ELSE 
                      sub_cast_2 := add_temp_2(15 DOWNTO 0);
                    END IF;
                    sub_cast_3 := signed(resize(sub_cast_2, 32));
                    udp_frame_out_tmp(to_integer(sub_cast_3 - 1)) <= byte_in_unsigned;
                    IF options_counter_in_unsigned < to_unsigned(16#0000003D#, 16) THEN 
                      options_counter_out_tmp <= options_counter_in_unsigned + 1;
                    ELSE 
                      options_counter_out_tmp <= options_counter_in_unsigned;
                    END IF;
                  ELSE 
                    options_counter_out_tmp <= to_unsigned(16#0000#, 16);
                  END IF;
                  state_out_tmp <= to_unsigned(16#03#, 8);
                  udp_frame_out_ready <= udp_frame_in_ready;
                  --                udp_frame_out_ready_signal = true;
                ELSE 
                  state_out_tmp <= to_unsigned(16#05#, 8);
                  udp_frame_out_ready <= '1';
                  options_counter_out_tmp <= to_unsigned(16#0000#, 16);
                END IF;
              END IF;
              source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
              source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
              source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
              source_ip_out_tmp <= source_ip_in_unsigned;
              dest_ip_out_tmp <= dest_ip_in_unsigned;
              source_port_out_tmp <= source_port_in_unsigned;
              dest_port_out_tmp <= dest_port_in_unsigned;
              ip_length_out_tmp <= ip_length_in_unsigned;
              source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
              source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
              source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
              source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
              dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
              source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
              dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
              ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
          END CASE;
          IF guard1 = '1' THEN 
            -- write udp data to udp_frame(1..44)
            udp_frame_out_tmp <= udp_frame_in_unsigned;
            udp_frame_out_ready <= udp_frame_in_ready;
            temp_10 := nibble_counter_in_unsigned;
            c_6 := temp_10 srl 1;
            sub_cast := signed(resize(c_6, 17));
            sub_temp := sub_cast - to_signed(16#0002A#, 17);
            IF sub_temp(16) = '1' THEN 
              sub_cast_0 := X"0000";
            ELSE 
              sub_cast_0 := unsigned(sub_temp(15 DOWNTO 0));
            END IF;
            sub_cast_1 := signed(resize(sub_cast_0, 32));
            udp_frame_out_tmp(to_integer(sub_cast_1 - 1)) <= byte_in_unsigned;
            source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
            source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
            source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
            source_ip_out_tmp <= source_ip_in_unsigned;
            dest_ip_out_tmp <= dest_ip_in_unsigned;
            source_port_out_tmp <= source_port_in_unsigned;
            dest_port_out_tmp <= dest_port_in_unsigned;
            state_out_tmp <= to_unsigned(16#03#, 8);
            ip_length_out_tmp <= ip_length_in_unsigned;
            options_counter_out_tmp <= to_unsigned(16#0000#, 16);
            source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
            source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
            source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
            source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
            dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
            source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
            dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
            ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
          END IF;
        END IF;
        nibble_counter_out_tmp <= nibble_counter_in_unsigned;
        rx_clk_fifo_out <= '1';
        preamble_out_tmp <= to_unsigned(16#00000000#, 32);
      WHEN "00000101" =>
        IF rx_dv = '1' THEN 
          state_out_tmp <= to_unsigned(16#06#, 8);
        ELSE 
          state_out_tmp <= to_unsigned(16#07#, 8);
        END IF;
        rx_clk_fifo_out <= '0';
        udp_frame_out_tmp <= udp_frame_in_unsigned;
        udp_frame_out_ready <= udp_frame_in_ready;
        source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
        source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
        source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
        source_ip_out_tmp <= source_ip_in_unsigned;
        dest_ip_out_tmp <= dest_ip_in_unsigned;
        source_port_out_tmp <= source_port_in_unsigned;
        dest_port_out_tmp <= dest_port_in_unsigned;
        ip_length_out_tmp <= ip_length_in_unsigned;
        nibble_counter_out_tmp <= to_unsigned(16#0000#, 16);
        preamble_out_tmp <= to_unsigned(16#00000000#, 32);
        byte_out_tmp <= to_unsigned(16#00#, 8);
        options_counter_out_tmp <= to_unsigned(16#0000#, 16);
        source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
        source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
        source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
        source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
        dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
        source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
        dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
        ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
      WHEN "00000110" =>
        state_out_tmp <= to_unsigned(16#05#, 8);
        rx_clk_fifo_out <= '1';
        source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
        source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
        source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
        source_ip_out_tmp <= source_ip_in_unsigned;
        dest_ip_out_tmp <= dest_ip_in_unsigned;
        source_port_out_tmp <= source_port_in_unsigned;
        dest_port_out_tmp <= dest_port_in_unsigned;
        udp_frame_out_tmp <= udp_frame_in_unsigned;
        udp_frame_out_ready <= udp_frame_in_ready;
        ip_length_out_tmp <= ip_length_in_unsigned;
        nibble_counter_out_tmp <= to_unsigned(16#0000#, 16);
        preamble_out_tmp <= to_unsigned(16#00000000#, 32);
        byte_out_tmp <= to_unsigned(16#00#, 8);
        options_counter_out_tmp <= to_unsigned(16#0000#, 16);
        source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
        source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
        source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
        source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
        dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
        source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
        dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
        ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
      WHEN "00000111" =>
        state_out_tmp <= to_unsigned(16#01#, 8);
        rx_clk_fifo_out <= '1';
        source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
        source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
        source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
        source_ip_out_tmp <= source_ip_in_unsigned;
        dest_ip_out_tmp <= dest_ip_in_unsigned;
        source_port_out_tmp <= source_port_in_unsigned;
        dest_port_out_tmp <= dest_port_in_unsigned;
        udp_frame_out_tmp <= udp_frame_in_unsigned;
        udp_frame_out_ready <= udp_frame_in_ready;
        ip_length_out_tmp <= ip_length_in_unsigned;
        nibble_counter_out_tmp <= to_unsigned(16#0000#, 16);
        preamble_out_tmp <= to_unsigned(16#00000000#, 32);
        byte_out_tmp <= to_unsigned(16#00#, 8);
        options_counter_out_tmp <= to_unsigned(16#0000#, 16);
        source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
        source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
        source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
        source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
        dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
        source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
        dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
        ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
      WHEN "00001000" =>
        rx_clk_fifo_out <= '1';
        source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
        source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
        source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
        source_ip_out_tmp <= source_ip_in_unsigned;
        dest_ip_out_tmp <= dest_ip_in_unsigned;
        source_port_out_tmp <= source_port_in_unsigned;
        dest_port_out_tmp <= dest_port_in_unsigned;
        udp_frame_out_tmp <= udp_frame_in_unsigned;
        udp_frame_out_ready <= udp_frame_in_ready;
        state_out_tmp <= to_unsigned(16#01#, 8);
        ip_length_out_tmp <= ip_length_in_unsigned;
        preamble_out_tmp <= preamble_in_unsigned;
        nibble_counter_out_tmp <= nibble_counter_in_unsigned;
        byte_out_tmp <= to_unsigned(16#00#, 8);
        options_counter_out_tmp <= to_unsigned(16#0000#, 16);
        source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
        source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
        source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
        source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
        dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
        source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
        dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
        ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
      WHEN "00001001" =>
        rx_clk_fifo_out <= '1';
        source_mac_addr1_out_tmp <= source_mac_addr1_in_unsigned;
        source_mac_addr2_out_tmp <= source_mac_addr2_in_unsigned;
        source_mac_addr3_out_tmp <= source_mac_addr3_in_unsigned;
        source_ip_out_tmp <= source_ip_in_unsigned;
        dest_ip_out_tmp <= dest_ip_in_unsigned;
        source_port_out_tmp <= source_port_in_unsigned;
        dest_port_out_tmp <= dest_port_in_unsigned;
        udp_frame_out_tmp <= udp_frame_in_unsigned;
        udp_frame_out_ready <= udp_frame_in_ready;
        state_out_tmp <= to_unsigned(16#03#, 8);
        ip_length_out_tmp <= ip_length_in_unsigned;
        preamble_out_tmp <= to_unsigned(16#00000000#, 32);
        nibble_counter_out_tmp <= nibble_counter_in_unsigned;
        byte_out_tmp <= byte_in_unsigned;
        options_counter_out_tmp <= options_counter_in_unsigned;
        source_mac_addr1_tmp_out_tmp <= source_mac_addr1_tmp_in_unsigned;
        source_mac_addr2_tmp_out_tmp <= source_mac_addr2_tmp_in_unsigned;
        source_mac_addr3_tmp_out_tmp <= source_mac_addr3_tmp_in_unsigned;
        source_ip_tmp_out_tmp <= source_ip_tmp_in_unsigned;
        dest_ip_tmp_out_tmp <= dest_ip_tmp_in_unsigned;
        source_port_tmp_out_tmp <= source_port_tmp_in_unsigned;
        dest_port_tmp_out_tmp <= dest_port_tmp_in_unsigned;
        ip_length_tmp_out_tmp <= ip_length_tmp_in_unsigned;
      WHEN OTHERS => 
        rx_clk_fifo_out <= '0';
        source_mac_addr1_out_tmp <= to_unsigned(16#0000#, 16);
        source_mac_addr2_out_tmp <= to_unsigned(16#0000#, 16);
        source_mac_addr3_out_tmp <= to_unsigned(16#0000#, 16);
        source_ip_out_tmp <= to_unsigned(16#00000000#, 32);
        dest_ip_out_tmp <= to_unsigned(16#00000000#, 32);
        source_port_out_tmp <= to_unsigned(16#0000#, 16);
        dest_port_out_tmp <= to_unsigned(16#0000#, 16);
        udp_frame_out_tmp <= (OTHERS => to_unsigned(16#00#, 8));
        udp_frame_out_ready <= '0';
        state_out_tmp <= to_unsigned(16#00#, 8);
        ip_length_out_tmp <= to_unsigned(16#0000#, 16);
        nibble_counter_out_tmp <= to_unsigned(16#0000#, 16);
        preamble_out_tmp <= to_unsigned(16#00000000#, 32);
        byte_out_tmp <= to_unsigned(16#00#, 8);
        options_counter_out_tmp <= to_unsigned(16#0000#, 16);
        source_mac_addr1_tmp_out_tmp <= to_unsigned(16#0000#, 16);
        source_mac_addr2_tmp_out_tmp <= to_unsigned(16#0000#, 16);
        source_mac_addr3_tmp_out_tmp <= to_unsigned(16#0000#, 16);
        source_ip_tmp_out_tmp <= to_unsigned(16#00000000#, 32);
        dest_ip_tmp_out_tmp <= to_unsigned(16#00000000#, 32);
        source_port_tmp_out_tmp <= to_unsigned(16#0000#, 16);
        dest_port_tmp_out_tmp <= to_unsigned(16#0000#, 16);
        ip_length_tmp_out_tmp <= to_unsigned(16#0000#, 16);
    END CASE;
  END PROCESS Receiver_1_output;


  source_mac_addr1_out <= std_logic_vector(source_mac_addr1_out_tmp);

  source_mac_addr2_out <= std_logic_vector(source_mac_addr2_out_tmp);

  source_mac_addr3_out <= std_logic_vector(source_mac_addr3_out_tmp);

  source_ip_out <= std_logic_vector(source_ip_out_tmp);

  dest_ip_out <= std_logic_vector(dest_ip_out_tmp);

  source_port_out <= std_logic_vector(source_port_out_tmp);

  dest_port_out <= std_logic_vector(dest_port_out_tmp);

  outputgen: FOR k IN 0 TO 109 GENERATE
    udp_frame_out(k) <= std_logic_vector(udp_frame_out_tmp(k));
  END GENERATE;

  state_out <= std_logic_vector(state_out_tmp);

  ip_length_out <= std_logic_vector(ip_length_out_tmp);

  nibble_counter_out <= std_logic_vector(nibble_counter_out_tmp);

  preamble_out <= std_logic_vector(preamble_out_tmp);

  byte_out <= std_logic_vector(byte_out_tmp);

  options_counter_out <= std_logic_vector(options_counter_out_tmp);

  source_mac_addr1_tmp_out <= std_logic_vector(source_mac_addr1_tmp_out_tmp);

  source_mac_addr2_tmp_out <= std_logic_vector(source_mac_addr2_tmp_out_tmp);

  source_mac_addr3_tmp_out <= std_logic_vector(source_mac_addr3_tmp_out_tmp);

  source_ip_tmp_out <= std_logic_vector(source_ip_tmp_out_tmp);

  dest_ip_tmp_out <= std_logic_vector(dest_ip_tmp_out_tmp);

  source_port_tmp_out <= std_logic_vector(source_port_tmp_out_tmp);

  dest_port_tmp_out <= std_logic_vector(dest_port_tmp_out_tmp);

  ip_length_tmp_out <= std_logic_vector(ip_length_tmp_out_tmp);

END rtl;

