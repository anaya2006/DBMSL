create or replace trigger before_update_delete
AFTER UPDATE OR DELETE
ON Library
FOR EACH ROW
BEGIN
IF UPDATING THEN
INSERT INTO Library_audit (rollno, name, bname, doi, status, ts)
VALUES (:old.rollno, :old.name, :old.bname, :old.doi, :old.status, current_timestamp);
END IF;
IF DELETING THEN
INSERT INTO Library_audit (rollno, name, bname, doi, status, ts)
VALUES (:old.rollno, :old.name, :old.bname, :old.doi, :old.status, current_timestamp);
END IF;
END;
/