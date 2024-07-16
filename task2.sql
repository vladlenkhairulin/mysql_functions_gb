USE gbru;

DROP FUNCTION IF EXISTS even_numbers;

DELIMITER $$
CREATE FUNCTION even_numbers()
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(100) DEFAULT '';
    DECLARE i INT DEFAULT 1;
    REPEAT
        IF i % 2 = 0 THEN
            IF LENGTH(result) = 0 THEN
                SET result = i;
            ELSE
                SET result = CONCAT(result, ', ', i);
            END IF;
        END IF;
        SET i = i + 1;
    UNTIL i > 10 END REPEAT;
    RETURN result;
END$$
DELIMITER ;

SELECT even_numbers();
