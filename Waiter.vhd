LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Waiter IS
  PORT( eth_reset_n                       :   IN    std_logic;
        start                             :   IN    std_logic;
        button                            :   IN    std_logic;
        state_in                          :   IN    std_logic;
        done                              :   OUT   std_logic;
        state_out                         :   OUT   std_logic
        );
END Waiter;


ARCHITECTURE rtl OF Waiter IS

  ATTRIBUTE multstyle : string;

BEGIN
  Waiter_1_output : PROCESS (button, eth_reset_n, start, state_in)
    VARIABLE index : signed(31 DOWNTO 0);
    VARIABLE result : std_logic;
    VARIABLE result_0 : std_logic;
  BEGIN
    result :=  NOT state_in;
    IF result = '1' THEN 
      index := to_signed(16#00000000#, 32);
    ELSE 
      result_0 := state_in;
      IF result_0 = '1' THEN 
        index := to_signed(16#00000001#, 32);
      ELSE 
        index := X"FFFFFFFF";
      END IF;
    END IF;
    CASE index IS
      WHEN "00000000000000000000000000000000" =>
        IF ( NOT button) = '1' THEN 
          state_out <= '1';
        ELSE 
          state_out <= state_in;
        END IF;
        done <= '0';
      WHEN "00000000000000000000000000000001" =>
        IF ( NOT eth_reset_n) = '1' THEN 
          state_out <= '0';
          done <= '0';
        ELSE 
          state_out <= state_in;
          done <= start;
        END IF;
      WHEN OTHERS => 
        state_out <= '0';
        done <= '0';
    END CASE;
  END PROCESS Waiter_1_output;


END rtl;

