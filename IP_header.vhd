LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.Trader_pkg.ALL;

ENTITY IP_header IS
  PORT( start                             :   IN    std_logic;
        eth_frame                         :   IN    vector_of_std_logic_vector8(0 TO 309);  -- uint8 [310]
        length_in                         :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        checksum_in                       :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        state_in                          :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        byte_counter_in                   :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        done                              :   OUT   std_logic;
        length_out                        :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
        length_done                       :   OUT   std_logic;
        checksum_out                      :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        state_out                         :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
        byte_counter_out                  :   OUT   std_logic_vector(7 DOWNTO 0)  -- uint8
        );
END IP_header;


ARCHITECTURE rtl OF IP_header IS

  ATTRIBUTE multstyle : string;

  -- Signals
  SIGNAL eth_frame_unsigned               : vector_of_unsigned8(0 TO 309);  -- uint8 [310]
  SIGNAL length_in_unsigned               : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL checksum_in_unsigned             : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL state_in_unsigned                : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL byte_counter_in_unsigned         : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL length_out_tmp                   : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL checksum_out_tmp                 : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL state_out_tmp                    : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL byte_counter_out_tmp             : unsigned(7 DOWNTO 0);  -- uint8

BEGIN
  outputgen: FOR k IN 0 TO 309 GENERATE
    eth_frame_unsigned(k) <= unsigned(eth_frame(k));
  END GENERATE;

  length_in_unsigned <= unsigned(length_in);

  checksum_in_unsigned <= unsigned(checksum_in);

  state_in_unsigned <= unsigned(state_in);

  byte_counter_in_unsigned <= unsigned(byte_counter_in);

  IP_header_1_output : PROCESS (byte_counter_in_unsigned, checksum_in_unsigned, eth_frame_unsigned,
       length_in_unsigned, start, state_in_unsigned)
    VARIABLE temp : unsigned(31 DOWNTO 0);
    VARIABLE temp_0 : unsigned(7 DOWNTO 0);
    VARIABLE temp_1 : unsigned(15 DOWNTO 0);
    VARIABLE temp_2 : unsigned(31 DOWNTO 0);
    VARIABLE c : unsigned(31 DOWNTO 0);
    VARIABLE c_0 : unsigned(15 DOWNTO 0);
    VARIABLE c_1 : unsigned(7 DOWNTO 0);
    VARIABLE c_2 : unsigned(31 DOWNTO 0);
    VARIABLE cast : signed(31 DOWNTO 0);
    VARIABLE cast_0 : signed(31 DOWNTO 0);
    VARIABLE add_cast : signed(31 DOWNTO 0);
    VARIABLE cast_1 : signed(31 DOWNTO 0);
    VARIABLE cast_2 : signed(31 DOWNTO 0);
    VARIABLE add_cast_0 : signed(31 DOWNTO 0);
    VARIABLE cast_3 : signed(31 DOWNTO 0);
    VARIABLE cast_4 : signed(31 DOWNTO 0);
    VARIABLE add_cast_1 : unsigned(15 DOWNTO 0);
    VARIABLE add_temp : unsigned(32 DOWNTO 0);
    VARIABLE add_temp_0 : unsigned(8 DOWNTO 0);
    VARIABLE add_cast_2 : signed(31 DOWNTO 0);
    VARIABLE add_cast_3 : unsigned(31 DOWNTO 0);
  BEGIN
    CASE state_in_unsigned IS
      WHEN "00000000" =>
        IF start = '1' THEN 
          cast := signed(resize(eth_frame_unsigned(14), 32));
          cast_0 := cast AND to_signed(16#0000000F#, 32);
          temp_0 := unsigned(cast_0(7 DOWNTO 0));
          c_1 := temp_0 sll 2;
          length_out_tmp <= c_1;
          length_done <= '1';
          state_out_tmp <= to_unsigned(16#01#, 8);
        ELSE 
          length_out_tmp <= to_unsigned(16#00#, 8);
          length_done <= '0';
          state_out_tmp <= to_unsigned(16#00#, 8);
        END IF;
        checksum_out_tmp <= to_unsigned(16#00000000#, 32);
        byte_counter_out_tmp <= to_unsigned(16#00#, 8);
        done <= '0';
      WHEN "00000001" =>
        IF byte_counter_in_unsigned < length_in_unsigned THEN 
          add_cast := signed(resize(byte_counter_in_unsigned, 32));
          temp_1 := resize(eth_frame_unsigned(to_integer(add_cast + 14)), 16);
          c_0 := temp_1 sll 8;
          cast_2 := signed(resize(c_0, 32));
          add_cast_0 := signed(resize(byte_counter_in_unsigned, 32));
          cast_3 := signed(resize(eth_frame_unsigned(to_integer(add_cast_0 + 15)), 32));
          cast_4 := cast_2 OR cast_3;
          add_cast_1 := unsigned(cast_4(15 DOWNTO 0));
          add_temp := resize(checksum_in_unsigned, 33) + resize(add_cast_1, 33);
          IF add_temp(32) /= '0' THEN 
            checksum_out_tmp <= X"FFFFFFFF";
          ELSE 
            checksum_out_tmp <= add_temp(31 DOWNTO 0);
          END IF;
          state_out_tmp <= state_in_unsigned;
          add_temp_0 := resize(byte_counter_in_unsigned, 9) + to_unsigned(16#002#, 9);
          IF add_temp_0(8) /= '0' THEN 
            byte_counter_out_tmp <= "11111111";
          ELSE 
            byte_counter_out_tmp <= add_temp_0(7 DOWNTO 0);
          END IF;
        ELSE 
          checksum_out_tmp <= checksum_in_unsigned;
          state_out_tmp <= to_unsigned(16#02#, 8);
          byte_counter_out_tmp <= to_unsigned(16#00#, 8);
        END IF;
        length_out_tmp <= length_in_unsigned;
        length_done <= '1';
        done <= '0';
      WHEN "00000010" =>
        temp := checksum_in_unsigned;
        c := temp srl 16;
        cast_1 := signed(c);
        IF cast_1 = to_signed(16#00000000#, 32) THEN 
          -- final inversion of checksum
          checksum_out_tmp <= (checksum_in_unsigned XOR to_unsigned(16#0000FFFF#, 32)) AND to_unsigned(16#0000FFFF#, 32);
          state_out_tmp <= to_unsigned(16#03#, 8);
        ELSE 
          -- add the high 16 bits to the low 16 bits because there was overflow
          temp_2 := checksum_in_unsigned;
          c_2 := temp_2 srl 16;
          add_cast_2 := signed(c_2);
          add_cast_3 := unsigned(add_cast_2);
          checksum_out_tmp <= (checksum_in_unsigned AND to_unsigned(16#0000FFFF#, 32)) + add_cast_3;
          state_out_tmp <= state_in_unsigned;
        END IF;
        length_out_tmp <= length_in_unsigned;
        length_done <= '1';
        byte_counter_out_tmp <= byte_counter_in_unsigned;
        done <= '0';
      WHEN "00000011" =>
        -- go to the beginning
        IF ( NOT start) = '1' THEN 
          state_out_tmp <= to_unsigned(16#00#, 8);
        ELSE 
          state_out_tmp <= state_in_unsigned;
        END IF;
        length_out_tmp <= length_in_unsigned;
        length_done <= '1';
        checksum_out_tmp <= checksum_in_unsigned;
        byte_counter_out_tmp <= byte_counter_in_unsigned;
        done <= '1';
      WHEN OTHERS => 
        length_out_tmp <= to_unsigned(16#00#, 8);
        length_done <= '0';
        checksum_out_tmp <= to_unsigned(16#00000000#, 32);
        state_out_tmp <= to_unsigned(16#00#, 8);
        byte_counter_out_tmp <= to_unsigned(16#00#, 8);
        done <= '0';
    END CASE;
  END PROCESS IP_header_1_output;


  length_out <= std_logic_vector(length_out_tmp);

  checksum_out <= std_logic_vector(checksum_out_tmp);

  state_out <= std_logic_vector(state_out_tmp);

  byte_counter_out <= std_logic_vector(byte_counter_out_tmp);

END rtl;

