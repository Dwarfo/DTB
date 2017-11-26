ALTER TRIGGER zarobki
ON emp
FOR DELETE, UPDATE, INSERT
AS
BEGIN
DECLARE @ile INT, @ename VARCHAR(20), @sal INT, @empno INT

	DECLARE kurs CURSOR FOR SELECT empno,sal FROM deleted WHERE sal>0
	OPEN kurs
	FETCH NEXT FROM kurs INTO @empno, @sal
	WHILE @@FETCH_STATUS = 0 BEGIN
		IF @sal > 0
			
			
			PRINT 'No deletes'
		FETCH NEXT FROM kurs INTO @empno,@sal
	END
	CLOSE kurs
	DEALLOCATE kurs

	DECLARE @newname VARCHAR(20)
	DECLARE kurs2 CURSOR FOR SELECT empno,ename FROM deleted
	OPEN kurs2
	FETCH NEXT FROM kurs2 INTO @empno,@ename
	WHILE @@FETCH_STATUS = 0 BEGIN
		SELECT @newname = ename FROM emp WHERE empno = @empno
		IF(@ename != @newname)
			BEGIN
				UPDATE emp SET ename = @ename WHERE empno = @empno
				PRINT 'Nope!'
			END
		FETCH NEXT FROM kurs2 INTO @empno,@ename
	END
	CLOSE kurs2
	DEALLOCATE kurs2

	DECLARE @count INT
	DECLARE kurs3 CURSOR FOR SELECT empno,ename FROM inserted
	OPEN kurs3
	SET @count = 0
	FETCH NEXT FROM kurs3 INTO @empno,@ename
	WHILE @@FETCH_STATUS = 0 BEGIN
		
		IF EXISTS(SELECT 'X' FROM emp WHERE ENAME = @ename)
			BEGIN
				DELETE FROM emp WHERE ENAME = @ename
				PRINT 'This one is already existing'
			END
		FETCH NEXT FROM kurs3 INTO @empno,@ename
	END
	CLOSE kurs3
	DEALLOCATE kurs3


END



SELECT * FROM emp
DELETE FROM emp WHERE ename = 'SMITH'
INSERT INTO emp (empno,ename)
VALUES(9000,'ALLEN')
UPDATE emp SET ename = 'BROTISH' WHERE empno = 7499