use master

SELECT Imie,Nazwisko,YEAR(DataUrodzenia)
FROM master.dbo.Osoba 

ORDER BY DataUrodzenia DESC, Nazwisko ASC 

use master

SELECT Imie,Nazwisko,"Rok Urodzenia" ,"Rola w uczelni" FROM (
SELECT Imie,Nazwisko, YEAR(DataUrodzenia) "Rok Urodzenia" ,' - student' "Rola w uczelni"
FROM Osoba O
JOIN Student S
ON S.IdOsoba = O.IdOsoba
UNION
SELECT Imie,Nazwisko ,YEAR(DataUrodzenia) "Rok Urodzenia",' - dydaktyk' "Rola w uczelni"
FROM Osoba O
JOIN Dydaktyk D
ON D.IdOsoba = O.IdOsoba
) results
ORDER BY "Rok Urodzenia" DESC, Nazwisko ASC 

SELECT NrIndeksu,DATEDIFF(month,DataRekrutacji,CONVERT (date, SYSDATETIME()) ) "Miesiecy", 
DATEDIFF(day,DataRekrutacji,CONVERT (date, SYSDATETIME()) ) "Dni" ,
DATEDIFF(year,DataRekrutacji,CONVERT (date, SYSDATETIME()) ) "Lata" FROM Student

SELECT IdOsoba, Imie, Nazwisko FROM Osoba O
WHERE O.IdOsoba IN (SELECT IdOsoba FROM Student S ) AND O.IdOsoba IN (SELECT IdOsoba FROM Dydaktyk D) 

SELECT Imie, Nazwisko FROM Osoba O
JOIN Ocena Oc
ON Oc.IdStudent = O.IdOsoba AND Oc.IdPrzedmiot = 6 AND Oc.Ocena = 2.0 AND YEAR(Oc.DataWystawienia) = 2013

SELECT * FROM Student S
LEFT JOIN Ocena Oc
ON Oc.IdStudent = S.IdOsoba
WHERE Oc.IdPrzedmiot = 2 AND Oc.Ocena IS NOT NULL 
/*
SELECT * FROM (
(SELECT * FROM Student S
LEFT JOIN Ocena Oc
ON Oc.IdStudent = S.IdOsoba
WHERE Oc.IdPrzedmiot = 2 AND Oc.Ocena IS NOT NULL ) AS T1
(SELECT * FROM Student S
LEFT JOIN Ocena Oc
ON Oc.IdStudent = S.IdOsoba
WHERE Oc.IdPrzedmiot = 12 AND Oc.Ocena IS NOT NULL ) AS T2
)*/

SELECT DISTINCT Przedmiot,"Ilosc Ocen","Srednia Ocena" FROM Przedmiot Prz
JOIN (SELECT DISTINCT Count(*) OVER(PARTITION BY IdPrzedmiot) "Ilosc Ocen",AVG(Ocena) OVER(PARTITION BY IdPrzedmiot) "Srednia Ocena", IdPrzedmiot FROM Ocena ) as T2
ON T2.IdPrzedmiot = Prz.IdPrzedmiot
WHERE [Ilosc Ocen]>=5 AND [Srednia Ocena] >=3

SELECT DISTINCT Przedmiot FROM Przedmiot Prz
JOIN Ocena as T2
ON T2.IdPrzedmiot = Prz.IdPrzedmiot
WHERE (Count(*) OVER(PARTITION BY IdPrzedmiot)) >=5 AND (AVG(Ocena) OVER(PARTITION BY IdPrzedmiot)) >=3

SELECT Imie, Nazwisko FROM Osoba O
JOIN Student S
ON S.IdOsoba = O.IdOsoba
WHERE S.DataRekrutacji IN ( SELECT DataRekrutacji FROM Student S1
	WHERE S1.IdOsoba IN (SELECT IdOsoba FROM Osoba WHERE Imie = 'Alberta' AND Nazwisko = 'Ananas'))

SELECT IdOsoba,imie, Nazwisko FROM Osoba O
WHERE O.IdOsoba IN (SELECT IdOsoba FROM Student S
	WHERE s.DataRekrutacji IN (SELECT MAX(DataRekrutacji) FROM Student))

SELECT Imie, Nazwisko, "Srednia Ocena" FROM Osoba O
JOIN (SELECT AVG(Ocena) OVER(PARTITION BY IdStudent) "Srednia Ocena", IdStudent FROM Ocena) AS Oc
ON Oc.IdStudent = O.IdOsoba
WHERE Oc.[Srednia Ocena] > (SELECT DISTINCT "Srednia Ocena" FROM Osoba O
	JOIN (SELECT AVG(Ocena) OVER(PARTITION BY IdStudent) "Srednia Ocena", IdStudent FROM Ocena) AS Oc
	ON Oc.IdStudent = O.IdOsoba
	WHERE O.Imie = 'Hieronim' AND O.Nazwisko = 'Kapusta')


SELECT Imie,Nazwisko,Przedmiot, [Max Ocena] FROM 
(SELECT DISTINCT MAX(Ocena) "Max Ocena",IdPrzedmiot, MAX(IdStudent) "IdStudent" FROM Ocena AS T1
GROUP BY IdPrzedmiot
) result
JOIN Osoba O
ON result.IdStudent = O.IdOsoba
JOIN Przedmiot Prz
ON Prz.IdPrzedmiot = result.IdPrzedmiot




SELECT * FROM Student
SELECT * FROM Przedmiot
SELECT * FROM PrzedmiotPoprzedzajacy
SELECT DISTINCT IdStudent FROM Ocena
SELECT * FROM Osoba
SELECT * FROM Ocena

SELECT DISTINCT MAX(Ocena) "Max Ocena",IdPrzedmiot, MAX(IdStudent) "IdStudent" FROM Ocena AS T1
JOIN Osoba O
ON O.IdOsoba = T1.IdStudent
GROUP BY IdPrzedmiot