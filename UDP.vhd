LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.Trader_pkg.ALL;

ENTITY UDP IS
  PORT( ip_header_length                  :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        ip_header_length_valid            :   IN    std_logic;
        start                             :   IN    std_logic;
        eth_frame                         :   IN    vector_of_std_logic_vector8(0 TO 309);  -- uint8 [310]
        length_in                         :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        checksum_in                       :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        state_in                          :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        byte_counter_in                   :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        done                              :   OUT   std_logic;
        length_out                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
        checksum_out                      :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        state_out                         :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
        byte_counter_out                  :   OUT   std_logic_vector(15 DOWNTO 0)  -- uint16
        );
END UDP;


ARCHITECTURE rtl OF UDP IS

  ATTRIBUTE multstyle : string;

  -- Signals
  SIGNAL ip_header_length_unsigned        : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL eth_frame_unsigned               : vector_of_unsigned8(0 TO 309);  -- uint8 [310]
  SIGNAL length_in_unsigned               : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL checksum_in_unsigned             : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL state_in_unsigned                : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL byte_counter_in_unsigned         : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL length_out_tmp                   : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL checksum_out_tmp                 : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL state_out_tmp                    : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL byte_counter_out_tmp             : unsigned(15 DOWNTO 0);  -- uint16

BEGIN
  ip_header_length_unsigned <= unsigned(ip_header_length);

  outputgen: FOR k IN 0 TO 309 GENERATE
    eth_frame_unsigned(k) <= unsigned(eth_frame(k));
  END GENERATE;

  length_in_unsigned <= unsigned(length_in);

  checksum_in_unsigned <= unsigned(checksum_in);

  state_in_unsigned <= unsigned(state_in);

  byte_counter_in_unsigned <= unsigned(byte_counter_in);

  UDP_1_output : PROCESS (byte_counter_in_unsigned, checksum_in_unsigned, eth_frame_unsigned,
       ip_header_length_unsigned, ip_header_length_valid, length_in_unsigned,
       start, state_in_unsigned)
    VARIABLE temp : unsigned(31 DOWNTO 0);
    VARIABLE temp_0 : unsigned(15 DOWNTO 0);
    VARIABLE temp_1 : unsigned(15 DOWNTO 0);
    VARIABLE temp_2 : unsigned(31 DOWNTO 0);
    VARIABLE temp_3 : unsigned(15 DOWNTO 0);
    VARIABLE c : unsigned(31 DOWNTO 0);
    VARIABLE c_0 : unsigned(15 DOWNTO 0);
    VARIABLE c_1 : unsigned(15 DOWNTO 0);
    VARIABLE c_2 : unsigned(15 DOWNTO 0);
    VARIABLE c_3 : unsigned(31 DOWNTO 0);
    VARIABLE add_temp : unsigned(32 DOWNTO 0);
    VARIABLE add_temp_0 : unsigned(32 DOWNTO 0);
    VARIABLE add_cast : signed(31 DOWNTO 0);
    VARIABLE add_cast_0 : signed(31 DOWNTO 0);
    VARIABLE add_temp_1 : signed(31 DOWNTO 0);
    VARIABLE add_cast_1 : unsigned(15 DOWNTO 0);
    VARIABLE add_temp_2 : unsigned(16 DOWNTO 0);
    VARIABLE sub_cast : unsigned(15 DOWNTO 0);
    VARIABLE sub_cast_0 : signed(31 DOWNTO 0);
    VARIABLE cast : signed(31 DOWNTO 0);
    VARIABLE cast_0 : signed(31 DOWNTO 0);
    VARIABLE cast_1 : signed(31 DOWNTO 0);
    VARIABLE cast_2 : signed(31 DOWNTO 0);
    VARIABLE sub_cast_1 : unsigned(15 DOWNTO 0);
    VARIABLE sub_cast_2 : signed(16 DOWNTO 0);
    VARIABLE sub_cast_3 : unsigned(15 DOWNTO 0);
    VARIABLE sub_cast_4 : signed(16 DOWNTO 0);
    VARIABLE sub_temp : signed(16 DOWNTO 0);
    VARIABLE cast_3 : signed(31 DOWNTO 0);
    VARIABLE add_cast_2 : signed(31 DOWNTO 0);
    VARIABLE cast_4 : signed(31 DOWNTO 0);
    VARIABLE cast_5 : signed(31 DOWNTO 0);
    VARIABLE add_cast_3 : unsigned(15 DOWNTO 0);
    VARIABLE add_temp_3 : unsigned(32 DOWNTO 0);
    VARIABLE cast_6 : signed(31 DOWNTO 0);
    VARIABLE add_cast_4 : signed(31 DOWNTO 0);
    VARIABLE add_temp_4 : signed(31 DOWNTO 0);
    VARIABLE add_cast_5 : unsigned(15 DOWNTO 0);
    VARIABLE add_temp_5 : unsigned(16 DOWNTO 0);
    VARIABLE sub_cast_5 : unsigned(15 DOWNTO 0);
    VARIABLE sub_cast_6 : signed(31 DOWNTO 0);
    VARIABLE cast_7 : signed(31 DOWNTO 0);
    VARIABLE cast_8 : signed(31 DOWNTO 0);
    VARIABLE add_cast_6 : unsigned(15 DOWNTO 0);
    VARIABLE add_temp_6 : unsigned(32 DOWNTO 0);
    VARIABLE add_temp_7 : unsigned(16 DOWNTO 0);
    VARIABLE add_cast_7 : signed(31 DOWNTO 0);
    VARIABLE add_cast_8 : unsigned(31 DOWNTO 0);
  BEGIN
    CASE state_in_unsigned IS
      WHEN "00000000" =>
        IF (start AND ip_header_length_valid) = '1' THEN 
          -- UDP total length = IP total length - IP header length
          temp_3 := resize(eth_frame_unsigned(16), 16);
          c_2 := temp_3 sll 8;
          cast_0 := signed(resize(c_2, 32));
          cast_1 := signed(resize(eth_frame_unsigned(17), 32));
          cast_2 := cast_0 OR cast_1;
          sub_cast_1 := unsigned(cast_2(15 DOWNTO 0));
          sub_cast_2 := signed(resize(sub_cast_1, 17));
          sub_cast_3 := resize(ip_header_length_unsigned, 16);
          sub_cast_4 := signed(resize(sub_cast_3, 17));
          sub_temp := sub_cast_2 - sub_cast_4;
          IF sub_temp(16) = '1' THEN 
            length_out_tmp <= X"0000";
          ELSE 
            length_out_tmp <= unsigned(sub_temp(15 DOWNTO 0));
          END IF;
          state_out_tmp <= to_unsigned(16#01#, 8);
        ELSE 
          length_out_tmp <= to_unsigned(16#0000#, 16);
          state_out_tmp <= to_unsigned(16#00#, 8);
        END IF;
        checksum_out_tmp <= to_unsigned(16#00000000#, 32);
        byte_counter_out_tmp <= to_unsigned(16#0000#, 16);
        done <= '0';
      WHEN "00000001" =>
        -- calclulate the sum of virtual UDP header (source IP address + destination IP address + ... )
        IF byte_counter_in_unsigned < to_unsigned(16#00000008#, 16) THEN 
          add_cast := signed(resize(byte_counter_in_unsigned, 32));
          temp_0 := resize(eth_frame_unsigned(to_integer(add_cast + 26)), 16);
          c_0 := temp_0 sll 8;
          cast_3 := signed(resize(c_0, 32));
          add_cast_2 := signed(resize(byte_counter_in_unsigned, 32));
          cast_4 := signed(resize(eth_frame_unsigned(to_integer(add_cast_2 + 27)), 32));
          cast_5 := cast_3 OR cast_4;
          add_cast_3 := unsigned(cast_5(15 DOWNTO 0));
          add_temp_3 := resize(checksum_in_unsigned, 33) + resize(add_cast_3, 33);
          IF add_temp_3(32) /= '0' THEN 
            checksum_out_tmp <= X"FFFFFFFF";
          ELSE 
            checksum_out_tmp <= add_temp_3(31 DOWNTO 0);
          END IF;
          byte_counter_out_tmp <= byte_counter_in_unsigned + 2;
          state_out_tmp <= state_in_unsigned;
        ELSE 
          checksum_out_tmp <= checksum_in_unsigned;
          state_out_tmp <= to_unsigned(16#02#, 8);
          byte_counter_out_tmp <= to_unsigned(16#0000#, 16);
        END IF;
        length_out_tmp <= length_in_unsigned;
        done <= '0';
      WHEN "00000010" =>
        -- calclulate the sum of virtual UDP header (... + protocol type + ..)
        add_temp := resize(checksum_in_unsigned, 33) + resize(eth_frame_unsigned(23), 33);
        IF add_temp(32) /= '0' THEN 
          checksum_out_tmp <= X"FFFFFFFF";
        ELSE 
          checksum_out_tmp <= add_temp(31 DOWNTO 0);
        END IF;
        state_out_tmp <= to_unsigned(16#03#, 8);
        byte_counter_out_tmp <= to_unsigned(16#0000#, 16);
        length_out_tmp <= length_in_unsigned;
        done <= '0';
      WHEN "00000011" =>
        -- calclulate the sum of virtual UDP header (... + UDP length = IP total length - IP header length)
        add_temp_0 := resize(checksum_in_unsigned, 33) + resize(length_in_unsigned, 33);
        IF add_temp_0(32) /= '0' THEN 
          checksum_out_tmp <= X"FFFFFFFF";
        ELSE 
          checksum_out_tmp <= add_temp_0(31 DOWNTO 0);
        END IF;
        state_out_tmp <= to_unsigned(16#04#, 8);
        byte_counter_out_tmp <= to_unsigned(16#0000#, 16);
        length_out_tmp <= length_in_unsigned;
        done <= '0';
      WHEN "00000100" =>
        -- calclulate the sum of UDP payload
        IF byte_counter_in_unsigned < length_in_unsigned THEN 
          add_cast_0 := signed(resize(ip_header_length_unsigned, 32));
          add_temp_1 := add_cast_0 + 15;
          add_cast_1 := unsigned(add_temp_1(15 DOWNTO 0));
          add_temp_2 := resize(add_cast_1, 17) + resize(byte_counter_in_unsigned, 17);
          IF add_temp_2(16) /= '0' THEN 
            sub_cast := X"FFFF";
          ELSE 
            sub_cast := add_temp_2(15 DOWNTO 0);
          END IF;
          sub_cast_0 := signed(resize(sub_cast, 32));
          temp_1 := resize(eth_frame_unsigned(to_integer(sub_cast_0 - 1)), 16);
          c_1 := temp_1 sll 8;
          cast_6 := signed(resize(c_1, 32));
          add_cast_4 := signed(resize(ip_header_length_unsigned, 32));
          add_temp_4 := add_cast_4 + 16;
          add_cast_5 := unsigned(add_temp_4(15 DOWNTO 0));
          add_temp_5 := resize(add_cast_5, 17) + resize(byte_counter_in_unsigned, 17);
          IF add_temp_5(16) /= '0' THEN 
            sub_cast_5 := X"FFFF";
          ELSE 
            sub_cast_5 := add_temp_5(15 DOWNTO 0);
          END IF;
          sub_cast_6 := signed(resize(sub_cast_5, 32));
          cast_7 := signed(resize(eth_frame_unsigned(to_integer(sub_cast_6 - 1)), 32));
          cast_8 := cast_6 OR cast_7;
          add_cast_6 := unsigned(cast_8(15 DOWNTO 0));
          add_temp_6 := resize(checksum_in_unsigned, 33) + resize(add_cast_6, 33);
          IF add_temp_6(32) /= '0' THEN 
            checksum_out_tmp <= X"FFFFFFFF";
          ELSE 
            checksum_out_tmp <= add_temp_6(31 DOWNTO 0);
          END IF;
          state_out_tmp <= state_in_unsigned;
          add_temp_7 := resize(byte_counter_in_unsigned, 17) + to_unsigned(16#00002#, 17);
          IF add_temp_7(16) /= '0' THEN 
            byte_counter_out_tmp <= X"FFFF";
          ELSE 
            byte_counter_out_tmp <= add_temp_7(15 DOWNTO 0);
          END IF;
        ELSE 
          checksum_out_tmp <= checksum_in_unsigned;
          state_out_tmp <= to_unsigned(16#05#, 8);
          byte_counter_out_tmp <= to_unsigned(16#0000#, 16);
        END IF;
        length_out_tmp <= length_in_unsigned;
        done <= '0';
      WHEN "00000101" =>
        temp := checksum_in_unsigned;
        c := temp srl 16;
        cast := signed(c);
        IF cast = to_signed(16#00000000#, 32) THEN 
          -- go to the final inversion of UDP checksum if it is necessary
          checksum_out_tmp <= checksum_in_unsigned;
          state_out_tmp <= to_unsigned(16#06#, 8);
          byte_counter_out_tmp <= to_unsigned(16#0000#, 16);
        ELSE 
          -- add the high 16 bits to the low 16 bits
          temp_2 := checksum_in_unsigned;
          c_3 := temp_2 srl 16;
          add_cast_7 := signed(c_3);
          add_cast_8 := unsigned(add_cast_7);
          checksum_out_tmp <= (checksum_in_unsigned AND to_unsigned(16#0000FFFF#, 32)) + add_cast_8;
          state_out_tmp <= state_in_unsigned;
          byte_counter_out_tmp <= to_unsigned(16#0000#, 16);
        END IF;
        length_out_tmp <= length_in_unsigned;
        done <= '0';
      WHEN "00000110" =>
        -- final inversion of UDP checksum if it is necessary
        IF (checksum_in_unsigned AND to_unsigned(16#0000FFFF#, 32)) = to_unsigned(16#0000FFFF#, 32) THEN 
          checksum_out_tmp <= checksum_in_unsigned;
        ELSE 
          checksum_out_tmp <= (checksum_in_unsigned XOR to_unsigned(16#0000FFFF#, 32)) AND to_unsigned(16#0000FFFF#, 32);
        END IF;
        state_out_tmp <= to_unsigned(16#07#, 8);
        byte_counter_out_tmp <= to_unsigned(16#0000#, 16);
        length_out_tmp <= length_in_unsigned;
        done <= '0';
      WHEN "00000111" =>
        -- go to the beginning
        IF ( NOT start) = '1' THEN 
          state_out_tmp <= to_unsigned(16#00#, 8);
        ELSE 
          state_out_tmp <= state_in_unsigned;
        END IF;
        length_out_tmp <= length_in_unsigned;
        checksum_out_tmp <= checksum_in_unsigned;
        byte_counter_out_tmp <= byte_counter_in_unsigned;
        done <= '1';
      WHEN OTHERS => 
        length_out_tmp <= length_in_unsigned;
        checksum_out_tmp <= to_unsigned(16#00000000#, 32);
        state_out_tmp <= to_unsigned(16#00#, 8);
        byte_counter_out_tmp <= to_unsigned(16#0000#, 16);
        done <= '0';
    END CASE;
  END PROCESS UDP_1_output;


  length_out <= std_logic_vector(length_out_tmp);

  checksum_out <= std_logic_vector(checksum_out_tmp);

  state_out <= std_logic_vector(state_out_tmp);

  byte_counter_out <= std_logic_vector(byte_counter_out_tmp);

END rtl;

