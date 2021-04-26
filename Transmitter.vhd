LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.Trader_pkg.ALL;

ENTITY Transmitter IS
  PORT( tx_clk_fifo_in                    :   IN    std_logic;
        enable                            :   IN    std_logic;
        start                             :   IN    std_logic;
        eth_frame                         :   IN    vector_of_std_logic_vector8(0 TO 321);  -- uint8 [322]
        tx_fifo_full                      :   IN    std_logic;
        state_in                          :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        byte_counter_in                   :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        tx_clk_fifo_out                   :   OUT   std_logic;
        txd0_fifo                         :   OUT   std_logic;
        txd1_fifo                         :   OUT   std_logic;
        txd2_fifo                         :   OUT   std_logic;
        txd3_fifo                         :   OUT   std_logic;
        tx_en_fifo                        :   OUT   std_logic;
        done                              :   OUT   std_logic;
        state_out                         :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
        byte_counter_out                  :   OUT   std_logic_vector(15 DOWNTO 0)  -- uint16
        );
END Transmitter;


ARCHITECTURE rtl OF Transmitter IS

  ATTRIBUTE multstyle : string;

  -- Signals
  SIGNAL eth_frame_unsigned               : vector_of_unsigned8(0 TO 321);  -- uint8 [322]
  SIGNAL state_in_unsigned                : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL byte_counter_in_unsigned         : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL state_out_tmp                    : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL byte_counter_out_tmp             : unsigned(15 DOWNTO 0);  -- uint16

BEGIN
  outputgen: FOR k IN 0 TO 321 GENERATE
    eth_frame_unsigned(k) <= unsigned(eth_frame(k));
  END GENERATE;

  state_in_unsigned <= unsigned(state_in);

  byte_counter_in_unsigned <= unsigned(byte_counter_in);

  Transmitter_1_output : PROCESS (byte_counter_in_unsigned, enable, eth_frame_unsigned, start, state_in_unsigned,
       tx_clk_fifo_in, tx_fifo_full)
    VARIABLE temp : unsigned(7 DOWNTO 0);
    VARIABLE temp_0 : unsigned(7 DOWNTO 0);
    VARIABLE temp_1 : unsigned(7 DOWNTO 0);
    VARIABLE temp_2 : unsigned(7 DOWNTO 0);
    VARIABLE temp_3 : unsigned(7 DOWNTO 0);
    VARIABLE temp_4 : unsigned(7 DOWNTO 0);
    VARIABLE temp_5 : unsigned(7 DOWNTO 0);
    VARIABLE temp_6 : unsigned(7 DOWNTO 0);
    VARIABLE temp_7 : unsigned(7 DOWNTO 0);
    VARIABLE temp_8 : unsigned(7 DOWNTO 0);
    VARIABLE temp_9 : unsigned(7 DOWNTO 0);
    VARIABLE temp_10 : unsigned(7 DOWNTO 0);
    VARIABLE temp_11 : unsigned(7 DOWNTO 0);
    VARIABLE temp_12 : unsigned(7 DOWNTO 0);
    VARIABLE c : unsigned(7 DOWNTO 0);
    VARIABLE c_0 : unsigned(7 DOWNTO 0);
    VARIABLE c_1 : unsigned(7 DOWNTO 0);
    VARIABLE c_2 : unsigned(7 DOWNTO 0);
    VARIABLE c_3 : unsigned(7 DOWNTO 0);
    VARIABLE c_4 : unsigned(7 DOWNTO 0);
    VARIABLE c_5 : unsigned(7 DOWNTO 0);
    VARIABLE c_6 : unsigned(7 DOWNTO 0);
    VARIABLE c_7 : unsigned(7 DOWNTO 0);
    VARIABLE c_8 : unsigned(7 DOWNTO 0);
    VARIABLE c_9 : unsigned(7 DOWNTO 0);
    VARIABLE c_10 : unsigned(7 DOWNTO 0);
    VARIABLE c_11 : unsigned(7 DOWNTO 0);
    VARIABLE c_12 : unsigned(7 DOWNTO 0);
    VARIABLE add_temp : unsigned(16 DOWNTO 0);
    VARIABLE sub_cast : unsigned(15 DOWNTO 0);
    VARIABLE sub_cast_0 : signed(31 DOWNTO 0);
    VARIABLE cast : signed(31 DOWNTO 0);
    VARIABLE cast_0 : signed(31 DOWNTO 0);
    VARIABLE cast_1 : unsigned(7 DOWNTO 0);
    VARIABLE add_temp_0 : unsigned(16 DOWNTO 0);
    VARIABLE sub_cast_1 : unsigned(15 DOWNTO 0);
    VARIABLE sub_cast_2 : signed(31 DOWNTO 0);
    VARIABLE add_temp_1 : unsigned(16 DOWNTO 0);
    VARIABLE sub_cast_3 : unsigned(15 DOWNTO 0);
    VARIABLE sub_cast_4 : signed(31 DOWNTO 0);
    VARIABLE cast_2 : signed(31 DOWNTO 0);
    VARIABLE cast_3 : signed(31 DOWNTO 0);
    VARIABLE cast_4 : unsigned(7 DOWNTO 0);
    VARIABLE add_temp_2 : unsigned(16 DOWNTO 0);
    VARIABLE sub_cast_5 : unsigned(15 DOWNTO 0);
    VARIABLE sub_cast_6 : signed(31 DOWNTO 0);
    VARIABLE cast_5 : signed(31 DOWNTO 0);
    VARIABLE cast_6 : signed(31 DOWNTO 0);
    VARIABLE cast_7 : unsigned(7 DOWNTO 0);
    VARIABLE cast_8 : signed(31 DOWNTO 0);
    VARIABLE cast_9 : signed(31 DOWNTO 0);
    VARIABLE cast_10 : unsigned(7 DOWNTO 0);
    VARIABLE cast_11 : signed(31 DOWNTO 0);
    VARIABLE cast_12 : signed(31 DOWNTO 0);
    VARIABLE cast_13 : unsigned(7 DOWNTO 0);
    VARIABLE add_temp_3 : unsigned(16 DOWNTO 0);
    VARIABLE sub_cast_7 : unsigned(15 DOWNTO 0);
    VARIABLE sub_cast_8 : signed(31 DOWNTO 0);
    VARIABLE add_temp_4 : unsigned(16 DOWNTO 0);
    VARIABLE sub_cast_9 : unsigned(15 DOWNTO 0);
    VARIABLE sub_cast_10 : signed(31 DOWNTO 0);
    VARIABLE cast_14 : signed(31 DOWNTO 0);
    VARIABLE cast_15 : signed(31 DOWNTO 0);
    VARIABLE cast_16 : unsigned(7 DOWNTO 0);
    VARIABLE add_temp_5 : unsigned(16 DOWNTO 0);
    VARIABLE sub_cast_11 : unsigned(15 DOWNTO 0);
    VARIABLE sub_cast_12 : signed(31 DOWNTO 0);
    VARIABLE cast_17 : signed(31 DOWNTO 0);
    VARIABLE cast_18 : signed(31 DOWNTO 0);
    VARIABLE cast_19 : unsigned(7 DOWNTO 0);
    VARIABLE cast_20 : signed(31 DOWNTO 0);
    VARIABLE cast_21 : signed(31 DOWNTO 0);
    VARIABLE cast_22 : unsigned(7 DOWNTO 0);
    VARIABLE cast_23 : signed(31 DOWNTO 0);
    VARIABLE cast_24 : signed(31 DOWNTO 0);
    VARIABLE cast_25 : unsigned(7 DOWNTO 0);
    VARIABLE add_temp_6 : unsigned(16 DOWNTO 0);
    VARIABLE sub_cast_13 : unsigned(15 DOWNTO 0);
    VARIABLE sub_cast_14 : signed(31 DOWNTO 0);
    VARIABLE add_temp_7 : unsigned(16 DOWNTO 0);
    VARIABLE sub_cast_15 : unsigned(15 DOWNTO 0);
    VARIABLE sub_cast_16 : signed(31 DOWNTO 0);
    VARIABLE cast_26 : signed(31 DOWNTO 0);
    VARIABLE cast_27 : signed(31 DOWNTO 0);
    VARIABLE cast_28 : unsigned(7 DOWNTO 0);
    VARIABLE add_temp_8 : unsigned(16 DOWNTO 0);
    VARIABLE sub_cast_17 : unsigned(15 DOWNTO 0);
    VARIABLE sub_cast_18 : signed(31 DOWNTO 0);
    VARIABLE cast_29 : signed(31 DOWNTO 0);
    VARIABLE cast_30 : signed(31 DOWNTO 0);
    VARIABLE cast_31 : unsigned(7 DOWNTO 0);
    VARIABLE cast_32 : signed(31 DOWNTO 0);
    VARIABLE cast_33 : signed(31 DOWNTO 0);
    VARIABLE cast_34 : unsigned(7 DOWNTO 0);
    VARIABLE cast_35 : signed(31 DOWNTO 0);
    VARIABLE cast_36 : signed(31 DOWNTO 0);
    VARIABLE cast_37 : unsigned(7 DOWNTO 0);
    VARIABLE add_temp_9 : unsigned(16 DOWNTO 0);
    VARIABLE sub_cast_19 : unsigned(15 DOWNTO 0);
    VARIABLE sub_cast_20 : signed(31 DOWNTO 0);
    VARIABLE add_temp_10 : unsigned(16 DOWNTO 0);
    VARIABLE sub_cast_21 : unsigned(15 DOWNTO 0);
    VARIABLE sub_cast_22 : signed(31 DOWNTO 0);
    VARIABLE cast_38 : signed(31 DOWNTO 0);
    VARIABLE cast_39 : signed(31 DOWNTO 0);
    VARIABLE cast_40 : unsigned(7 DOWNTO 0);
    VARIABLE add_temp_11 : unsigned(16 DOWNTO 0);
  BEGIN
    -- Transmission sequence: ethernet frame(1st = first byte to transmit) -> ... -> ethernet frame(314th = last byte to transmit),
    -- D0D1D2D3 -> D5D6D7D8 (least 4 bits and then most 4 bits in each byte)
    CASE state_in_unsigned IS
      WHEN "00000000" =>
        IF start = '1' THEN 
          state_out_tmp <= to_unsigned(16#01#, 8);
          done <= '0';
        ELSE 
          state_out_tmp <= state_in_unsigned;
          done <= '1';
        END IF;
        IF ( NOT tx_fifo_full) = '1' THEN 
          tx_clk_fifo_out <=  NOT tx_clk_fifo_in;
        ELSE 
          tx_clk_fifo_out <= '0';
        END IF;
        tx_en_fifo <= '0';
        txd0_fifo <= '0';
        txd1_fifo <= '0';
        txd2_fifo <= '0';
        txd3_fifo <= '0';
        byte_counter_out_tmp <= to_unsigned(16#0000#, 16);
      WHEN "00000001" =>
        IF enable = '1' THEN 
          state_out_tmp <= to_unsigned(16#02#, 8);
          done <= '0';
        ELSE 
          state_out_tmp <= to_unsigned(16#06#, 8);
          done <= '1';
        END IF;
        IF ( NOT tx_fifo_full) = '1' THEN 
          tx_clk_fifo_out <=  NOT tx_clk_fifo_in;
        ELSE 
          tx_clk_fifo_out <= '0';
        END IF;
        tx_en_fifo <= '0';
        txd0_fifo <= '0';
        txd1_fifo <= '0';
        txd2_fifo <= '0';
        txd3_fifo <= '0';
        byte_counter_out_tmp <= to_unsigned(16#0000#, 16);
      WHEN "00000010" =>
        IF byte_counter_in_unsigned < to_unsigned(16#00000142#, 16) THEN 
          IF ( NOT tx_fifo_full) = '1' THEN 
            state_out_tmp <= to_unsigned(16#03#, 8);
          ELSE 
            state_out_tmp <= state_in_unsigned;
          END IF;
          tx_clk_fifo_out <= '0';
          tx_en_fifo <= '1';
          cast_2 := signed(resize(eth_frame_unsigned(to_integer(byte_counter_in_unsigned)), 32));
          cast_3 := cast_2 AND to_signed(16#00000001#, 32);
          cast_4 := unsigned(cast_3(7 DOWNTO 0));
          IF cast_4 /= to_unsigned(16#00000000#, 8) THEN 
            txd0_fifo <= '1';
          ELSE 
            txd0_fifo <= '0';
          END IF;
          temp_4 := eth_frame_unsigned(to_integer(byte_counter_in_unsigned));
          c_2 := temp_4 srl 1;
          cast_14 := signed(resize(c_2, 32));
          cast_15 := cast_14 AND to_signed(16#00000001#, 32);
          cast_16 := unsigned(cast_15(7 DOWNTO 0));
          IF cast_16 /= to_unsigned(16#00000000#, 8) THEN 
            txd1_fifo <= '1';
          ELSE 
            txd1_fifo <= '0';
          END IF;
          temp_8 := eth_frame_unsigned(to_integer(byte_counter_in_unsigned));
          c_6 := temp_8 srl 2;
          cast_26 := signed(resize(c_6, 32));
          cast_27 := cast_26 AND to_signed(16#00000001#, 32);
          cast_28 := unsigned(cast_27(7 DOWNTO 0));
          IF cast_28 /= to_unsigned(16#00000000#, 8) THEN 
            txd2_fifo <= '1';
          ELSE 
            txd2_fifo <= '0';
          END IF;
          temp_12 := eth_frame_unsigned(to_integer(byte_counter_in_unsigned));
          c_10 := temp_12 srl 3;
          cast_38 := signed(resize(c_10, 32));
          cast_39 := cast_38 AND to_signed(16#00000001#, 32);
          cast_40 := unsigned(cast_39(7 DOWNTO 0));
          IF cast_40 /= to_unsigned(16#00000000#, 8) THEN 
            txd3_fifo <= '1';
          ELSE 
            txd3_fifo <= '0';
          END IF;
          done <= '0';
          byte_counter_out_tmp <= byte_counter_in_unsigned;
        ELSE 
          tx_clk_fifo_out <= '0';
          tx_en_fifo <= '0';
          txd0_fifo <= '0';
          txd1_fifo <= '0';
          txd2_fifo <= '0';
          txd3_fifo <= '0';
          done <= '1';
          state_out_tmp <= to_unsigned(16#06#, 8);
          byte_counter_out_tmp <= to_unsigned(16#0000#, 16);
        END IF;
      WHEN "00000011" =>
        IF ( NOT tx_fifo_full) = '1' THEN 
          tx_clk_fifo_out <= '1';
          state_out_tmp <= to_unsigned(16#04#, 8);
        ELSE 
          tx_clk_fifo_out <= '0';
          state_out_tmp <= state_in_unsigned;
        END IF;
        tx_en_fifo <= '1';
        add_temp := resize(byte_counter_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp(16) /= '0' THEN 
          sub_cast := X"FFFF";
        ELSE 
          sub_cast := add_temp(15 DOWNTO 0);
        END IF;
        sub_cast_0 := signed(resize(sub_cast, 32));
        cast := signed(resize(eth_frame_unsigned(to_integer(sub_cast_0 - 1)), 32));
        cast_0 := cast AND to_signed(16#00000001#, 32);
        cast_1 := unsigned(cast_0(7 DOWNTO 0));
        IF cast_1 /= to_unsigned(16#00000000#, 8) THEN 
          txd0_fifo <= '1';
        ELSE 
          txd0_fifo <= '0';
        END IF;
        add_temp_2 := resize(byte_counter_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_2(16) /= '0' THEN 
          sub_cast_5 := X"FFFF";
        ELSE 
          sub_cast_5 := add_temp_2(15 DOWNTO 0);
        END IF;
        sub_cast_6 := signed(resize(sub_cast_5, 32));
        temp_1 := eth_frame_unsigned(to_integer(sub_cast_6 - 1));
        c_1 := temp_1 srl 1;
        cast_11 := signed(resize(c_1, 32));
        cast_12 := cast_11 AND to_signed(16#00000001#, 32);
        cast_13 := unsigned(cast_12(7 DOWNTO 0));
        IF cast_13 /= to_unsigned(16#00000000#, 8) THEN 
          txd1_fifo <= '1';
        ELSE 
          txd1_fifo <= '0';
        END IF;
        add_temp_5 := resize(byte_counter_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_5(16) /= '0' THEN 
          sub_cast_11 := X"FFFF";
        ELSE 
          sub_cast_11 := add_temp_5(15 DOWNTO 0);
        END IF;
        sub_cast_12 := signed(resize(sub_cast_11, 32));
        temp_5 := eth_frame_unsigned(to_integer(sub_cast_12 - 1));
        c_5 := temp_5 srl 2;
        cast_23 := signed(resize(c_5, 32));
        cast_24 := cast_23 AND to_signed(16#00000001#, 32);
        cast_25 := unsigned(cast_24(7 DOWNTO 0));
        IF cast_25 /= to_unsigned(16#00000000#, 8) THEN 
          txd2_fifo <= '1';
        ELSE 
          txd2_fifo <= '0';
        END IF;
        add_temp_8 := resize(byte_counter_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_8(16) /= '0' THEN 
          sub_cast_17 := X"FFFF";
        ELSE 
          sub_cast_17 := add_temp_8(15 DOWNTO 0);
        END IF;
        sub_cast_18 := signed(resize(sub_cast_17, 32));
        temp_9 := eth_frame_unsigned(to_integer(sub_cast_18 - 1));
        c_9 := temp_9 srl 3;
        cast_35 := signed(resize(c_9, 32));
        cast_36 := cast_35 AND to_signed(16#00000001#, 32);
        cast_37 := unsigned(cast_36(7 DOWNTO 0));
        IF cast_37 /= to_unsigned(16#00000000#, 8) THEN 
          txd3_fifo <= '1';
        ELSE 
          txd3_fifo <= '0';
        END IF;
        done <= '0';
        byte_counter_out_tmp <= byte_counter_in_unsigned;
      WHEN "00000100" =>
        IF ( NOT tx_fifo_full) = '1' THEN 
          state_out_tmp <= to_unsigned(16#05#, 8);
        ELSE 
          state_out_tmp <= state_in_unsigned;
        END IF;
        tx_clk_fifo_out <= '0';
        tx_en_fifo <= '1';
        add_temp_0 := resize(byte_counter_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_0(16) /= '0' THEN 
          sub_cast_1 := X"FFFF";
        ELSE 
          sub_cast_1 := add_temp_0(15 DOWNTO 0);
        END IF;
        sub_cast_2 := signed(resize(sub_cast_1, 32));
        temp := eth_frame_unsigned(to_integer(sub_cast_2 - 1));
        c := temp srl 4;
        cast_5 := signed(resize(c, 32));
        cast_6 := cast_5 AND to_signed(16#00000001#, 32);
        cast_7 := unsigned(cast_6(7 DOWNTO 0));
        IF cast_7 /= to_unsigned(16#00000000#, 8) THEN 
          txd0_fifo <= '1';
        ELSE 
          txd0_fifo <= '0';
        END IF;
        add_temp_3 := resize(byte_counter_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_3(16) /= '0' THEN 
          sub_cast_7 := X"FFFF";
        ELSE 
          sub_cast_7 := add_temp_3(15 DOWNTO 0);
        END IF;
        sub_cast_8 := signed(resize(sub_cast_7, 32));
        temp_2 := eth_frame_unsigned(to_integer(sub_cast_8 - 1));
        c_3 := temp_2 srl 5;
        cast_17 := signed(resize(c_3, 32));
        cast_18 := cast_17 AND to_signed(16#00000001#, 32);
        cast_19 := unsigned(cast_18(7 DOWNTO 0));
        IF cast_19 /= to_unsigned(16#00000000#, 8) THEN 
          txd1_fifo <= '1';
        ELSE 
          txd1_fifo <= '0';
        END IF;
        add_temp_6 := resize(byte_counter_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_6(16) /= '0' THEN 
          sub_cast_13 := X"FFFF";
        ELSE 
          sub_cast_13 := add_temp_6(15 DOWNTO 0);
        END IF;
        sub_cast_14 := signed(resize(sub_cast_13, 32));
        temp_6 := eth_frame_unsigned(to_integer(sub_cast_14 - 1));
        c_7 := temp_6 srl 6;
        cast_29 := signed(resize(c_7, 32));
        cast_30 := cast_29 AND to_signed(16#00000001#, 32);
        cast_31 := unsigned(cast_30(7 DOWNTO 0));
        IF cast_31 /= to_unsigned(16#00000000#, 8) THEN 
          txd2_fifo <= '1';
        ELSE 
          txd2_fifo <= '0';
        END IF;
        add_temp_9 := resize(byte_counter_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_9(16) /= '0' THEN 
          sub_cast_19 := X"FFFF";
        ELSE 
          sub_cast_19 := add_temp_9(15 DOWNTO 0);
        END IF;
        sub_cast_20 := signed(resize(sub_cast_19, 32));
        temp_10 := eth_frame_unsigned(to_integer(sub_cast_20 - 1));
        c_11 := temp_10 srl 7;
        IF c_11 /= to_unsigned(16#00000000#, 8) THEN 
          txd3_fifo <= '1';
        ELSE 
          txd3_fifo <= '0';
        END IF;
        done <= '0';
        byte_counter_out_tmp <= byte_counter_in_unsigned;
      WHEN "00000101" =>
        IF ( NOT tx_fifo_full) = '1' THEN 
          tx_clk_fifo_out <= '1';
          state_out_tmp <= to_unsigned(16#02#, 8);
        ELSE 
          tx_clk_fifo_out <= '0';
          state_out_tmp <= state_in_unsigned;
        END IF;
        tx_en_fifo <= '1';
        add_temp_1 := resize(byte_counter_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_1(16) /= '0' THEN 
          sub_cast_3 := X"FFFF";
        ELSE 
          sub_cast_3 := add_temp_1(15 DOWNTO 0);
        END IF;
        sub_cast_4 := signed(resize(sub_cast_3, 32));
        temp_0 := eth_frame_unsigned(to_integer(sub_cast_4 - 1));
        c_0 := temp_0 srl 4;
        cast_8 := signed(resize(c_0, 32));
        cast_9 := cast_8 AND to_signed(16#00000001#, 32);
        cast_10 := unsigned(cast_9(7 DOWNTO 0));
        IF cast_10 /= to_unsigned(16#00000000#, 8) THEN 
          txd0_fifo <= '1';
        ELSE 
          txd0_fifo <= '0';
        END IF;
        add_temp_4 := resize(byte_counter_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_4(16) /= '0' THEN 
          sub_cast_9 := X"FFFF";
        ELSE 
          sub_cast_9 := add_temp_4(15 DOWNTO 0);
        END IF;
        sub_cast_10 := signed(resize(sub_cast_9, 32));
        temp_3 := eth_frame_unsigned(to_integer(sub_cast_10 - 1));
        c_4 := temp_3 srl 5;
        cast_20 := signed(resize(c_4, 32));
        cast_21 := cast_20 AND to_signed(16#00000001#, 32);
        cast_22 := unsigned(cast_21(7 DOWNTO 0));
        IF cast_22 /= to_unsigned(16#00000000#, 8) THEN 
          txd1_fifo <= '1';
        ELSE 
          txd1_fifo <= '0';
        END IF;
        add_temp_7 := resize(byte_counter_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_7(16) /= '0' THEN 
          sub_cast_15 := X"FFFF";
        ELSE 
          sub_cast_15 := add_temp_7(15 DOWNTO 0);
        END IF;
        sub_cast_16 := signed(resize(sub_cast_15, 32));
        temp_7 := eth_frame_unsigned(to_integer(sub_cast_16 - 1));
        c_8 := temp_7 srl 6;
        cast_32 := signed(resize(c_8, 32));
        cast_33 := cast_32 AND to_signed(16#00000001#, 32);
        cast_34 := unsigned(cast_33(7 DOWNTO 0));
        IF cast_34 /= to_unsigned(16#00000000#, 8) THEN 
          txd2_fifo <= '1';
        ELSE 
          txd2_fifo <= '0';
        END IF;
        add_temp_10 := resize(byte_counter_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_10(16) /= '0' THEN 
          sub_cast_21 := X"FFFF";
        ELSE 
          sub_cast_21 := add_temp_10(15 DOWNTO 0);
        END IF;
        sub_cast_22 := signed(resize(sub_cast_21, 32));
        temp_11 := eth_frame_unsigned(to_integer(sub_cast_22 - 1));
        c_12 := temp_11 srl 7;
        IF c_12 /= to_unsigned(16#00000000#, 8) THEN 
          txd3_fifo <= '1';
        ELSE 
          txd3_fifo <= '0';
        END IF;
        done <= '0';
        add_temp_11 := resize(byte_counter_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_11(16) /= '0' THEN 
          byte_counter_out_tmp <= X"FFFF";
        ELSE 
          byte_counter_out_tmp <= add_temp_11(15 DOWNTO 0);
        END IF;
      WHEN "00000110" =>
        IF start = '1' THEN 
          state_out_tmp <= state_in_unsigned;
        ELSE 
          state_out_tmp <= to_unsigned(16#00#, 8);
        END IF;
        IF ( NOT tx_fifo_full) = '1' THEN 
          tx_clk_fifo_out <=  NOT tx_clk_fifo_in;
        ELSE 
          tx_clk_fifo_out <= '0';
        END IF;
        tx_en_fifo <= '0';
        txd0_fifo <= '0';
        txd1_fifo <= '0';
        txd2_fifo <= '0';
        txd3_fifo <= '0';
        done <= '1';
        byte_counter_out_tmp <= to_unsigned(16#0000#, 16);
      WHEN OTHERS => 
        IF ( NOT tx_fifo_full) = '1' THEN 
          tx_clk_fifo_out <=  NOT tx_clk_fifo_in;
        ELSE 
          tx_clk_fifo_out <= '0';
        END IF;
        tx_en_fifo <= '0';
        txd0_fifo <= '0';
        txd1_fifo <= '0';
        txd2_fifo <= '0';
        txd3_fifo <= '0';
        done <= '0';
        state_out_tmp <= to_unsigned(16#00#, 8);
        byte_counter_out_tmp <= to_unsigned(16#0000#, 16);
    END CASE;
  END PROCESS Transmitter_1_output;


  state_out <= std_logic_vector(state_out_tmp);

  byte_counter_out <= std_logic_vector(byte_counter_out_tmp);

END rtl;

