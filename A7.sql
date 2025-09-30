create or replace trigger after_update_delete
AFTER UPDATE OR DELETE
ON Library
FOR EACH ROW
BEGIN
  IF UPDATING THEN
    INSERT INTO Library_audit (rollno, name, bname, doi, status)
    VALUES (:OLD.rollno, :OLD.name, :OLD.bname, :OLD.doi, :OLD.status);
  END IF;
  IF DELETING THEN
    INSERT INTO Library_audit (rollno, name, bname, doi, status)
    VALUES (:OLD.rollno, :OLD.name, :OLD.bname, :OLD.doi, :OLD.status);
  END IF;
END;
/                
