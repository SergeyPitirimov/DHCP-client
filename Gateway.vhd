LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.Trader_pkg.ALL;

ENTITY Gateway IS
  PORT( server_ip_in                      :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        client_ip_in                      :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        ciaddr_in                         :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        ip_time_in                        :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        phy_ready                         :   IN    std_logic;
        random_number                     :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        retry_delay                       :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        mac_addr1                         :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        mac_addr2                         :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        mac_addr3                         :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        dhcp_port                         :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        data_port                         :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        source_mac_addr1                  :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        source_mac_addr2                  :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        source_mac_addr3                  :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        source_ip                         :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        dest_ip                           :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        source_port                       :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        dest_port                         :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        udp_frame                         :   IN    vector_of_std_logic_vector8(0 TO 109);  -- uint8 [110]
        udp_frame_ready                   :   IN    std_logic;
        transmitter_ready                 :   IN    std_logic;
        state_in                          :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        xid_in                            :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        cnt_in                            :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        renewal_cnt_in                    :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        server_ip_out                     :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        client_ip_out                     :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        ciaddr_out                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        ip_time_out                       :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        send                              :   OUT   std_logic;
        eth_frame                         :   OUT   vector_of_std_logic_vector8(0 TO 309);  -- uint8 [310]
        led1                              :   OUT   std_logic;
        led2                              :   OUT   std_logic;
        led3                              :   OUT   std_logic;
        led4                              :   OUT   std_logic;
        state_out                         :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
        xid_out                           :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        cnt_out                           :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        renewal_cnt_out                   :   OUT   std_logic_vector(31 DOWNTO 0)  -- uint32
        );
END Gateway;


ARCHITECTURE rtl OF Gateway IS

  ATTRIBUTE multstyle : string;

  -- Functions
  -- HDLCODER_TO_STDLOGIC 
  FUNCTION hdlcoder_to_stdlogic(arg: boolean) RETURN std_logic IS
  BEGIN
    IF arg THEN
      RETURN '1';
    ELSE
      RETURN '0';
    END IF;
  END FUNCTION;


  -- Signals
  SIGNAL server_ip_in_unsigned            : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL client_ip_in_unsigned            : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL ciaddr_in_unsigned               : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL ip_time_in_unsigned              : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL random_number_unsigned           : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL retry_delay_unsigned             : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL mac_addr1_unsigned               : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL mac_addr2_unsigned               : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL mac_addr3_unsigned               : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL dhcp_port_unsigned               : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL data_port_unsigned               : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL source_mac_addr1_unsigned        : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL source_mac_addr2_unsigned        : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL source_mac_addr3_unsigned        : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL source_ip_unsigned               : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL dest_ip_unsigned                 : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL source_port_unsigned             : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL dest_port_unsigned               : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL udp_frame_unsigned               : vector_of_unsigned8(0 TO 109);  -- uint8 [110]
  SIGNAL state_in_unsigned                : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL xid_in_unsigned                  : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL cnt_in_unsigned                  : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL renewal_cnt_in_unsigned          : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL server_ip_out_tmp                : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL client_ip_out_tmp                : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL ciaddr_out_tmp                   : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL ip_time_out_tmp                  : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL eth_frame_tmp                    : vector_of_unsigned8(0 TO 309);  -- uint8 [310]
  SIGNAL state_out_tmp                    : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL xid_out_tmp                      : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL cnt_out_tmp                      : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL renewal_cnt_out_tmp              : unsigned(31 DOWNTO 0);  -- uint32

BEGIN
  server_ip_in_unsigned <= unsigned(server_ip_in);

  client_ip_in_unsigned <= unsigned(client_ip_in);

  ciaddr_in_unsigned <= unsigned(ciaddr_in);

  ip_time_in_unsigned <= unsigned(ip_time_in);

  random_number_unsigned <= unsigned(random_number);

  retry_delay_unsigned <= unsigned(retry_delay);

  mac_addr1_unsigned <= unsigned(mac_addr1);

  mac_addr2_unsigned <= unsigned(mac_addr2);

  mac_addr3_unsigned <= unsigned(mac_addr3);

  dhcp_port_unsigned <= unsigned(dhcp_port);

  data_port_unsigned <= unsigned(data_port);

  source_mac_addr1_unsigned <= unsigned(source_mac_addr1);

  source_mac_addr2_unsigned <= unsigned(source_mac_addr2);

  source_mac_addr3_unsigned <= unsigned(source_mac_addr3);

  source_ip_unsigned <= unsigned(source_ip);

  dest_ip_unsigned <= unsigned(dest_ip);

  source_port_unsigned <= unsigned(source_port);

  dest_port_unsigned <= unsigned(dest_port);

  outputgen1: FOR k IN 0 TO 109 GENERATE
    udp_frame_unsigned(k) <= unsigned(udp_frame(k));
  END GENERATE;

  state_in_unsigned <= unsigned(state_in);

  xid_in_unsigned <= unsigned(xid_in);

  cnt_in_unsigned <= unsigned(cnt_in);

  renewal_cnt_in_unsigned <= unsigned(renewal_cnt_in);

  Gateway_1_output : PROCESS (ciaddr_in_unsigned, client_ip_in_unsigned, cnt_in_unsigned, dest_port_unsigned,
       dhcp_port_unsigned, ip_time_in_unsigned, mac_addr1_unsigned,
       mac_addr2_unsigned, mac_addr3_unsigned, phy_ready,
       random_number_unsigned, renewal_cnt_in_unsigned, retry_delay_unsigned,
       server_ip_in_unsigned, source_port_unsigned, state_in_unsigned,
       transmitter_ready, udp_frame_ready, udp_frame_unsigned, xid_in_unsigned)
    VARIABLE temp : unsigned(15 DOWNTO 0);
    VARIABLE temp_0 : unsigned(15 DOWNTO 0);
    VARIABLE temp_1 : unsigned(15 DOWNTO 0);
    VARIABLE temp_2 : unsigned(31 DOWNTO 0);
    VARIABLE temp_3 : unsigned(31 DOWNTO 0);
    VARIABLE w : unsigned(31 DOWNTO 0);
    VARIABLE temp_4 : unsigned(31 DOWNTO 0);
    VARIABLE temp_5 : unsigned(15 DOWNTO 0);
    VARIABLE temp_6 : unsigned(15 DOWNTO 0);
    VARIABLE temp_7 : unsigned(15 DOWNTO 0);
    VARIABLE temp_8 : unsigned(15 DOWNTO 0);
    VARIABLE temp_9 : unsigned(15 DOWNTO 0);
    VARIABLE temp_10 : unsigned(15 DOWNTO 0);
    VARIABLE temp_11 : unsigned(15 DOWNTO 0);
    VARIABLE temp_12 : unsigned(15 DOWNTO 0);
    VARIABLE temp_13 : unsigned(31 DOWNTO 0);
    VARIABLE temp_14 : unsigned(31 DOWNTO 0);
    VARIABLE w_0 : unsigned(31 DOWNTO 0);
    VARIABLE temp_15 : unsigned(31 DOWNTO 0);
    VARIABLE temp_16 : unsigned(15 DOWNTO 0);
    VARIABLE temp_17 : unsigned(15 DOWNTO 0);
    VARIABLE temp_18 : unsigned(15 DOWNTO 0);
    VARIABLE temp_19 : unsigned(15 DOWNTO 0);
    VARIABLE temp_20 : unsigned(15 DOWNTO 0);
    VARIABLE temp_21 : unsigned(15 DOWNTO 0);
    VARIABLE temp_22 : unsigned(15 DOWNTO 0);
    VARIABLE temp_23 : unsigned(15 DOWNTO 0);
    VARIABLE temp_24 : unsigned(31 DOWNTO 0);
    VARIABLE temp_25 : unsigned(31 DOWNTO 0);
    VARIABLE w_1 : unsigned(31 DOWNTO 0);
    VARIABLE temp_26 : unsigned(31 DOWNTO 0);
    VARIABLE temp_27 : unsigned(31 DOWNTO 0);
    VARIABLE temp_28 : unsigned(31 DOWNTO 0);
    VARIABLE w_2 : unsigned(31 DOWNTO 0);
    VARIABLE temp_29 : unsigned(31 DOWNTO 0);
    VARIABLE temp_30 : unsigned(31 DOWNTO 0);
    VARIABLE temp_31 : unsigned(31 DOWNTO 0);
    VARIABLE w_3 : unsigned(31 DOWNTO 0);
    VARIABLE temp_32 : unsigned(31 DOWNTO 0);
    VARIABLE temp_33 : unsigned(15 DOWNTO 0);
    VARIABLE temp_34 : unsigned(15 DOWNTO 0);
    VARIABLE temp_35 : unsigned(15 DOWNTO 0);
    VARIABLE temp_36 : unsigned(31 DOWNTO 0);
    VARIABLE temp_37 : unsigned(31 DOWNTO 0);
    VARIABLE w_4 : unsigned(31 DOWNTO 0);
    VARIABLE temp_38 : unsigned(31 DOWNTO 0);
    VARIABLE temp_39 : unsigned(31 DOWNTO 0);
    VARIABLE temp_40 : unsigned(31 DOWNTO 0);
    VARIABLE w_5 : unsigned(31 DOWNTO 0);
    VARIABLE temp_41 : unsigned(31 DOWNTO 0);
    VARIABLE temp_42 : unsigned(15 DOWNTO 0);
    VARIABLE temp_43 : unsigned(15 DOWNTO 0);
    VARIABLE temp_44 : unsigned(15 DOWNTO 0);
    VARIABLE temp_45 : unsigned(15 DOWNTO 0);
    VARIABLE temp_46 : unsigned(15 DOWNTO 0);
    VARIABLE temp_47 : unsigned(31 DOWNTO 0);
    VARIABLE temp_48 : unsigned(31 DOWNTO 0);
    VARIABLE w_6 : unsigned(31 DOWNTO 0);
    VARIABLE temp_49 : unsigned(31 DOWNTO 0);
    VARIABLE temp_50 : unsigned(31 DOWNTO 0);
    VARIABLE temp_51 : unsigned(31 DOWNTO 0);
    VARIABLE w_7 : unsigned(31 DOWNTO 0);
    VARIABLE temp_52 : unsigned(31 DOWNTO 0);
    VARIABLE temp_53 : unsigned(31 DOWNTO 0);
    VARIABLE temp_54 : unsigned(31 DOWNTO 0);
    VARIABLE w_8 : unsigned(31 DOWNTO 0);
    VARIABLE temp_55 : unsigned(31 DOWNTO 0);
    VARIABLE temp_56 : unsigned(15 DOWNTO 0);
    VARIABLE temp_57 : unsigned(15 DOWNTO 0);
    VARIABLE temp_58 : unsigned(15 DOWNTO 0);
    VARIABLE temp_59 : unsigned(31 DOWNTO 0);
    VARIABLE temp_60 : unsigned(31 DOWNTO 0);
    VARIABLE w_9 : unsigned(31 DOWNTO 0);
    VARIABLE temp_61 : unsigned(31 DOWNTO 0);
    VARIABLE temp_62 : unsigned(31 DOWNTO 0);
    VARIABLE temp_63 : unsigned(31 DOWNTO 0);
    VARIABLE w_10 : unsigned(31 DOWNTO 0);
    VARIABLE temp_64 : unsigned(31 DOWNTO 0);
    VARIABLE temp_65 : unsigned(15 DOWNTO 0);
    VARIABLE w_11 : unsigned(31 DOWNTO 0);
    VARIABLE temp_66 : unsigned(31 DOWNTO 0);
    VARIABLE temp_67 : unsigned(15 DOWNTO 0);
    VARIABLE w_12 : unsigned(31 DOWNTO 0);
    VARIABLE temp_68 : unsigned(31 DOWNTO 0);
    VARIABLE w_13 : unsigned(31 DOWNTO 0);
    VARIABLE temp_69 : unsigned(31 DOWNTO 0);
    VARIABLE temp_70 : unsigned(31 DOWNTO 0);
    VARIABLE w_14 : unsigned(31 DOWNTO 0);
    VARIABLE temp_71 : unsigned(31 DOWNTO 0);
    VARIABLE w_15 : unsigned(31 DOWNTO 0);
    VARIABLE temp_72 : unsigned(31 DOWNTO 0);
    VARIABLE temp_73 : unsigned(31 DOWNTO 0);
    VARIABLE temp_74 : unsigned(15 DOWNTO 0);
    VARIABLE temp_75 : unsigned(15 DOWNTO 0);
    VARIABLE temp_76 : unsigned(15 DOWNTO 0);
    VARIABLE temp_77 : unsigned(15 DOWNTO 0);
    VARIABLE w_16 : unsigned(31 DOWNTO 0);
    VARIABLE temp_78 : unsigned(31 DOWNTO 0);
    VARIABLE w_17 : unsigned(31 DOWNTO 0);
    VARIABLE temp_79 : unsigned(31 DOWNTO 0);
    VARIABLE temp_80 : unsigned(31 DOWNTO 0);
    VARIABLE w_18 : unsigned(31 DOWNTO 0);
    VARIABLE temp_81 : unsigned(31 DOWNTO 0);
    VARIABLE w_19 : unsigned(31 DOWNTO 0);
    VARIABLE temp_82 : unsigned(31 DOWNTO 0);
    VARIABLE temp_83 : unsigned(31 DOWNTO 0);
    VARIABLE w_20 : unsigned(31 DOWNTO 0);
    VARIABLE temp_84 : unsigned(31 DOWNTO 0);
    VARIABLE w_21 : unsigned(31 DOWNTO 0);
    VARIABLE temp_85 : unsigned(31 DOWNTO 0);
    VARIABLE temp_86 : unsigned(31 DOWNTO 0);
    VARIABLE c : unsigned(15 DOWNTO 0);
    VARIABLE c_0 : unsigned(15 DOWNTO 0);
    VARIABLE c_1 : unsigned(15 DOWNTO 0);
    VARIABLE c_2 : unsigned(15 DOWNTO 0);
    VARIABLE c_3 : unsigned(15 DOWNTO 0);
    VARIABLE c_4 : unsigned(31 DOWNTO 0);
    VARIABLE c_5 : unsigned(15 DOWNTO 0);
    VARIABLE c_6 : unsigned(31 DOWNTO 0);
    VARIABLE c_7 : unsigned(31 DOWNTO 0);
    VARIABLE c_8 : unsigned(15 DOWNTO 0);
    VARIABLE c_9 : unsigned(15 DOWNTO 0);
    VARIABLE c_10 : unsigned(15 DOWNTO 0);
    VARIABLE c_11 : unsigned(15 DOWNTO 0);
    VARIABLE c_12 : unsigned(31 DOWNTO 0);
    VARIABLE c_13 : unsigned(31 DOWNTO 0);
    VARIABLE c_14 : unsigned(15 DOWNTO 0);
    VARIABLE c_15 : unsigned(15 DOWNTO 0);
    VARIABLE c_16 : unsigned(31 DOWNTO 0);
    VARIABLE c_17 : unsigned(31 DOWNTO 0);
    VARIABLE c_18 : unsigned(15 DOWNTO 0);
    VARIABLE c_19 : unsigned(15 DOWNTO 0);
    VARIABLE c_20 : unsigned(15 DOWNTO 0);
    VARIABLE c_21 : unsigned(15 DOWNTO 0);
    VARIABLE c_22 : unsigned(15 DOWNTO 0);
    VARIABLE c_23 : unsigned(15 DOWNTO 0);
    VARIABLE c_24 : unsigned(31 DOWNTO 0);
    VARIABLE c_25 : unsigned(15 DOWNTO 0);
    VARIABLE c_26 : unsigned(15 DOWNTO 0);
    VARIABLE c_27 : unsigned(15 DOWNTO 0);
    VARIABLE c_28 : unsigned(31 DOWNTO 0);
    VARIABLE c_29 : unsigned(31 DOWNTO 0);
    VARIABLE c_30 : unsigned(31 DOWNTO 0);
    VARIABLE c_31 : unsigned(15 DOWNTO 0);
    VARIABLE c_32 : unsigned(15 DOWNTO 0);
    VARIABLE c_33 : unsigned(15 DOWNTO 0);
    VARIABLE c_34 : unsigned(31 DOWNTO 0);
    VARIABLE c_35 : unsigned(31 DOWNTO 0);
    VARIABLE c_36 : unsigned(31 DOWNTO 0);
    VARIABLE c_37 : unsigned(31 DOWNTO 0);
    VARIABLE c_38 : unsigned(31 DOWNTO 0);
    VARIABLE c_39 : unsigned(31 DOWNTO 0);
    VARIABLE c_40 : unsigned(31 DOWNTO 0);
    VARIABLE c_41 : unsigned(31 DOWNTO 0);
    VARIABLE c_42 : unsigned(15 DOWNTO 0);
    VARIABLE c_43 : unsigned(31 DOWNTO 0);
    VARIABLE c_44 : unsigned(31 DOWNTO 0);
    VARIABLE c_45 : unsigned(31 DOWNTO 0);
    VARIABLE c_46 : unsigned(15 DOWNTO 0);
    VARIABLE c_47 : unsigned(31 DOWNTO 0);
    VARIABLE c_48 : unsigned(31 DOWNTO 0);
    VARIABLE c_49 : unsigned(31 DOWNTO 0);
    VARIABLE c_50 : unsigned(15 DOWNTO 0);
    VARIABLE c_51 : unsigned(15 DOWNTO 0);
    VARIABLE c_52 : unsigned(31 DOWNTO 0);
    VARIABLE c_53 : unsigned(31 DOWNTO 0);
    VARIABLE c_54 : unsigned(31 DOWNTO 0);
    VARIABLE c_55 : unsigned(31 DOWNTO 0);
    VARIABLE c_56 : unsigned(31 DOWNTO 0);
    VARIABLE c_57 : unsigned(31 DOWNTO 0);
    VARIABLE c_58 : unsigned(15 DOWNTO 0);
    VARIABLE c_59 : unsigned(31 DOWNTO 0);
    VARIABLE c_60 : unsigned(31 DOWNTO 0);
    VARIABLE c_61 : unsigned(31 DOWNTO 0);
    VARIABLE c_62 : unsigned(15 DOWNTO 0);
    VARIABLE c_63 : unsigned(31 DOWNTO 0);
    VARIABLE c_64 : unsigned(31 DOWNTO 0);
    VARIABLE c_65 : unsigned(31 DOWNTO 0);
    VARIABLE c_66 : unsigned(31 DOWNTO 0);
    VARIABLE c_67 : unsigned(31 DOWNTO 0);
    VARIABLE c_68 : unsigned(31 DOWNTO 0);
    VARIABLE c_69 : unsigned(15 DOWNTO 0);
    VARIABLE c_70 : unsigned(15 DOWNTO 0);
    VARIABLE c_71 : unsigned(15 DOWNTO 0);
    VARIABLE c_72 : unsigned(15 DOWNTO 0);
    VARIABLE c_73 : unsigned(15 DOWNTO 0);
    VARIABLE c_74 : unsigned(15 DOWNTO 0);
    VARIABLE c_75 : unsigned(31 DOWNTO 0);
    VARIABLE c_76 : unsigned(31 DOWNTO 0);
    VARIABLE c_77 : unsigned(31 DOWNTO 0);
    VARIABLE c_78 : unsigned(31 DOWNTO 0);
    VARIABLE c_79 : unsigned(31 DOWNTO 0);
    VARIABLE c_80 : unsigned(31 DOWNTO 0);
    VARIABLE c_81 : unsigned(31 DOWNTO 0);
    VARIABLE c_82 : unsigned(31 DOWNTO 0);
    VARIABLE c_83 : unsigned(31 DOWNTO 0);
    VARIABLE c_84 : unsigned(31 DOWNTO 0);
    VARIABLE c_85 : unsigned(31 DOWNTO 0);
    VARIABLE c_86 : unsigned(31 DOWNTO 0);
    VARIABLE guard1 : std_logic;
    VARIABLE guard1_0 : std_logic;
    VARIABLE add_temp : unsigned(8 DOWNTO 0);
    VARIABLE sub_cast : signed(8 DOWNTO 0);
    VARIABLE sub_temp : signed(8 DOWNTO 0);
    VARIABLE sub_cast_0 : signed(16 DOWNTO 0);
    VARIABLE sub_temp_0 : signed(16 DOWNTO 0);
    VARIABLE cast : unsigned(15 DOWNTO 0);
    VARIABLE sub_cast_1 : signed(31 DOWNTO 0);
    VARIABLE add_cast : signed(31 DOWNTO 0);
    VARIABLE add_cast_0 : signed(31 DOWNTO 0);
    VARIABLE sub_cast_2 : signed(8 DOWNTO 0);
    VARIABLE sub_temp_1 : signed(8 DOWNTO 0);
    VARIABLE sub_cast_3 : signed(8 DOWNTO 0);
    VARIABLE sub_temp_2 : signed(8 DOWNTO 0);
    VARIABLE add_temp_0 : unsigned(8 DOWNTO 0);
    VARIABLE sub_cast_4 : signed(31 DOWNTO 0);
    VARIABLE add_cast_1 : signed(31 DOWNTO 0);
    VARIABLE sub_cast_5 : signed(16 DOWNTO 0);
    VARIABLE sub_temp_3 : signed(16 DOWNTO 0);
    VARIABLE cast_0 : unsigned(15 DOWNTO 0);
    VARIABLE sub_cast_6 : signed(31 DOWNTO 0);
    VARIABLE add_cast_2 : signed(31 DOWNTO 0);
    VARIABLE add_cast_3 : signed(31 DOWNTO 0);
    VARIABLE sub_cast_7 : signed(8 DOWNTO 0);
    VARIABLE sub_temp_4 : signed(8 DOWNTO 0);
    VARIABLE sub_cast_8 : signed(31 DOWNTO 0);
    VARIABLE sub_cast_9 : signed(31 DOWNTO 0);
    VARIABLE add_temp_1 : unsigned(8 DOWNTO 0);
    VARIABLE sub_cast_10 : signed(16 DOWNTO 0);
    VARIABLE sub_temp_5 : signed(16 DOWNTO 0);
    VARIABLE add_temp_2 : unsigned(8 DOWNTO 0);
    VARIABLE sub_cast_11 : signed(31 DOWNTO 0);
    VARIABLE add_cast_4 : signed(31 DOWNTO 0);
    VARIABLE add_temp_3 : unsigned(8 DOWNTO 0);
    VARIABLE add_temp_4 : unsigned(8 DOWNTO 0);
    VARIABLE sub_cast_12 : signed(16 DOWNTO 0);
    VARIABLE sub_temp_6 : signed(16 DOWNTO 0);
    VARIABLE sub_cast_13 : signed(16 DOWNTO 0);
    VARIABLE sub_temp_7 : signed(16 DOWNTO 0);
    VARIABLE cast_1 : signed(31 DOWNTO 0);
    VARIABLE cast_2 : signed(31 DOWNTO 0);
    VARIABLE cast_3 : signed(31 DOWNTO 0);
    VARIABLE cast_4 : signed(31 DOWNTO 0);
    VARIABLE cast_5 : signed(31 DOWNTO 0);
    VARIABLE cast_6 : unsigned(15 DOWNTO 0);
    VARIABLE cast_7 : signed(31 DOWNTO 0);
    VARIABLE add_temp_5 : unsigned(8 DOWNTO 0);
    VARIABLE add_cast_5 : signed(31 DOWNTO 0);
    VARIABLE add_cast_6 : signed(31 DOWNTO 0);
    VARIABLE cast_8 : signed(31 DOWNTO 0);
    VARIABLE cast_9 : signed(31 DOWNTO 0);
    VARIABLE cast_10 : signed(31 DOWNTO 0);
    VARIABLE cast_11 : signed(31 DOWNTO 0);
    VARIABLE cast_12 : signed(31 DOWNTO 0);
    VARIABLE cast_13 : unsigned(15 DOWNTO 0);
    VARIABLE cast_14 : signed(31 DOWNTO 0);
    VARIABLE sub_cast_14 : signed(8 DOWNTO 0);
    VARIABLE sub_temp_8 : signed(8 DOWNTO 0);
    VARIABLE cast_15 : signed(31 DOWNTO 0);
    VARIABLE cast_16 : signed(31 DOWNTO 0);
    VARIABLE cast_17 : signed(31 DOWNTO 0);
    VARIABLE cast_18 : signed(31 DOWNTO 0);
    VARIABLE cast_19 : signed(31 DOWNTO 0);
    VARIABLE cast_20 : unsigned(15 DOWNTO 0);
    VARIABLE cast_21 : signed(31 DOWNTO 0);
    VARIABLE add_temp_6 : unsigned(32 DOWNTO 0);
    VARIABLE add_temp_7 : unsigned(32 DOWNTO 0);
    VARIABLE add_cast_7 : signed(31 DOWNTO 0);
    VARIABLE add_cast_8 : signed(31 DOWNTO 0);
    VARIABLE cast_22 : signed(31 DOWNTO 0);
    VARIABLE cast_23 : signed(31 DOWNTO 0);
    VARIABLE cast_24 : signed(31 DOWNTO 0);
    VARIABLE cast_25 : signed(31 DOWNTO 0);
    VARIABLE cast_26 : signed(31 DOWNTO 0);
    VARIABLE cast_27 : unsigned(15 DOWNTO 0);
    VARIABLE cast_28 : signed(31 DOWNTO 0);
    VARIABLE add_temp_8 : unsigned(32 DOWNTO 0);
    VARIABLE add_temp_9 : unsigned(32 DOWNTO 0);
    VARIABLE add_temp_10 : unsigned(32 DOWNTO 0);
    VARIABLE add_temp_11 : unsigned(32 DOWNTO 0);
    VARIABLE sub_cast_15 : signed(8 DOWNTO 0);
    VARIABLE sub_temp_9 : signed(8 DOWNTO 0);
    VARIABLE cast_29 : signed(31 DOWNTO 0);
    VARIABLE cast_30 : signed(31 DOWNTO 0);
    VARIABLE cast_31 : signed(31 DOWNTO 0);
    VARIABLE cast_32 : signed(31 DOWNTO 0);
    VARIABLE cast_33 : signed(31 DOWNTO 0);
    VARIABLE cast_34 : unsigned(15 DOWNTO 0);
    VARIABLE cast_35 : signed(31 DOWNTO 0);
    VARIABLE add_temp_12 : unsigned(32 DOWNTO 0);
    VARIABLE add_cast_9 : signed(31 DOWNTO 0);
    VARIABLE add_cast_10 : signed(31 DOWNTO 0);
    VARIABLE cast_36 : signed(31 DOWNTO 0);
    VARIABLE cast_37 : signed(31 DOWNTO 0);
    VARIABLE cast_38 : signed(31 DOWNTO 0);
    VARIABLE cast_39 : signed(31 DOWNTO 0);
    VARIABLE cast_40 : signed(31 DOWNTO 0);
    VARIABLE cast_41 : unsigned(15 DOWNTO 0);
    VARIABLE cast_42 : signed(31 DOWNTO 0);
    VARIABLE add_temp_13 : unsigned(32 DOWNTO 0);
    VARIABLE cast_43 : signed(31 DOWNTO 0);
    VARIABLE cast_44 : unsigned(31 DOWNTO 0);
    VARIABLE add_cast_11 : signed(31 DOWNTO 0);
    VARIABLE cast_45 : signed(31 DOWNTO 0);
    VARIABLE cast_46 : unsigned(31 DOWNTO 0);
    VARIABLE add_cast_12 : signed(31 DOWNTO 0);
    VARIABLE cast_47 : signed(31 DOWNTO 0);
    VARIABLE cast_48 : unsigned(31 DOWNTO 0);
    VARIABLE add_temp_14 : unsigned(8 DOWNTO 0);
    VARIABLE cast_49 : signed(31 DOWNTO 0);
    VARIABLE cast_50 : unsigned(31 DOWNTO 0);
    VARIABLE cast_51 : signed(31 DOWNTO 0);
    VARIABLE cast_52 : signed(31 DOWNTO 0);
    VARIABLE add_temp_15 : unsigned(8 DOWNTO 0);
    VARIABLE cast_53 : signed(31 DOWNTO 0);
    VARIABLE cast_54 : signed(31 DOWNTO 0);
    VARIABLE cast_55 : signed(31 DOWNTO 0);
    VARIABLE cast_56 : signed(31 DOWNTO 0);
    VARIABLE cast_57 : signed(31 DOWNTO 0);
    VARIABLE cast_58 : signed(31 DOWNTO 0);
    VARIABLE cast_59 : signed(31 DOWNTO 0);
    VARIABLE cast_60 : signed(31 DOWNTO 0);
    VARIABLE cast_61 : signed(31 DOWNTO 0);
    VARIABLE cast_62 : signed(31 DOWNTO 0);
    VARIABLE cast_63 : signed(31 DOWNTO 0);
    VARIABLE cast_64 : unsigned(31 DOWNTO 0);
    VARIABLE cast_65 : signed(31 DOWNTO 0);
    VARIABLE cast_66 : signed(31 DOWNTO 0);
    VARIABLE sub_cast_16 : signed(16 DOWNTO 0);
    VARIABLE sub_temp_10 : signed(16 DOWNTO 0);
    VARIABLE cast_67 : unsigned(15 DOWNTO 0);
    VARIABLE cast_68 : signed(31 DOWNTO 0);
    VARIABLE cast_69 : signed(31 DOWNTO 0);
    VARIABLE cast_70 : signed(31 DOWNTO 0);
    VARIABLE cast_71 : signed(31 DOWNTO 0);
    VARIABLE cast_72 : signed(31 DOWNTO 0);
    VARIABLE cast_73 : signed(31 DOWNTO 0);
    VARIABLE cast_74 : signed(31 DOWNTO 0);
    VARIABLE cast_75 : signed(31 DOWNTO 0);
    VARIABLE cast_76 : unsigned(31 DOWNTO 0);
    VARIABLE cast_77 : signed(31 DOWNTO 0);
    VARIABLE cast_78 : signed(31 DOWNTO 0);
    VARIABLE cast_79 : signed(31 DOWNTO 0);
    VARIABLE cast_80 : signed(31 DOWNTO 0);
    VARIABLE cast_81 : signed(31 DOWNTO 0);
    VARIABLE cast_82 : signed(31 DOWNTO 0);
    VARIABLE cast_83 : signed(31 DOWNTO 0);
    VARIABLE cast_84 : signed(31 DOWNTO 0);
    VARIABLE cast_85 : signed(31 DOWNTO 0);
    VARIABLE cast_86 : signed(31 DOWNTO 0);
    VARIABLE cast_87 : unsigned(31 DOWNTO 0);
    VARIABLE cast_88 : signed(31 DOWNTO 0);
    VARIABLE cast_89 : signed(31 DOWNTO 0);
    VARIABLE cast_90 : signed(31 DOWNTO 0);
    VARIABLE cast_91 : signed(31 DOWNTO 0);
    VARIABLE cast_92 : signed(31 DOWNTO 0);
    VARIABLE cast_93 : signed(31 DOWNTO 0);
    VARIABLE cast_94 : signed(31 DOWNTO 0);
    VARIABLE cast_95 : signed(31 DOWNTO 0);
    VARIABLE cast_96 : signed(31 DOWNTO 0);
    VARIABLE cast_97 : signed(31 DOWNTO 0);
    VARIABLE cast_98 : signed(31 DOWNTO 0);
    VARIABLE cast_99 : signed(31 DOWNTO 0);
    VARIABLE cast_100 : signed(31 DOWNTO 0);
    VARIABLE cast_101 : signed(31 DOWNTO 0);
    VARIABLE cast_102 : signed(31 DOWNTO 0);
    VARIABLE cast_103 : signed(31 DOWNTO 0);
    VARIABLE sub_cast_17 : signed(16 DOWNTO 0);
    VARIABLE sub_temp_11 : signed(16 DOWNTO 0);
    VARIABLE cast_104 : unsigned(15 DOWNTO 0);
    VARIABLE cast_105 : signed(31 DOWNTO 0);
    VARIABLE cast_106 : signed(31 DOWNTO 0);
    VARIABLE sub_cast_18 : signed(16 DOWNTO 0);
    VARIABLE sub_temp_12 : signed(16 DOWNTO 0);
    VARIABLE cast_107 : unsigned(15 DOWNTO 0);
    VARIABLE cast_108 : signed(31 DOWNTO 0);
    VARIABLE cast_109 : signed(31 DOWNTO 0);
    VARIABLE cast_110 : signed(31 DOWNTO 0);
    VARIABLE cast_111 : signed(31 DOWNTO 0);
    VARIABLE cast_112 : signed(31 DOWNTO 0);
    VARIABLE cast_113 : unsigned(31 DOWNTO 0);
    VARIABLE cast_114 : signed(31 DOWNTO 0);
    VARIABLE cast_115 : unsigned(31 DOWNTO 0);
    VARIABLE add_temp_16 : unsigned(8 DOWNTO 0);
    VARIABLE cast_116 : signed(31 DOWNTO 0);
    VARIABLE cast_117 : signed(31 DOWNTO 0);
    VARIABLE add_temp_17 : unsigned(8 DOWNTO 0);
    VARIABLE cast_118 : signed(31 DOWNTO 0);
    VARIABLE cast_119 : unsigned(31 DOWNTO 0);
    VARIABLE cast_120 : signed(31 DOWNTO 0);
    VARIABLE cast_121 : unsigned(31 DOWNTO 0);
    VARIABLE cast_122 : signed(31 DOWNTO 0);
    VARIABLE cast_123 : signed(31 DOWNTO 0);
    VARIABLE cast_124 : signed(31 DOWNTO 0);
    VARIABLE cast_125 : unsigned(31 DOWNTO 0);
    VARIABLE cast_126 : signed(31 DOWNTO 0);
    VARIABLE cast_127 : unsigned(31 DOWNTO 0);
    VARIABLE cast_128 : signed(31 DOWNTO 0);
    VARIABLE cast_129 : signed(31 DOWNTO 0);
    VARIABLE cast_130 : signed(31 DOWNTO 0);
    VARIABLE cast_131 : signed(31 DOWNTO 0);
    VARIABLE cast_132 : signed(31 DOWNTO 0);
    VARIABLE cast_133 : signed(31 DOWNTO 0);
    VARIABLE cast_134 : signed(31 DOWNTO 0);
    VARIABLE cast_135 : signed(31 DOWNTO 0);
    VARIABLE cast_136 : signed(31 DOWNTO 0);
    VARIABLE cast_137 : signed(31 DOWNTO 0);
    VARIABLE cast_138 : signed(31 DOWNTO 0);
    VARIABLE cast_139 : signed(31 DOWNTO 0);
    VARIABLE cast_140 : signed(31 DOWNTO 0);
    VARIABLE cast_141 : signed(31 DOWNTO 0);
    VARIABLE cast_142 : signed(31 DOWNTO 0);
    VARIABLE cast_143 : unsigned(31 DOWNTO 0);
    VARIABLE cast_144 : signed(31 DOWNTO 0);
    VARIABLE cast_145 : unsigned(31 DOWNTO 0);
    VARIABLE cast_146 : signed(31 DOWNTO 0);
    VARIABLE cast_147 : signed(31 DOWNTO 0);
    VARIABLE cast_148 : signed(31 DOWNTO 0);
    VARIABLE cast_149 : unsigned(31 DOWNTO 0);
    VARIABLE cast_150 : signed(31 DOWNTO 0);
    VARIABLE cast_151 : unsigned(31 DOWNTO 0);
    VARIABLE add_temp_18 : unsigned(8 DOWNTO 0);
    VARIABLE add_temp_19 : unsigned(8 DOWNTO 0);
  BEGIN
    -- This function sends several ethernet frames one by one.
    CASE state_in_unsigned IS
      WHEN "00000000" =>
        -- Wait for ethernet analog tranceiver IC's ready
        eth_frame_tmp <= (OTHERS => to_unsigned(16#00#, 8));
        send <= '0';
        IF ( NOT phy_ready) = '1' THEN 
          state_out_tmp <= state_in_unsigned;
        ELSE 
          add_temp := resize(state_in_unsigned, 9) + to_unsigned(16#001#, 9);
          IF add_temp(8) /= '0' THEN 
            state_out_tmp <= "11111111";
          ELSE 
            state_out_tmp <= add_temp(7 DOWNTO 0);
          END IF;
        END IF;
        server_ip_out_tmp <= to_unsigned(16#00000000#, 32);
        client_ip_out_tmp <= to_unsigned(16#00000000#, 32);
        ciaddr_out_tmp <= to_unsigned(16#00000000#, 32);
        ip_time_out_tmp <= to_unsigned(16#00000000#, 32);
        xid_out_tmp <= random_number_unsigned;
        cnt_out_tmp <= to_unsigned(16#00000001#, 32);
        renewal_cnt_out_tmp <= to_unsigned(16#00000000#, 32);
        led1 <= '0';
        led2 <= '0';
        led3 <= '0';
        led4 <= '0';
      WHEN "00000001" =>
        -- Send DHCP DISCOVER frame to the router
        temp := mac_addr1_unsigned;
        c := temp srl 8;
        temp_0 := mac_addr2_unsigned;
        c_8 := temp_0 srl 8;
        temp_1 := mac_addr3_unsigned;
        c_18 := temp_1 srl 8;
        temp_2 := xid_in_unsigned;
        c_24 := temp_2 srl 24;
        temp_3 := xid_in_unsigned;
        c_28 := temp_3 srl 16;
        temp_4 := xid_in_unsigned;
        c_34 := temp_4 srl 8;
        w := c_34;
        temp_5 := mac_addr1_unsigned;
        c_42 := temp_5 srl 8;
        temp_6 := mac_addr2_unsigned;
        c_46 := temp_6 srl 8;
        temp_7 := mac_addr3_unsigned;
        c_50 := temp_7 srl 8;
        eth_frame_tmp(0) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(1) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(2) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(3) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(4) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(5) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(6) <= c(7 DOWNTO 0);
        cast_51 := signed(resize(mac_addr1_unsigned, 32));
        cast_52 := cast_51 AND to_signed(16#000000FF#, 32);
        eth_frame_tmp(7) <= unsigned(cast_52(7 DOWNTO 0));
        eth_frame_tmp(8) <= c_8(7 DOWNTO 0);
        cast_53 := signed(resize(mac_addr2_unsigned, 32));
        cast_54 := cast_53 AND to_signed(16#000000FF#, 32);
        eth_frame_tmp(9) <= unsigned(cast_54(7 DOWNTO 0));
        eth_frame_tmp(10) <= c_18(7 DOWNTO 0);
        cast_55 := signed(resize(mac_addr3_unsigned, 32));
        cast_56 := cast_55 AND to_signed(16#000000FF#, 32);
        eth_frame_tmp(11) <= unsigned(cast_56(7 DOWNTO 0));
        eth_frame_tmp(12) <= to_unsigned(16#08#, 8);
        eth_frame_tmp(13) <= to_unsigned(16#00#, 8);
        eth_frame_tmp(14) <= to_unsigned(16#45#, 8);
        eth_frame_tmp(15) <= to_unsigned(16#00#, 8);
        eth_frame_tmp(16) <= to_unsigned(16#01#, 8);
        eth_frame_tmp(17) <= to_unsigned(16#28#, 8);
        eth_frame_tmp(18 TO 21) <= (OTHERS => to_unsigned(16#00#, 8));
        eth_frame_tmp(22) <= to_unsigned(16#10#, 8);
        eth_frame_tmp(23) <= to_unsigned(16#11#, 8);
        eth_frame_tmp(24 TO 25) <= (OTHERS => to_unsigned(16#00#, 8));
        eth_frame_tmp(26 TO 29) <= (OTHERS => to_unsigned(16#00#, 8));
        eth_frame_tmp(30) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(31) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(32) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(33) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(34) <= to_unsigned(16#00#, 8);
        eth_frame_tmp(35) <= to_unsigned(16#44#, 8);
        eth_frame_tmp(36) <= to_unsigned(16#00#, 8);
        eth_frame_tmp(37) <= to_unsigned(16#43#, 8);
        eth_frame_tmp(38) <= to_unsigned(16#01#, 8);
        eth_frame_tmp(39) <= to_unsigned(16#14#, 8);
        eth_frame_tmp(42) <= to_unsigned(16#01#, 8);
        eth_frame_tmp(43) <= to_unsigned(16#01#, 8);
        eth_frame_tmp(44) <= to_unsigned(16#06#, 8);
        eth_frame_tmp(45) <= to_unsigned(16#00#, 8);
        cast_74 := signed(c_24);
        eth_frame_tmp(46) <= unsigned(cast_74(7 DOWNTO 0));
        cast_75 := signed(c_28);
        cast_76 := unsigned(cast_75);
        eth_frame_tmp(47) <= resize(cast_76 AND to_unsigned(16#000000FF#, 32), 8);
        eth_frame_tmp(48) <= resize(w AND to_unsigned(16#000000FF#, 32), 8);
        eth_frame_tmp(49) <= resize(xid_in_unsigned AND to_unsigned(16#000000FF#, 32), 8);
        eth_frame_tmp(40 TO 41) <= (OTHERS => to_unsigned(16#00#, 8));
        eth_frame_tmp(50 TO 51) <= (OTHERS => to_unsigned(16#00#, 8));
        eth_frame_tmp(52) <= to_unsigned(16#80#, 8);
        eth_frame_tmp(53 TO 69) <= (OTHERS => to_unsigned(16#00#, 8));
        eth_frame_tmp(70) <= c_42(7 DOWNTO 0);
        cast_88 := signed(resize(mac_addr1_unsigned, 32));
        cast_89 := cast_88 AND to_signed(16#000000FF#, 32);
        eth_frame_tmp(71) <= unsigned(cast_89(7 DOWNTO 0));
        eth_frame_tmp(72) <= c_46(7 DOWNTO 0);
        cast_90 := signed(resize(mac_addr2_unsigned, 32));
        cast_91 := cast_90 AND to_signed(16#000000FF#, 32);
        eth_frame_tmp(73) <= unsigned(cast_91(7 DOWNTO 0));
        eth_frame_tmp(74) <= c_50(7 DOWNTO 0);
        cast_92 := signed(resize(mac_addr3_unsigned, 32));
        cast_93 := cast_92 AND to_signed(16#000000FF#, 32);
        eth_frame_tmp(75) <= unsigned(cast_93(7 DOWNTO 0));
        eth_frame_tmp(76 TO 277) <= (OTHERS => to_unsigned(16#00#, 8));
        eth_frame_tmp(278) <= to_unsigned(16#63#, 8);
        eth_frame_tmp(279) <= to_unsigned(16#82#, 8);
        eth_frame_tmp(280) <= to_unsigned(16#53#, 8);
        eth_frame_tmp(281) <= to_unsigned(16#63#, 8);
        eth_frame_tmp(282) <= to_unsigned(16#35#, 8);
        eth_frame_tmp(283) <= to_unsigned(16#01#, 8);
        eth_frame_tmp(284) <= to_unsigned(16#01#, 8);
        eth_frame_tmp(285) <= to_unsigned(16#0C#, 8);
        eth_frame_tmp(286) <= to_unsigned(16#07#, 8);
        eth_frame_tmp(287) <= to_unsigned(16#67#, 8);
        eth_frame_tmp(288) <= to_unsigned(16#61#, 8);
        eth_frame_tmp(289) <= to_unsigned(16#74#, 8);
        eth_frame_tmp(290) <= to_unsigned(16#65#, 8);
        eth_frame_tmp(291) <= to_unsigned(16#77#, 8);
        eth_frame_tmp(292) <= to_unsigned(16#61#, 8);
        eth_frame_tmp(293) <= to_unsigned(16#79#, 8);
        eth_frame_tmp(294) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(295 TO 309) <= (OTHERS => to_unsigned(16#00#, 8));
        send <= '1';
        -- wait for starting the transmission
        IF transmitter_ready = '1' THEN 
          state_out_tmp <= state_in_unsigned;
        ELSE 
          add_temp_16 := resize(state_in_unsigned, 9) + to_unsigned(16#001#, 9);
          IF add_temp_16(8) /= '0' THEN 
            state_out_tmp <= "11111111";
          ELSE 
            state_out_tmp <= add_temp_16(7 DOWNTO 0);
          END IF;
        END IF;
        server_ip_out_tmp <= to_unsigned(16#00000000#, 32);
        client_ip_out_tmp <= to_unsigned(16#00000000#, 32);
        ciaddr_out_tmp <= to_unsigned(16#00000000#, 32);
        ip_time_out_tmp <= to_unsigned(16#00000000#, 32);
        xid_out_tmp <= xid_in_unsigned;
        cnt_out_tmp <= to_unsigned(16#00000001#, 32);
        renewal_cnt_out_tmp <= to_unsigned(16#00000000#, 32);
        led1 <= '1';
        led2 <= '0';
        led3 <= '0';
        led4 <= '0';
      WHEN "00000010" =>
        -- Wait for the end of transmission DHCP DISCOVER frame
        temp_8 := mac_addr1_unsigned;
        c_0 := temp_8 srl 8;
        temp_9 := mac_addr2_unsigned;
        c_9 := temp_9 srl 8;
        temp_10 := mac_addr3_unsigned;
        c_19 := temp_10 srl 8;
        temp_11 := dhcp_port_unsigned;
        c_25 := temp_11 srl 8;
        sub_cast_10 := signed(resize(dhcp_port_unsigned, 17));
        sub_temp_5 := sub_cast_10 - to_signed(16#00001#, 17);
        IF sub_temp_5(16) = '1' THEN 
          temp_12 := X"0000";
        ELSE 
          temp_12 := unsigned(sub_temp_5(15 DOWNTO 0));
        END IF;
        c_31 := temp_12 srl 8;
        temp_13 := xid_in_unsigned;
        c_37 := temp_13 srl 24;
        temp_14 := xid_in_unsigned;
        c_43 := temp_14 srl 16;
        temp_15 := xid_in_unsigned;
        c_47 := temp_15 srl 8;
        w_0 := c_47;
        temp_16 := mac_addr1_unsigned;
        c_51 := temp_16 srl 8;
        temp_17 := mac_addr2_unsigned;
        c_58 := temp_17 srl 8;
        temp_18 := mac_addr3_unsigned;
        c_62 := temp_18 srl 8;
        eth_frame_tmp(0) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(1) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(2) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(3) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(4) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(5) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(6) <= c_0(7 DOWNTO 0);
        cast_57 := signed(resize(mac_addr1_unsigned, 32));
        cast_58 := cast_57 AND to_signed(16#000000FF#, 32);
        eth_frame_tmp(7) <= unsigned(cast_58(7 DOWNTO 0));
        eth_frame_tmp(8) <= c_9(7 DOWNTO 0);
        cast_59 := signed(resize(mac_addr2_unsigned, 32));
        cast_60 := cast_59 AND to_signed(16#000000FF#, 32);
        eth_frame_tmp(9) <= unsigned(cast_60(7 DOWNTO 0));
        eth_frame_tmp(10) <= c_19(7 DOWNTO 0);
        cast_61 := signed(resize(mac_addr3_unsigned, 32));
        cast_62 := cast_61 AND to_signed(16#000000FF#, 32);
        eth_frame_tmp(11) <= unsigned(cast_62(7 DOWNTO 0));
        eth_frame_tmp(12) <= to_unsigned(16#08#, 8);
        eth_frame_tmp(13) <= to_unsigned(16#00#, 8);
        eth_frame_tmp(14) <= to_unsigned(16#45#, 8);
        eth_frame_tmp(15) <= to_unsigned(16#00#, 8);
        eth_frame_tmp(16) <= to_unsigned(16#01#, 8);
        eth_frame_tmp(17) <= to_unsigned(16#28#, 8);
        eth_frame_tmp(18 TO 21) <= (OTHERS => to_unsigned(16#00#, 8));
        eth_frame_tmp(22) <= to_unsigned(16#10#, 8);
        eth_frame_tmp(23) <= to_unsigned(16#11#, 8);
        eth_frame_tmp(24 TO 25) <= (OTHERS => to_unsigned(16#00#, 8));
        eth_frame_tmp(26 TO 29) <= (OTHERS => to_unsigned(16#00#, 8));
        eth_frame_tmp(30) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(31) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(32) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(33) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(34) <= c_25(7 DOWNTO 0);
        cast_65 := signed(resize(dhcp_port_unsigned, 32));
        cast_66 := cast_65 AND to_signed(16#000000FF#, 32);
        eth_frame_tmp(35) <= unsigned(cast_66(7 DOWNTO 0));
        eth_frame_tmp(36) <= c_31(7 DOWNTO 0);
        sub_cast_16 := signed(resize(dhcp_port_unsigned, 17));
        sub_temp_10 := sub_cast_16 - to_signed(16#00001#, 17);
        IF sub_temp_10(16) = '1' THEN 
          cast_67 := X"0000";
        ELSE 
          cast_67 := unsigned(sub_temp_10(15 DOWNTO 0));
        END IF;
        cast_68 := signed(resize(cast_67, 32));
        cast_69 := cast_68 AND to_signed(16#000000FF#, 32);
        eth_frame_tmp(37) <= unsigned(cast_69(7 DOWNTO 0));
        eth_frame_tmp(38) <= to_unsigned(16#01#, 8);
        eth_frame_tmp(39) <= to_unsigned(16#14#, 8);
        eth_frame_tmp(42) <= to_unsigned(16#01#, 8);
        eth_frame_tmp(43) <= to_unsigned(16#01#, 8);
        eth_frame_tmp(44) <= to_unsigned(16#06#, 8);
        eth_frame_tmp(45) <= to_unsigned(16#00#, 8);
        cast_85 := signed(c_37);
        eth_frame_tmp(46) <= unsigned(cast_85(7 DOWNTO 0));
        cast_86 := signed(c_43);
        cast_87 := unsigned(cast_86);
        eth_frame_tmp(47) <= resize(cast_87 AND to_unsigned(16#000000FF#, 32), 8);
        eth_frame_tmp(48) <= resize(w_0 AND to_unsigned(16#000000FF#, 32), 8);
        eth_frame_tmp(49) <= resize(xid_in_unsigned AND to_unsigned(16#000000FF#, 32), 8);
        eth_frame_tmp(40 TO 41) <= (OTHERS => to_unsigned(16#00#, 8));
        eth_frame_tmp(50 TO 51) <= (OTHERS => to_unsigned(16#00#, 8));
        eth_frame_tmp(52) <= to_unsigned(16#80#, 8);
        eth_frame_tmp(53 TO 69) <= (OTHERS => to_unsigned(16#00#, 8));
        eth_frame_tmp(70) <= c_51(7 DOWNTO 0);
        cast_94 := signed(resize(mac_addr1_unsigned, 32));
        cast_95 := cast_94 AND to_signed(16#000000FF#, 32);
        eth_frame_tmp(71) <= unsigned(cast_95(7 DOWNTO 0));
        eth_frame_tmp(72) <= c_58(7 DOWNTO 0);
        cast_96 := signed(resize(mac_addr2_unsigned, 32));
        cast_97 := cast_96 AND to_signed(16#000000FF#, 32);
        eth_frame_tmp(73) <= unsigned(cast_97(7 DOWNTO 0));
        eth_frame_tmp(74) <= c_62(7 DOWNTO 0);
        cast_98 := signed(resize(mac_addr3_unsigned, 32));
        cast_99 := cast_98 AND to_signed(16#000000FF#, 32);
        eth_frame_tmp(75) <= unsigned(cast_99(7 DOWNTO 0));
        eth_frame_tmp(76 TO 277) <= (OTHERS => to_unsigned(16#00#, 8));
        eth_frame_tmp(278) <= to_unsigned(16#63#, 8);
        eth_frame_tmp(279) <= to_unsigned(16#82#, 8);
        eth_frame_tmp(280) <= to_unsigned(16#53#, 8);
        eth_frame_tmp(281) <= to_unsigned(16#63#, 8);
        eth_frame_tmp(282) <= to_unsigned(16#35#, 8);
        eth_frame_tmp(283) <= to_unsigned(16#01#, 8);
        eth_frame_tmp(284) <= to_unsigned(16#01#, 8);
        eth_frame_tmp(285) <= to_unsigned(16#0C#, 8);
        eth_frame_tmp(286) <= to_unsigned(16#07#, 8);
        eth_frame_tmp(287) <= to_unsigned(16#67#, 8);
        eth_frame_tmp(288) <= to_unsigned(16#61#, 8);
        eth_frame_tmp(289) <= to_unsigned(16#74#, 8);
        eth_frame_tmp(290) <= to_unsigned(16#65#, 8);
        eth_frame_tmp(291) <= to_unsigned(16#77#, 8);
        eth_frame_tmp(292) <= to_unsigned(16#61#, 8);
        eth_frame_tmp(293) <= to_unsigned(16#79#, 8);
        eth_frame_tmp(294) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(295 TO 309) <= (OTHERS => to_unsigned(16#00#, 8));
        IF transmitter_ready = '1' THEN 
          add_temp_17 := resize(state_in_unsigned, 9) + to_unsigned(16#001#, 9);
          IF add_temp_17(8) /= '0' THEN 
            state_out_tmp <= "11111111";
          ELSE 
            state_out_tmp <= add_temp_17(7 DOWNTO 0);
          END IF;
          send <= '0';
        ELSE 
          state_out_tmp <= state_in_unsigned;
          send <= '1';
        END IF;
        server_ip_out_tmp <= to_unsigned(16#00000000#, 32);
        client_ip_out_tmp <= to_unsigned(16#00000000#, 32);
        ciaddr_out_tmp <= to_unsigned(16#00000000#, 32);
        ip_time_out_tmp <= to_unsigned(16#00000000#, 32);
        xid_out_tmp <= xid_in_unsigned;
        cnt_out_tmp <= to_unsigned(16#00000001#, 32);
        renewal_cnt_out_tmp <= to_unsigned(16#00000000#, 32);
        led1 <= '0';
        led2 <= '1';
        led3 <= '0';
        led4 <= '0';
      WHEN "00000011" =>
        -- Wait for DHCP OFFER from the router
        eth_frame_tmp <= (OTHERS => to_unsigned(16#00#, 8));
        send <= '0';
        ciaddr_out_tmp <= to_unsigned(16#00000000#, 32);
        ip_time_out_tmp <= to_unsigned(16#00000000#, 32);
        -- wait for incoming dhcp reply from the router
        guard1 := '0';
        sub_cast_5 := signed(resize(dhcp_port_unsigned, 17));
        sub_temp_3 := sub_cast_5 - to_signed(16#00001#, 17);
        IF sub_temp_3(16) = '1' THEN 
          cast_0 := X"0000";
        ELSE 
          cast_0 := unsigned(sub_temp_3(15 DOWNTO 0));
        END IF;
        IF (((udp_frame_ready AND hdlcoder_to_stdlogic(source_port_unsigned = cast_0)) AND hdlcoder_to_stdlogic(dest_port_unsigned = dhcp_port_unsigned)) AND hdlcoder_to_stdlogic(udp_frame_unsigned(0) = to_unsigned(16#00000002#, 8))) = '1' THEN 
          temp_67 := mac_addr1_unsigned;
          c_5 := temp_67 srl 8;
          cast_8 := signed(resize(udp_frame_unsigned(28), 32));
          cast_9 := signed(resize(c_5, 32));
          cast_10 := signed(resize(udp_frame_unsigned(29), 32));
          cast_11 := signed(resize(mac_addr1_unsigned, 32));
          cast_12 := cast_11 AND to_signed(16#000000FF#, 32);
          cast_13 := unsigned(cast_12(15 DOWNTO 0));
          cast_14 := signed(resize(cast_13, 32));
          IF (cast_8 = cast_9) AND (cast_10 = cast_14) THEN 
            temp_75 := mac_addr2_unsigned;
            c_15 := temp_75 srl 8;
            cast_22 := signed(resize(udp_frame_unsigned(30), 32));
            cast_23 := signed(resize(c_15, 32));
            cast_24 := signed(resize(udp_frame_unsigned(31), 32));
            cast_25 := signed(resize(mac_addr2_unsigned, 32));
            cast_26 := cast_25 AND to_signed(16#000000FF#, 32);
            cast_27 := unsigned(cast_26(15 DOWNTO 0));
            cast_28 := signed(resize(cast_27, 32));
            IF (cast_22 = cast_23) AND (cast_24 = cast_28) THEN 
              temp_77 := mac_addr3_unsigned;
              c_23 := temp_77 srl 8;
              cast_36 := signed(resize(udp_frame_unsigned(32), 32));
              cast_37 := signed(resize(c_23, 32));
              cast_38 := signed(resize(udp_frame_unsigned(33), 32));
              cast_39 := signed(resize(mac_addr3_unsigned, 32));
              cast_40 := cast_39 AND to_signed(16#000000FF#, 32);
              cast_41 := unsigned(cast_40(15 DOWNTO 0));
              cast_42 := signed(resize(cast_41, 32));
              IF (cast_36 = cast_37) AND (cast_38 = cast_42) THEN 
                temp_81 := resize(udp_frame_unsigned(4), 32);
                c_30 := temp_81 sll 24;
                w_18 := c_30;
                temp_82 := resize(udp_frame_unsigned(5), 32);
                c_36 := temp_82 sll 16;
                w_19 := c_36;
                temp_83 := resize(udp_frame_unsigned(6), 32);
                c_41 := temp_83 sll 8;
                cast_49 := signed(c_41);
                cast_50 := unsigned(cast_49);
                IF ((w_18 AND unsigned'("11111111000000000000000000000000")) OR ((w_19 AND to_unsigned(16#00FF0000#, 32)) OR ((cast_50 AND to_unsigned(16#0000FF00#, 32)) OR resize(udp_frame_unsigned(7), 32)))) = xid_in_unsigned THEN 
                  add_temp_15 := resize(state_in_unsigned, 9) + to_unsigned(16#001#, 9);
                  IF add_temp_15(8) /= '0' THEN 
                    state_out_tmp <= "11111111";
                  ELSE 
                    state_out_tmp <= add_temp_15(7 DOWNTO 0);
                  END IF;
                  server_ip_out_tmp <= server_ip_in_unsigned;
                  temp_84 := resize(udp_frame_unsigned(16), 32);
                  c_54 := temp_84 sll 24;
                  w_20 := c_54;
                  temp_85 := resize(udp_frame_unsigned(17), 32);
                  c_57 := temp_85 sll 16;
                  w_21 := c_57;
                  temp_86 := resize(udp_frame_unsigned(18), 32);
                  c_61 := temp_86 sll 8;
                  cast_63 := signed(c_61);
                  cast_64 := unsigned(cast_63);
                  client_ip_out_tmp <= (w_20 AND unsigned'("11111111000000000000000000000000")) OR ((w_21 AND to_unsigned(16#00FF0000#, 32)) OR ((cast_64 AND to_unsigned(16#0000FF00#, 32)) OR resize(udp_frame_unsigned(19), 32)));
                  xid_out_tmp <= xid_in_unsigned;
                  cnt_out_tmp <= to_unsigned(16#00000001#, 32);
                  renewal_cnt_out_tmp <= renewal_cnt_in_unsigned;
                ELSE 
                  guard1 := '1';
                END IF;
              ELSE 
                guard1 := '1';
              END IF;
            ELSE 
              guard1 := '1';
            END IF;
          ELSE 
            guard1 := '1';
          END IF;
        ELSE 
          guard1 := '1';
        END IF;
        IF guard1 = '1' THEN 
          IF renewal_cnt_in_unsigned < retry_delay_unsigned THEN 
            -- wait for 10 seconds and send DHCP DISCOVER again with xid++
            state_out_tmp <= state_in_unsigned;
            server_ip_out_tmp <= server_ip_in_unsigned;
            client_ip_out_tmp <= client_ip_in_unsigned;
            xid_out_tmp <= xid_in_unsigned;
            renewal_cnt_out_tmp <= renewal_cnt_in_unsigned + 1;
          ELSE 
            state_out_tmp <= to_unsigned(16#01#, 8);
            server_ip_out_tmp <= to_unsigned(16#00000000#, 32);
            client_ip_out_tmp <= to_unsigned(16#00000000#, 32);
            add_temp_12 := resize(xid_in_unsigned, 33) + to_unsigned(1, 33);
            IF add_temp_12(32) /= '0' THEN 
              xid_out_tmp <= X"FFFFFFFF";
            ELSE 
              xid_out_tmp <= add_temp_12(31 DOWNTO 0);
            END IF;
            renewal_cnt_out_tmp <= to_unsigned(16#00000000#, 32);
          END IF;
          cnt_out_tmp <= to_unsigned(16#00000001#, 32);
        END IF;
        led1 <= '1';
        led2 <= '1';
        led3 <= '0';
        led4 <= '0';
      WHEN "00000100" =>
        -- Search the magic cookie (0x63 0x82 0x53 0x63) in the udp_frame
        eth_frame_tmp <= (OTHERS => to_unsigned(16#00#, 8));
        send <= '0';
        ciaddr_out_tmp <= to_unsigned(16#00000000#, 32);
        ip_time_out_tmp <= to_unsigned(16#00000000#, 32);
        IF udp_frame_ready = '1' THEN 
          IF cnt_in_unsigned <= to_unsigned(16#0000006B#, 32) THEN 
            sub_cast_6 := signed(cnt_in_unsigned);
            add_cast_2 := signed(cnt_in_unsigned);
            add_cast_3 := signed(cnt_in_unsigned);
            IF (((udp_frame_unsigned(to_integer(sub_cast_6 - 1)) = to_unsigned(16#00000063#, 8)) AND (udp_frame_unsigned(to_integer(cnt_in_unsigned)) = to_unsigned(16#00000082#, 8))) AND (udp_frame_unsigned(to_integer(add_cast_2 + 1)) = to_unsigned(16#00000053#, 8))) AND (udp_frame_unsigned(to_integer(add_cast_3 + 2)) = to_unsigned(16#00000063#, 8)) THEN 
              add_temp_2 := resize(state_in_unsigned, 9) + to_unsigned(16#001#, 9);
              IF add_temp_2(8) /= '0' THEN 
                state_out_tmp <= "11111111";
              ELSE 
                state_out_tmp <= add_temp_2(7 DOWNTO 0);
              END IF;
            ELSE 
              state_out_tmp <= state_in_unsigned;
            END IF;
            server_ip_out_tmp <= server_ip_in_unsigned;
            client_ip_out_tmp <= client_ip_in_unsigned;
            xid_out_tmp <= xid_in_unsigned;
            cnt_out_tmp <= cnt_in_unsigned + 4;
            renewal_cnt_out_tmp <= renewal_cnt_in_unsigned;
          ELSE 
            -- magic cookie has not been found -> send DHCP_DISCOVER again with xid++ after 10 seconds waiting
            IF renewal_cnt_in_unsigned < retry_delay_unsigned THEN 
              -- wait for 10 seconds and send DHCP DISCOVER again with xid++
              state_out_tmp <= state_in_unsigned;
              server_ip_out_tmp <= server_ip_in_unsigned;
              client_ip_out_tmp <= client_ip_in_unsigned;
              xid_out_tmp <= xid_in_unsigned;
              renewal_cnt_out_tmp <= renewal_cnt_in_unsigned + 1;
            ELSE 
              state_out_tmp <= to_unsigned(16#01#, 8);
              server_ip_out_tmp <= to_unsigned(16#00000000#, 32);
              client_ip_out_tmp <= to_unsigned(16#00000000#, 32);
              add_temp_7 := resize(xid_in_unsigned, 33) + to_unsigned(1, 33);
              IF add_temp_7(32) /= '0' THEN 
                xid_out_tmp <= X"FFFFFFFF";
              ELSE 
                xid_out_tmp <= add_temp_7(31 DOWNTO 0);
              END IF;
              renewal_cnt_out_tmp <= to_unsigned(16#00000000#, 32);
            END IF;
            cnt_out_tmp <= to_unsigned(16#00000001#, 32);
          END IF;
        ELSE 
          sub_cast_3 := signed(resize(state_in_unsigned, 9));
          sub_temp_2 := sub_cast_3 - to_signed(16#001#, 9);
          IF sub_temp_2(8) = '1' THEN 
            state_out_tmp <= "00000000";
          ELSE 
            state_out_tmp <= unsigned(sub_temp_2(7 DOWNTO 0));
          END IF;
          server_ip_out_tmp <= server_ip_in_unsigned;
          client_ip_out_tmp <= client_ip_in_unsigned;
          xid_out_tmp <= xid_in_unsigned;
          cnt_out_tmp <= to_unsigned(16#00000001#, 32);
          renewal_cnt_out_tmp <= to_unsigned(16#00000000#, 32);
        END IF;
        led1 <= '0';
        led2 <= '0';
        led3 <= '1';
        led4 <= '0';
      WHEN "00000101" =>
        -- Get the DHCP OFFER reply in dhcp options
        eth_frame_tmp <= (OTHERS => to_unsigned(16#00#, 8));
        send <= '0';
        ciaddr_out_tmp <= to_unsigned(16#00000000#, 32);
        ip_time_out_tmp <= to_unsigned(16#00000000#, 32);
        -- Search for DHCP OFFER reply in options
        IF udp_frame_ready = '1' THEN 
          IF cnt_in_unsigned <= to_unsigned(16#0000006C#, 32) THEN 
            sub_cast_11 := signed(cnt_in_unsigned);
            add_cast_4 := signed(cnt_in_unsigned);
            IF ((udp_frame_unsigned(to_integer(sub_cast_11 - 1)) = to_unsigned(16#00000035#, 8)) AND (udp_frame_unsigned(to_integer(cnt_in_unsigned)) = to_unsigned(16#00000001#, 8))) AND (udp_frame_unsigned(to_integer(add_cast_4 + 1)) = to_unsigned(16#00000002#, 8)) THEN 
              add_temp_5 := resize(state_in_unsigned, 9) + to_unsigned(16#001#, 9);
              IF add_temp_5(8) /= '0' THEN 
                state_out_tmp <= "11111111";
              ELSE 
                state_out_tmp <= add_temp_5(7 DOWNTO 0);
              END IF;
            ELSE 
              state_out_tmp <= state_in_unsigned;
            END IF;
            server_ip_out_tmp <= server_ip_in_unsigned;
            client_ip_out_tmp <= client_ip_in_unsigned;
            xid_out_tmp <= xid_in_unsigned;
            cnt_out_tmp <= cnt_in_unsigned + 1;
            renewal_cnt_out_tmp <= to_unsigned(16#00000000#, 32);
          ELSE 
            -- DHCP reply has not been found -> send DHCP_DISCOVER again with xid++ after 10 seconds waiting
            IF renewal_cnt_in_unsigned < retry_delay_unsigned THEN 
              -- wait for 10 seconds and send DHCP DISCOVER again with xid++
              sub_cast_14 := signed(resize(state_in_unsigned, 9));
              sub_temp_8 := sub_cast_14 - to_signed(16#002#, 9);
              IF sub_temp_8(8) = '1' THEN 
                state_out_tmp <= "00000000";
              ELSE 
                state_out_tmp <= unsigned(sub_temp_8(7 DOWNTO 0));
              END IF;
              server_ip_out_tmp <= server_ip_in_unsigned;
              client_ip_out_tmp <= client_ip_in_unsigned;
              xid_out_tmp <= xid_in_unsigned;
              renewal_cnt_out_tmp <= renewal_cnt_in_unsigned + 1;
            ELSE 
              state_out_tmp <= to_unsigned(16#01#, 8);
              server_ip_out_tmp <= to_unsigned(16#00000000#, 32);
              client_ip_out_tmp <= to_unsigned(16#00000000#, 32);
              add_temp_8 := resize(xid_in_unsigned, 33) + to_unsigned(1, 33);
              IF add_temp_8(32) /= '0' THEN 
                xid_out_tmp <= X"FFFFFFFF";
              ELSE 
                xid_out_tmp <= add_temp_8(31 DOWNTO 0);
              END IF;
              renewal_cnt_out_tmp <= to_unsigned(16#00000000#, 32);
            END IF;
            cnt_out_tmp <= to_unsigned(16#00000001#, 32);
          END IF;
        ELSE 
          sub_cast_7 := signed(resize(state_in_unsigned, 9));
          sub_temp_4 := sub_cast_7 - to_signed(16#002#, 9);
          IF sub_temp_4(8) = '1' THEN 
            state_out_tmp <= "00000000";
          ELSE 
            state_out_tmp <= unsigned(sub_temp_4(7 DOWNTO 0));
          END IF;
          server_ip_out_tmp <= server_ip_in_unsigned;
          client_ip_out_tmp <= client_ip_in_unsigned;
          xid_out_tmp <= xid_in_unsigned;
          cnt_out_tmp <= to_unsigned(16#00000001#, 32);
          renewal_cnt_out_tmp <= to_unsigned(16#00000000#, 32);
        END IF;
        led1 <= '1';
        led2 <= '0';
        led3 <= '1';
        led4 <= '0';
      WHEN "00000110" =>
        -- Get the DHCP server's identifier (DHCP server's IP) value from the dhcp options in udp_frame
        eth_frame_tmp <= (OTHERS => to_unsigned(16#00#, 8));
        send <= '0';
        ciaddr_out_tmp <= to_unsigned(16#00000000#, 32);
        -- Search for dhcp server's identifier value in options (DHCP server's IP)
        IF udp_frame_ready = '1' THEN 
          IF cnt_in_unsigned <= to_unsigned(16#00000069#, 32) THEN 
            sub_cast_8 := signed(cnt_in_unsigned);
            IF (udp_frame_unsigned(to_integer(sub_cast_8 - 1)) = to_unsigned(16#00000036#, 8)) AND (udp_frame_unsigned(to_integer(cnt_in_unsigned)) = to_unsigned(16#00000004#, 8)) THEN 
              add_temp_3 := resize(state_in_unsigned, 9) + to_unsigned(16#001#, 9);
              IF add_temp_3(8) /= '0' THEN 
                state_out_tmp <= "11111111";
              ELSE 
                state_out_tmp <= add_temp_3(7 DOWNTO 0);
              END IF;
              add_cast_5 := signed(cnt_in_unsigned);
              temp_68 := resize(udp_frame_unsigned(to_integer(add_cast_5 + 1)), 32);
              c_6 := temp_68 sll 24;
              w_12 := c_6;
              add_cast_7 := signed(cnt_in_unsigned);
              temp_69 := resize(udp_frame_unsigned(to_integer(add_cast_7 + 2)), 32);
              c_12 := temp_69 sll 16;
              w_13 := c_12;
              add_cast_9 := signed(cnt_in_unsigned);
              temp_70 := resize(udp_frame_unsigned(to_integer(add_cast_9 + 3)), 32);
              c_16 := temp_70 sll 8;
              cast_43 := signed(c_16);
              cast_44 := unsigned(cast_43);
              add_cast_11 := signed(cnt_in_unsigned);
              server_ip_out_tmp <= (w_12 AND unsigned'("11111111000000000000000000000000")) OR ((w_13 AND to_unsigned(16#00FF0000#, 32)) OR ((cast_44 AND to_unsigned(16#0000FF00#, 32)) OR resize(udp_frame_unsigned(to_integer(add_cast_11 + 4)), 32)));
            ELSE 
              state_out_tmp <= state_in_unsigned;
              server_ip_out_tmp <= to_unsigned(16#00000000#, 32);
            END IF;
            client_ip_out_tmp <= client_ip_in_unsigned;
            ip_time_out_tmp <= ip_time_in_unsigned;
            xid_out_tmp <= xid_in_unsigned;
            cnt_out_tmp <= cnt_in_unsigned + 1;
            renewal_cnt_out_tmp <= to_unsigned(16#00000000#, 32);
          ELSE 
            -- DHCP server's IP value has not been found -> send DHCP_DISCOVER again with xid++ after 10 seconds waiting
            IF renewal_cnt_in_unsigned < retry_delay_unsigned THEN 
              -- wait for 10 seconds and send DHCP DISCOVER again with xid++
              state_out_tmp <= state_in_unsigned;
              server_ip_out_tmp <= server_ip_in_unsigned;
              client_ip_out_tmp <= client_ip_in_unsigned;
              ip_time_out_tmp <= ip_time_in_unsigned;
              xid_out_tmp <= xid_in_unsigned;
              renewal_cnt_out_tmp <= renewal_cnt_in_unsigned + 1;
            ELSE 
              state_out_tmp <= to_unsigned(16#01#, 8);
              server_ip_out_tmp <= to_unsigned(16#00000000#, 32);
              client_ip_out_tmp <= to_unsigned(16#00000000#, 32);
              ip_time_out_tmp <= to_unsigned(16#00000000#, 32);
              add_temp_9 := resize(xid_in_unsigned, 33) + to_unsigned(1, 33);
              IF add_temp_9(32) /= '0' THEN 
                xid_out_tmp <= X"FFFFFFFF";
              ELSE 
                xid_out_tmp <= add_temp_9(31 DOWNTO 0);
              END IF;
              renewal_cnt_out_tmp <= to_unsigned(16#00000000#, 32);
            END IF;
            cnt_out_tmp <= to_unsigned(16#00000001#, 32);
          END IF;
        ELSE 
          state_out_tmp <= to_unsigned(16#01#, 8);
          server_ip_out_tmp <= server_ip_in_unsigned;
          client_ip_out_tmp <= client_ip_in_unsigned;
          ip_time_out_tmp <= ip_time_in_unsigned;
          xid_out_tmp <= xid_in_unsigned;
          cnt_out_tmp <= to_unsigned(16#00000001#, 32);
          renewal_cnt_out_tmp <= to_unsigned(16#00000000#, 32);
        END IF;
        led1 <= '0';
        led2 <= '1';
        led3 <= '1';
        led4 <= '0';
      WHEN "00000111" =>
        -- Get the IP lease time value from the dhcp options in udp_frame
        eth_frame_tmp <= (OTHERS => to_unsigned(16#00#, 8));
        send <= '0';
        ciaddr_out_tmp <= to_unsigned(16#00000000#, 32);
        -- Search for IP lease time value in options
        IF udp_frame_ready = '1' THEN 
          IF cnt_in_unsigned <= to_unsigned(16#00000069#, 32) THEN 
            sub_cast_9 := signed(cnt_in_unsigned);
            IF (udp_frame_unsigned(to_integer(sub_cast_9 - 1)) = to_unsigned(16#00000033#, 8)) AND (udp_frame_unsigned(to_integer(cnt_in_unsigned)) = to_unsigned(16#00000004#, 8)) THEN 
              add_temp_4 := resize(state_in_unsigned, 9) + to_unsigned(16#001#, 9);
              IF add_temp_4(8) /= '0' THEN 
                state_out_tmp <= "11111111";
              ELSE 
                state_out_tmp <= add_temp_4(7 DOWNTO 0);
              END IF;
              add_cast_6 := signed(cnt_in_unsigned);
              temp_71 := resize(udp_frame_unsigned(to_integer(add_cast_6 + 1)), 32);
              c_7 := temp_71 sll 24;
              w_14 := c_7;
              add_cast_8 := signed(cnt_in_unsigned);
              temp_72 := resize(udp_frame_unsigned(to_integer(add_cast_8 + 2)), 32);
              c_13 := temp_72 sll 16;
              w_15 := c_13;
              add_cast_10 := signed(cnt_in_unsigned);
              temp_73 := resize(udp_frame_unsigned(to_integer(add_cast_10 + 3)), 32);
              c_17 := temp_73 sll 8;
              cast_45 := signed(c_17);
              cast_46 := unsigned(cast_45);
              add_cast_12 := signed(cnt_in_unsigned);
              ip_time_out_tmp <= (w_14 AND unsigned'("11111111000000000000000000000000")) OR ((w_15 AND to_unsigned(16#00FF0000#, 32)) OR ((cast_46 AND to_unsigned(16#0000FF00#, 32)) OR resize(udp_frame_unsigned(to_integer(add_cast_12 + 4)), 32)));
              cnt_out_tmp <= to_unsigned(16#00000001#, 32);
            ELSE 
              state_out_tmp <= state_in_unsigned;
              ip_time_out_tmp <= to_unsigned(16#00000000#, 32);
              cnt_out_tmp <= cnt_in_unsigned + 1;
            END IF;
            server_ip_out_tmp <= server_ip_in_unsigned;
            client_ip_out_tmp <= client_ip_in_unsigned;
            xid_out_tmp <= xid_in_unsigned;
            renewal_cnt_out_tmp <= to_unsigned(16#00000000#, 32);
          ELSE 
            -- IP lease time value has not been found -> send DHCP_DISCOVER again with xid++ after 10 seconds waiting
            IF renewal_cnt_in_unsigned < retry_delay_unsigned THEN 
              -- wait for 10 seconds and send DHCP DISCOVER again with xid++
              state_out_tmp <= state_in_unsigned;
              server_ip_out_tmp <= server_ip_in_unsigned;
              client_ip_out_tmp <= client_ip_in_unsigned;
              ip_time_out_tmp <= ip_time_in_unsigned;
              xid_out_tmp <= xid_in_unsigned;
              renewal_cnt_out_tmp <= renewal_cnt_in_unsigned + 1;
            ELSE 
              state_out_tmp <= to_unsigned(16#01#, 8);
              server_ip_out_tmp <= to_unsigned(16#00000000#, 32);
              client_ip_out_tmp <= to_unsigned(16#00000000#, 32);
              ip_time_out_tmp <= to_unsigned(16#00000000#, 32);
              add_temp_10 := resize(xid_in_unsigned, 33) + to_unsigned(1, 33);
              IF add_temp_10(32) /= '0' THEN 
                xid_out_tmp <= X"FFFFFFFF";
              ELSE 
                xid_out_tmp <= add_temp_10(31 DOWNTO 0);
              END IF;
              renewal_cnt_out_tmp <= to_unsigned(16#00000000#, 32);
            END IF;
            cnt_out_tmp <= to_unsigned(16#00000001#, 32);
          END IF;
        ELSE 
          state_out_tmp <= to_unsigned(16#01#, 8);
          server_ip_out_tmp <= server_ip_in_unsigned;
          client_ip_out_tmp <= client_ip_in_unsigned;
          ip_time_out_tmp <= ip_time_in_unsigned;
          xid_out_tmp <= xid_in_unsigned;
          cnt_out_tmp <= to_unsigned(16#00000001#, 32);
          renewal_cnt_out_tmp <= to_unsigned(16#00000000#, 32);
        END IF;
        led1 <= '1';
        led2 <= '1';
        led3 <= '1';
        led4 <= '0';
      WHEN "00001000" =>
        -- Send DHCP REQUEST to the router
        temp_19 := mac_addr1_unsigned;
        c_1 := temp_19 srl 8;
        temp_20 := mac_addr2_unsigned;
        c_10 := temp_20 srl 8;
        temp_21 := mac_addr3_unsigned;
        c_20 := temp_21 srl 8;
        temp_22 := dhcp_port_unsigned;
        c_26 := temp_22 srl 8;
        sub_cast_12 := signed(resize(dhcp_port_unsigned, 17));
        sub_temp_6 := sub_cast_12 - to_signed(16#00001#, 17);
        IF sub_temp_6(16) = '1' THEN 
          temp_23 := X"0000";
        ELSE 
          temp_23 := unsigned(sub_temp_6(15 DOWNTO 0));
        END IF;
        c_32 := temp_23 srl 8;
        temp_24 := xid_in_unsigned;
        c_38 := temp_24 srl 24;
        temp_25 := xid_in_unsigned;
        c_44 := temp_25 srl 16;
        temp_26 := xid_in_unsigned;
        c_48 := temp_26 srl 8;
        w_1 := c_48;
        temp_27 := ciaddr_in_unsigned;
        c_52 := temp_27 srl 24;
        temp_28 := ciaddr_in_unsigned;
        c_55 := temp_28 srl 16;
        temp_29 := ciaddr_in_unsigned;
        c_59 := temp_29 srl 8;
        w_2 := c_59;
        temp_30 := server_ip_in_unsigned;
        c_63 := temp_30 srl 24;
        temp_31 := server_ip_in_unsigned;
        c_65 := temp_31 srl 16;
        temp_32 := server_ip_in_unsigned;
        c_67 := temp_32 srl 8;
        w_3 := c_67;
        temp_33 := mac_addr1_unsigned;
        c_69 := temp_33 srl 8;
        temp_34 := mac_addr2_unsigned;
        c_71 := temp_34 srl 8;
        temp_35 := mac_addr3_unsigned;
        c_73 := temp_35 srl 8;
        temp_36 := client_ip_in_unsigned;
        c_75 := temp_36 srl 24;
        temp_37 := client_ip_in_unsigned;
        c_77 := temp_37 srl 16;
        temp_38 := client_ip_in_unsigned;
        c_79 := temp_38 srl 8;
        w_4 := c_79;
        temp_39 := server_ip_in_unsigned;
        c_81 := temp_39 srl 24;
        temp_40 := server_ip_in_unsigned;
        c_83 := temp_40 srl 16;
        temp_41 := server_ip_in_unsigned;
        c_85 := temp_41 srl 8;
        w_5 := c_85;
        eth_frame_tmp(0) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(1) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(2) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(3) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(4) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(5) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(6) <= c_1(7 DOWNTO 0);
        cast_70 := signed(resize(mac_addr1_unsigned, 32));
        cast_71 := cast_70 AND to_signed(16#000000FF#, 32);
        eth_frame_tmp(7) <= unsigned(cast_71(7 DOWNTO 0));
        eth_frame_tmp(8) <= c_10(7 DOWNTO 0);
        cast_77 := signed(resize(mac_addr2_unsigned, 32));
        cast_78 := cast_77 AND to_signed(16#000000FF#, 32);
        eth_frame_tmp(9) <= unsigned(cast_78(7 DOWNTO 0));
        eth_frame_tmp(10) <= c_20(7 DOWNTO 0);
        cast_81 := signed(resize(mac_addr3_unsigned, 32));
        cast_82 := cast_81 AND to_signed(16#000000FF#, 32);
        eth_frame_tmp(11) <= unsigned(cast_82(7 DOWNTO 0));
        eth_frame_tmp(12) <= to_unsigned(16#08#, 8);
        eth_frame_tmp(13) <= to_unsigned(16#00#, 8);
        eth_frame_tmp(14) <= to_unsigned(16#45#, 8);
        eth_frame_tmp(15) <= to_unsigned(16#00#, 8);
        eth_frame_tmp(16) <= to_unsigned(16#01#, 8);
        eth_frame_tmp(17) <= to_unsigned(16#28#, 8);
        eth_frame_tmp(18 TO 21) <= (OTHERS => to_unsigned(16#00#, 8));
        eth_frame_tmp(22) <= to_unsigned(16#10#, 8);
        eth_frame_tmp(23) <= to_unsigned(16#11#, 8);
        eth_frame_tmp(24 TO 25) <= (OTHERS => to_unsigned(16#00#, 8));
        eth_frame_tmp(26 TO 29) <= (OTHERS => to_unsigned(16#00#, 8));
        eth_frame_tmp(30) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(31) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(32) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(33) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(34) <= c_26(7 DOWNTO 0);
        cast_100 := signed(resize(dhcp_port_unsigned, 32));
        cast_101 := cast_100 AND to_signed(16#000000FF#, 32);
        eth_frame_tmp(35) <= unsigned(cast_101(7 DOWNTO 0));
        eth_frame_tmp(36) <= c_32(7 DOWNTO 0);
        sub_cast_17 := signed(resize(dhcp_port_unsigned, 17));
        sub_temp_11 := sub_cast_17 - to_signed(16#00001#, 17);
        IF sub_temp_11(16) = '1' THEN 
          cast_104 := X"0000";
        ELSE 
          cast_104 := unsigned(sub_temp_11(15 DOWNTO 0));
        END IF;
        cast_105 := signed(resize(cast_104, 32));
        cast_106 := cast_105 AND to_signed(16#000000FF#, 32);
        eth_frame_tmp(37) <= unsigned(cast_106(7 DOWNTO 0));
        eth_frame_tmp(38) <= to_unsigned(16#01#, 8);
        eth_frame_tmp(39) <= to_unsigned(16#14#, 8);
        eth_frame_tmp(42) <= to_unsigned(16#01#, 8);
        eth_frame_tmp(43) <= to_unsigned(16#01#, 8);
        eth_frame_tmp(44) <= to_unsigned(16#06#, 8);
        eth_frame_tmp(45) <= to_unsigned(16#00#, 8);
        cast_110 := signed(c_38);
        eth_frame_tmp(46) <= unsigned(cast_110(7 DOWNTO 0));
        cast_112 := signed(c_44);
        cast_113 := unsigned(cast_112);
        eth_frame_tmp(47) <= resize(cast_113 AND to_unsigned(16#000000FF#, 32), 8);
        eth_frame_tmp(48) <= resize(w_1 AND to_unsigned(16#000000FF#, 32), 8);
        eth_frame_tmp(49) <= resize(xid_in_unsigned AND to_unsigned(16#000000FF#, 32), 8);
        eth_frame_tmp(40 TO 41) <= (OTHERS => to_unsigned(16#00#, 8));
        eth_frame_tmp(50 TO 51) <= (OTHERS => to_unsigned(16#00#, 8));
        eth_frame_tmp(52) <= to_unsigned(16#80#, 8);
        eth_frame_tmp(53) <= to_unsigned(16#00#, 8);
        cast_116 := signed(c_52);
        eth_frame_tmp(54) <= unsigned(cast_116(7 DOWNTO 0));
        cast_118 := signed(c_55);
        cast_119 := unsigned(cast_118);
        eth_frame_tmp(55) <= resize(cast_119 AND to_unsigned(16#000000FF#, 32), 8);
        eth_frame_tmp(56) <= resize(w_2 AND to_unsigned(16#000000FF#, 32), 8);
        eth_frame_tmp(57) <= resize(ciaddr_in_unsigned AND to_unsigned(16#000000FF#, 32), 8);
        cast_122 := signed(c_63);
        eth_frame_tmp(62) <= unsigned(cast_122(7 DOWNTO 0));
        cast_124 := signed(c_65);
        cast_125 := unsigned(cast_124);
        eth_frame_tmp(63) <= resize(cast_125 AND to_unsigned(16#000000FF#, 32), 8);
        eth_frame_tmp(64) <= resize(w_3 AND to_unsigned(16#000000FF#, 32), 8);
        eth_frame_tmp(65) <= resize(server_ip_in_unsigned AND to_unsigned(16#000000FF#, 32), 8);
        eth_frame_tmp(58 TO 61) <= (OTHERS => to_unsigned(16#00#, 8));
        eth_frame_tmp(66 TO 69) <= (OTHERS => to_unsigned(16#00#, 8));
        eth_frame_tmp(70) <= c_69(7 DOWNTO 0);
        cast_128 := signed(resize(mac_addr1_unsigned, 32));
        cast_129 := cast_128 AND to_signed(16#000000FF#, 32);
        eth_frame_tmp(71) <= unsigned(cast_129(7 DOWNTO 0));
        eth_frame_tmp(72) <= c_71(7 DOWNTO 0);
        cast_132 := signed(resize(mac_addr2_unsigned, 32));
        cast_133 := cast_132 AND to_signed(16#000000FF#, 32);
        eth_frame_tmp(73) <= unsigned(cast_133(7 DOWNTO 0));
        eth_frame_tmp(74) <= c_73(7 DOWNTO 0);
        cast_136 := signed(resize(mac_addr3_unsigned, 32));
        cast_137 := cast_136 AND to_signed(16#000000FF#, 32);
        eth_frame_tmp(75) <= unsigned(cast_137(7 DOWNTO 0));
        eth_frame_tmp(76 TO 277) <= (OTHERS => to_unsigned(16#00#, 8));
        eth_frame_tmp(278) <= to_unsigned(16#63#, 8);
        eth_frame_tmp(279) <= to_unsigned(16#82#, 8);
        eth_frame_tmp(280) <= to_unsigned(16#53#, 8);
        eth_frame_tmp(281) <= to_unsigned(16#63#, 8);
        eth_frame_tmp(282) <= to_unsigned(16#35#, 8);
        eth_frame_tmp(283) <= to_unsigned(16#01#, 8);
        eth_frame_tmp(284) <= to_unsigned(16#03#, 8);
        eth_frame_tmp(285) <= to_unsigned(16#32#, 8);
        eth_frame_tmp(286) <= to_unsigned(16#04#, 8);
        cast_140 := signed(c_75);
        eth_frame_tmp(287) <= unsigned(cast_140(7 DOWNTO 0));
        cast_142 := signed(c_77);
        cast_143 := unsigned(cast_142);
        eth_frame_tmp(288) <= resize(cast_143 AND to_unsigned(16#000000FF#, 32), 8);
        eth_frame_tmp(289) <= resize(w_4 AND to_unsigned(16#000000FF#, 32), 8);
        eth_frame_tmp(290) <= resize(client_ip_in_unsigned AND to_unsigned(16#000000FF#, 32), 8);
        eth_frame_tmp(291) <= to_unsigned(16#36#, 8);
        eth_frame_tmp(292) <= to_unsigned(16#04#, 8);
        cast_146 := signed(c_81);
        eth_frame_tmp(293) <= unsigned(cast_146(7 DOWNTO 0));
        cast_148 := signed(c_83);
        cast_149 := unsigned(cast_148);
        eth_frame_tmp(294) <= resize(cast_149 AND to_unsigned(16#000000FF#, 32), 8);
        eth_frame_tmp(295) <= resize(w_5 AND to_unsigned(16#000000FF#, 32), 8);
        eth_frame_tmp(296) <= resize(server_ip_in_unsigned AND to_unsigned(16#000000FF#, 32), 8);
        eth_frame_tmp(297) <= to_unsigned(16#0C#, 8);
        eth_frame_tmp(298) <= to_unsigned(16#07#, 8);
        eth_frame_tmp(299) <= to_unsigned(16#67#, 8);
        eth_frame_tmp(300) <= to_unsigned(16#61#, 8);
        eth_frame_tmp(301) <= to_unsigned(16#74#, 8);
        eth_frame_tmp(302) <= to_unsigned(16#65#, 8);
        eth_frame_tmp(303) <= to_unsigned(16#77#, 8);
        eth_frame_tmp(304) <= to_unsigned(16#61#, 8);
        eth_frame_tmp(305) <= to_unsigned(16#79#, 8);
        eth_frame_tmp(306) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(307 TO 309) <= (OTHERS => to_unsigned(16#00#, 8));
        -- wait for starting transmission
        send <= '1';
        IF transmitter_ready = '1' THEN 
          state_out_tmp <= state_in_unsigned;
        ELSE 
          add_temp_19 := resize(state_in_unsigned, 9) + to_unsigned(16#001#, 9);
          IF add_temp_19(8) /= '0' THEN 
            state_out_tmp <= "11111111";
          ELSE 
            state_out_tmp <= add_temp_19(7 DOWNTO 0);
          END IF;
        END IF;
        server_ip_out_tmp <= server_ip_in_unsigned;
        client_ip_out_tmp <= client_ip_in_unsigned;
        ciaddr_out_tmp <= ciaddr_in_unsigned;
        ip_time_out_tmp <= ip_time_in_unsigned;
        xid_out_tmp <= xid_in_unsigned;
        cnt_out_tmp <= to_unsigned(16#00000001#, 32);
        renewal_cnt_out_tmp <= to_unsigned(16#00000000#, 32);
        led1 <= '0';
        led2 <= '0';
        led3 <= '0';
        led4 <= '1';
      WHEN "00001001" =>
        -- Wait for end of transmission DHCP REQUEST
        temp_42 := mac_addr1_unsigned;
        c_2 := temp_42 srl 8;
        temp_43 := mac_addr2_unsigned;
        c_11 := temp_43 srl 8;
        temp_44 := mac_addr3_unsigned;
        c_21 := temp_44 srl 8;
        temp_45 := dhcp_port_unsigned;
        c_27 := temp_45 srl 8;
        sub_cast_13 := signed(resize(dhcp_port_unsigned, 17));
        sub_temp_7 := sub_cast_13 - to_signed(16#00001#, 17);
        IF sub_temp_7(16) = '1' THEN 
          temp_46 := X"0000";
        ELSE 
          temp_46 := unsigned(sub_temp_7(15 DOWNTO 0));
        END IF;
        c_33 := temp_46 srl 8;
        temp_47 := xid_in_unsigned;
        c_39 := temp_47 srl 24;
        temp_48 := xid_in_unsigned;
        c_45 := temp_48 srl 16;
        temp_49 := xid_in_unsigned;
        c_49 := temp_49 srl 8;
        w_6 := c_49;
        temp_50 := ciaddr_in_unsigned;
        c_53 := temp_50 srl 24;
        temp_51 := ciaddr_in_unsigned;
        c_56 := temp_51 srl 16;
        temp_52 := ciaddr_in_unsigned;
        c_60 := temp_52 srl 8;
        w_7 := c_60;
        temp_53 := server_ip_in_unsigned;
        c_64 := temp_53 srl 24;
        temp_54 := server_ip_in_unsigned;
        c_66 := temp_54 srl 16;
        temp_55 := server_ip_in_unsigned;
        c_68 := temp_55 srl 8;
        w_8 := c_68;
        temp_56 := mac_addr1_unsigned;
        c_70 := temp_56 srl 8;
        temp_57 := mac_addr2_unsigned;
        c_72 := temp_57 srl 8;
        temp_58 := mac_addr3_unsigned;
        c_74 := temp_58 srl 8;
        temp_59 := client_ip_in_unsigned;
        c_76 := temp_59 srl 24;
        temp_60 := client_ip_in_unsigned;
        c_78 := temp_60 srl 16;
        temp_61 := client_ip_in_unsigned;
        c_80 := temp_61 srl 8;
        w_9 := c_80;
        temp_62 := server_ip_in_unsigned;
        c_82 := temp_62 srl 24;
        temp_63 := server_ip_in_unsigned;
        c_84 := temp_63 srl 16;
        temp_64 := server_ip_in_unsigned;
        c_86 := temp_64 srl 8;
        w_10 := c_86;
        eth_frame_tmp(0) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(1) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(2) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(3) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(4) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(5) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(6) <= c_2(7 DOWNTO 0);
        cast_72 := signed(resize(mac_addr1_unsigned, 32));
        cast_73 := cast_72 AND to_signed(16#000000FF#, 32);
        eth_frame_tmp(7) <= unsigned(cast_73(7 DOWNTO 0));
        eth_frame_tmp(8) <= c_11(7 DOWNTO 0);
        cast_79 := signed(resize(mac_addr2_unsigned, 32));
        cast_80 := cast_79 AND to_signed(16#000000FF#, 32);
        eth_frame_tmp(9) <= unsigned(cast_80(7 DOWNTO 0));
        eth_frame_tmp(10) <= c_21(7 DOWNTO 0);
        cast_83 := signed(resize(mac_addr3_unsigned, 32));
        cast_84 := cast_83 AND to_signed(16#000000FF#, 32);
        eth_frame_tmp(11) <= unsigned(cast_84(7 DOWNTO 0));
        eth_frame_tmp(12) <= to_unsigned(16#08#, 8);
        eth_frame_tmp(13) <= to_unsigned(16#00#, 8);
        eth_frame_tmp(14) <= to_unsigned(16#45#, 8);
        eth_frame_tmp(15) <= to_unsigned(16#00#, 8);
        eth_frame_tmp(16) <= to_unsigned(16#01#, 8);
        eth_frame_tmp(17) <= to_unsigned(16#28#, 8);
        eth_frame_tmp(18 TO 21) <= (OTHERS => to_unsigned(16#00#, 8));
        eth_frame_tmp(22) <= to_unsigned(16#10#, 8);
        eth_frame_tmp(23) <= to_unsigned(16#11#, 8);
        eth_frame_tmp(24 TO 25) <= (OTHERS => to_unsigned(16#00#, 8));
        eth_frame_tmp(26 TO 29) <= (OTHERS => to_unsigned(16#00#, 8));
        eth_frame_tmp(30) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(31) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(32) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(33) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(34) <= c_27(7 DOWNTO 0);
        cast_102 := signed(resize(dhcp_port_unsigned, 32));
        cast_103 := cast_102 AND to_signed(16#000000FF#, 32);
        eth_frame_tmp(35) <= unsigned(cast_103(7 DOWNTO 0));
        eth_frame_tmp(36) <= c_33(7 DOWNTO 0);
        sub_cast_18 := signed(resize(dhcp_port_unsigned, 17));
        sub_temp_12 := sub_cast_18 - to_signed(16#00001#, 17);
        IF sub_temp_12(16) = '1' THEN 
          cast_107 := X"0000";
        ELSE 
          cast_107 := unsigned(sub_temp_12(15 DOWNTO 0));
        END IF;
        cast_108 := signed(resize(cast_107, 32));
        cast_109 := cast_108 AND to_signed(16#000000FF#, 32);
        eth_frame_tmp(37) <= unsigned(cast_109(7 DOWNTO 0));
        eth_frame_tmp(38) <= to_unsigned(16#01#, 8);
        eth_frame_tmp(39) <= to_unsigned(16#14#, 8);
        eth_frame_tmp(42) <= to_unsigned(16#01#, 8);
        eth_frame_tmp(43) <= to_unsigned(16#01#, 8);
        eth_frame_tmp(44) <= to_unsigned(16#06#, 8);
        eth_frame_tmp(45) <= to_unsigned(16#00#, 8);
        cast_111 := signed(c_39);
        eth_frame_tmp(46) <= unsigned(cast_111(7 DOWNTO 0));
        cast_114 := signed(c_45);
        cast_115 := unsigned(cast_114);
        eth_frame_tmp(47) <= resize(cast_115 AND to_unsigned(16#000000FF#, 32), 8);
        eth_frame_tmp(48) <= resize(w_6 AND to_unsigned(16#000000FF#, 32), 8);
        eth_frame_tmp(49) <= resize(xid_in_unsigned AND to_unsigned(16#000000FF#, 32), 8);
        eth_frame_tmp(40 TO 41) <= (OTHERS => to_unsigned(16#00#, 8));
        eth_frame_tmp(50 TO 51) <= (OTHERS => to_unsigned(16#00#, 8));
        eth_frame_tmp(52) <= to_unsigned(16#80#, 8);
        eth_frame_tmp(53) <= to_unsigned(16#00#, 8);
        cast_117 := signed(c_53);
        eth_frame_tmp(54) <= unsigned(cast_117(7 DOWNTO 0));
        cast_120 := signed(c_56);
        cast_121 := unsigned(cast_120);
        eth_frame_tmp(55) <= resize(cast_121 AND to_unsigned(16#000000FF#, 32), 8);
        eth_frame_tmp(56) <= resize(w_7 AND to_unsigned(16#000000FF#, 32), 8);
        eth_frame_tmp(57) <= resize(ciaddr_in_unsigned AND to_unsigned(16#000000FF#, 32), 8);
        cast_123 := signed(c_64);
        eth_frame_tmp(62) <= unsigned(cast_123(7 DOWNTO 0));
        cast_126 := signed(c_66);
        cast_127 := unsigned(cast_126);
        eth_frame_tmp(63) <= resize(cast_127 AND to_unsigned(16#000000FF#, 32), 8);
        eth_frame_tmp(64) <= resize(w_8 AND to_unsigned(16#000000FF#, 32), 8);
        eth_frame_tmp(65) <= resize(server_ip_in_unsigned AND to_unsigned(16#000000FF#, 32), 8);
        eth_frame_tmp(58 TO 61) <= (OTHERS => to_unsigned(16#00#, 8));
        eth_frame_tmp(66 TO 69) <= (OTHERS => to_unsigned(16#00#, 8));
        eth_frame_tmp(70) <= c_70(7 DOWNTO 0);
        cast_130 := signed(resize(mac_addr1_unsigned, 32));
        cast_131 := cast_130 AND to_signed(16#000000FF#, 32);
        eth_frame_tmp(71) <= unsigned(cast_131(7 DOWNTO 0));
        eth_frame_tmp(72) <= c_72(7 DOWNTO 0);
        cast_134 := signed(resize(mac_addr2_unsigned, 32));
        cast_135 := cast_134 AND to_signed(16#000000FF#, 32);
        eth_frame_tmp(73) <= unsigned(cast_135(7 DOWNTO 0));
        eth_frame_tmp(74) <= c_74(7 DOWNTO 0);
        cast_138 := signed(resize(mac_addr3_unsigned, 32));
        cast_139 := cast_138 AND to_signed(16#000000FF#, 32);
        eth_frame_tmp(75) <= unsigned(cast_139(7 DOWNTO 0));
        eth_frame_tmp(76 TO 277) <= (OTHERS => to_unsigned(16#00#, 8));
        eth_frame_tmp(278) <= to_unsigned(16#63#, 8);
        eth_frame_tmp(279) <= to_unsigned(16#82#, 8);
        eth_frame_tmp(280) <= to_unsigned(16#53#, 8);
        eth_frame_tmp(281) <= to_unsigned(16#63#, 8);
        eth_frame_tmp(282) <= to_unsigned(16#35#, 8);
        eth_frame_tmp(283) <= to_unsigned(16#01#, 8);
        eth_frame_tmp(284) <= to_unsigned(16#03#, 8);
        eth_frame_tmp(285) <= to_unsigned(16#32#, 8);
        eth_frame_tmp(286) <= to_unsigned(16#04#, 8);
        cast_141 := signed(c_76);
        eth_frame_tmp(287) <= unsigned(cast_141(7 DOWNTO 0));
        cast_144 := signed(c_78);
        cast_145 := unsigned(cast_144);
        eth_frame_tmp(288) <= resize(cast_145 AND to_unsigned(16#000000FF#, 32), 8);
        eth_frame_tmp(289) <= resize(w_9 AND to_unsigned(16#000000FF#, 32), 8);
        eth_frame_tmp(290) <= resize(client_ip_in_unsigned AND to_unsigned(16#000000FF#, 32), 8);
        eth_frame_tmp(291) <= to_unsigned(16#36#, 8);
        eth_frame_tmp(292) <= to_unsigned(16#04#, 8);
        cast_147 := signed(c_82);
        eth_frame_tmp(293) <= unsigned(cast_147(7 DOWNTO 0));
        cast_150 := signed(c_84);
        cast_151 := unsigned(cast_150);
        eth_frame_tmp(294) <= resize(cast_151 AND to_unsigned(16#000000FF#, 32), 8);
        eth_frame_tmp(295) <= resize(w_10 AND to_unsigned(16#000000FF#, 32), 8);
        eth_frame_tmp(296) <= resize(server_ip_in_unsigned AND to_unsigned(16#000000FF#, 32), 8);
        eth_frame_tmp(297) <= to_unsigned(16#0C#, 8);
        eth_frame_tmp(298) <= to_unsigned(16#07#, 8);
        eth_frame_tmp(299) <= to_unsigned(16#67#, 8);
        eth_frame_tmp(300) <= to_unsigned(16#61#, 8);
        eth_frame_tmp(301) <= to_unsigned(16#74#, 8);
        eth_frame_tmp(302) <= to_unsigned(16#65#, 8);
        eth_frame_tmp(303) <= to_unsigned(16#77#, 8);
        eth_frame_tmp(304) <= to_unsigned(16#61#, 8);
        eth_frame_tmp(305) <= to_unsigned(16#79#, 8);
        eth_frame_tmp(306) <= to_unsigned(16#FF#, 8);
        eth_frame_tmp(307 TO 309) <= (OTHERS => to_unsigned(16#00#, 8));
        IF transmitter_ready = '1' THEN 
          add_temp_18 := resize(state_in_unsigned, 9) + to_unsigned(16#001#, 9);
          IF add_temp_18(8) /= '0' THEN 
            state_out_tmp <= "11111111";
          ELSE 
            state_out_tmp <= add_temp_18(7 DOWNTO 0);
          END IF;
          send <= '0';
        ELSE 
          state_out_tmp <= state_in_unsigned;
          send <= '1';
        END IF;
        server_ip_out_tmp <= server_ip_in_unsigned;
        client_ip_out_tmp <= client_ip_in_unsigned;
        ciaddr_out_tmp <= ciaddr_in_unsigned;
        ip_time_out_tmp <= ip_time_in_unsigned;
        xid_out_tmp <= xid_in_unsigned;
        cnt_out_tmp <= to_unsigned(16#00000001#, 32);
        renewal_cnt_out_tmp <= to_unsigned(16#00000000#, 32);
        led1 <= '1';
        led2 <= '0';
        led3 <= '0';
        led4 <= '1';
      WHEN "00001010" =>
        -- Wait for DHCP ACK/NAK from the router
        eth_frame_tmp <= (OTHERS => to_unsigned(16#00#, 8));
        -- wait for DHCP reply from the router
        send <= '0';
        guard1_0 := '0';
        sub_cast_0 := signed(resize(dhcp_port_unsigned, 17));
        sub_temp_0 := sub_cast_0 - to_signed(16#00001#, 17);
        IF sub_temp_0(16) = '1' THEN 
          cast := X"0000";
        ELSE 
          cast := unsigned(sub_temp_0(15 DOWNTO 0));
        END IF;
        IF (((udp_frame_ready AND hdlcoder_to_stdlogic(source_port_unsigned = cast)) AND hdlcoder_to_stdlogic(dest_port_unsigned = dhcp_port_unsigned)) AND hdlcoder_to_stdlogic(udp_frame_unsigned(0) = to_unsigned(16#00000002#, 8))) = '1' THEN 
          temp_65 := mac_addr1_unsigned;
          c_3 := temp_65 srl 8;
          cast_1 := signed(resize(udp_frame_unsigned(28), 32));
          cast_2 := signed(resize(c_3, 32));
          cast_3 := signed(resize(udp_frame_unsigned(29), 32));
          cast_4 := signed(resize(mac_addr1_unsigned, 32));
          cast_5 := cast_4 AND to_signed(16#000000FF#, 32);
          cast_6 := unsigned(cast_5(15 DOWNTO 0));
          cast_7 := signed(resize(cast_6, 32));
          IF (cast_1 = cast_2) AND (cast_3 = cast_7) THEN 
            temp_74 := mac_addr2_unsigned;
            c_14 := temp_74 srl 8;
            cast_15 := signed(resize(udp_frame_unsigned(30), 32));
            cast_16 := signed(resize(c_14, 32));
            cast_17 := signed(resize(udp_frame_unsigned(31), 32));
            cast_18 := signed(resize(mac_addr2_unsigned, 32));
            cast_19 := cast_18 AND to_signed(16#000000FF#, 32);
            cast_20 := unsigned(cast_19(15 DOWNTO 0));
            cast_21 := signed(resize(cast_20, 32));
            IF (cast_15 = cast_16) AND (cast_17 = cast_21) THEN 
              temp_76 := mac_addr3_unsigned;
              c_22 := temp_76 srl 8;
              cast_29 := signed(resize(udp_frame_unsigned(32), 32));
              cast_30 := signed(resize(c_22, 32));
              cast_31 := signed(resize(udp_frame_unsigned(33), 32));
              cast_32 := signed(resize(mac_addr3_unsigned, 32));
              cast_33 := cast_32 AND to_signed(16#000000FF#, 32);
              cast_34 := unsigned(cast_33(15 DOWNTO 0));
              cast_35 := signed(resize(cast_34, 32));
              IF (cast_29 = cast_30) AND (cast_31 = cast_35) THEN 
                temp_78 := resize(udp_frame_unsigned(4), 32);
                c_29 := temp_78 sll 24;
                w_16 := c_29;
                temp_79 := resize(udp_frame_unsigned(5), 32);
                c_35 := temp_79 sll 16;
                w_17 := c_35;
                temp_80 := resize(udp_frame_unsigned(6), 32);
                c_40 := temp_80 sll 8;
                cast_47 := signed(c_40);
                cast_48 := unsigned(cast_47);
                IF ((w_16 AND unsigned'("11111111000000000000000000000000")) OR ((w_17 AND to_unsigned(16#00FF0000#, 32)) OR ((cast_48 AND to_unsigned(16#0000FF00#, 32)) OR resize(udp_frame_unsigned(7), 32)))) = xid_in_unsigned THEN 
                  add_temp_14 := resize(state_in_unsigned, 9) + to_unsigned(16#001#, 9);
                  IF add_temp_14(8) /= '0' THEN 
                    state_out_tmp <= "11111111";
                  ELSE 
                    state_out_tmp <= add_temp_14(7 DOWNTO 0);
                  END IF;
                  server_ip_out_tmp <= server_ip_in_unsigned;
                  client_ip_out_tmp <= client_ip_in_unsigned;
                  ciaddr_out_tmp <= ciaddr_in_unsigned;
                  ip_time_out_tmp <= ip_time_in_unsigned;
                  xid_out_tmp <= xid_in_unsigned;
                  cnt_out_tmp <= to_unsigned(16#00000001#, 32);
                  renewal_cnt_out_tmp <= renewal_cnt_in_unsigned;
                ELSE 
                  guard1_0 := '1';
                END IF;
              ELSE 
                guard1_0 := '1';
              END IF;
            ELSE 
              guard1_0 := '1';
            END IF;
          ELSE 
            guard1_0 := '1';
          END IF;
        ELSE 
          guard1_0 := '1';
        END IF;
        IF guard1_0 = '1' THEN 
          -- wait for 10 second and send DHCP DISCOVER again with xid++
          IF renewal_cnt_in_unsigned < retry_delay_unsigned THEN 
            state_out_tmp <= state_in_unsigned;
            server_ip_out_tmp <= server_ip_in_unsigned;
            client_ip_out_tmp <= client_ip_in_unsigned;
            ciaddr_out_tmp <= ciaddr_in_unsigned;
            ip_time_out_tmp <= ip_time_in_unsigned;
            xid_out_tmp <= xid_in_unsigned;
            renewal_cnt_out_tmp <= renewal_cnt_in_unsigned + 1;
          ELSE 
            state_out_tmp <= to_unsigned(16#01#, 8);
            server_ip_out_tmp <= to_unsigned(16#00000000#, 32);
            client_ip_out_tmp <= to_unsigned(16#00000000#, 32);
            ciaddr_out_tmp <= to_unsigned(16#00000000#, 32);
            ip_time_out_tmp <= to_unsigned(16#00000000#, 32);
            add_temp_13 := resize(xid_in_unsigned, 33) + to_unsigned(1, 33);
            IF add_temp_13(32) /= '0' THEN 
              xid_out_tmp <= X"FFFFFFFF";
            ELSE 
              xid_out_tmp <= add_temp_13(31 DOWNTO 0);
            END IF;
            renewal_cnt_out_tmp <= to_unsigned(16#00000000#, 32);
          END IF;
          cnt_out_tmp <= to_unsigned(16#00000001#, 32);
        END IF;
        led1 <= '0';
        led2 <= '1';
        led3 <= '0';
        led4 <= '1';
      WHEN "00001011" =>
        -- Search the magic cookie (0x63 0x82 0x53 0x63) in the udp_frame
        eth_frame_tmp <= (OTHERS => to_unsigned(16#00#, 8));
        send <= '0';
        IF udp_frame_ready = '1' THEN 
          IF cnt_in_unsigned <= to_unsigned(16#0000006B#, 32) THEN 
            sub_cast_1 := signed(cnt_in_unsigned);
            add_cast := signed(cnt_in_unsigned);
            add_cast_0 := signed(cnt_in_unsigned);
            IF (((udp_frame_unsigned(to_integer(sub_cast_1 - 1)) = to_unsigned(16#00000063#, 8)) AND (udp_frame_unsigned(to_integer(cnt_in_unsigned)) = to_unsigned(16#00000082#, 8))) AND (udp_frame_unsigned(to_integer(add_cast + 1)) = to_unsigned(16#00000053#, 8))) AND (udp_frame_unsigned(to_integer(add_cast_0 + 2)) = to_unsigned(16#00000063#, 8)) THEN 
              add_temp_0 := resize(state_in_unsigned, 9) + to_unsigned(16#001#, 9);
              IF add_temp_0(8) /= '0' THEN 
                state_out_tmp <= "11111111";
              ELSE 
                state_out_tmp <= add_temp_0(7 DOWNTO 0);
              END IF;
            ELSE 
              state_out_tmp <= state_in_unsigned;
            END IF;
            server_ip_out_tmp <= server_ip_in_unsigned;
            client_ip_out_tmp <= client_ip_in_unsigned;
            ciaddr_out_tmp <= ciaddr_in_unsigned;
            xid_out_tmp <= xid_in_unsigned;
            ip_time_out_tmp <= ip_time_in_unsigned;
            cnt_out_tmp <= cnt_in_unsigned + 4;
            renewal_cnt_out_tmp <= renewal_cnt_in_unsigned;
          ELSE 
            -- magic cookie has not been found -> send DHCP_DISCOVER again with xid++ after 10 seconds waiting
            IF renewal_cnt_in_unsigned < retry_delay_unsigned THEN 
              state_out_tmp <= state_in_unsigned;
              server_ip_out_tmp <= server_ip_in_unsigned;
              client_ip_out_tmp <= client_ip_in_unsigned;
              ciaddr_out_tmp <= ciaddr_in_unsigned;
              xid_out_tmp <= xid_in_unsigned;
              ip_time_out_tmp <= ip_time_in_unsigned;
              renewal_cnt_out_tmp <= renewal_cnt_in_unsigned + 1;
            ELSE 
              state_out_tmp <= to_unsigned(16#01#, 8);
              server_ip_out_tmp <= to_unsigned(16#00000000#, 32);
              client_ip_out_tmp <= to_unsigned(16#00000000#, 32);
              ciaddr_out_tmp <= to_unsigned(16#00000000#, 32);
              add_temp_6 := resize(xid_in_unsigned, 33) + to_unsigned(1, 33);
              IF add_temp_6(32) /= '0' THEN 
                xid_out_tmp <= X"FFFFFFFF";
              ELSE 
                xid_out_tmp <= add_temp_6(31 DOWNTO 0);
              END IF;
              ip_time_out_tmp <= to_unsigned(16#00000000#, 32);
              renewal_cnt_out_tmp <= to_unsigned(16#00000000#, 32);
            END IF;
            cnt_out_tmp <= to_unsigned(16#00000001#, 32);
          END IF;
        ELSE 
          sub_cast := signed(resize(state_in_unsigned, 9));
          sub_temp := sub_cast - to_signed(16#001#, 9);
          IF sub_temp(8) = '1' THEN 
            state_out_tmp <= "00000000";
          ELSE 
            state_out_tmp <= unsigned(sub_temp(7 DOWNTO 0));
          END IF;
          server_ip_out_tmp <= server_ip_in_unsigned;
          client_ip_out_tmp <= client_ip_in_unsigned;
          ciaddr_out_tmp <= ciaddr_in_unsigned;
          xid_out_tmp <= xid_in_unsigned;
          ip_time_out_tmp <= ip_time_in_unsigned;
          cnt_out_tmp <= to_unsigned(16#00000001#, 32);
          renewal_cnt_out_tmp <= to_unsigned(16#00000000#, 32);
        END IF;
        led1 <= '1';
        led2 <= '1';
        led3 <= '0';
        led4 <= '1';
      WHEN "00001100" =>
        -- Check the ACK/NAK in options
        eth_frame_tmp <= (OTHERS => to_unsigned(16#00#, 8));
        send <= '0';
        -- Search the ACK/NAK option
        IF udp_frame_ready = '1' THEN 
          IF cnt_in_unsigned <= to_unsigned(16#0000006C#, 32) THEN 
            sub_cast_4 := signed(cnt_in_unsigned);
            add_cast_1 := signed(cnt_in_unsigned);
            IF ((udp_frame_unsigned(to_integer(sub_cast_4 - 1)) = to_unsigned(16#00000035#, 8)) AND (udp_frame_unsigned(to_integer(cnt_in_unsigned)) = to_unsigned(16#00000001#, 8))) AND (udp_frame_unsigned(to_integer(add_cast_1 + 1)) = to_unsigned(16#00000005#, 8)) THEN 
              add_temp_1 := resize(state_in_unsigned, 9) + to_unsigned(16#001#, 9);
              IF add_temp_1(8) /= '0' THEN 
                state_out_tmp <= "11111111";
              ELSE 
                state_out_tmp <= add_temp_1(7 DOWNTO 0);
              END IF;
              cnt_out_tmp <= to_unsigned(16#00000001#, 32);
              renewal_cnt_out_tmp <= to_unsigned(16#00000000#, 32);
            ELSE 
              state_out_tmp <= state_in_unsigned;
              cnt_out_tmp <= cnt_in_unsigned + 1;
              renewal_cnt_out_tmp <= renewal_cnt_in_unsigned;
            END IF;
            server_ip_out_tmp <= server_ip_in_unsigned;
            client_ip_out_tmp <= client_ip_in_unsigned;
            ciaddr_out_tmp <= ciaddr_in_unsigned;
            xid_out_tmp <= xid_in_unsigned;
            ip_time_out_tmp <= ip_time_in_unsigned;
          ELSE 
            -- DHCP ACK value has not been found -> send DHCP_DISCOVER again with xid++ after waiting for 10 seconds
            IF renewal_cnt_in_unsigned < retry_delay_unsigned THEN 
              -- wait for 10 second and send DHCP DISCOVER again with xid++
              state_out_tmp <= state_in_unsigned;
              server_ip_out_tmp <= server_ip_in_unsigned;
              client_ip_out_tmp <= client_ip_in_unsigned;
              ciaddr_out_tmp <= ciaddr_in_unsigned;
              ip_time_out_tmp <= ip_time_in_unsigned;
              xid_out_tmp <= xid_in_unsigned;
              renewal_cnt_out_tmp <= renewal_cnt_in_unsigned + 1;
            ELSE 
              state_out_tmp <= to_unsigned(16#01#, 8);
              server_ip_out_tmp <= to_unsigned(16#00000000#, 32);
              client_ip_out_tmp <= to_unsigned(16#00000000#, 32);
              ciaddr_out_tmp <= to_unsigned(16#00000000#, 32);
              ip_time_out_tmp <= to_unsigned(16#00000000#, 32);
              add_temp_11 := resize(xid_in_unsigned, 33) + to_unsigned(1, 33);
              IF add_temp_11(32) /= '0' THEN 
                xid_out_tmp <= X"FFFFFFFF";
              ELSE 
                xid_out_tmp <= add_temp_11(31 DOWNTO 0);
              END IF;
              renewal_cnt_out_tmp <= to_unsigned(16#00000000#, 32);
            END IF;
            cnt_out_tmp <= to_unsigned(16#00000001#, 32);
          END IF;
        ELSE 
          sub_cast_2 := signed(resize(state_in_unsigned, 9));
          sub_temp_1 := sub_cast_2 - to_signed(16#002#, 9);
          IF sub_temp_1(8) = '1' THEN 
            state_out_tmp <= "00000000";
          ELSE 
            state_out_tmp <= unsigned(sub_temp_1(7 DOWNTO 0));
          END IF;
          server_ip_out_tmp <= server_ip_in_unsigned;
          client_ip_out_tmp <= client_ip_in_unsigned;
          ciaddr_out_tmp <= ciaddr_in_unsigned;
          ip_time_out_tmp <= ip_time_in_unsigned;
          xid_out_tmp <= xid_in_unsigned;
          cnt_out_tmp <= to_unsigned(16#00000001#, 32);
          renewal_cnt_out_tmp <= to_unsigned(16#00000000#, 32);
        END IF;
        led1 <= '0';
        led2 <= '0';
        led3 <= '1';
        led4 <= '1';
      WHEN "00001101" =>
        -- wait for little bit less than IP lease time and then send DHCP_REQUEST again
        eth_frame_tmp <= (OTHERS => to_unsigned(16#00#, 8));
        send <= '0';
        server_ip_out_tmp <= server_ip_in_unsigned;
        client_ip_out_tmp <= client_ip_in_unsigned;
        ip_time_out_tmp <= ip_time_in_unsigned;
        xid_out_tmp <= xid_in_unsigned;
        -- Wait for IP lease time and send DHCP_REQUEST again with changed ciaddr = current client IP (it was 0x0 before)
        temp_66 := ip_time_in_unsigned;
        c_4 := temp_66 srl 7;
        w_11 := c_4;
        IF renewal_cnt_in_unsigned >= w_11 THEN 
          -- Change ciaddr to current IP in eth_frame (it was 0x0)
          sub_cast_15 := signed(resize(state_in_unsigned, 9));
          sub_temp_9 := sub_cast_15 - to_signed(16#005#, 9);
          IF sub_temp_9(8) = '1' THEN 
            state_out_tmp <= "00000000";
          ELSE 
            state_out_tmp <= unsigned(sub_temp_9(7 DOWNTO 0));
          END IF;
          ciaddr_out_tmp <= client_ip_in_unsigned;
          cnt_out_tmp <= to_unsigned(16#00000001#, 32);
          renewal_cnt_out_tmp <= to_unsigned(16#00000000#, 32);
        ELSE 
          -- Count the time to renew IP address
          IF cnt_in_unsigned = unsigned'("11111111111111111111111111111111") THEN 
            cnt_out_tmp <= to_unsigned(16#00000000#, 32);
            renewal_cnt_out_tmp <= renewal_cnt_in_unsigned + 1;
          ELSE 
            cnt_out_tmp <= cnt_in_unsigned + 1;
            renewal_cnt_out_tmp <= renewal_cnt_in_unsigned;
          END IF;
          state_out_tmp <= state_in_unsigned;
          ciaddr_out_tmp <= ciaddr_in_unsigned;
        END IF;
        led1 <= '1';
        led2 <= '0';
        led3 <= '1';
        led4 <= '1';
      WHEN OTHERS => 
        eth_frame_tmp <= (OTHERS => to_unsigned(16#00#, 8));
        send <= '0';
        state_out_tmp <= to_unsigned(16#00#, 8);
        server_ip_out_tmp <= to_unsigned(16#00000000#, 32);
        client_ip_out_tmp <= to_unsigned(16#00000000#, 32);
        ciaddr_out_tmp <= to_unsigned(16#00000000#, 32);
        ip_time_out_tmp <= to_unsigned(16#00000000#, 32);
        xid_out_tmp <= to_unsigned(16#00000000#, 32);
        cnt_out_tmp <= to_unsigned(16#00000001#, 32);
        renewal_cnt_out_tmp <= to_unsigned(16#00000000#, 32);
        led1 <= '0';
        led2 <= '0';
        led3 <= '0';
        led4 <= '0';
    END CASE;
  END PROCESS Gateway_1_output;


  server_ip_out <= std_logic_vector(server_ip_out_tmp);

  client_ip_out <= std_logic_vector(client_ip_out_tmp);

  ciaddr_out <= std_logic_vector(ciaddr_out_tmp);

  ip_time_out <= std_logic_vector(ip_time_out_tmp);

  outputgen: FOR k IN 0 TO 309 GENERATE
    eth_frame(k) <= std_logic_vector(eth_frame_tmp(k));
  END GENERATE;

  state_out <= std_logic_vector(state_out_tmp);

  xid_out <= std_logic_vector(xid_out_tmp);

  cnt_out <= std_logic_vector(cnt_out_tmp);

  renewal_cnt_out <= std_logic_vector(renewal_cnt_out_tmp);

END rtl;

