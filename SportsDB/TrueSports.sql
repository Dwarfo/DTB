INSERT INTO Country(ID_kraju,Kraj)
VALUES(1,'Ukraine')
INSERT INTO Country(ID_kraju,Kraj)
VALUES(2,'Poland')
INSERT INTO Country(ID_kraju,Kraj)
VALUES(3,'Russia')
INSERT INTO Country(ID_kraju,Kraj)
VALUES(4,'America')

SELECT * FROM Country
--------------------
INSERT INTO Sport_type(ID_sportu,Typ)
VALUES(1,'Plywanie')
INSERT INTO Sport_type(ID_sportu,Typ)
VALUES(2,'Badminton')
INSERT INTO Sport_type(ID_sportu,Typ)
VALUES(3,'Bieg')

SELECT * FROM Sport_type
----------------------------

INSERT INTO Sportsmen(ID_Sportsmena,Imie,Nazwisko,Tytul,Id_kraju,ID_Sportu)
VALUES (1,'Ivan','Dushenko','Mistrzsp',1,1)
INSERT INTO Sportsmen(ID_Sportsmena,Imie,Nazwisko,Tytul,Id_kraju,ID_Sportu)
VALUES (2,'Denys','Kirienko','4th rozr',1,2)
INSERT INTO Sportsmen(ID_Sportsmena,Imie,Nazwisko,Tytul,Id_kraju,ID_Sportu)
VALUES (3,'Anna','Mulenko','MSMK',1,3)

INSERT INTO Sportsmen(ID_Sportsmena,Imie,Nazwisko,Tytul,Id_kraju,ID_Sportu)
VALUES (4,'Urszula','Wroblewska','Mistrzsp',2,1)
INSERT INTO Sportsmen(ID_Sportsmena,Imie,Nazwisko,Tytul,Id_kraju,ID_Sportu)
VALUES (5,'Wiktor','Glowacz','MSMK',2,2)
INSERT INTO Sportsmen(ID_Sportsmena,Imie,Nazwisko,Tytul,Id_kraju,ID_Sportu)
VALUES (6,'Michal','Nogalski','Candydatms',2,3)

INSERT INTO Sportsmen(ID_Sportsmena,Imie,Nazwisko,Tytul,Id_kraju,ID_Sportu)
VALUES (7,'Ivan','Sovkov','MSMK',3,1)
INSERT INTO Sportsmen(ID_Sportsmena,Imie,Nazwisko,Tytul,Id_kraju,ID_Sportu)
VALUES (8,'Ludmila','Petrova','Mistrzsp',3,2)
INSERT INTO Sportsmen(ID_Sportsmena,Imie,Nazwisko,Tytul,Id_kraju,ID_Sportu)
VALUES (9,'Dmitrij','Nevzorin','Mistrzsp',3,3)

INSERT INTO Sportsmen(ID_Sportsmena,Imie,Nazwisko,Tytul,Id_kraju,ID_Sportu)
VALUES (10,'Jeorge','Bush','Mistrzsp',4,1)
INSERT INTO Sportsmen(ID_Sportsmena,Imie,Nazwisko,Tytul,Id_kraju,ID_Sportu)
VALUES (11,'Barak','Obama','Mistrzsp',4,2)
INSERT INTO Sportsmen(ID_Sportsmena,Imie,Nazwisko,Tytul,Id_kraju,ID_Sportu)
VALUES (12,'Dnoald','Trump','MSMK',4,3)

SELECT * FROM Sportsmen
---------------------------------
INSERT INTO Championship(ID_Championship,Data_Championship,ID_Sportu)
VALUES(1,'1988-12-13 12:15:00',1)
INSERT INTO Championship(ID_Championship,Data_Championship,ID_Sportu)
VALUES(2,'2001-11-14 19:00:00',2)
INSERT INTO Championship(ID_Championship,Data_Championship,ID_Sportu)
VALUES(3,'2012-06-05 15:15:00',3)

SELECT * FROM Championship
--------------------------------
INSERT INTO Sportsmens_in_Championships(ID_Championship,ID_Sportsmena)
VALUES(1,1)
INSERT INTO Sportsmens_in_Championships(ID_Championship,ID_Sportsmena)
VALUES(1,4)
INSERT INTO Sportsmens_in_Championships(ID_Championship,ID_Sportsmena)
VALUES(1,7)
INSERT INTO Sportsmens_in_Championships(ID_Championship,ID_Sportsmena)
VALUES(1,10)
INSERT INTO Sportsmens_in_Championships(ID_Championship,ID_Sportsmena)
VALUES(2,2)
INSERT INTO Sportsmens_in_Championships(ID_Championship,ID_Sportsmena)
VALUES(2,5)
INSERT INTO Sportsmens_in_Championships(ID_Championship,ID_Sportsmena)
VALUES(2,8)
INSERT INTO Sportsmens_in_Championships(ID_Championship,ID_Sportsmena)
VALUES(2,11)
INSERT INTO Sportsmens_in_Championships(ID_Championship,ID_Sportsmena)
VALUES(3,3)
INSERT INTO Sportsmens_in_Championships(ID_Championship,ID_Sportsmena)
VALUES(3,6)
INSERT INTO Sportsmens_in_Championships(ID_Championship,ID_Sportsmena)
VALUES(3,9)
INSERT INTO Sportsmens_in_Championships(ID_Championship,ID_Sportsmena)
VALUES(3,12)

SELECT * FROM Sportsmens_in_Championships
---------------------------------------------------------
INSERT INTO Medal(ID_medali,Typ,ID_Sportsmena,ID_Championship)
VALUES(1,'G',1,1)
INSERT INTO Medal(ID_medali,Typ,ID_Sportsmena,ID_Championship)
VALUES(2,'S',4,1)
INSERT INTO Medal(ID_medali,Typ,ID_Sportsmena,ID_Championship)
VALUES(3,'B',10,1)
INSERT INTO Medal(ID_medali,Typ,ID_Sportsmena,ID_Championship)
VALUES(4,'G',5,2)
INSERT INTO Medal(ID_medali,Typ,ID_Sportsmena,ID_Championship)
VALUES(5,'S',8,2)
INSERT INTO Medal(ID_medali,Typ,ID_Sportsmena,ID_Championship)
VALUES(6,'B',2,2)
INSERT INTO Medal(ID_medali,Typ,ID_Sportsmena,ID_Championship)
VALUES(7,'G',12,3)
INSERT INTO Medal(ID_medali,Typ,ID_Sportsmena,ID_Championship)
VALUES(8,'S',3,3)
INSERT INTO Medal(ID_medali,Typ,ID_Sportsmena,ID_Championship)
VALUES(9,'B',9,3)

SELECT * FROM Medal


