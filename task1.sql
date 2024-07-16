USE gbru;

DROP FUNCTION IF EXISTS seconds_converter;
DELIMITER $$
CREATE FUNCTION seconds_converter(seconds_input INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE seconds_output INT;
    DECLARE result VARCHAR(100);

    SET days = FLOOR(seconds_input / (24 * 3600));
    SET seconds_input = seconds_input % (24 * 3600);
    SET hours = FLOOR(seconds_input / 3600);
    SET seconds_input = seconds_input % 3600;
    SET minutes = FLOOR(seconds_input / 60);
    SET seconds_output = seconds_input % 60;

    SET result = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds_output, ' seconds ');

    RETURN result;
END $$

DELIMITER ;

SELECT seconds_converter(123456);
