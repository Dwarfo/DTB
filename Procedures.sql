CREATE PROCEDURE chooseStudent
	@Year INT
	AS BEGIN
	SELECT Imie , Nazwisko , DataUrodzenia FROM Osoba o
	WHERE YEAR(DataUrodzenia) = @Year

	END

SELECT * FROM Student

exec chooseStudent 1998

ALTER PROCEDURE countStudent
	@Year INT,
	@Liczba INT OUTPUT
	AS BEGIN
	SELECT @Liczba = COUNT(*) FROM Student
	WHERE YEAR(DataRekrutacji) = @Year

	END
/*
create procedure p_x
as
begin
declare @t table(col1 varchar(10), col2 float, col3 float, col4 float)
insert @t values('a', 1,1,1)
insert @t values('b', 2,2,2)

select * from @t
end
go

declare @t table(col1 varchar(10), col2 float, col3 float, col4 float)
insert @t
exec p_x

select * from @t
*/
ALTER PROCEDURE countStudent
	@Year INT
	AS BEGIN
	DECLARE @Students INT 
	DECLARE @t table(col1 INT)
	SELECT @Students = COUNT(*) FROM Student
	WHERE YEAR(DataRekrutacji) = @Year
	INSERT INTO @t VALUES (@Students)
	
	select * FROM @t

	END

DECLARE @StNumber INT
exec countStudent 2011, @Liczba = @StNumber output
SELECT @StNumber 'Number of Students'

DECLARE @T table(numerstudentow INT)
INSERT @T exec countStudent 2011
SELECT * FROM @T

SELECT * FROM Osoba WHERE DataUrodzenia IS NULL

ALTER PROCEDURE changeTown
	@City1 VARCHAR(1), @City2 VARCHAR(1)
	AS BEGIN
	DECLARE @Ile INT
	SELECT @Ile = COUNT(*) FROM Osoba WHERE Plec = @City1 AND (DataUrodzenia IS NULL)
	UPDATE Osoba SET Plec = @City2 WHERE Plec = @City1 AND (DataUrodzenia IS NULL)
	PRINT CAST(@Ile AS VARCHAR) + ' Osob zmieniono'
	END
exec changeTown 'K', 'M'

CREATE PROCEDURE wstawPrzedmiot
	@Przedmiot VARCHAR(10),@Symbol VARCHAR(10)
	AS BEGIN
	DECLARE @Ile INT
	SELECT @Ile = COUNT(*) FROM Przedmiot WHERE Przedmiot=@Przedmiot OR Symbol = @Symbol
	IF @Ile =0
		INSERT INTO Przedmiot(Przedmiot,Symbol)
		VALUES (@Przedmiot,@Symbol)
	ELSE
		PRINT 'Taki Przedmiot Juz Istnieje'

	END

SELECT * FROM Przedmiot
exec wstawPrzedmiot 'Systemy baz danych', 'SBD'
exec wstawPrzedmiot 'Cos Nowego', 'CNW'

CREATE PROCEDURE addDydaktyk
	@Imie VARCHAR(10),@Nazwisko VARCHAR(10),@Plec Varchar(1), @Stopien VARCHAR(40)
	AS BEGIN
	DECLARE @Ile INT, @Pensja INT, @Empno INT
	SELECT @Ile = COUNT(*) FROM Osoba O
	JOIN Dydaktyk D
	ON O.IdOsoba = D.IdOsoba
	WHERE O.Imie = @Imie AND O.Nazwisko = @Nazwisko
	IF @Ile > 0
		PRINT 'Taki Dydaktyk juz Istnieje'
	ELSE
		BEGIN
			DECLARE @ID INT, @IDS INT
			SELECT @Ile = COUNT(*) FROM StopnieTytuly WHERE Stopien = @Stopien
			IF @Ile > 0
				BEGIN
					
					INSERT INTO Osoba(Imie,Nazwisko,Plec)
					VALUES (@Imie,@Nazwisko,@Plec)

					SELECT @ID = IdOsoba FROM Osoba O WHERE O.Imie = @Imie AND O.Nazwisko = @Nazwisko
					SELECT @IDS = IdStopien FROM StopnieTytuly ST WHERE ST.Stopien = @Stopien 
					INSERT INTO Dydaktyk(IdOsoba,IdStopien,Podlega)
					VALUES (@ID,@IDS,4)
				END
			ELSE
				BEGIN
				
					INSERT INTO Osoba(Imie,Nazwisko,Plec)
					VALUES (@Imie,@Nazwisko,@Plec)

					SELECT @ID = IdOsoba FROM Osoba O WHERE O.Imie = @Imie AND O.Nazwisko = @Nazwisko
					SELECT @IDS = NULL
					INSERT INTO Dydaktyk(IdOsoba,IdStopien,Podlega)
					VALUES (@ID,@IDS,4)
				END
		END
	END

exec addDydaktyk 'Ivan2','Petrovich', 'M', 'Magister'
SELECT * FROM Osoba
SELECt * FROM Dydaktyk
SELECT * FROM StopnieTytuly