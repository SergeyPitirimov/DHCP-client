LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.Trader_pkg.ALL;

ENTITY Ethernet_frame_checksum IS
  PORT( start                             :   IN    std_logic;
        eth_frame                         :   IN    vector_of_std_logic_vector8(0 TO 309);  -- uint8 [310]
        checksum_in                       :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        state_in                          :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        byte_counter_in                   :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        done                              :   OUT   std_logic;
        checksum_out                      :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        state_out                         :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
        byte_counter_out                  :   OUT   std_logic_vector(15 DOWNTO 0)  -- uint16
        );
END Ethernet_frame_checksum;


ARCHITECTURE rtl OF Ethernet_frame_checksum IS

  ATTRIBUTE multstyle : string;

  -- Signals
  SIGNAL eth_frame_unsigned               : vector_of_unsigned8(0 TO 309);  -- uint8 [310]
  SIGNAL checksum_in_unsigned             : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL state_in_unsigned                : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL byte_counter_in_unsigned         : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL checksum_out_tmp                 : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL state_out_tmp                    : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL byte_counter_out_tmp             : unsigned(15 DOWNTO 0);  -- uint16

BEGIN
  outputgen: FOR k IN 0 TO 309 GENERATE
    eth_frame_unsigned(k) <= unsigned(eth_frame(k));
  END GENERATE;

  checksum_in_unsigned <= unsigned(checksum_in);

  state_in_unsigned <= unsigned(state_in);

  byte_counter_in_unsigned <= unsigned(byte_counter_in);

  Ethernet_frame_checksum_1_output : PROCESS (byte_counter_in_unsigned, checksum_in_unsigned, eth_frame_unsigned, start,
       state_in_unsigned)
    VARIABLE crc : unsigned(31 DOWNTO 0);
    VARIABLE mask : unsigned(31 DOWNTO 0);
    VARIABLE w : unsigned(31 DOWNTO 0);
    VARIABLE temp : unsigned(31 DOWNTO 0);
    VARIABLE c : unsigned(31 DOWNTO 0);
    VARIABLE mask_0 : unsigned(31 DOWNTO 0);
  BEGIN
    ----------------------------- original matlab function ---------------------
    --function crc = crc32(data)
    --crc32   Computes the CRC-32 checksum value of a byte vector.
    ----------------------------------------------------------------------------
    --   CRC = crc32(DATA) computes the CRC-32 checksum value of the data stored
    --   in vector DATA. The elements of DATA are interpreted as unsigned bytes
    --   (uint8). The result is an unsigned 32-bit integer (uint32). Polynomial
    --   bit positions have been reversed, and the algorithm modified, in order
    --   to improve performance.
    --   Version:    1.00
    --   Programmer: Costas Vlachos
    --   Date:       23-Dec-2014
    -- Initialize variables
    --crc  = uint32(hex2dec('FFFFFFFF'));
    --poly = uint32(hex2dec('EDB88320'));
    --data = uint8(data);
    -- Compute CRC-32 value
    --for i = 1:length(data)
    --    crc = bitxor(crc,uint32(data(i)));
    --    for j = 1:8
    --        mask = uint32(bitcmp(bitand(crc,uint32(1))));
    --        if mask == intmax('uint32')
    --          mask = uint32(0);
    --        else
    --          mask = uint32(mask) + uint32(1);
    --        end
    --        crc = uint32(bitxor(bitshift(crc,-1), bitand(poly,mask)));
    --    end
    --end
    --crc = uint32(bitcmp(crc));
    -----------------------------------------------------------------------------
    CASE state_in_unsigned IS
      WHEN "00000000" =>
        IF start = '1' THEN 
          state_out_tmp <= to_unsigned(16#01#, 8);
        ELSE 
          state_out_tmp <= state_in_unsigned;
        END IF;
        crc := unsigned'("11111111111111111111111111111111");
        byte_counter_out_tmp <= to_unsigned(16#0000#, 16);
        done <= '0';
      WHEN "00000001" =>
        IF byte_counter_in_unsigned < to_unsigned(16#00000136#, 16) THEN 
          crc := checksum_in_unsigned XOR resize(eth_frame_unsigned(to_integer(byte_counter_in_unsigned)), 32);
          state_out_tmp <= to_unsigned(16#02#, 8);
          byte_counter_out_tmp <= byte_counter_in_unsigned + 1;
        ELSE 
          crc :=  NOT checksum_in_unsigned;
          state_out_tmp <= to_unsigned(16#03#, 8);
          byte_counter_out_tmp <= to_unsigned(16#0000#, 16);
        END IF;
        done <= '0';
      WHEN "00000010" =>
        crc := checksum_in_unsigned;

        FOR j IN 0 TO 7 LOOP
          mask :=  NOT (crc AND to_unsigned(16#00000001#, 32));
          IF mask = unsigned'("11111111111111111111111111111111") THEN 
            mask_0 := to_unsigned(16#00000000#, 32);
          ELSE 
            mask_0 := mask + 1;
          END IF;
          temp := crc;
          c := temp srl 1;
          w := c;
          crc := w XOR (mask_0 AND unsigned'("11101101101110001000001100100000"));
        END LOOP;

        state_out_tmp <= to_unsigned(16#01#, 8);
        byte_counter_out_tmp <= byte_counter_in_unsigned;
        done <= '0';
      WHEN "00000011" =>
        IF start = '1' THEN 
          state_out_tmp <= state_in_unsigned;
        ELSE 
          state_out_tmp <= to_unsigned(16#00#, 8);
        END IF;
        crc := checksum_in_unsigned;
        byte_counter_out_tmp <= to_unsigned(16#0000#, 16);
        done <= '1';
      WHEN OTHERS => 
        state_out_tmp <= to_unsigned(16#00#, 8);
        crc := to_unsigned(16#00000000#, 32);
        byte_counter_out_tmp <= to_unsigned(16#0000#, 16);
        done <= '0';
    END CASE;
    checksum_out_tmp <= crc;
  END PROCESS Ethernet_frame_checksum_1_output;


  checksum_out <= std_logic_vector(checksum_out_tmp);

  state_out <= std_logic_vector(state_out_tmp);

  byte_counter_out <= std_logic_vector(byte_counter_out_tmp);

END rtl;

