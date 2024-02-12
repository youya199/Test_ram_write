LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

PACKAGE misc_pkg IS
   FUNCTION log2 (x : natural) RETURN natural;
   FUNCTION ceil_log2 (t : natural) RETURN natural;
   FUNCTION ceil_log2t (t : natural) RETURN natural;
   FUNCTION SYNC_MODE_SEL (FAMILY: INTEGER) return INTEGER;
   FUNCTION reductionAnd (x: std_logic_vector) RETURN std_logic;
   FUNCTION reductionOr (x: std_logic_vector) RETURN std_logic;
   FUNCTION reductionXor (x: std_logic_vector) RETURN std_logic;
END;

PACKAGE BODY misc_pkg IS
    FUNCTION log2 (x : natural) RETURN natural is 
    BEGIN
	IF x <= 1 THEN   --[SAR#46322] Below change to accomodate value of DEPTH = 1, so that ceil log function returns 1 and MEMWADDDR is [0:0] for WDEPTH = 1
        --IF x < 1 THEN   
            RETURN 0;
        ELSE
            RETURN log2 (x / 2) + 1;
        END IF;
    END FUNCTION log2;

    FUNCTION ceil_log2 (t : natural) RETURN natural is
        VARIABLE RetVal:    natural;
    BEGIN
        RetVal := log2(t);
        IF (t > (2**RetVal)) THEN
            RETURN(RetVal + 1); -- RetVal is too small, so bump it up by 1 and return
        ELSE
            RETURN(RetVal); -- Just right
        END IF;
    END FUNCTION ceil_log2;

    FUNCTION ceil_log2t (t : natural) RETURN natural is
        VARIABLE RetVal:    natural;
    BEGIN
        IF (t = 1) THEN
          RetVal := 1;
          RETURN(RetVal); -- Just right
	ELSE
          RetVal := log2(t);
          IF (t > (2**RetVal)) THEN
            RETURN(RetVal + 1); -- RetVal is too small, so bump it up by 1 and return
          ELSE
            RETURN(RetVal); -- Just right
          END IF;
        END IF;
    END FUNCTION ceil_log2t;

    FUNCTION SYNC_MODE_SEL (FAMILY: INTEGER) RETURN INTEGER IS
       VARIABLE return_val: INTEGER := 0;
       BEGIN
          IF (FAMILY = 25) THEN
             return_val := 1;
          ELSE 
             return_val := 0;
          END IF;
          RETURN return_val;
    END SYNC_MODE_SEL;

  FUNCTION reductionAnd (x: std_logic_vector) RETURN std_logic IS
    VARIABLE r: std_logic := '1';
    BEGIN
      FOR i IN x'range LOOP
        r := r AND x(i);
      END LOOP;
      RETURN r;
  END FUNCTION reductionAnd;


  FUNCTION reductionOr (x: std_logic_vector) RETURN std_logic IS
    VARIABLE r: std_logic := '0';
    BEGIN
      FOR i IN x'range LOOP
        r := r OR x(i);
      END LOOP;
      RETURN r;
  END FUNCTION reductionOr;


  FUNCTION reductionXor (x: std_logic_vector) RETURN std_logic IS
    VARIABLE r: std_logic := '0';
    BEGIN
      FOR i IN x'range LOOP
        r := r XOR x(i);
      END LOOP;
      RETURN r;
  END FUNCTION reductionXor;


END;



