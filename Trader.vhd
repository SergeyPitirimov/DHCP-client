-- -------------------------------------------------------------
-- Rate and Clocking Details: CLK = 50 MHz.
-- -------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.Trader_pkg.ALL;

ENTITY Trader IS
  PORT( CLK                               :   IN    std_logic;
        RSTn                              :   IN    std_logic;
        CLK_EN                            :   IN    std_logic;
        RXD0                              :   IN    std_logic;
        RXD1                              :   IN    std_logic;
        RXD2                              :   IN    std_logic;
        RXD3                              :   IN    std_logic;
        RX_DV                             :   IN    std_logic;
        RX_CLK                            :   IN    std_logic;
        RX_CRS                            :   IN    std_logic;
        RX_ERR                            :   IN    std_logic;
        RX_COL                            :   IN    std_logic;
        TX_CLK                            :   IN    std_logic;
        BUTTON1                           :   IN    std_logic;
        CLK_EN_OUT                        :   OUT   std_logic;
        TXD0                              :   OUT   std_logic;
        TXD1                              :   OUT   std_logic;
        TXD2                              :   OUT   std_logic;
        TXD3                              :   OUT   std_logic;
        TX_EN                             :   OUT   std_logic;
        ETH_RST_N                         :   OUT   std_logic;
        MDC                               :   OUT   std_logic;
        MDIO                              :   OUT   std_logic;
        LED1                              :   OUT   std_logic;
        LED2                              :   OUT   std_logic;
        LED3                              :   OUT   std_logic;
        LED4                              :   OUT   std_logic
        );
END Trader;


ARCHITECTURE rtl OF Trader IS

  ATTRIBUTE multstyle : string;

  -- Component Declarations
  COMPONENT Delay
    PORT( preset                          :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          cnt_in                          :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          done                            :   OUT   std_logic;
          cnt_out                         :   OUT   std_logic_vector(31 DOWNTO 0)  -- uint32
          );
  END COMPONENT;

  COMPONENT Initialization
    PORT( clk_cnt_in                      :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          mdc                             :   OUT   std_logic;
          mdio                            :   OUT   std_logic;
          eth_reset_n                     :   OUT   std_logic;
          done                            :   OUT   std_logic;
          clk_cnt_out                     :   OUT   std_logic_vector(15 DOWNTO 0)  -- uint16
          );
  END COMPONENT;

  COMPONENT Waiter
    PORT( eth_reset_n                     :   IN    std_logic;
          start                           :   IN    std_logic;
          button                          :   IN    std_logic;
          state_in                        :   IN    std_logic;
          done                            :   OUT   std_logic;
          state_out                       :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT RandomNumberGen
    PORT( clk_1                           :   IN    std_logic;
          rxd0                            :   IN    std_logic;
          rxd1                            :   IN    std_logic;
          rxd2                            :   IN    std_logic;
          rxd3                            :   IN    std_logic;
          number                          :   OUT   std_logic_vector(31 DOWNTO 0)  -- uint32
          );
  END COMPONENT;

  COMPONENT HDL_FIFO12
    PORT( CLK                             :   IN    std_logic;
          RSTn                            :   IN    std_logic;
          enb                             :   IN    std_logic;
          In_rsvd                         :   IN    std_logic;
          Push                            :   IN    std_logic;
          Pop                             :   IN    std_logic;
          Out_rsvd                        :   OUT   std_logic;
          Empty                           :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT HDL_FIFO11
    PORT( CLK                             :   IN    std_logic;
          RSTn                            :   IN    std_logic;
          enb                             :   IN    std_logic;
          In_rsvd                         :   IN    std_logic;
          Push                            :   IN    std_logic;
          Pop                             :   IN    std_logic;
          Out_rsvd                        :   OUT   std_logic;
          Empty                           :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT HDL_FIFO10
    PORT( CLK                             :   IN    std_logic;
          RSTn                            :   IN    std_logic;
          enb                             :   IN    std_logic;
          In_rsvd                         :   IN    std_logic;
          Push                            :   IN    std_logic;
          Pop                             :   IN    std_logic;
          Out_rsvd                        :   OUT   std_logic;
          Empty                           :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT HDL_FIFO9
    PORT( CLK                             :   IN    std_logic;
          RSTn                            :   IN    std_logic;
          enb                             :   IN    std_logic;
          In_rsvd                         :   IN    std_logic;
          Push                            :   IN    std_logic;
          Pop                             :   IN    std_logic;
          Out_rsvd                        :   OUT   std_logic;
          Empty                           :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT HDL_FIFO8
    PORT( CLK                             :   IN    std_logic;
          RSTn                            :   IN    std_logic;
          enb                             :   IN    std_logic;
          In_rsvd                         :   IN    std_logic;
          Push                            :   IN    std_logic;
          Pop                             :   IN    std_logic;
          Out_rsvd                        :   OUT   std_logic;
          Empty                           :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT HDL_FIFO7
    PORT( CLK                             :   IN    std_logic;
          RSTn                            :   IN    std_logic;
          enb                             :   IN    std_logic;
          In_rsvd                         :   IN    std_logic;
          Push                            :   IN    std_logic;
          Pop                             :   IN    std_logic;
          Out_rsvd                        :   OUT   std_logic;
          Empty                           :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT HDL_FIFO6
    PORT( CLK                             :   IN    std_logic;
          RSTn                            :   IN    std_logic;
          enb                             :   IN    std_logic;
          In_rsvd                         :   IN    std_logic;
          Push                            :   IN    std_logic;
          Pop                             :   IN    std_logic;
          Out_rsvd                        :   OUT   std_logic;
          Empty                           :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT HDL_FIFO5
    PORT( CLK                             :   IN    std_logic;
          RSTn                            :   IN    std_logic;
          enb                             :   IN    std_logic;
          In_rsvd                         :   IN    std_logic;
          Push                            :   IN    std_logic;
          Pop                             :   IN    std_logic;
          Out_rsvd                        :   OUT   std_logic;
          Empty                           :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT Receiver
    PORT( phy_ready                       :   IN    std_logic;
          mac_addr1                       :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          mac_addr2                       :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          mac_addr3                       :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          dhcp_port                       :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          data_port                       :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          rxd0                            :   IN    std_logic;
          rxd1                            :   IN    std_logic;
          rxd2                            :   IN    std_logic;
          rxd3                            :   IN    std_logic;
          rx_dv                           :   IN    std_logic;
          rx_crs                          :   IN    std_logic;
          rx_err                          :   IN    std_logic;
          rx_col                          :   IN    std_logic;
          rx_fifo_empty                   :   IN    std_logic;
          source_mac_addr1_in             :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          source_mac_addr2_in             :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          source_mac_addr3_in             :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          source_ip_in                    :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          dest_ip_in                      :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          source_port_in                  :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          dest_port_in                    :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          udp_frame_in                    :   IN    vector_of_std_logic_vector8(0 TO 109);  -- uint8 [110]
          udp_frame_in_ready              :   IN    std_logic;
          state_in                        :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          ip_length_in                    :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          nibble_counter_in               :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          preamble_in                     :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          byte_in                         :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          options_counter_in              :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          source_mac_addr1_tmp_in         :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          source_mac_addr2_tmp_in         :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          source_mac_addr3_tmp_in         :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          source_ip_tmp_in                :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          dest_ip_tmp_in                  :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          source_port_tmp_in              :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          dest_port_tmp_in                :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          ip_length_tmp_in                :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          rx_clk_fifo_out                 :   OUT   std_logic;
          source_mac_addr1_out            :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
          source_mac_addr2_out            :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
          source_mac_addr3_out            :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
          source_ip_out                   :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
          dest_ip_out                     :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
          source_port_out                 :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
          dest_port_out                   :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
          udp_frame_out                   :   OUT   vector_of_std_logic_vector8(0 TO 109);  -- uint8 [110]
          udp_frame_out_ready             :   OUT   std_logic;
          state_out                       :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
          ip_length_out                   :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
          nibble_counter_out              :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
          preamble_out                    :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
          byte_out                        :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
          options_counter_out             :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
          source_mac_addr1_tmp_out        :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
          source_mac_addr2_tmp_out        :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
          source_mac_addr3_tmp_out        :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
          source_ip_tmp_out               :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
          dest_ip_tmp_out                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
          source_port_tmp_out             :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
          dest_port_tmp_out               :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
          ip_length_tmp_out               :   OUT   std_logic_vector(15 DOWNTO 0)  -- uint16
          );
  END COMPONENT;

  COMPONENT HDL_FIFO4
    PORT( CLK                             :   IN    std_logic;
          RSTn                            :   IN    std_logic;
          enb                             :   IN    std_logic;
          In_rsvd                         :   IN    std_logic;
          Push                            :   IN    std_logic;
          Pop                             :   IN    std_logic;
          Out_rsvd                        :   OUT   std_logic;
          Full                            :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT HDL_FIFO3
    PORT( CLK                             :   IN    std_logic;
          RSTn                            :   IN    std_logic;
          enb                             :   IN    std_logic;
          In_rsvd                         :   IN    std_logic;
          Push                            :   IN    std_logic;
          Pop                             :   IN    std_logic;
          Out_rsvd                        :   OUT   std_logic;
          Full                            :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT HDL_FIFO2
    PORT( CLK                             :   IN    std_logic;
          RSTn                            :   IN    std_logic;
          enb                             :   IN    std_logic;
          In_rsvd                         :   IN    std_logic;
          Push                            :   IN    std_logic;
          Pop                             :   IN    std_logic;
          Out_rsvd                        :   OUT   std_logic;
          Full                            :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT HDL_FIFO1
    PORT( CLK                             :   IN    std_logic;
          RSTn                            :   IN    std_logic;
          enb                             :   IN    std_logic;
          In_rsvd                         :   IN    std_logic;
          Push                            :   IN    std_logic;
          Pop                             :   IN    std_logic;
          Out_rsvd                        :   OUT   std_logic;
          Full                            :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT UDP
    PORT( ip_header_length                :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          ip_header_length_valid          :   IN    std_logic;
          start                           :   IN    std_logic;
          eth_frame                       :   IN    vector_of_std_logic_vector8(0 TO 309);  -- uint8 [310]
          length_in                       :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          checksum_in                     :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          state_in                        :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          byte_counter_in                 :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          done                            :   OUT   std_logic;
          length_out                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
          checksum_out                    :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
          state_out                       :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
          byte_counter_out                :   OUT   std_logic_vector(15 DOWNTO 0)  -- uint16
          );
  END COMPONENT;

  COMPONENT IP_header
    PORT( start                           :   IN    std_logic;
          eth_frame                       :   IN    vector_of_std_logic_vector8(0 TO 309);  -- uint8 [310]
          length_in                       :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          checksum_in                     :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          state_in                        :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          byte_counter_in                 :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          done                            :   OUT   std_logic;
          length_out                      :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
          length_done                     :   OUT   std_logic;
          checksum_out                    :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
          state_out                       :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
          byte_counter_out                :   OUT   std_logic_vector(7 DOWNTO 0)  -- uint8
          );
  END COMPONENT;

  COMPONENT Ethernet_frame_updater
    PORT( ip_header_checksum_is_valid     :   IN    std_logic;
          ip_header_checksum              :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          udp_checksum_is_valid           :   IN    std_logic;
          udp_length                      :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          udp_checksum                    :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          start                           :   IN    std_logic;
          eth_frame_in                    :   IN    vector_of_std_logic_vector8(0 TO 309);  -- uint8 [310]
          done                            :   OUT   std_logic;
          eth_frame_out                   :   OUT   vector_of_std_logic_vector8(0 TO 309)  -- uint8 [310]
          );
  END COMPONENT;

  COMPONENT Ethernet_frame_checksum
    PORT( start                           :   IN    std_logic;
          eth_frame                       :   IN    vector_of_std_logic_vector8(0 TO 309);  -- uint8 [310]
          checksum_in                     :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          state_in                        :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          byte_counter_in                 :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          done                            :   OUT   std_logic;
          checksum_out                    :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
          state_out                       :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
          byte_counter_out                :   OUT   std_logic_vector(15 DOWNTO 0)  -- uint16
          );
  END COMPONENT;

  COMPONENT Checksum_combiner
    PORT( start                           :   IN    std_logic;
          checksum                        :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          eth_frame                       :   IN    vector_of_std_logic_vector8(0 TO 309);  -- uint8 [310]
          done                            :   OUT   std_logic;
          complete_eth_frame              :   OUT   vector_of_std_logic_vector8(0 TO 321)  -- uint8 [322]
          );
  END COMPONENT;

  COMPONENT Gateway
    PORT( server_ip_in                    :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          client_ip_in                    :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          ciaddr_in                       :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          ip_time_in                      :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          phy_ready                       :   IN    std_logic;
          random_number                   :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          retry_delay                     :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          mac_addr1                       :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          mac_addr2                       :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          mac_addr3                       :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          dhcp_port                       :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          data_port                       :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          source_mac_addr1                :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          source_mac_addr2                :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          source_mac_addr3                :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          source_ip                       :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          dest_ip                         :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          source_port                     :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          dest_port                       :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          udp_frame                       :   IN    vector_of_std_logic_vector8(0 TO 109);  -- uint8 [110]
          udp_frame_ready                 :   IN    std_logic;
          transmitter_ready               :   IN    std_logic;
          state_in                        :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          xid_in                          :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          cnt_in                          :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          renewal_cnt_in                  :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          server_ip_out                   :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
          client_ip_out                   :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
          ciaddr_out                      :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
          ip_time_out                     :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
          send                            :   OUT   std_logic;
          eth_frame                       :   OUT   vector_of_std_logic_vector8(0 TO 309);  -- uint8 [310]
          led1                            :   OUT   std_logic;
          led2                            :   OUT   std_logic;
          led3                            :   OUT   std_logic;
          led4                            :   OUT   std_logic;
          state_out                       :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
          xid_out                         :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
          cnt_out                         :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
          renewal_cnt_out                 :   OUT   std_logic_vector(31 DOWNTO 0)  -- uint32
          );
  END COMPONENT;

  COMPONENT Protocol_verifier
    PORT( eth_frame                       :   IN    vector_of_std_logic_vector8(0 TO 309);  -- uint8 [310]
          good                            :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT Transmitter
    PORT( tx_clk_fifo_in                  :   IN    std_logic;
          enable                          :   IN    std_logic;
          start                           :   IN    std_logic;
          eth_frame                       :   IN    vector_of_std_logic_vector8(0 TO 321);  -- uint8 [322]
          tx_fifo_full                    :   IN    std_logic;
          state_in                        :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          byte_counter_in                 :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          tx_clk_fifo_out                 :   OUT   std_logic;
          txd0_fifo                       :   OUT   std_logic;
          txd1_fifo                       :   OUT   std_logic;
          txd2_fifo                       :   OUT   std_logic;
          txd3_fifo                       :   OUT   std_logic;
          tx_en_fifo                      :   OUT   std_logic;
          done                            :   OUT   std_logic;
          state_out                       :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
          byte_counter_out                :   OUT   std_logic_vector(15 DOWNTO 0)  -- uint16
          );
  END COMPONENT;

  COMPONENT HDL_FIFO
    PORT( CLK                             :   IN    std_logic;
          RSTn                            :   IN    std_logic;
          enb                             :   IN    std_logic;
          In_rsvd                         :   IN    std_logic;
          Push                            :   IN    std_logic;
          Pop                             :   IN    std_logic;
          Out_rsvd                        :   OUT   std_logic;
          Full                            :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : Delay
    USE ENTITY work.Delay(rtl);

  FOR ALL : Initialization
    USE ENTITY work.Initialization(rtl);

  FOR ALL : Waiter
    USE ENTITY work.Waiter(rtl);

  FOR ALL : RandomNumberGen
    USE ENTITY work.RandomNumberGen(rtl);

  FOR ALL : HDL_FIFO12
    USE ENTITY work.HDL_FIFO12(rtl);

  FOR ALL : HDL_FIFO11
    USE ENTITY work.HDL_FIFO11(rtl);

  FOR ALL : HDL_FIFO10
    USE ENTITY work.HDL_FIFO10(rtl);

  FOR ALL : HDL_FIFO9
    USE ENTITY work.HDL_FIFO9(rtl);

  FOR ALL : HDL_FIFO8
    USE ENTITY work.HDL_FIFO8(rtl);

  FOR ALL : HDL_FIFO7
    USE ENTITY work.HDL_FIFO7(rtl);

  FOR ALL : HDL_FIFO6
    USE ENTITY work.HDL_FIFO6(rtl);

  FOR ALL : HDL_FIFO5
    USE ENTITY work.HDL_FIFO5(rtl);

  FOR ALL : Receiver
    USE ENTITY work.Receiver(rtl);

  FOR ALL : HDL_FIFO4
    USE ENTITY work.HDL_FIFO4(rtl);

  FOR ALL : HDL_FIFO3
    USE ENTITY work.HDL_FIFO3(rtl);

  FOR ALL : HDL_FIFO2
    USE ENTITY work.HDL_FIFO2(rtl);

  FOR ALL : HDL_FIFO1
    USE ENTITY work.HDL_FIFO1(rtl);

  FOR ALL : UDP
    USE ENTITY work.UDP(rtl);

  FOR ALL : IP_header
    USE ENTITY work.IP_header(rtl);

  FOR ALL : Ethernet_frame_updater
    USE ENTITY work.Ethernet_frame_updater(rtl);

  FOR ALL : Ethernet_frame_checksum
    USE ENTITY work.Ethernet_frame_checksum(rtl);

  FOR ALL : Checksum_combiner
    USE ENTITY work.Checksum_combiner(rtl);

  FOR ALL : Gateway
    USE ENTITY work.Gateway(rtl);

  FOR ALL : Protocol_verifier
    USE ENTITY work.Protocol_verifier(rtl);

  FOR ALL : Transmitter
    USE ENTITY work.Transmitter(rtl);

  FOR ALL : HDL_FIFO
    USE ENTITY work.HDL_FIFO(rtl);

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL Constant7_out1                   : std_logic;
  SIGNAL Constant3_out1                   : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL cnt_out                          : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL cnt_out_unsigned                 : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Unit_Delay75_out1                : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL done                             : std_logic;
  SIGNAL clk_cnt_out                      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL clk_cnt_out_unsigned             : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Unit_Delay_out1                  : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL mdc_1                            : std_logic;
  SIGNAL mdio_1                           : std_logic;
  SIGNAL eth_reset_n                      : std_logic;
  SIGNAL done_1                           : std_logic;
  SIGNAL Unit_Delay42_reg                 : std_logic_vector(0 TO 2);  -- ufix1 [3]
  SIGNAL Unit_Delay42_out1                : std_logic;
  SIGNAL state_out                        : std_logic;
  SIGNAL Unit_Delay29_out1                : std_logic;
  SIGNAL done_2                           : std_logic;
  SIGNAL Switch_out1                      : std_logic;
  SIGNAL Unit_Delay63_reg                 : std_logic_vector(0 TO 2);  -- ufix1 [3]
  SIGNAL Unit_Delay63_out1                : std_logic;
  SIGNAL Unit_Delay46_reg                 : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Unit_Delay46_out1                : std_logic;
  SIGNAL Unit_Delay48_reg                 : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Unit_Delay48_out1                : std_logic;
  SIGNAL Unit_Delay50_reg                 : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Unit_Delay50_out1                : std_logic;
  SIGNAL Unit_Delay52_reg                 : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Unit_Delay52_out1                : std_logic;
  SIGNAL number                           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant2_out1                   : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Constant4_out1                   : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Constant5_out1                   : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Constant6_out1                   : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Constant_out1                    : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Constant1_out1                   : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Unit_Delay54_reg                 : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Unit_Delay54_out1                : std_logic;
  SIGNAL Unit_Delay56_reg                 : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Unit_Delay56_out1                : std_logic;
  SIGNAL Unit_Delay58_reg                 : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Unit_Delay58_out1                : std_logic;
  SIGNAL Unit_Delay60_reg                 : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Unit_Delay60_out1                : std_logic;
  SIGNAL ip_length_tmp_out                : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL ip_length_tmp_out_unsigned       : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Unit_Delay68_out1                : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL dest_port_tmp_out                : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL dest_port_tmp_out_unsigned       : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Unit_Delay67_out1                : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL source_port_tmp_out              : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL source_port_tmp_out_unsigned     : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Unit_Delay66_out1                : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL dest_ip_tmp_out                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL dest_ip_tmp_out_unsigned         : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Unit_Delay65_out1                : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL source_ip_tmp_out                : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL source_ip_tmp_out_unsigned       : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Unit_Delay64_out1                : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL source_mac_addr3_tmp_out         : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL source_mac_addr3_tmp_out_unsigned : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Unit_Delay74_out1                : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL source_mac_addr2_tmp_out         : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL source_mac_addr2_tmp_out_unsigned : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Unit_Delay73_out1                : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL source_mac_addr1_tmp_out         : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL source_mac_addr1_tmp_out_unsigned : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Unit_Delay72_out1                : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL options_counter_out              : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL options_counter_out_unsigned     : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Unit_Delay33_out1                : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL byte_out                         : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL byte_out_unsigned                : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Unit_Delay26_out1                : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL preamble_out                     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL preamble_out_unsigned            : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Unit_Delay25_out1                : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL nibble_counter_out               : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL nibble_counter_out_unsigned      : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Unit_Delay20_out1                : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL ip_length_out                    : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL ip_length_out_unsigned           : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Unit_Delay34_out1                : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL state_out_1                      : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL state_out_unsigned               : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Unit_Delay21_out1                : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL udp_frame_out_ready              : std_logic;
  SIGNAL Unit_Delay24_out1                : std_logic;
  SIGNAL udp_frame_out                    : vector_of_std_logic_vector8(0 TO 109);  -- ufix8 [110]
  SIGNAL udp_frame_out_unsigned           : vector_of_unsigned8(0 TO 109);  -- uint8 [110]
  SIGNAL udp_frame_out_1                  : vector_of_unsigned8(0 TO 109);  -- uint8 [110]
  SIGNAL Unit_Delay23_out1                : vector_of_unsigned8(0 TO 109);  -- uint8 [110]
  SIGNAL Unit_Delay23_out1_1              : vector_of_std_logic_vector8(0 TO 109);  -- ufix8 [110]
  SIGNAL dest_port_out                    : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL dest_port_out_unsigned           : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Unit_Delay39_out1                : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL source_port_out                  : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL source_port_out_unsigned         : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Unit_Delay38_out1                : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL dest_ip_out                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL dest_ip_out_unsigned             : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Unit_Delay27_out1                : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL source_ip_out                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL source_ip_out_unsigned           : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Unit_Delay28_out1                : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL source_mac_addr3_out             : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL source_mac_addr3_out_unsigned    : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Unit_Delay71_out1                : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL source_mac_addr2_out             : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL source_mac_addr2_out_unsigned    : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Unit_Delay70_out1                : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL source_mac_addr1_out             : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL source_mac_addr1_out_unsigned    : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Unit_Delay69_out1                : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL HDL_FIFO5_out2                   : std_logic;
  SIGNAL HDL_FIFO6_out2                   : std_logic;
  SIGNAL HDL_FIFO7_out2                   : std_logic;
  SIGNAL HDL_FIFO8_out2                   : std_logic;
  SIGNAL HDL_FIFO9_out2                   : std_logic;
  SIGNAL HDL_FIFO10_out2                  : std_logic;
  SIGNAL HDL_FIFO11_out2                  : std_logic;
  SIGNAL HDL_FIFO12_out2                  : std_logic;
  SIGNAL Logical_Operator1_out1           : std_logic;
  SIGNAL Unit_Delay22_out1                : std_logic;
  SIGNAL HDL_FIFO12_out1                  : std_logic;
  SIGNAL HDL_FIFO11_out1                  : std_logic;
  SIGNAL HDL_FIFO10_out1                  : std_logic;
  SIGNAL HDL_FIFO9_out1                   : std_logic;
  SIGNAL HDL_FIFO8_out1                   : std_logic;
  SIGNAL HDL_FIFO7_out1                   : std_logic;
  SIGNAL HDL_FIFO6_out1                   : std_logic;
  SIGNAL rx_clk_fifo_out                  : std_logic;
  SIGNAL HDL_FIFO5_out1                   : std_logic;
  SIGNAL Unit_Delay44_reg                 : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Unit_Delay44_out1                : std_logic;
  SIGNAL byte_counter_out                 : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL byte_counter_out_unsigned        : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Unit_Delay7_out1                 : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL state_out_2                      : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL state_out_unsigned_1             : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Unit_Delay8_out1                 : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL tx_en_fifo                       : std_logic;
  SIGNAL tx_clk_fifo_out                  : std_logic;
  SIGNAL HDL_FIFO4_out1                   : std_logic;
  SIGNAL HDL_FIFO4_out2                   : std_logic;
  SIGNAL txd3_fifo                        : std_logic;
  SIGNAL HDL_FIFO3_out1                   : std_logic;
  SIGNAL HDL_FIFO3_out2                   : std_logic;
  SIGNAL txd2_fifo                        : std_logic;
  SIGNAL HDL_FIFO2_out1                   : std_logic;
  SIGNAL HDL_FIFO2_out2                   : std_logic;
  SIGNAL txd1_fifo                        : std_logic;
  SIGNAL HDL_FIFO1_out1                   : std_logic;
  SIGNAL HDL_FIFO1_out2                   : std_logic;
  SIGNAL HDL_FIFO_out2                    : std_logic;
  SIGNAL Logical_Operator_out1            : std_logic;
  SIGNAL Unit_Delay17_out1                : std_logic;
  SIGNAL eth_frame_out                    : vector_of_std_logic_vector8(0 TO 309);  -- ufix8 [310]
  SIGNAL eth_frame_out_unsigned           : vector_of_unsigned8(0 TO 309);  -- uint8 [310]
  SIGNAL eth_frame_out_1                  : vector_of_unsigned8(0 TO 309);  -- uint8 [310]
  SIGNAL eth_frame_out_2                  : vector_of_std_logic_vector8(0 TO 309);  -- ufix8 [310]
  SIGNAL byte_counter_out_1               : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL byte_counter_out_unsigned_1      : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Unit_Delay6_out1                 : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL state_out_3                      : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL state_out_unsigned_2             : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Unit_Delay4_out1                 : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL checksum_out                     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL checksum_out_unsigned            : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Unit_Delay5_out1                 : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL eth_frame                        : vector_of_std_logic_vector8(0 TO 309);  -- ufix8 [310]
  SIGNAL eth_frame_unsigned               : vector_of_unsigned8(0 TO 309);  -- uint8 [310]
  SIGNAL eth_frame_1                      : vector_of_unsigned8(0 TO 309);  -- uint8 [310]
  SIGNAL eth_frame_2                      : vector_of_std_logic_vector8(0 TO 309);  -- ufix8 [310]
  SIGNAL byte_counter_out_2               : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL byte_counter_out_unsigned_2      : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Unit_Delay14_out1                : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL state_out_4                      : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL state_out_unsigned_3             : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Unit_Delay13_out1                : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL checksum_out_1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL checksum_out_unsigned_1          : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Unit_Delay15_out1                : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL length_out                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL length_out_unsigned              : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Unit_Delay16_out1                : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL length_done                      : std_logic;
  SIGNAL Unit_Delay3_out1                 : std_logic;
  SIGNAL Unit_Delay12_out1                : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL send                             : std_logic;
  SIGNAL done_3                           : std_logic;
  SIGNAL byte_counter_out_3               : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL byte_counter_out_unsigned_3      : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Unit_Delay9_out1                 : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL state_out_5                      : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL state_out_unsigned_4             : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Unit_Delay10_out1                : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL checksum_out_2                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL checksum_out_unsigned_2          : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Unit_Delay11_out1                : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL length_out_1                     : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL length_out_unsigned_1            : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL done_4                           : std_logic;
  SIGNAL done_5                           : std_logic;
  SIGNAL done_6                           : std_logic;
  SIGNAL done_7                           : std_logic;
  SIGNAL complete_eth_frame               : vector_of_std_logic_vector8(0 TO 321);  -- ufix8 [322]
  SIGNAL renewal_cnt_out                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL renewal_cnt_out_unsigned         : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Unit_Delay36_out1                : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL cnt_out_1                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL cnt_out_unsigned_1               : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Unit_Delay30_out1                : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL xid_out                          : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL xid_out_unsigned                 : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Unit_Delay19_out1                : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL state_out_6                      : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL state_out_unsigned_5             : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Unit_Delay2_out1                 : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL done_8                           : std_logic;
  SIGNAL Unit_Delay1_out1                 : std_logic;
  SIGNAL ip_time_out                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL ip_time_out_unsigned             : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Unit_Delay35_out1                : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL ciaddr_out                       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL ciaddr_out_unsigned              : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Unit_Delay37_out1                : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL client_ip_out                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL client_ip_out_unsigned           : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Unit_Delay32_out1                : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL server_ip_out                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL server_ip_out_unsigned           : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Unit_Delay31_out1                : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL led1_1                           : std_logic;
  SIGNAL led2_1                           : std_logic;
  SIGNAL led3_1                           : std_logic;
  SIGNAL led4_1                           : std_logic;
  SIGNAL good                             : std_logic;
  SIGNAL Unit_Delay18_out1                : std_logic;
  SIGNAL txd0_fifo                        : std_logic;
  SIGNAL HDL_FIFO_out1                    : std_logic;
  SIGNAL Logical_Operator2_out1           : std_logic;
  SIGNAL Logical_Operator5_out1           : std_logic;
  SIGNAL Logical_Operator3_out1           : std_logic;
  SIGNAL Logical_Operator4_out1           : std_logic;

BEGIN
  u_Delay : Delay
    PORT MAP( preset => std_logic_vector(Constant3_out1),  -- uint32
              cnt_in => std_logic_vector(Unit_Delay75_out1),  -- uint32
              done => done,
              cnt_out => cnt_out  -- uint32
              );

  u_Initialization : Initialization
    PORT MAP( clk_cnt_in => std_logic_vector(Unit_Delay_out1),  -- uint16
              mdc => mdc_1,
              mdio => mdio_1,
              eth_reset_n => eth_reset_n,
              done => done_1,
              clk_cnt_out => clk_cnt_out  -- uint16
              );

  u_Waiter : Waiter
    PORT MAP( eth_reset_n => eth_reset_n,
              start => done_1,
              button => Unit_Delay42_out1,
              state_in => Unit_Delay29_out1,
              done => done_2,
              state_out => state_out
              );

  u_RandomNumberGen : RandomNumberGen
    PORT MAP( clk_1 => Unit_Delay63_out1,
              rxd0 => Unit_Delay46_out1,
              rxd1 => Unit_Delay48_out1,
              rxd2 => Unit_Delay50_out1,
              rxd3 => Unit_Delay52_out1,
              number => number  -- uint32
              );

  u_HDL_FIFO12 : HDL_FIFO12
    PORT MAP( CLK => CLK,
              RSTn => RSTn,
              enb => CLK_EN,
              In_rsvd => Unit_Delay60_out1,
              Push => Unit_Delay63_out1,
              Pop => Unit_Delay22_out1,
              Out_rsvd => HDL_FIFO12_out1,
              Empty => HDL_FIFO12_out2
              );

  u_HDL_FIFO11 : HDL_FIFO11
    PORT MAP( CLK => CLK,
              RSTn => RSTn,
              enb => CLK_EN,
              In_rsvd => Unit_Delay58_out1,
              Push => Unit_Delay63_out1,
              Pop => Unit_Delay22_out1,
              Out_rsvd => HDL_FIFO11_out1,
              Empty => HDL_FIFO11_out2
              );

  u_HDL_FIFO10 : HDL_FIFO10
    PORT MAP( CLK => CLK,
              RSTn => RSTn,
              enb => CLK_EN,
              In_rsvd => Unit_Delay56_out1,
              Push => Unit_Delay63_out1,
              Pop => Unit_Delay22_out1,
              Out_rsvd => HDL_FIFO10_out1,
              Empty => HDL_FIFO10_out2
              );

  u_HDL_FIFO9 : HDL_FIFO9
    PORT MAP( CLK => CLK,
              RSTn => RSTn,
              enb => CLK_EN,
              In_rsvd => Unit_Delay54_out1,
              Push => Unit_Delay63_out1,
              Pop => Unit_Delay22_out1,
              Out_rsvd => HDL_FIFO9_out1,
              Empty => HDL_FIFO9_out2
              );

  u_HDL_FIFO8 : HDL_FIFO8
    PORT MAP( CLK => CLK,
              RSTn => RSTn,
              enb => CLK_EN,
              In_rsvd => Unit_Delay52_out1,
              Push => Unit_Delay63_out1,
              Pop => Unit_Delay22_out1,
              Out_rsvd => HDL_FIFO8_out1,
              Empty => HDL_FIFO8_out2
              );

  u_HDL_FIFO7 : HDL_FIFO7
    PORT MAP( CLK => CLK,
              RSTn => RSTn,
              enb => CLK_EN,
              In_rsvd => Unit_Delay50_out1,
              Push => Unit_Delay63_out1,
              Pop => Unit_Delay22_out1,
              Out_rsvd => HDL_FIFO7_out1,
              Empty => HDL_FIFO7_out2
              );

  u_HDL_FIFO6 : HDL_FIFO6
    PORT MAP( CLK => CLK,
              RSTn => RSTn,
              enb => CLK_EN,
              In_rsvd => Unit_Delay48_out1,
              Push => Unit_Delay63_out1,
              Pop => Unit_Delay22_out1,
              Out_rsvd => HDL_FIFO6_out1,
              Empty => HDL_FIFO6_out2
              );

  u_HDL_FIFO5 : HDL_FIFO5
    PORT MAP( CLK => CLK,
              RSTn => RSTn,
              enb => CLK_EN,
              In_rsvd => Unit_Delay46_out1,
              Push => Unit_Delay63_out1,
              Pop => Unit_Delay22_out1,
              Out_rsvd => HDL_FIFO5_out1,
              Empty => HDL_FIFO5_out2
              );

  u_Receiver : Receiver
    PORT MAP( phy_ready => Switch_out1,
              mac_addr1 => std_logic_vector(Constant4_out1),  -- uint16
              mac_addr2 => std_logic_vector(Constant5_out1),  -- uint16
              mac_addr3 => std_logic_vector(Constant6_out1),  -- uint16
              dhcp_port => std_logic_vector(Constant_out1),  -- uint16
              data_port => std_logic_vector(Constant1_out1),  -- uint16
              rxd0 => HDL_FIFO5_out1,
              rxd1 => HDL_FIFO6_out1,
              rxd2 => HDL_FIFO7_out1,
              rxd3 => HDL_FIFO8_out1,
              rx_dv => HDL_FIFO9_out1,
              rx_crs => HDL_FIFO10_out1,
              rx_err => HDL_FIFO11_out1,
              rx_col => HDL_FIFO12_out1,
              rx_fifo_empty => Logical_Operator1_out1,
              source_mac_addr1_in => std_logic_vector(Unit_Delay69_out1),  -- uint16
              source_mac_addr2_in => std_logic_vector(Unit_Delay70_out1),  -- uint16
              source_mac_addr3_in => std_logic_vector(Unit_Delay71_out1),  -- uint16
              source_ip_in => std_logic_vector(Unit_Delay28_out1),  -- uint32
              dest_ip_in => std_logic_vector(Unit_Delay27_out1),  -- uint32
              source_port_in => std_logic_vector(Unit_Delay38_out1),  -- uint16
              dest_port_in => std_logic_vector(Unit_Delay39_out1),  -- uint16
              udp_frame_in => Unit_Delay23_out1_1,  -- uint8 [110]
              udp_frame_in_ready => Unit_Delay24_out1,
              state_in => std_logic_vector(Unit_Delay21_out1),  -- uint8
              ip_length_in => std_logic_vector(Unit_Delay34_out1),  -- uint16
              nibble_counter_in => std_logic_vector(Unit_Delay20_out1),  -- uint16
              preamble_in => std_logic_vector(Unit_Delay25_out1),  -- uint32
              byte_in => std_logic_vector(Unit_Delay26_out1),  -- uint8
              options_counter_in => std_logic_vector(Unit_Delay33_out1),  -- uint16
              source_mac_addr1_tmp_in => std_logic_vector(Unit_Delay72_out1),  -- uint16
              source_mac_addr2_tmp_in => std_logic_vector(Unit_Delay73_out1),  -- uint16
              source_mac_addr3_tmp_in => std_logic_vector(Unit_Delay74_out1),  -- uint16
              source_ip_tmp_in => std_logic_vector(Unit_Delay64_out1),  -- uint32
              dest_ip_tmp_in => std_logic_vector(Unit_Delay65_out1),  -- uint32
              source_port_tmp_in => std_logic_vector(Unit_Delay66_out1),  -- uint16
              dest_port_tmp_in => std_logic_vector(Unit_Delay67_out1),  -- uint16
              ip_length_tmp_in => std_logic_vector(Unit_Delay68_out1),  -- uint16
              rx_clk_fifo_out => rx_clk_fifo_out,
              source_mac_addr1_out => source_mac_addr1_out,  -- uint16
              source_mac_addr2_out => source_mac_addr2_out,  -- uint16
              source_mac_addr3_out => source_mac_addr3_out,  -- uint16
              source_ip_out => source_ip_out,  -- uint32
              dest_ip_out => dest_ip_out,  -- uint32
              source_port_out => source_port_out,  -- uint16
              dest_port_out => dest_port_out,  -- uint16
              udp_frame_out => udp_frame_out,  -- uint8 [110]
              udp_frame_out_ready => udp_frame_out_ready,
              state_out => state_out_1,  -- uint8
              ip_length_out => ip_length_out,  -- uint16
              nibble_counter_out => nibble_counter_out,  -- uint16
              preamble_out => preamble_out,  -- uint32
              byte_out => byte_out,  -- uint8
              options_counter_out => options_counter_out,  -- uint16
              source_mac_addr1_tmp_out => source_mac_addr1_tmp_out,  -- uint16
              source_mac_addr2_tmp_out => source_mac_addr2_tmp_out,  -- uint16
              source_mac_addr3_tmp_out => source_mac_addr3_tmp_out,  -- uint16
              source_ip_tmp_out => source_ip_tmp_out,  -- uint32
              dest_ip_tmp_out => dest_ip_tmp_out,  -- uint32
              source_port_tmp_out => source_port_tmp_out,  -- uint16
              dest_port_tmp_out => dest_port_tmp_out,  -- uint16
              ip_length_tmp_out => ip_length_tmp_out  -- uint16
              );

  u_HDL_FIFO4 : HDL_FIFO4
    PORT MAP( CLK => CLK,
              RSTn => RSTn,
              enb => CLK_EN,
              In_rsvd => tx_en_fifo,
              Push => tx_clk_fifo_out,
              Pop => Unit_Delay44_out1,
              Out_rsvd => HDL_FIFO4_out1,
              Full => HDL_FIFO4_out2
              );

  u_HDL_FIFO3 : HDL_FIFO3
    PORT MAP( CLK => CLK,
              RSTn => RSTn,
              enb => CLK_EN,
              In_rsvd => txd3_fifo,
              Push => tx_clk_fifo_out,
              Pop => Unit_Delay44_out1,
              Out_rsvd => HDL_FIFO3_out1,
              Full => HDL_FIFO3_out2
              );

  u_HDL_FIFO2 : HDL_FIFO2
    PORT MAP( CLK => CLK,
              RSTn => RSTn,
              enb => CLK_EN,
              In_rsvd => txd2_fifo,
              Push => tx_clk_fifo_out,
              Pop => Unit_Delay44_out1,
              Out_rsvd => HDL_FIFO2_out1,
              Full => HDL_FIFO2_out2
              );

  u_HDL_FIFO1 : HDL_FIFO1
    PORT MAP( CLK => CLK,
              RSTn => RSTn,
              enb => CLK_EN,
              In_rsvd => txd1_fifo,
              Push => tx_clk_fifo_out,
              Pop => Unit_Delay44_out1,
              Out_rsvd => HDL_FIFO1_out1,
              Full => HDL_FIFO1_out2
              );

  u_UDP : UDP
    PORT MAP( ip_header_length => std_logic_vector(Unit_Delay12_out1),  -- uint8
              ip_header_length_valid => Unit_Delay3_out1,
              start => send,
              eth_frame => eth_frame,  -- uint8 [310]
              length_in => std_logic_vector(Unit_Delay16_out1),  -- uint16
              checksum_in => std_logic_vector(Unit_Delay15_out1),  -- uint32
              state_in => std_logic_vector(Unit_Delay13_out1),  -- uint8
              byte_counter_in => std_logic_vector(Unit_Delay14_out1),  -- uint16
              done => done_3,
              length_out => length_out,  -- uint16
              checksum_out => checksum_out_1,  -- uint32
              state_out => state_out_4,  -- uint8
              byte_counter_out => byte_counter_out_2  -- uint16
              );

  u_IP_header : IP_header
    PORT MAP( start => send,
              eth_frame => eth_frame,  -- uint8 [310]
              length_in => std_logic_vector(Unit_Delay12_out1),  -- uint8
              checksum_in => std_logic_vector(Unit_Delay11_out1),  -- uint32
              state_in => std_logic_vector(Unit_Delay10_out1),  -- uint8
              byte_counter_in => std_logic_vector(Unit_Delay9_out1),  -- uint8
              done => done_4,
              length_out => length_out_1,  -- uint8
              length_done => length_done,
              checksum_out => checksum_out_2,  -- uint32
              state_out => state_out_5,  -- uint8
              byte_counter_out => byte_counter_out_3  -- uint8
              );

  u_Ethernet_frame_updater : Ethernet_frame_updater
    PORT MAP( ip_header_checksum_is_valid => done_4,
              ip_header_checksum => checksum_out_2,  -- uint32
              udp_checksum_is_valid => done_3,
              udp_length => length_out,  -- uint16
              udp_checksum => checksum_out_1,  -- uint32
              start => send,
              eth_frame_in => eth_frame_2,  -- uint8 [310]
              done => done_5,
              eth_frame_out => eth_frame_out  -- uint8 [310]
              );

  u_Ethernet_frame_checksum : Ethernet_frame_checksum
    PORT MAP( start => done_5,
              eth_frame => eth_frame_out,  -- uint8 [310]
              checksum_in => std_logic_vector(Unit_Delay5_out1),  -- uint32
              state_in => std_logic_vector(Unit_Delay4_out1),  -- uint8
              byte_counter_in => std_logic_vector(Unit_Delay6_out1),  -- uint16
              done => done_6,
              checksum_out => checksum_out,  -- uint32
              state_out => state_out_3,  -- uint8
              byte_counter_out => byte_counter_out_1  -- uint16
              );

  u_Checksum_combiner : Checksum_combiner
    PORT MAP( start => done_6,
              checksum => checksum_out,  -- uint32
              eth_frame => eth_frame_out_2,  -- uint8 [310]
              done => done_7,
              complete_eth_frame => complete_eth_frame  -- uint8 [322]
              );

  u_Gateway : Gateway
    PORT MAP( server_ip_in => std_logic_vector(Unit_Delay31_out1),  -- uint32
              client_ip_in => std_logic_vector(Unit_Delay32_out1),  -- uint32
              ciaddr_in => std_logic_vector(Unit_Delay37_out1),  -- uint32
              ip_time_in => std_logic_vector(Unit_Delay35_out1),  -- uint32
              phy_ready => Switch_out1,
              random_number => number,  -- uint32
              retry_delay => std_logic_vector(Constant2_out1),  -- uint32
              mac_addr1 => std_logic_vector(Constant4_out1),  -- uint16
              mac_addr2 => std_logic_vector(Constant5_out1),  -- uint16
              mac_addr3 => std_logic_vector(Constant6_out1),  -- uint16
              dhcp_port => std_logic_vector(Constant_out1),  -- uint16
              data_port => std_logic_vector(Constant1_out1),  -- uint16
              source_mac_addr1 => source_mac_addr1_out,  -- uint16
              source_mac_addr2 => source_mac_addr2_out,  -- uint16
              source_mac_addr3 => source_mac_addr3_out,  -- uint16
              source_ip => source_ip_out,  -- uint32
              dest_ip => dest_ip_out,  -- uint32
              source_port => source_port_out,  -- uint16
              dest_port => dest_port_out,  -- uint16
              udp_frame => udp_frame_out,  -- uint8 [110]
              udp_frame_ready => udp_frame_out_ready,
              transmitter_ready => Unit_Delay1_out1,
              state_in => std_logic_vector(Unit_Delay2_out1),  -- uint8
              xid_in => std_logic_vector(Unit_Delay19_out1),  -- uint32
              cnt_in => std_logic_vector(Unit_Delay30_out1),  -- uint32
              renewal_cnt_in => std_logic_vector(Unit_Delay36_out1),  -- uint32
              server_ip_out => server_ip_out,  -- uint32
              client_ip_out => client_ip_out,  -- uint32
              ciaddr_out => ciaddr_out,  -- uint32
              ip_time_out => ip_time_out,  -- uint32
              send => send,
              eth_frame => eth_frame,  -- uint8 [310]
              led1 => led1_1,
              led2 => led2_1,
              led3 => led3_1,
              led4 => led4_1,
              state_out => state_out_6,  -- uint8
              xid_out => xid_out,  -- uint32
              cnt_out => cnt_out_1,  -- uint32
              renewal_cnt_out => renewal_cnt_out  -- uint32
              );

  u_Protocol_verifier : Protocol_verifier
    PORT MAP( eth_frame => eth_frame,  -- uint8 [310]
              good => good
              );

  u_Transmitter : Transmitter
    PORT MAP( tx_clk_fifo_in => Unit_Delay18_out1,
              enable => good,
              start => done_7,
              eth_frame => complete_eth_frame,  -- uint8 [322]
              tx_fifo_full => Unit_Delay17_out1,
              state_in => std_logic_vector(Unit_Delay8_out1),  -- uint8
              byte_counter_in => std_logic_vector(Unit_Delay7_out1),  -- uint16
              tx_clk_fifo_out => tx_clk_fifo_out,
              txd0_fifo => txd0_fifo,
              txd1_fifo => txd1_fifo,
              txd2_fifo => txd2_fifo,
              txd3_fifo => txd3_fifo,
              tx_en_fifo => tx_en_fifo,
              done => done_8,
              state_out => state_out_2,  -- uint8
              byte_counter_out => byte_counter_out  -- uint16
              );

  u_HDL_FIFO : HDL_FIFO
    PORT MAP( CLK => CLK,
              RSTn => RSTn,
              enb => CLK_EN,
              In_rsvd => txd0_fifo,
              Push => tx_clk_fifo_out,
              Pop => Unit_Delay44_out1,
              Out_rsvd => HDL_FIFO_out1,
              Full => HDL_FIFO_out2
              );

  enb <= CLK_EN;

  Constant7_out1 <= '0';

  Constant3_out1 <= to_unsigned(1000, 32);

  cnt_out_unsigned <= unsigned(cnt_out);

  Unit_Delay75_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay75_out1 <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        Unit_Delay75_out1 <= cnt_out_unsigned;
      END IF;
    END IF;
  END PROCESS Unit_Delay75_process;


  clk_cnt_out_unsigned <= unsigned(clk_cnt_out);

  Unit_Delay_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay_out1 <= to_unsigned(16#0000#, 16);
      ELSIF enb = '1' THEN
        Unit_Delay_out1 <= clk_cnt_out_unsigned;
      END IF;
    END IF;
  END PROCESS Unit_Delay_process;


  Unit_Delay42_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay42_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        Unit_Delay42_reg(0) <= BUTTON1;
        Unit_Delay42_reg(1 TO 2) <= Unit_Delay42_reg(0 TO 1);
      END IF;
    END IF;
  END PROCESS Unit_Delay42_process;

  Unit_Delay42_out1 <= Unit_Delay42_reg(2);

  Unit_Delay29_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay29_out1 <= '0';
      ELSIF enb = '1' THEN
        Unit_Delay29_out1 <= state_out;
      END IF;
    END IF;
  END PROCESS Unit_Delay29_process;


  
  Switch_out1 <= done WHEN Constant7_out1 = '0' ELSE
      done_2;

  Unit_Delay63_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay63_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        Unit_Delay63_reg(0) <= RX_CLK;
        Unit_Delay63_reg(1 TO 2) <= Unit_Delay63_reg(0 TO 1);
      END IF;
    END IF;
  END PROCESS Unit_Delay63_process;

  Unit_Delay63_out1 <= Unit_Delay63_reg(2);

  Unit_Delay46_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay46_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        Unit_Delay46_reg(0) <= RXD0;
        Unit_Delay46_reg(1) <= Unit_Delay46_reg(0);
      END IF;
    END IF;
  END PROCESS Unit_Delay46_process;

  Unit_Delay46_out1 <= Unit_Delay46_reg(1);

  Unit_Delay48_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay48_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        Unit_Delay48_reg(0) <= RXD1;
        Unit_Delay48_reg(1) <= Unit_Delay48_reg(0);
      END IF;
    END IF;
  END PROCESS Unit_Delay48_process;

  Unit_Delay48_out1 <= Unit_Delay48_reg(1);

  Unit_Delay50_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay50_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        Unit_Delay50_reg(0) <= RXD2;
        Unit_Delay50_reg(1) <= Unit_Delay50_reg(0);
      END IF;
    END IF;
  END PROCESS Unit_Delay50_process;

  Unit_Delay50_out1 <= Unit_Delay50_reg(1);

  Unit_Delay52_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay52_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        Unit_Delay52_reg(0) <= RXD3;
        Unit_Delay52_reg(1) <= Unit_Delay52_reg(0);
      END IF;
    END IF;
  END PROCESS Unit_Delay52_process;

  Unit_Delay52_out1 <= Unit_Delay52_reg(1);

  Constant2_out1 <= to_unsigned(50000000, 32);

  Constant4_out1 <= to_unsigned(16#000A#, 16);

  Constant5_out1 <= to_unsigned(16#3501#, 16);

  Constant6_out1 <= to_unsigned(16#793C#, 16);

  Constant_out1 <= to_unsigned(16#0044#, 16);

  Constant1_out1 <= to_unsigned(16#7777#, 16);

  Unit_Delay54_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay54_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        Unit_Delay54_reg(0) <= RX_DV;
        Unit_Delay54_reg(1) <= Unit_Delay54_reg(0);
      END IF;
    END IF;
  END PROCESS Unit_Delay54_process;

  Unit_Delay54_out1 <= Unit_Delay54_reg(1);

  Unit_Delay56_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay56_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        Unit_Delay56_reg(0) <= RX_CRS;
        Unit_Delay56_reg(1) <= Unit_Delay56_reg(0);
      END IF;
    END IF;
  END PROCESS Unit_Delay56_process;

  Unit_Delay56_out1 <= Unit_Delay56_reg(1);

  Unit_Delay58_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay58_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        Unit_Delay58_reg(0) <= RX_ERR;
        Unit_Delay58_reg(1) <= Unit_Delay58_reg(0);
      END IF;
    END IF;
  END PROCESS Unit_Delay58_process;

  Unit_Delay58_out1 <= Unit_Delay58_reg(1);

  Unit_Delay60_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay60_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        Unit_Delay60_reg(0) <= RX_COL;
        Unit_Delay60_reg(1) <= Unit_Delay60_reg(0);
      END IF;
    END IF;
  END PROCESS Unit_Delay60_process;

  Unit_Delay60_out1 <= Unit_Delay60_reg(1);

  ip_length_tmp_out_unsigned <= unsigned(ip_length_tmp_out);

  Unit_Delay68_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay68_out1 <= to_unsigned(16#0000#, 16);
      ELSIF enb = '1' THEN
        Unit_Delay68_out1 <= ip_length_tmp_out_unsigned;
      END IF;
    END IF;
  END PROCESS Unit_Delay68_process;


  dest_port_tmp_out_unsigned <= unsigned(dest_port_tmp_out);

  Unit_Delay67_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay67_out1 <= to_unsigned(16#0000#, 16);
      ELSIF enb = '1' THEN
        Unit_Delay67_out1 <= dest_port_tmp_out_unsigned;
      END IF;
    END IF;
  END PROCESS Unit_Delay67_process;


  source_port_tmp_out_unsigned <= unsigned(source_port_tmp_out);

  Unit_Delay66_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay66_out1 <= to_unsigned(16#0000#, 16);
      ELSIF enb = '1' THEN
        Unit_Delay66_out1 <= source_port_tmp_out_unsigned;
      END IF;
    END IF;
  END PROCESS Unit_Delay66_process;


  dest_ip_tmp_out_unsigned <= unsigned(dest_ip_tmp_out);

  Unit_Delay65_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay65_out1 <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        Unit_Delay65_out1 <= dest_ip_tmp_out_unsigned;
      END IF;
    END IF;
  END PROCESS Unit_Delay65_process;


  source_ip_tmp_out_unsigned <= unsigned(source_ip_tmp_out);

  Unit_Delay64_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay64_out1 <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        Unit_Delay64_out1 <= source_ip_tmp_out_unsigned;
      END IF;
    END IF;
  END PROCESS Unit_Delay64_process;


  source_mac_addr3_tmp_out_unsigned <= unsigned(source_mac_addr3_tmp_out);

  Unit_Delay74_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay74_out1 <= to_unsigned(16#0000#, 16);
      ELSIF enb = '1' THEN
        Unit_Delay74_out1 <= source_mac_addr3_tmp_out_unsigned;
      END IF;
    END IF;
  END PROCESS Unit_Delay74_process;


  source_mac_addr2_tmp_out_unsigned <= unsigned(source_mac_addr2_tmp_out);

  Unit_Delay73_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay73_out1 <= to_unsigned(16#0000#, 16);
      ELSIF enb = '1' THEN
        Unit_Delay73_out1 <= source_mac_addr2_tmp_out_unsigned;
      END IF;
    END IF;
  END PROCESS Unit_Delay73_process;


  source_mac_addr1_tmp_out_unsigned <= unsigned(source_mac_addr1_tmp_out);

  Unit_Delay72_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay72_out1 <= to_unsigned(16#0000#, 16);
      ELSIF enb = '1' THEN
        Unit_Delay72_out1 <= source_mac_addr1_tmp_out_unsigned;
      END IF;
    END IF;
  END PROCESS Unit_Delay72_process;


  options_counter_out_unsigned <= unsigned(options_counter_out);

  Unit_Delay33_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay33_out1 <= to_unsigned(16#0000#, 16);
      ELSIF enb = '1' THEN
        Unit_Delay33_out1 <= options_counter_out_unsigned;
      END IF;
    END IF;
  END PROCESS Unit_Delay33_process;


  byte_out_unsigned <= unsigned(byte_out);

  Unit_Delay26_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay26_out1 <= to_unsigned(16#00#, 8);
      ELSIF enb = '1' THEN
        Unit_Delay26_out1 <= byte_out_unsigned;
      END IF;
    END IF;
  END PROCESS Unit_Delay26_process;


  preamble_out_unsigned <= unsigned(preamble_out);

  Unit_Delay25_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay25_out1 <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        Unit_Delay25_out1 <= preamble_out_unsigned;
      END IF;
    END IF;
  END PROCESS Unit_Delay25_process;


  nibble_counter_out_unsigned <= unsigned(nibble_counter_out);

  Unit_Delay20_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay20_out1 <= to_unsigned(16#0000#, 16);
      ELSIF enb = '1' THEN
        Unit_Delay20_out1 <= nibble_counter_out_unsigned;
      END IF;
    END IF;
  END PROCESS Unit_Delay20_process;


  ip_length_out_unsigned <= unsigned(ip_length_out);

  Unit_Delay34_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay34_out1 <= to_unsigned(16#0000#, 16);
      ELSIF enb = '1' THEN
        Unit_Delay34_out1 <= ip_length_out_unsigned;
      END IF;
    END IF;
  END PROCESS Unit_Delay34_process;


  state_out_unsigned <= unsigned(state_out_1);

  Unit_Delay21_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay21_out1 <= to_unsigned(16#00#, 8);
      ELSIF enb = '1' THEN
        Unit_Delay21_out1 <= state_out_unsigned;
      END IF;
    END IF;
  END PROCESS Unit_Delay21_process;


  Unit_Delay24_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay24_out1 <= '0';
      ELSIF enb = '1' THEN
        Unit_Delay24_out1 <= udp_frame_out_ready;
      END IF;
    END IF;
  END PROCESS Unit_Delay24_process;


  outputgen5: FOR k IN 0 TO 109 GENERATE
    udp_frame_out_unsigned(k) <= unsigned(udp_frame_out(k));
  END GENERATE;

  udp_frame_out_1 <= udp_frame_out_unsigned;

  Unit_Delay23_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay23_out1 <= (OTHERS => to_unsigned(16#00#, 8));
      ELSIF enb = '1' THEN
        Unit_Delay23_out1 <= udp_frame_out_1;
      END IF;
    END IF;
  END PROCESS Unit_Delay23_process;


  outputgen4: FOR k IN 0 TO 109 GENERATE
    Unit_Delay23_out1_1(k) <= std_logic_vector(Unit_Delay23_out1(k));
  END GENERATE;

  dest_port_out_unsigned <= unsigned(dest_port_out);

  Unit_Delay39_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay39_out1 <= to_unsigned(16#0000#, 16);
      ELSIF enb = '1' THEN
        Unit_Delay39_out1 <= dest_port_out_unsigned;
      END IF;
    END IF;
  END PROCESS Unit_Delay39_process;


  source_port_out_unsigned <= unsigned(source_port_out);

  Unit_Delay38_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay38_out1 <= to_unsigned(16#0000#, 16);
      ELSIF enb = '1' THEN
        Unit_Delay38_out1 <= source_port_out_unsigned;
      END IF;
    END IF;
  END PROCESS Unit_Delay38_process;


  dest_ip_out_unsigned <= unsigned(dest_ip_out);

  Unit_Delay27_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay27_out1 <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        Unit_Delay27_out1 <= dest_ip_out_unsigned;
      END IF;
    END IF;
  END PROCESS Unit_Delay27_process;


  source_ip_out_unsigned <= unsigned(source_ip_out);

  Unit_Delay28_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay28_out1 <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        Unit_Delay28_out1 <= source_ip_out_unsigned;
      END IF;
    END IF;
  END PROCESS Unit_Delay28_process;


  source_mac_addr3_out_unsigned <= unsigned(source_mac_addr3_out);

  Unit_Delay71_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay71_out1 <= to_unsigned(16#0000#, 16);
      ELSIF enb = '1' THEN
        Unit_Delay71_out1 <= source_mac_addr3_out_unsigned;
      END IF;
    END IF;
  END PROCESS Unit_Delay71_process;


  source_mac_addr2_out_unsigned <= unsigned(source_mac_addr2_out);

  Unit_Delay70_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay70_out1 <= to_unsigned(16#0000#, 16);
      ELSIF enb = '1' THEN
        Unit_Delay70_out1 <= source_mac_addr2_out_unsigned;
      END IF;
    END IF;
  END PROCESS Unit_Delay70_process;


  source_mac_addr1_out_unsigned <= unsigned(source_mac_addr1_out);

  Unit_Delay69_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay69_out1 <= to_unsigned(16#0000#, 16);
      ELSIF enb = '1' THEN
        Unit_Delay69_out1 <= source_mac_addr1_out_unsigned;
      END IF;
    END IF;
  END PROCESS Unit_Delay69_process;


  Logical_Operator1_out1 <= HDL_FIFO12_out2 OR (HDL_FIFO11_out2 OR (HDL_FIFO10_out2 OR (HDL_FIFO9_out2 OR (HDL_FIFO8_out2 OR (HDL_FIFO7_out2 OR (HDL_FIFO5_out2 OR HDL_FIFO6_out2))))));

  Unit_Delay22_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay22_out1 <= '0';
      ELSIF enb = '1' THEN
        Unit_Delay22_out1 <= rx_clk_fifo_out;
      END IF;
    END IF;
  END PROCESS Unit_Delay22_process;


  Unit_Delay44_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay44_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        Unit_Delay44_reg(0) <= TX_CLK;
        Unit_Delay44_reg(1) <= Unit_Delay44_reg(0);
      END IF;
    END IF;
  END PROCESS Unit_Delay44_process;

  Unit_Delay44_out1 <= Unit_Delay44_reg(1);

  byte_counter_out_unsigned <= unsigned(byte_counter_out);

  Unit_Delay7_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay7_out1 <= to_unsigned(16#0000#, 16);
      ELSIF enb = '1' THEN
        Unit_Delay7_out1 <= byte_counter_out_unsigned;
      END IF;
    END IF;
  END PROCESS Unit_Delay7_process;


  state_out_unsigned_1 <= unsigned(state_out_2);

  Unit_Delay8_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay8_out1 <= to_unsigned(16#00#, 8);
      ELSIF enb = '1' THEN
        Unit_Delay8_out1 <= state_out_unsigned_1;
      END IF;
    END IF;
  END PROCESS Unit_Delay8_process;


  Logical_Operator_out1 <= HDL_FIFO4_out2 OR (HDL_FIFO3_out2 OR (HDL_FIFO2_out2 OR (HDL_FIFO_out2 OR HDL_FIFO1_out2)));

  Unit_Delay17_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay17_out1 <= '0';
      ELSIF enb = '1' THEN
        Unit_Delay17_out1 <= Logical_Operator_out1;
      END IF;
    END IF;
  END PROCESS Unit_Delay17_process;


  outputgen3: FOR k IN 0 TO 309 GENERATE
    eth_frame_out_unsigned(k) <= unsigned(eth_frame_out(k));
  END GENERATE;

  eth_frame_out_1 <= eth_frame_out_unsigned;

  outputgen2: FOR k IN 0 TO 309 GENERATE
    eth_frame_out_2(k) <= std_logic_vector(eth_frame_out_1(k));
  END GENERATE;

  byte_counter_out_unsigned_1 <= unsigned(byte_counter_out_1);

  Unit_Delay6_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay6_out1 <= to_unsigned(16#0000#, 16);
      ELSIF enb = '1' THEN
        Unit_Delay6_out1 <= byte_counter_out_unsigned_1;
      END IF;
    END IF;
  END PROCESS Unit_Delay6_process;


  state_out_unsigned_2 <= unsigned(state_out_3);

  Unit_Delay4_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay4_out1 <= to_unsigned(16#00#, 8);
      ELSIF enb = '1' THEN
        Unit_Delay4_out1 <= state_out_unsigned_2;
      END IF;
    END IF;
  END PROCESS Unit_Delay4_process;


  checksum_out_unsigned <= unsigned(checksum_out);

  Unit_Delay5_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay5_out1 <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        Unit_Delay5_out1 <= checksum_out_unsigned;
      END IF;
    END IF;
  END PROCESS Unit_Delay5_process;


  outputgen1: FOR k IN 0 TO 309 GENERATE
    eth_frame_unsigned(k) <= unsigned(eth_frame(k));
  END GENERATE;

  eth_frame_1 <= eth_frame_unsigned;

  outputgen: FOR k IN 0 TO 309 GENERATE
    eth_frame_2(k) <= std_logic_vector(eth_frame_1(k));
  END GENERATE;

  byte_counter_out_unsigned_2 <= unsigned(byte_counter_out_2);

  Unit_Delay14_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay14_out1 <= to_unsigned(16#0000#, 16);
      ELSIF enb = '1' THEN
        Unit_Delay14_out1 <= byte_counter_out_unsigned_2;
      END IF;
    END IF;
  END PROCESS Unit_Delay14_process;


  state_out_unsigned_3 <= unsigned(state_out_4);

  Unit_Delay13_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay13_out1 <= to_unsigned(16#00#, 8);
      ELSIF enb = '1' THEN
        Unit_Delay13_out1 <= state_out_unsigned_3;
      END IF;
    END IF;
  END PROCESS Unit_Delay13_process;


  checksum_out_unsigned_1 <= unsigned(checksum_out_1);

  Unit_Delay15_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay15_out1 <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        Unit_Delay15_out1 <= checksum_out_unsigned_1;
      END IF;
    END IF;
  END PROCESS Unit_Delay15_process;


  length_out_unsigned <= unsigned(length_out);

  Unit_Delay16_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay16_out1 <= to_unsigned(16#0000#, 16);
      ELSIF enb = '1' THEN
        Unit_Delay16_out1 <= length_out_unsigned;
      END IF;
    END IF;
  END PROCESS Unit_Delay16_process;


  Unit_Delay3_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay3_out1 <= '0';
      ELSIF enb = '1' THEN
        Unit_Delay3_out1 <= length_done;
      END IF;
    END IF;
  END PROCESS Unit_Delay3_process;


  byte_counter_out_unsigned_3 <= unsigned(byte_counter_out_3);

  Unit_Delay9_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay9_out1 <= to_unsigned(16#00#, 8);
      ELSIF enb = '1' THEN
        Unit_Delay9_out1 <= byte_counter_out_unsigned_3;
      END IF;
    END IF;
  END PROCESS Unit_Delay9_process;


  state_out_unsigned_4 <= unsigned(state_out_5);

  Unit_Delay10_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay10_out1 <= to_unsigned(16#00#, 8);
      ELSIF enb = '1' THEN
        Unit_Delay10_out1 <= state_out_unsigned_4;
      END IF;
    END IF;
  END PROCESS Unit_Delay10_process;


  checksum_out_unsigned_2 <= unsigned(checksum_out_2);

  Unit_Delay11_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay11_out1 <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        Unit_Delay11_out1 <= checksum_out_unsigned_2;
      END IF;
    END IF;
  END PROCESS Unit_Delay11_process;


  length_out_unsigned_1 <= unsigned(length_out_1);

  Unit_Delay12_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay12_out1 <= to_unsigned(16#00#, 8);
      ELSIF enb = '1' THEN
        Unit_Delay12_out1 <= length_out_unsigned_1;
      END IF;
    END IF;
  END PROCESS Unit_Delay12_process;


  renewal_cnt_out_unsigned <= unsigned(renewal_cnt_out);

  Unit_Delay36_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay36_out1 <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        Unit_Delay36_out1 <= renewal_cnt_out_unsigned;
      END IF;
    END IF;
  END PROCESS Unit_Delay36_process;


  cnt_out_unsigned_1 <= unsigned(cnt_out_1);

  Unit_Delay30_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay30_out1 <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        Unit_Delay30_out1 <= cnt_out_unsigned_1;
      END IF;
    END IF;
  END PROCESS Unit_Delay30_process;


  xid_out_unsigned <= unsigned(xid_out);

  Unit_Delay19_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay19_out1 <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        Unit_Delay19_out1 <= xid_out_unsigned;
      END IF;
    END IF;
  END PROCESS Unit_Delay19_process;


  state_out_unsigned_5 <= unsigned(state_out_6);

  Unit_Delay2_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay2_out1 <= to_unsigned(16#00#, 8);
      ELSIF enb = '1' THEN
        Unit_Delay2_out1 <= state_out_unsigned_5;
      END IF;
    END IF;
  END PROCESS Unit_Delay2_process;


  Unit_Delay1_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay1_out1 <= '0';
      ELSIF enb = '1' THEN
        Unit_Delay1_out1 <= done_8;
      END IF;
    END IF;
  END PROCESS Unit_Delay1_process;


  ip_time_out_unsigned <= unsigned(ip_time_out);

  Unit_Delay35_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay35_out1 <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        Unit_Delay35_out1 <= ip_time_out_unsigned;
      END IF;
    END IF;
  END PROCESS Unit_Delay35_process;


  ciaddr_out_unsigned <= unsigned(ciaddr_out);

  Unit_Delay37_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay37_out1 <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        Unit_Delay37_out1 <= ciaddr_out_unsigned;
      END IF;
    END IF;
  END PROCESS Unit_Delay37_process;


  client_ip_out_unsigned <= unsigned(client_ip_out);

  Unit_Delay32_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay32_out1 <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        Unit_Delay32_out1 <= client_ip_out_unsigned;
      END IF;
    END IF;
  END PROCESS Unit_Delay32_process;


  server_ip_out_unsigned <= unsigned(server_ip_out);

  Unit_Delay31_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay31_out1 <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        Unit_Delay31_out1 <= server_ip_out_unsigned;
      END IF;
    END IF;
  END PROCESS Unit_Delay31_process;


  Unit_Delay18_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        Unit_Delay18_out1 <= '0';
      ELSIF enb = '1' THEN
        Unit_Delay18_out1 <= tx_clk_fifo_out;
      END IF;
    END IF;
  END PROCESS Unit_Delay18_process;


  Logical_Operator2_out1 <=  NOT led1_1;

  Logical_Operator5_out1 <=  NOT led2_1;

  Logical_Operator3_out1 <=  NOT led3_1;

  Logical_Operator4_out1 <=  NOT led4_1;

  CLK_EN_OUT <= CLK_EN;

  TXD0 <= HDL_FIFO_out1;

  TXD1 <= HDL_FIFO1_out1;

  TXD2 <= HDL_FIFO2_out1;

  TXD3 <= HDL_FIFO3_out1;

  TX_EN <= HDL_FIFO4_out1;

  ETH_RST_N <= eth_reset_n;

  MDC <= mdc_1;

  MDIO <= mdio_1;

  LED1 <= Logical_Operator2_out1;

  LED2 <= Logical_Operator5_out1;

  LED3 <= Logical_Operator3_out1;

  LED4 <= Logical_Operator4_out1;

END rtl;

