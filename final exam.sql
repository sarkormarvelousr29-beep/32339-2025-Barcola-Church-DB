CREATE OR REPLACE PROCEDURE display_message
AS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Welcome to Oracle PL/SQL!');
END;
/

EXEC display_message;
     