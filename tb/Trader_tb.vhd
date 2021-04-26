LIBRARY IEEE;
USE IEEE.std_logic_textio.ALL;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY STD;
USE STD.textio.ALL;
LIBRARY work;
USE work.Trader_pkg.ALL;
USE work.Trader_tb_pkg.ALL;

ENTITY Trader_tb IS
END Trader_tb;


ARCHITECTURE rtl OF Trader_tb IS

  ATTRIBUTE multstyle : string;

  -- Component Declarations
  COMPONENT Trader
    PORT( CLK                             :   IN    std_logic;
          RSTn                            :   IN    std_logic;
          CLK_EN                          :   IN    std_logic;
          RXD0                            :   IN    std_logic;
          RXD1                            :   IN    std_logic;
          RXD2                            :   IN    std_logic;
          RXD3                            :   IN    std_logic;
          RX_DV                           :   IN    std_logic;
          RX_CLK                          :   IN    std_logic;
          RX_CRS                          :   IN    std_logic;
          RX_ERR                          :   IN    std_logic;
          RX_COL                          :   IN    std_logic;
          TX_CLK                          :   IN    std_logic;
          BUTTON1                         :   IN    std_logic;
          CLK_EN_OUT                      :   OUT   std_logic;
          TXD0                            :   OUT   std_logic;
          TXD1                            :   OUT   std_logic;
          TXD2                            :   OUT   std_logic;
          TXD3                            :   OUT   std_logic;
          TX_EN                           :   OUT   std_logic;
          ETH_RST_N                       :   OUT   std_logic;
          MDC                             :   OUT   std_logic;
          MDIO                            :   OUT   std_logic;
          LED1                            :   OUT   std_logic;
          LED2                            :   OUT   std_logic;
          LED3                            :   OUT   std_logic;
          LED4                            :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : Trader
    USE ENTITY work.Trader(rtl);

  -- Signals
  SIGNAL CLK                              : std_logic;
  SIGNAL RSTn                             : std_logic;
  SIGNAL CLK_EN                           : std_logic;
  SIGNAL LED4_done                        : std_logic;  -- ufix1
  SIGNAL rdEnb                            : std_logic;
  SIGNAL LED4_done_enb                    : std_logic;  -- ufix1
  SIGNAL TXD0_addr                        : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL LED4_lastAddr                    : std_logic;  -- ufix1
  SIGNAL check12_done                     : std_logic;  -- ufix1
  SIGNAL LED3_done                        : std_logic;  -- ufix1
  SIGNAL LED3_done_enb                    : std_logic;  -- ufix1
  SIGNAL LED3_lastAddr                    : std_logic;  -- ufix1
  SIGNAL check11_done                     : std_logic;  -- ufix1
  SIGNAL LED2_done                        : std_logic;  -- ufix1
  SIGNAL LED2_done_enb                    : std_logic;  -- ufix1
  SIGNAL LED2_lastAddr                    : std_logic;  -- ufix1
  SIGNAL check10_done                     : std_logic;  -- ufix1
  SIGNAL LED1_done                        : std_logic;  -- ufix1
  SIGNAL LED1_done_enb                    : std_logic;  -- ufix1
  SIGNAL LED1_lastAddr                    : std_logic;  -- ufix1
  SIGNAL check9_done                      : std_logic;  -- ufix1
  SIGNAL MDIO_done                        : std_logic;  -- ufix1
  SIGNAL MDIO_done_enb                    : std_logic;  -- ufix1
  SIGNAL MDIO_lastAddr                    : std_logic;  -- ufix1
  SIGNAL check8_done                      : std_logic;  -- ufix1
  SIGNAL MDC_done                         : std_logic;  -- ufix1
  SIGNAL MDC_done_enb                     : std_logic;  -- ufix1
  SIGNAL MDC_lastAddr                     : std_logic;  -- ufix1
  SIGNAL check7_done                      : std_logic;  -- ufix1
  SIGNAL ETH_RST_N_done                   : std_logic;  -- ufix1
  SIGNAL ETH_RST_N_done_enb               : std_logic;  -- ufix1
  SIGNAL ETH_RST_N_lastAddr               : std_logic;  -- ufix1
  SIGNAL check6_done                      : std_logic;  -- ufix1
  SIGNAL TX_EN_done                       : std_logic;  -- ufix1
  SIGNAL TX_EN_done_enb                   : std_logic;  -- ufix1
  SIGNAL TX_EN_lastAddr                   : std_logic;  -- ufix1
  SIGNAL check5_done                      : std_logic;  -- ufix1
  SIGNAL TXD3_done                        : std_logic;  -- ufix1
  SIGNAL TXD3_done_enb                    : std_logic;  -- ufix1
  SIGNAL TXD3_lastAddr                    : std_logic;  -- ufix1
  SIGNAL check4_done                      : std_logic;  -- ufix1
  SIGNAL TXD2_done                        : std_logic;  -- ufix1
  SIGNAL TXD2_done_enb                    : std_logic;  -- ufix1
  SIGNAL TXD2_lastAddr                    : std_logic;  -- ufix1
  SIGNAL check3_done                      : std_logic;  -- ufix1
  SIGNAL TXD1_done                        : std_logic;  -- ufix1
  SIGNAL TXD1_done_enb                    : std_logic;  -- ufix1
  SIGNAL TXD1_lastAddr                    : std_logic;  -- ufix1
  SIGNAL check2_done                      : std_logic;  -- ufix1
  SIGNAL TXD0_done                        : std_logic;  -- ufix1
  SIGNAL TXD0_done_enb                    : std_logic;  -- ufix1
  SIGNAL TXD0_active                      : std_logic;  -- ufix1
  SIGNAL FrameGenerator_out1_addr         : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL Logical_Operator_out1_addr_delay_1 : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL tb_enb_delay                     : std_logic;
  SIGNAL BUTTON1raw                       : std_logic;
  SIGNAL rawData_BUTTON1                  : std_logic;
  SIGNAL holdData_BUTTON1                 : std_logic;
  SIGNAL BUTTON1_offset                   : std_logic;
  SIGNAL BUTTON1                          : std_logic;
  SIGNAL RX_CLK                           : std_logic;
  SIGNAL TX_CLK                           : std_logic;
  SIGNAL RX_ERR                           : std_logic;
  SIGNAL RX_COL                           : std_logic;
  SIGNAL rawData_RX_ERR                   : std_logic;
  SIGNAL holdData_RX_ERR                  : std_logic;
  SIGNAL RX_ERR_offset                    : std_logic;
  SIGNAL RX_ERR_1                         : std_logic;
  SIGNAL rawData_RX_CRS                   : std_logic;
  SIGNAL holdData_RX_CRS                  : std_logic;
  SIGNAL RX_CRS_offset                    : std_logic;
  SIGNAL RX_CRS                           : std_logic;
  SIGNAL Data_Type_Conversion6_out1_addr_delay_1 : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL RX_CLKraw                        : std_logic;
  SIGNAL rawData_RX_CLK                   : std_logic;
  SIGNAL holdData_RX_CLK                  : std_logic;
  SIGNAL RX_CLK_offset                    : std_logic;
  SIGNAL RX_CLK_1                         : std_logic;
  SIGNAL FrameGenerator_out5_addr_delay_1 : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL RX_DVraw                         : std_logic;
  SIGNAL rawData_RX_DV                    : std_logic;
  SIGNAL holdData_RX_DV                   : std_logic;
  SIGNAL RX_DV_offset                     : std_logic;
  SIGNAL RX_DV                            : std_logic;
  SIGNAL FrameGenerator_out4_addr_delay_1 : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL RXD3raw                          : std_logic;
  SIGNAL rawData_RXD3                     : std_logic;
  SIGNAL holdData_RXD3                    : std_logic;
  SIGNAL RXD3_offset                      : std_logic;
  SIGNAL RXD3                             : std_logic;
  SIGNAL FrameGenerator_out3_addr_delay_1 : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL RXD2raw                          : std_logic;
  SIGNAL rawData_RXD2                     : std_logic;
  SIGNAL holdData_RXD2                    : std_logic;
  SIGNAL RXD2_offset                      : std_logic;
  SIGNAL RXD2                             : std_logic;
  SIGNAL FrameGenerator_out2_addr_delay_1 : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL RXD1raw                          : std_logic;
  SIGNAL rawData_RXD1                     : std_logic;
  SIGNAL holdData_RXD1                    : std_logic;
  SIGNAL RXD1_offset                      : std_logic;
  SIGNAL RXD1                             : std_logic;
  SIGNAL FrameGenerator_out1_active       : std_logic;  -- ufix1
  SIGNAL FrameGenerator_out1_enb          : std_logic;  -- ufix1
  SIGNAL FrameGenerator_out1_addr_delay_1 : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL RXD0raw                          : std_logic;
  SIGNAL rawData_RXD0                     : std_logic;
  SIGNAL holdData_RXD0                    : std_logic;
  SIGNAL RXD0_offset                      : std_logic;
  SIGNAL RXD0                             : std_logic;
  SIGNAL snkDone                          : std_logic;
  SIGNAL snkDonen                         : std_logic;
  SIGNAL tb_enb                           : std_logic;
  SIGNAL CLK_EN_OUT                       : std_logic;
  SIGNAL TXD0                             : std_logic;
  SIGNAL TXD1                             : std_logic;
  SIGNAL TXD2                             : std_logic;
  SIGNAL TXD3                             : std_logic;
  SIGNAL TX_EN                            : std_logic;
  SIGNAL ETH_RST_N                        : std_logic;
  SIGNAL MDC                              : std_logic;
  SIGNAL MDIO                             : std_logic;
  SIGNAL LED1                             : std_logic;
  SIGNAL LED2                             : std_logic;
  SIGNAL LED3                             : std_logic;
  SIGNAL LED4                             : std_logic;
  SIGNAL TXD0_enb                         : std_logic;  -- ufix1
  SIGNAL TXD0_lastAddr                    : std_logic;  -- ufix1
  SIGNAL check1_done                      : std_logic;  -- ufix1
  SIGNAL TXD0_addr_delay_1                : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL TXD0_expected                    : std_logic;
  SIGNAL TXD0_ref                         : std_logic;
  SIGNAL TXD0_testFailure                 : std_logic;  -- ufix1
  SIGNAL TXD1_addr_delay_1                : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL TXD1_expected                    : std_logic;
  SIGNAL TXD1_ref                         : std_logic;
  SIGNAL TXD1_testFailure                 : std_logic;  -- ufix1
  SIGNAL TXD2_addr_delay_1                : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL TXD2_expected                    : std_logic;
  SIGNAL TXD2_ref                         : std_logic;
  SIGNAL TXD2_testFailure                 : std_logic;  -- ufix1
  SIGNAL TXD3_addr_delay_1                : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL TXD3_expected                    : std_logic;
  SIGNAL TXD3_ref                         : std_logic;
  SIGNAL TXD3_testFailure                 : std_logic;  -- ufix1
  SIGNAL TX_EN_addr_delay_1               : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL TX_EN_expected                   : std_logic;
  SIGNAL TX_EN_ref                        : std_logic;
  SIGNAL TX_EN_testFailure                : std_logic;  -- ufix1
  SIGNAL ETH_RST_N_addr_delay_1           : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL ETH_RST_N_expected               : std_logic;
  SIGNAL ETH_RST_N_ref                    : std_logic;
  SIGNAL ETH_RST_N_testFailure            : std_logic;  -- ufix1
  SIGNAL MDC_addr_delay_1                 : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL MDC_expected                     : std_logic;
  SIGNAL MDC_ref                          : std_logic;
  SIGNAL MDC_testFailure                  : std_logic;  -- ufix1
  SIGNAL MDIO_addr_delay_1                : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL MDIO_expected                    : std_logic;
  SIGNAL MDIO_ref                         : std_logic;
  SIGNAL MDIO_testFailure                 : std_logic;  -- ufix1
  SIGNAL LED1_addr_delay_1                : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL LED1_expected                    : std_logic;
  SIGNAL LED1_ref                         : std_logic;
  SIGNAL LED1_testFailure                 : std_logic;  -- ufix1
  SIGNAL LED2_addr_delay_1                : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL LED2_expected                    : std_logic;
  SIGNAL LED2_ref                         : std_logic;
  SIGNAL LED2_testFailure                 : std_logic;  -- ufix1
  SIGNAL LED3_addr_delay_1                : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL LED3_expected                    : std_logic;
  SIGNAL LED3_ref                         : std_logic;
  SIGNAL LED3_testFailure                 : std_logic;  -- ufix1
  SIGNAL LED4_addr_delay_1                : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL LED4_expected                    : std_logic;
  SIGNAL LED4_ref                         : std_logic;
  SIGNAL LED4_testFailure                 : std_logic;  -- ufix1
  SIGNAL testFailure                      : std_logic;  -- ufix1

BEGIN
  u_Trader : Trader
    PORT MAP( CLK => CLK,
              RSTn => RSTn,
              CLK_EN => CLK_EN,
              RXD0 => RXD0,
              RXD1 => RXD1,
              RXD2 => RXD2,
              RXD3 => RXD3,
              RX_DV => RX_DV,
              RX_CLK => RX_CLK_1,
              RX_CRS => RX_CRS,
              RX_ERR => RX_ERR_1,
              RX_COL => RX_COL,
              TX_CLK => TX_CLK,
              BUTTON1 => BUTTON1,
              CLK_EN_OUT => CLK_EN_OUT,
              TXD0 => TXD0,
              TXD1 => TXD1,
              TXD2 => TXD2,
              TXD3 => TXD3,
              TX_EN => TX_EN,
              ETH_RST_N => ETH_RST_N,
              MDC => MDC,
              MDIO => MDIO,
              LED1 => LED1,
              LED2 => LED2,
              LED3 => LED3,
              LED4 => LED4
              );

  LED4_done_enb <= LED4_done AND rdEnb;

  
  LED4_lastAddr <= '1' WHEN TXD0_addr >= to_unsigned(16#3A98#, 14) ELSE
      '0';

  LED4_done <= LED4_lastAddr AND RSTn;

  -- Delay to allow last sim cycle to complete
  checkDone_12_process: PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        check12_done <= '0';
      ELSIF LED4_done_enb = '1' THEN
        check12_done <= LED4_done;
      END IF;
    END IF;
  END PROCESS checkDone_12_process;

  LED3_done_enb <= LED3_done AND rdEnb;

  
  LED3_lastAddr <= '1' WHEN TXD0_addr >= to_unsigned(16#3A98#, 14) ELSE
      '0';

  LED3_done <= LED3_lastAddr AND RSTn;

  -- Delay to allow last sim cycle to complete
  checkDone_11_process: PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        check11_done <= '0';
      ELSIF LED3_done_enb = '1' THEN
        check11_done <= LED3_done;
      END IF;
    END IF;
  END PROCESS checkDone_11_process;

  LED2_done_enb <= LED2_done AND rdEnb;

  
  LED2_lastAddr <= '1' WHEN TXD0_addr >= to_unsigned(16#3A98#, 14) ELSE
      '0';

  LED2_done <= LED2_lastAddr AND RSTn;

  -- Delay to allow last sim cycle to complete
  checkDone_10_process: PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        check10_done <= '0';
      ELSIF LED2_done_enb = '1' THEN
        check10_done <= LED2_done;
      END IF;
    END IF;
  END PROCESS checkDone_10_process;

  LED1_done_enb <= LED1_done AND rdEnb;

  
  LED1_lastAddr <= '1' WHEN TXD0_addr >= to_unsigned(16#3A98#, 14) ELSE
      '0';

  LED1_done <= LED1_lastAddr AND RSTn;

  -- Delay to allow last sim cycle to complete
  checkDone_9_process: PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        check9_done <= '0';
      ELSIF LED1_done_enb = '1' THEN
        check9_done <= LED1_done;
      END IF;
    END IF;
  END PROCESS checkDone_9_process;

  MDIO_done_enb <= MDIO_done AND rdEnb;

  
  MDIO_lastAddr <= '1' WHEN TXD0_addr >= to_unsigned(16#3A98#, 14) ELSE
      '0';

  MDIO_done <= MDIO_lastAddr AND RSTn;

  -- Delay to allow last sim cycle to complete
  checkDone_8_process: PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        check8_done <= '0';
      ELSIF MDIO_done_enb = '1' THEN
        check8_done <= MDIO_done;
      END IF;
    END IF;
  END PROCESS checkDone_8_process;

  MDC_done_enb <= MDC_done AND rdEnb;

  
  MDC_lastAddr <= '1' WHEN TXD0_addr >= to_unsigned(16#3A98#, 14) ELSE
      '0';

  MDC_done <= MDC_lastAddr AND RSTn;

  -- Delay to allow last sim cycle to complete
  checkDone_7_process: PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        check7_done <= '0';
      ELSIF MDC_done_enb = '1' THEN
        check7_done <= MDC_done;
      END IF;
    END IF;
  END PROCESS checkDone_7_process;

  ETH_RST_N_done_enb <= ETH_RST_N_done AND rdEnb;

  
  ETH_RST_N_lastAddr <= '1' WHEN TXD0_addr >= to_unsigned(16#3A98#, 14) ELSE
      '0';

  ETH_RST_N_done <= ETH_RST_N_lastAddr AND RSTn;

  -- Delay to allow last sim cycle to complete
  checkDone_6_process: PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        check6_done <= '0';
      ELSIF ETH_RST_N_done_enb = '1' THEN
        check6_done <= ETH_RST_N_done;
      END IF;
    END IF;
  END PROCESS checkDone_6_process;

  TX_EN_done_enb <= TX_EN_done AND rdEnb;

  
  TX_EN_lastAddr <= '1' WHEN TXD0_addr >= to_unsigned(16#3A98#, 14) ELSE
      '0';

  TX_EN_done <= TX_EN_lastAddr AND RSTn;

  -- Delay to allow last sim cycle to complete
  checkDone_5_process: PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        check5_done <= '0';
      ELSIF TX_EN_done_enb = '1' THEN
        check5_done <= TX_EN_done;
      END IF;
    END IF;
  END PROCESS checkDone_5_process;

  TXD3_done_enb <= TXD3_done AND rdEnb;

  
  TXD3_lastAddr <= '1' WHEN TXD0_addr >= to_unsigned(16#3A98#, 14) ELSE
      '0';

  TXD3_done <= TXD3_lastAddr AND RSTn;

  -- Delay to allow last sim cycle to complete
  checkDone_4_process: PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        check4_done <= '0';
      ELSIF TXD3_done_enb = '1' THEN
        check4_done <= TXD3_done;
      END IF;
    END IF;
  END PROCESS checkDone_4_process;

  TXD2_done_enb <= TXD2_done AND rdEnb;

  
  TXD2_lastAddr <= '1' WHEN TXD0_addr >= to_unsigned(16#3A98#, 14) ELSE
      '0';

  TXD2_done <= TXD2_lastAddr AND RSTn;

  -- Delay to allow last sim cycle to complete
  checkDone_3_process: PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        check3_done <= '0';
      ELSIF TXD2_done_enb = '1' THEN
        check3_done <= TXD2_done;
      END IF;
    END IF;
  END PROCESS checkDone_3_process;

  TXD1_done_enb <= TXD1_done AND rdEnb;

  
  TXD1_lastAddr <= '1' WHEN TXD0_addr >= to_unsigned(16#3A98#, 14) ELSE
      '0';

  TXD1_done <= TXD1_lastAddr AND RSTn;

  -- Delay to allow last sim cycle to complete
  checkDone_2_process: PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        check2_done <= '0';
      ELSIF TXD1_done_enb = '1' THEN
        check2_done <= TXD1_done;
      END IF;
    END IF;
  END PROCESS checkDone_2_process;

  TXD0_done_enb <= TXD0_done AND rdEnb;

  
  TXD0_active <= '1' WHEN TXD0_addr /= to_unsigned(16#3A98#, 14) ELSE
      '0';

  Logical_Operator_out1_addr_delay_1 <= FrameGenerator_out1_addr AFTER 1 ns;

  -- Data source for BUTTON1
  BUTTON1_fileread: PROCESS (Logical_Operator_out1_addr_delay_1, tb_enb_delay, rdEnb)
    FILE fp: TEXT open READ_MODE is "BUTTON1.dat";
    VARIABLE l: LINE;
    VARIABLE read_data: std_logic;

  BEGIN
    IF tb_enb_delay /= '1' THEN
      read_data := '0';
    ELSIF rdEnb = '1' AND NOT ENDFILE(fp) THEN
      READLINE(fp, l);
      READ(l, read_data);
    END IF;
    BUTTON1raw <= read_data;
  END PROCESS BUTTON1_fileread;

  
  rawData_BUTTON1 <= '0' WHEN rdEnb = '0' ELSE
      BUTTON1raw;

  -- holdData reg for Logical_Operator_out1
  stimuli_Logical_Operator_out1_process: PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        holdData_BUTTON1 <= '0';
      ELSE
        holdData_BUTTON1 <= rawData_BUTTON1;
      END IF;
    END IF;
  END PROCESS stimuli_Logical_Operator_out1_process;

  stimuli_Logical_Operator_out1_1: PROCESS (rawData_BUTTON1, rdEnb, tb_enb_delay)
  BEGIN
    IF tb_enb_delay = '0' THEN
      BUTTON1_offset <= '0';
    ELSIF rdEnb = '0' THEN
      BUTTON1_offset <= holdData_BUTTON1;
    ELSE
      BUTTON1_offset <= rawData_BUTTON1;
    END IF;
  END PROCESS stimuli_Logical_Operator_out1_1;

  BUTTON1 <= BUTTON1_offset AFTER 2 ns;

  TX_CLK <= RX_CLK;

  RX_COL <= RX_ERR;

  
  rawData_RX_ERR <= '0' WHEN rdEnb = '0' ELSE
      '0';

  -- holdData reg for Constant1_out1
  stimuli_Constant1_out1_process: PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        holdData_RX_ERR <= '0';
      ELSE
        holdData_RX_ERR <= rawData_RX_ERR;
      END IF;
    END IF;
  END PROCESS stimuli_Constant1_out1_process;

  stimuli_Constant1_out1_1: PROCESS (rawData_RX_ERR, rdEnb, tb_enb_delay)
  BEGIN
    IF tb_enb_delay = '0' THEN
      RX_ERR_offset <= '0';
    ELSIF rdEnb = '0' THEN
      RX_ERR_offset <= holdData_RX_ERR;
    ELSE
      RX_ERR_offset <= rawData_RX_ERR;
    END IF;
  END PROCESS stimuli_Constant1_out1_1;

  RX_ERR <= RX_ERR_offset AFTER 2 ns;

  RX_ERR_1 <= RX_ERR;

  
  rawData_RX_CRS <= '0' WHEN rdEnb = '0' ELSE
      '1';

  -- holdData reg for Constant_out1
  stimuli_Constant_out1_process: PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        holdData_RX_CRS <= '0';
      ELSE
        holdData_RX_CRS <= rawData_RX_CRS;
      END IF;
    END IF;
  END PROCESS stimuli_Constant_out1_process;

  stimuli_Constant_out1_1: PROCESS (rawData_RX_CRS, rdEnb, tb_enb_delay)
  BEGIN
    IF tb_enb_delay = '0' THEN
      RX_CRS_offset <= '0';
    ELSIF rdEnb = '0' THEN
      RX_CRS_offset <= holdData_RX_CRS;
    ELSE
      RX_CRS_offset <= rawData_RX_CRS;
    END IF;
  END PROCESS stimuli_Constant_out1_1;

  RX_CRS <= RX_CRS_offset AFTER 2 ns;

  Data_Type_Conversion6_out1_addr_delay_1 <= FrameGenerator_out1_addr AFTER 1 ns;

  -- Data source for RX_CLK
  RX_CLK_fileread: PROCESS (Data_Type_Conversion6_out1_addr_delay_1, tb_enb_delay, rdEnb)
    FILE fp: TEXT open READ_MODE is "RX_CLK.dat";
    VARIABLE l: LINE;
    VARIABLE read_data: std_logic;

  BEGIN
    IF tb_enb_delay /= '1' THEN
      read_data := '0';
    ELSIF rdEnb = '1' AND NOT ENDFILE(fp) THEN
      READLINE(fp, l);
      READ(l, read_data);
    END IF;
    RX_CLKraw <= read_data;
  END PROCESS RX_CLK_fileread;

  
  rawData_RX_CLK <= '0' WHEN rdEnb = '0' ELSE
      RX_CLKraw;

  -- holdData reg for Data_Type_Conversion6_out1
  stimuli_Data_Type_Conversion6_out1_process: PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        holdData_RX_CLK <= '0';
      ELSE
        holdData_RX_CLK <= rawData_RX_CLK;
      END IF;
    END IF;
  END PROCESS stimuli_Data_Type_Conversion6_out1_process;

  stimuli_Data_Type_Conversion6_out1_1: PROCESS (rawData_RX_CLK, rdEnb, tb_enb_delay)
  BEGIN
    IF tb_enb_delay = '0' THEN
      RX_CLK_offset <= '0';
    ELSIF rdEnb = '0' THEN
      RX_CLK_offset <= holdData_RX_CLK;
    ELSE
      RX_CLK_offset <= rawData_RX_CLK;
    END IF;
  END PROCESS stimuli_Data_Type_Conversion6_out1_1;

  RX_CLK <= RX_CLK_offset AFTER 2 ns;

  RX_CLK_1 <= RX_CLK;

  FrameGenerator_out5_addr_delay_1 <= FrameGenerator_out1_addr AFTER 1 ns;

  -- Data source for RX_DV
  RX_DV_fileread: PROCESS (FrameGenerator_out5_addr_delay_1, tb_enb_delay, rdEnb)
    FILE fp: TEXT open READ_MODE is "RX_DV.dat";
    VARIABLE l: LINE;
    VARIABLE read_data: std_logic;

  BEGIN
    IF tb_enb_delay /= '1' THEN
      read_data := '0';
    ELSIF rdEnb = '1' AND NOT ENDFILE(fp) THEN
      READLINE(fp, l);
      READ(l, read_data);
    END IF;
    RX_DVraw <= read_data;
  END PROCESS RX_DV_fileread;

  
  rawData_RX_DV <= '0' WHEN rdEnb = '0' ELSE
      RX_DVraw;

  -- holdData reg for FrameGenerator_out5
  stimuli_FrameGenerator_out5_process: PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        holdData_RX_DV <= '0';
      ELSE
        holdData_RX_DV <= rawData_RX_DV;
      END IF;
    END IF;
  END PROCESS stimuli_FrameGenerator_out5_process;

  stimuli_FrameGenerator_out5_1: PROCESS (rawData_RX_DV, rdEnb, tb_enb_delay)
  BEGIN
    IF tb_enb_delay = '0' THEN
      RX_DV_offset <= '0';
    ELSIF rdEnb = '0' THEN
      RX_DV_offset <= holdData_RX_DV;
    ELSE
      RX_DV_offset <= rawData_RX_DV;
    END IF;
  END PROCESS stimuli_FrameGenerator_out5_1;

  RX_DV <= RX_DV_offset AFTER 2 ns;

  FrameGenerator_out4_addr_delay_1 <= FrameGenerator_out1_addr AFTER 1 ns;

  -- Data source for RXD3
  RXD3_fileread: PROCESS (FrameGenerator_out4_addr_delay_1, tb_enb_delay, rdEnb)
    FILE fp: TEXT open READ_MODE is "RXD3.dat";
    VARIABLE l: LINE;
    VARIABLE read_data: std_logic;

  BEGIN
    IF tb_enb_delay /= '1' THEN
      read_data := '0';
    ELSIF rdEnb = '1' AND NOT ENDFILE(fp) THEN
      READLINE(fp, l);
      READ(l, read_data);
    END IF;
    RXD3raw <= read_data;
  END PROCESS RXD3_fileread;

  
  rawData_RXD3 <= '0' WHEN rdEnb = '0' ELSE
      RXD3raw;

  -- holdData reg for FrameGenerator_out4
  stimuli_FrameGenerator_out4_process: PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        holdData_RXD3 <= '0';
      ELSE
        holdData_RXD3 <= rawData_RXD3;
      END IF;
    END IF;
  END PROCESS stimuli_FrameGenerator_out4_process;

  stimuli_FrameGenerator_out4_1: PROCESS (rawData_RXD3, rdEnb, tb_enb_delay)
  BEGIN
    IF tb_enb_delay = '0' THEN
      RXD3_offset <= '0';
    ELSIF rdEnb = '0' THEN
      RXD3_offset <= holdData_RXD3;
    ELSE
      RXD3_offset <= rawData_RXD3;
    END IF;
  END PROCESS stimuli_FrameGenerator_out4_1;

  RXD3 <= RXD3_offset AFTER 2 ns;

  FrameGenerator_out3_addr_delay_1 <= FrameGenerator_out1_addr AFTER 1 ns;

  -- Data source for RXD2
  RXD2_fileread: PROCESS (FrameGenerator_out3_addr_delay_1, tb_enb_delay, rdEnb)
    FILE fp: TEXT open READ_MODE is "RXD2.dat";
    VARIABLE l: LINE;
    VARIABLE read_data: std_logic;

  BEGIN
    IF tb_enb_delay /= '1' THEN
      read_data := '0';
    ELSIF rdEnb = '1' AND NOT ENDFILE(fp) THEN
      READLINE(fp, l);
      READ(l, read_data);
    END IF;
    RXD2raw <= read_data;
  END PROCESS RXD2_fileread;

  
  rawData_RXD2 <= '0' WHEN rdEnb = '0' ELSE
      RXD2raw;

  -- holdData reg for FrameGenerator_out3
  stimuli_FrameGenerator_out3_process: PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        holdData_RXD2 <= '0';
      ELSE
        holdData_RXD2 <= rawData_RXD2;
      END IF;
    END IF;
  END PROCESS stimuli_FrameGenerator_out3_process;

  stimuli_FrameGenerator_out3_1: PROCESS (rawData_RXD2, rdEnb, tb_enb_delay)
  BEGIN
    IF tb_enb_delay = '0' THEN
      RXD2_offset <= '0';
    ELSIF rdEnb = '0' THEN
      RXD2_offset <= holdData_RXD2;
    ELSE
      RXD2_offset <= rawData_RXD2;
    END IF;
  END PROCESS stimuli_FrameGenerator_out3_1;

  RXD2 <= RXD2_offset AFTER 2 ns;

  FrameGenerator_out2_addr_delay_1 <= FrameGenerator_out1_addr AFTER 1 ns;

  -- Data source for RXD1
  RXD1_fileread: PROCESS (FrameGenerator_out2_addr_delay_1, tb_enb_delay, rdEnb)
    FILE fp: TEXT open READ_MODE is "RXD1.dat";
    VARIABLE l: LINE;
    VARIABLE read_data: std_logic;

  BEGIN
    IF tb_enb_delay /= '1' THEN
      read_data := '0';
    ELSIF rdEnb = '1' AND NOT ENDFILE(fp) THEN
      READLINE(fp, l);
      READ(l, read_data);
    END IF;
    RXD1raw <= read_data;
  END PROCESS RXD1_fileread;

  
  rawData_RXD1 <= '0' WHEN rdEnb = '0' ELSE
      RXD1raw;

  -- holdData reg for FrameGenerator_out2
  stimuli_FrameGenerator_out2_process: PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        holdData_RXD1 <= '0';
      ELSE
        holdData_RXD1 <= rawData_RXD1;
      END IF;
    END IF;
  END PROCESS stimuli_FrameGenerator_out2_process;

  stimuli_FrameGenerator_out2_1: PROCESS (rawData_RXD1, rdEnb, tb_enb_delay)
  BEGIN
    IF tb_enb_delay = '0' THEN
      RXD1_offset <= '0';
    ELSIF rdEnb = '0' THEN
      RXD1_offset <= holdData_RXD1;
    ELSE
      RXD1_offset <= rawData_RXD1;
    END IF;
  END PROCESS stimuli_FrameGenerator_out2_1;

  RXD1 <= RXD1_offset AFTER 2 ns;

  
  FrameGenerator_out1_active <= '1' WHEN FrameGenerator_out1_addr /= to_unsigned(16#3A98#, 14) ELSE
      '0';

  FrameGenerator_out1_enb <= FrameGenerator_out1_active AND (rdEnb AND tb_enb_delay);

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 15000
  FrameGenerator_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        FrameGenerator_out1_addr <= to_unsigned(16#0000#, 14);
      ELSIF FrameGenerator_out1_enb = '1' THEN
        IF FrameGenerator_out1_addr >= to_unsigned(16#3A98#, 14) THEN 
          FrameGenerator_out1_addr <= to_unsigned(16#0000#, 14);
        ELSE 
          FrameGenerator_out1_addr <= FrameGenerator_out1_addr + to_unsigned(16#0001#, 14);
        END IF;
      END IF;
    END IF;
  END PROCESS FrameGenerator_process;


  FrameGenerator_out1_addr_delay_1 <= FrameGenerator_out1_addr AFTER 1 ns;

  -- Data source for RXD0
  RXD0_fileread: PROCESS (FrameGenerator_out1_addr_delay_1, tb_enb_delay, rdEnb)
    FILE fp: TEXT open READ_MODE is "RXD0.dat";
    VARIABLE l: LINE;
    VARIABLE read_data: std_logic;

  BEGIN
    IF tb_enb_delay /= '1' THEN
      read_data := '0';
    ELSIF rdEnb = '1' AND NOT ENDFILE(fp) THEN
      READLINE(fp, l);
      READ(l, read_data);
    END IF;
    RXD0raw <= read_data;
  END PROCESS RXD0_fileread;

  
  rawData_RXD0 <= '0' WHEN rdEnb = '0' ELSE
      RXD0raw;

  -- holdData reg for FrameGenerator_out1
  stimuli_FrameGenerator_out1_process: PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        holdData_RXD0 <= '0';
      ELSE
        holdData_RXD0 <= rawData_RXD0;
      END IF;
    END IF;
  END PROCESS stimuli_FrameGenerator_out1_process;

  stimuli_FrameGenerator_out1_1: PROCESS (rawData_RXD0, rdEnb, tb_enb_delay)
  BEGIN
    IF tb_enb_delay = '0' THEN
      RXD0_offset <= '0';
    ELSIF rdEnb = '0' THEN
      RXD0_offset <= holdData_RXD0;
    ELSE
      RXD0_offset <= rawData_RXD0;
    END IF;
  END PROCESS stimuli_FrameGenerator_out1_1;

  RXD0 <= RXD0_offset AFTER 2 ns;

  snkDonen <=  NOT snkDone;

  tb_enb <= RSTn AND snkDonen;

  -- Delay inside enable generation: register depth 1
  u_enable_delay_process: PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        tb_enb_delay <= '0';
      ELSE
        tb_enb_delay <= tb_enb;
      END IF;
    END IF;
  END PROCESS u_enable_delay_process;

  
  rdEnb <= tb_enb_delay WHEN snkDone = '0' ELSE
      '0';

  CLK_EN <= rdEnb AFTER 2 ns;

  RSTn_gen: PROCESS 
  BEGIN
    RSTn <= '0';
    WAIT FOR 20 ns;
    WAIT UNTIL rising_edge(CLK);
    WAIT FOR 2 ns;
    RSTn <= '1';
    WAIT;
  END PROCESS RSTn_gen;

  CLK_gen: PROCESS 
  BEGIN
    CLK <= '1';
    WAIT FOR 5 ns;
    CLK <= '0';
    WAIT FOR 5 ns;
    IF snkDone = '1' THEN
      CLK <= '1';
      WAIT FOR 5 ns;
      CLK <= '0';
      WAIT FOR 5 ns;
      WAIT;
    END IF;
  END PROCESS CLK_gen;

  TXD0_enb <= CLK_EN_OUT AND TXD0_active;

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 15000
  c_3_process : PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        TXD0_addr <= to_unsigned(16#0000#, 14);
      ELSIF TXD0_enb = '1' THEN
        IF TXD0_addr >= to_unsigned(16#3A98#, 14) THEN 
          TXD0_addr <= to_unsigned(16#0000#, 14);
        ELSE 
          TXD0_addr <= TXD0_addr + to_unsigned(16#0001#, 14);
        END IF;
      END IF;
    END IF;
  END PROCESS c_3_process;


  
  TXD0_lastAddr <= '1' WHEN TXD0_addr >= to_unsigned(16#3A98#, 14) ELSE
      '0';

  TXD0_done <= TXD0_lastAddr AND RSTn;

  -- Delay to allow last sim cycle to complete
  checkDone_1_process: PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF RSTn = '0' THEN
        check1_done <= '0';
      ELSIF TXD0_done_enb = '1' THEN
        check1_done <= TXD0_done;
      END IF;
    END IF;
  END PROCESS checkDone_1_process;

  snkDone <= check12_done AND (check11_done AND (check10_done AND (check9_done AND (check8_done AND (check7_done AND (check6_done AND (check5_done AND (check4_done AND (check3_done AND (check1_done AND check2_done))))))))));

  TXD0_addr_delay_1 <= TXD0_addr AFTER 1 ns;

  -- Data source for TXD0_expected
  TXD0_expected_fileread: PROCESS (TXD0_addr_delay_1, tb_enb_delay, CLK_EN_OUT)
    FILE fp: TEXT open READ_MODE is "TXD0_expected.dat";
    VARIABLE l: LINE;
    VARIABLE read_data: std_logic;

  BEGIN
    IF tb_enb_delay /= '1' THEN
      read_data := '0';
    ELSIF CLK_EN_OUT = '1' AND NOT ENDFILE(fp) THEN
      READLINE(fp, l);
      READ(l, read_data);
    END IF;
    TXD0_expected <= read_data;
  END PROCESS TXD0_expected_fileread;

  TXD0_ref <= TXD0_expected;

  TXD0_checker: PROCESS (CLK, RSTn)
  BEGIN
    IF RSTn = '0' THEN
      TXD0_testFailure <= '0';
    ELSIF rising_edge(CLK) THEN
      IF CLK_EN_OUT = '1' AND TXD0 /= TXD0_ref THEN
        TXD0_testFailure <= '1';
        ASSERT FALSE
          REPORT "Error in TXD0: Expected " & to_hex(TXD0_ref) & (" Actual " & to_hex(TXD0))
          SEVERITY ERROR;
      END IF;
    END IF;
  END PROCESS TXD0_checker;

  TXD1_addr_delay_1 <= TXD0_addr AFTER 1 ns;

  -- Data source for TXD1_expected
  TXD1_expected_fileread: PROCESS (TXD1_addr_delay_1, tb_enb_delay, CLK_EN_OUT)
    FILE fp: TEXT open READ_MODE is "TXD1_expected.dat";
    VARIABLE l: LINE;
    VARIABLE read_data: std_logic;

  BEGIN
    IF tb_enb_delay /= '1' THEN
      read_data := '0';
    ELSIF CLK_EN_OUT = '1' AND NOT ENDFILE(fp) THEN
      READLINE(fp, l);
      READ(l, read_data);
    END IF;
    TXD1_expected <= read_data;
  END PROCESS TXD1_expected_fileread;

  TXD1_ref <= TXD1_expected;

  TXD1_checker: PROCESS (CLK, RSTn)
  BEGIN
    IF RSTn = '0' THEN
      TXD1_testFailure <= '0';
    ELSIF rising_edge(CLK) THEN
      IF CLK_EN_OUT = '1' AND TXD1 /= TXD1_ref THEN
        TXD1_testFailure <= '1';
        ASSERT FALSE
          REPORT "Error in TXD1: Expected " & to_hex(TXD1_ref) & (" Actual " & to_hex(TXD1))
          SEVERITY ERROR;
      END IF;
    END IF;
  END PROCESS TXD1_checker;

  TXD2_addr_delay_1 <= TXD0_addr AFTER 1 ns;

  -- Data source for TXD2_expected
  TXD2_expected_fileread: PROCESS (TXD2_addr_delay_1, tb_enb_delay, CLK_EN_OUT)
    FILE fp: TEXT open READ_MODE is "TXD2_expected.dat";
    VARIABLE l: LINE;
    VARIABLE read_data: std_logic;

  BEGIN
    IF tb_enb_delay /= '1' THEN
      read_data := '0';
    ELSIF CLK_EN_OUT = '1' AND NOT ENDFILE(fp) THEN
      READLINE(fp, l);
      READ(l, read_data);
    END IF;
    TXD2_expected <= read_data;
  END PROCESS TXD2_expected_fileread;

  TXD2_ref <= TXD2_expected;

  TXD2_checker: PROCESS (CLK, RSTn)
  BEGIN
    IF RSTn = '0' THEN
      TXD2_testFailure <= '0';
    ELSIF rising_edge(CLK) THEN
      IF CLK_EN_OUT = '1' AND TXD2 /= TXD2_ref THEN
        TXD2_testFailure <= '1';
        ASSERT FALSE
          REPORT "Error in TXD2: Expected " & to_hex(TXD2_ref) & (" Actual " & to_hex(TXD2))
          SEVERITY ERROR;
      END IF;
    END IF;
  END PROCESS TXD2_checker;

  TXD3_addr_delay_1 <= TXD0_addr AFTER 1 ns;

  -- Data source for TXD3_expected
  TXD3_expected_fileread: PROCESS (TXD3_addr_delay_1, tb_enb_delay, CLK_EN_OUT)
    FILE fp: TEXT open READ_MODE is "TXD3_expected.dat";
    VARIABLE l: LINE;
    VARIABLE read_data: std_logic;

  BEGIN
    IF tb_enb_delay /= '1' THEN
      read_data := '0';
    ELSIF CLK_EN_OUT = '1' AND NOT ENDFILE(fp) THEN
      READLINE(fp, l);
      READ(l, read_data);
    END IF;
    TXD3_expected <= read_data;
  END PROCESS TXD3_expected_fileread;

  TXD3_ref <= TXD3_expected;

  TXD3_checker: PROCESS (CLK, RSTn)
  BEGIN
    IF RSTn = '0' THEN
      TXD3_testFailure <= '0';
    ELSIF rising_edge(CLK) THEN
      IF CLK_EN_OUT = '1' AND TXD3 /= TXD3_ref THEN
        TXD3_testFailure <= '1';
        ASSERT FALSE
          REPORT "Error in TXD3: Expected " & to_hex(TXD3_ref) & (" Actual " & to_hex(TXD3))
          SEVERITY ERROR;
      END IF;
    END IF;
  END PROCESS TXD3_checker;

  TX_EN_addr_delay_1 <= TXD0_addr AFTER 1 ns;

  -- Data source for TX_EN_expected
  TX_EN_expected_fileread: PROCESS (TX_EN_addr_delay_1, tb_enb_delay, CLK_EN_OUT)
    FILE fp: TEXT open READ_MODE is "TX_EN_expected.dat";
    VARIABLE l: LINE;
    VARIABLE read_data: std_logic;

  BEGIN
    IF tb_enb_delay /= '1' THEN
      read_data := '0';
    ELSIF CLK_EN_OUT = '1' AND NOT ENDFILE(fp) THEN
      READLINE(fp, l);
      READ(l, read_data);
    END IF;
    TX_EN_expected <= read_data;
  END PROCESS TX_EN_expected_fileread;

  TX_EN_ref <= TX_EN_expected;

  TX_EN_checker: PROCESS (CLK, RSTn)
  BEGIN
    IF RSTn = '0' THEN
      TX_EN_testFailure <= '0';
    ELSIF rising_edge(CLK) THEN
      IF CLK_EN_OUT = '1' AND TX_EN /= TX_EN_ref THEN
        TX_EN_testFailure <= '1';
        ASSERT FALSE
          REPORT "Error in TX_EN: Expected " & to_hex(TX_EN_ref) & (" Actual " & to_hex(TX_EN))
          SEVERITY ERROR;
      END IF;
    END IF;
  END PROCESS TX_EN_checker;

  ETH_RST_N_addr_delay_1 <= TXD0_addr AFTER 1 ns;

  -- Data source for ETH_RST_N_expected
  ETH_RST_N_expected_fileread: PROCESS (ETH_RST_N_addr_delay_1, tb_enb_delay, CLK_EN_OUT)
    FILE fp: TEXT open READ_MODE is "ETH_RST_N_expected.dat";
    VARIABLE l: LINE;
    VARIABLE read_data: std_logic;

  BEGIN
    IF tb_enb_delay /= '1' THEN
      read_data := '0';
    ELSIF CLK_EN_OUT = '1' AND NOT ENDFILE(fp) THEN
      READLINE(fp, l);
      READ(l, read_data);
    END IF;
    ETH_RST_N_expected <= read_data;
  END PROCESS ETH_RST_N_expected_fileread;

  ETH_RST_N_ref <= ETH_RST_N_expected;

  ETH_RST_N_checker: PROCESS (CLK, RSTn)
  BEGIN
    IF RSTn = '0' THEN
      ETH_RST_N_testFailure <= '0';
    ELSIF rising_edge(CLK) THEN
      IF CLK_EN_OUT = '1' AND ETH_RST_N /= ETH_RST_N_ref THEN
        ETH_RST_N_testFailure <= '1';
        ASSERT FALSE
          REPORT "Error in ETH_RST_N: Expected " & to_hex(ETH_RST_N_ref) & (" Actual " & to_hex(ETH_RST_N))
          SEVERITY ERROR;
      END IF;
    END IF;
  END PROCESS ETH_RST_N_checker;

  MDC_addr_delay_1 <= TXD0_addr AFTER 1 ns;

  -- Data source for MDC_expected
  MDC_expected_fileread: PROCESS (MDC_addr_delay_1, tb_enb_delay, CLK_EN_OUT)
    FILE fp: TEXT open READ_MODE is "MDC_expected.dat";
    VARIABLE l: LINE;
    VARIABLE read_data: std_logic;

  BEGIN
    IF tb_enb_delay /= '1' THEN
      read_data := '0';
    ELSIF CLK_EN_OUT = '1' AND NOT ENDFILE(fp) THEN
      READLINE(fp, l);
      READ(l, read_data);
    END IF;
    MDC_expected <= read_data;
  END PROCESS MDC_expected_fileread;

  MDC_ref <= MDC_expected;

  MDC_checker: PROCESS (CLK, RSTn)
  BEGIN
    IF RSTn = '0' THEN
      MDC_testFailure <= '0';
    ELSIF rising_edge(CLK) THEN
      IF CLK_EN_OUT = '1' AND MDC /= MDC_ref THEN
        MDC_testFailure <= '1';
        ASSERT FALSE
          REPORT "Error in MDC: Expected " & to_hex(MDC_ref) & (" Actual " & to_hex(MDC))
          SEVERITY ERROR;
      END IF;
    END IF;
  END PROCESS MDC_checker;

  MDIO_addr_delay_1 <= TXD0_addr AFTER 1 ns;

  -- Data source for MDIO_expected
  MDIO_expected_fileread: PROCESS (MDIO_addr_delay_1, tb_enb_delay, CLK_EN_OUT)
    FILE fp: TEXT open READ_MODE is "MDIO_expected.dat";
    VARIABLE l: LINE;
    VARIABLE read_data: std_logic;

  BEGIN
    IF tb_enb_delay /= '1' THEN
      read_data := '0';
    ELSIF CLK_EN_OUT = '1' AND NOT ENDFILE(fp) THEN
      READLINE(fp, l);
      READ(l, read_data);
    END IF;
    MDIO_expected <= read_data;
  END PROCESS MDIO_expected_fileread;

  MDIO_ref <= MDIO_expected;

  MDIO_checker: PROCESS (CLK, RSTn)
  BEGIN
    IF RSTn = '0' THEN
      MDIO_testFailure <= '0';
    ELSIF rising_edge(CLK) THEN
      IF CLK_EN_OUT = '1' AND MDIO /= MDIO_ref THEN
        MDIO_testFailure <= '1';
        ASSERT FALSE
          REPORT "Error in MDIO: Expected " & to_hex(MDIO_ref) & (" Actual " & to_hex(MDIO))
          SEVERITY ERROR;
      END IF;
    END IF;
  END PROCESS MDIO_checker;

  LED1_addr_delay_1 <= TXD0_addr AFTER 1 ns;

  -- Data source for LED1_expected
  LED1_expected_fileread: PROCESS (LED1_addr_delay_1, tb_enb_delay, CLK_EN_OUT)
    FILE fp: TEXT open READ_MODE is "LED1_expected.dat";
    VARIABLE l: LINE;
    VARIABLE read_data: std_logic;

  BEGIN
    IF tb_enb_delay /= '1' THEN
      read_data := '0';
    ELSIF CLK_EN_OUT = '1' AND NOT ENDFILE(fp) THEN
      READLINE(fp, l);
      READ(l, read_data);
    END IF;
    LED1_expected <= read_data;
  END PROCESS LED1_expected_fileread;

  LED1_ref <= LED1_expected;

  LED1_checker: PROCESS (CLK, RSTn)
  BEGIN
    IF RSTn = '0' THEN
      LED1_testFailure <= '0';
    ELSIF rising_edge(CLK) THEN
      IF CLK_EN_OUT = '1' AND LED1 /= LED1_ref THEN
        LED1_testFailure <= '1';
        ASSERT FALSE
          REPORT "Error in LED1: Expected " & to_hex(LED1_ref) & (" Actual " & to_hex(LED1))
          SEVERITY ERROR;
      END IF;
    END IF;
  END PROCESS LED1_checker;

  LED2_addr_delay_1 <= TXD0_addr AFTER 1 ns;

  -- Data source for LED2_expected
  LED2_expected_fileread: PROCESS (LED2_addr_delay_1, tb_enb_delay, CLK_EN_OUT)
    FILE fp: TEXT open READ_MODE is "LED2_expected.dat";
    VARIABLE l: LINE;
    VARIABLE read_data: std_logic;

  BEGIN
    IF tb_enb_delay /= '1' THEN
      read_data := '0';
    ELSIF CLK_EN_OUT = '1' AND NOT ENDFILE(fp) THEN
      READLINE(fp, l);
      READ(l, read_data);
    END IF;
    LED2_expected <= read_data;
  END PROCESS LED2_expected_fileread;

  LED2_ref <= LED2_expected;

  LED2_checker: PROCESS (CLK, RSTn)
  BEGIN
    IF RSTn = '0' THEN
      LED2_testFailure <= '0';
    ELSIF rising_edge(CLK) THEN
      IF CLK_EN_OUT = '1' AND LED2 /= LED2_ref THEN
        LED2_testFailure <= '1';
        ASSERT FALSE
          REPORT "Error in LED2: Expected " & to_hex(LED2_ref) & (" Actual " & to_hex(LED2))
          SEVERITY ERROR;
      END IF;
    END IF;
  END PROCESS LED2_checker;

  LED3_addr_delay_1 <= TXD0_addr AFTER 1 ns;

  -- Data source for LED3_expected
  LED3_expected_fileread: PROCESS (LED3_addr_delay_1, tb_enb_delay, CLK_EN_OUT)
    FILE fp: TEXT open READ_MODE is "LED3_expected.dat";
    VARIABLE l: LINE;
    VARIABLE read_data: std_logic;

  BEGIN
    IF tb_enb_delay /= '1' THEN
      read_data := '0';
    ELSIF CLK_EN_OUT = '1' AND NOT ENDFILE(fp) THEN
      READLINE(fp, l);
      READ(l, read_data);
    END IF;
    LED3_expected <= read_data;
  END PROCESS LED3_expected_fileread;

  LED3_ref <= LED3_expected;

  LED3_checker: PROCESS (CLK, RSTn)
  BEGIN
    IF RSTn = '0' THEN
      LED3_testFailure <= '0';
    ELSIF rising_edge(CLK) THEN
      IF CLK_EN_OUT = '1' AND LED3 /= LED3_ref THEN
        LED3_testFailure <= '1';
        ASSERT FALSE
          REPORT "Error in LED3: Expected " & to_hex(LED3_ref) & (" Actual " & to_hex(LED3))
          SEVERITY ERROR;
      END IF;
    END IF;
  END PROCESS LED3_checker;

  LED4_addr_delay_1 <= TXD0_addr AFTER 1 ns;

  -- Data source for LED4_expected
  LED4_expected_fileread: PROCESS (LED4_addr_delay_1, tb_enb_delay, CLK_EN_OUT)
    FILE fp: TEXT open READ_MODE is "LED4_expected.dat";
    VARIABLE l: LINE;
    VARIABLE read_data: std_logic;

  BEGIN
    IF tb_enb_delay /= '1' THEN
      read_data := '0';
    ELSIF CLK_EN_OUT = '1' AND NOT ENDFILE(fp) THEN
      READLINE(fp, l);
      READ(l, read_data);
    END IF;
    LED4_expected <= read_data;
  END PROCESS LED4_expected_fileread;

  LED4_ref <= LED4_expected;

  LED4_checker: PROCESS (CLK, RSTn)
  BEGIN
    IF RSTn = '0' THEN
      LED4_testFailure <= '0';
    ELSIF rising_edge(CLK) THEN
      IF CLK_EN_OUT = '1' AND LED4 /= LED4_ref THEN
        LED4_testFailure <= '1';
        ASSERT FALSE
          REPORT "Error in LED4: Expected " & to_hex(LED4_ref) & (" Actual " & to_hex(LED4))
          SEVERITY ERROR;
      END IF;
    END IF;
  END PROCESS LED4_checker;

  testFailure <= LED4_testFailure OR (LED3_testFailure OR (LED2_testFailure OR (LED1_testFailure OR (MDIO_testFailure OR (MDC_testFailure OR (ETH_RST_N_testFailure OR (TX_EN_testFailure OR (TXD3_testFailure OR (TXD2_testFailure OR (TXD0_testFailure OR TXD1_testFailure))))))))));

  completed_msg: PROCESS (CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF snkDone = '1' THEN
        IF testFailure = '0' THEN
          ASSERT FALSE
            REPORT "**************TEST COMPLETED (PASSED)**************"
            SEVERITY NOTE;
        ELSE
          ASSERT FALSE
            REPORT "**************TEST COMPLETED (FAILED)**************"
            SEVERITY NOTE;
        END IF;
      END IF;
    END IF;
  END PROCESS completed_msg;

END rtl;

