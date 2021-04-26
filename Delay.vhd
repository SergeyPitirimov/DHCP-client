LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Delay IS
  PORT( preset                            :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        cnt_in                            :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        done                              :   OUT   std_logic;
        cnt_out                           :   OUT   std_logic_vector(31 DOWNTO 0)  -- uint32
        );
END Delay;


ARCHITECTURE rtl OF Delay IS

  ATTRIBUTE multstyle : string;

  -- Signals
  SIGNAL preset_unsigned                  : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL cnt_in_unsigned                  : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL cnt_out_tmp                      : unsigned(31 DOWNTO 0);  -- uint32

BEGIN
  preset_unsigned <= unsigned(preset);

  cnt_in_unsigned <= unsigned(cnt_in);

  Delay_1_output : PROCESS (cnt_in_unsigned, preset_unsigned)
  BEGIN
    IF cnt_in_unsigned >= preset_unsigned THEN 
      done <= '1';
      cnt_out_tmp <= cnt_in_unsigned;
    ELSE 
      done <= '0';
      cnt_out_tmp <= cnt_in_unsigned + 1;
    END IF;
  END PROCESS Delay_1_output;


  cnt_out <= std_logic_vector(cnt_out_tmp);

END rtl;

