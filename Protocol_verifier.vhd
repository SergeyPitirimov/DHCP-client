LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.Trader_pkg.ALL;

ENTITY Protocol_verifier IS
  PORT( eth_frame                         :   IN    vector_of_std_logic_vector8(0 TO 309);  -- uint8 [310]
        good                              :   OUT   std_logic
        );
END Protocol_verifier;


ARCHITECTURE rtl OF Protocol_verifier IS

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
  SIGNAL eth_frame_unsigned               : vector_of_unsigned8(0 TO 309);  -- uint8 [310]
  SIGNAL cast                             : signed(31 DOWNTO 0);  -- int32
  SIGNAL cast_1                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL cast_2                           : unsigned(7 DOWNTO 0);  -- uint8

BEGIN
  outputgen: FOR k IN 0 TO 309 GENERATE
    eth_frame_unsigned(k) <= unsigned(eth_frame(k));
  END GENERATE;

  cast <= signed(resize(eth_frame_unsigned(14), 32));
  cast_1 <= cast AND to_signed(16#000000F0#, 32);
  cast_2 <= unsigned(cast_1(7 DOWNTO 0));
  good <= hdlcoder_to_stdlogic(((eth_frame_unsigned(12) = to_unsigned(16#00000008#, 8)) AND (eth_frame_unsigned(13) = to_unsigned(16#00000000#, 8))) AND (cast_2 = to_unsigned(16#00000040#, 8)));

END rtl;

