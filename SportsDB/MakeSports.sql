/*    This SQL DDL script was generated by Microsoft Visual Studio (Release Date: LOCAL BUILD). */

/*    Driver Used : Microsoft Visual Studio - Microsoft SQL Server Driver.                    */
/*    Document    : C:\WINDOWS\System32\Drawing1.                                             */
/*    Time Created: 15 December 2017 12:34.                                                   */
/*    Operation   : From Visio Generate Wizard.                                               */
/*    Connected data source : No connection.                                                  */
/*    Connected server      : No connection.                                                  */
/*    Connected database    : Not applicable.                                                 */



SET QUOTED_IDENTIFIER ON

go


/* Create Sports database.                                                                    */
use master  

go

create database "Sports"  

go

use "Sports"  

go

/* Create new table "Sportsmen".                                                             */
/* "Sportsmen1" : Table of Sportsmen1                                                         */
/* 	"Imie" : Imie is of Sportsmen1                                                            */
/* 	"Nazwisko" : Nazwisko is of Sportsmen1                                                    */
/* 	"Tytul" : Tytul is of Sportsmen1                                                          */
/* 	"ID_Sportsmena" : ID_Sportsmena identifies Sportsmen1                                     */
/* 	"ID_kraju" : ID_kraju is of Sportsmen1                                                    */
/* 	"ID_Sportu" : ID_Sportu is of Sportsmen1                                                  */  
create table "Sportsmen" ( 
	"Imie" varchar(10) null,
	"Nazwisko" varchar(10) null,
	"Tytul" varchar(10) null,
	"ID_Sportsmena" smallint not null,
	"ID_kraju" smallint null,
	"ID_Sportu" smallint null)  

go

alter table "Sportsmen"
	add constraint "Sportsmen_PK" primary key ("ID_Sportsmena")   


go

/* Create new table "Sportsmens_in_Championships1".                                           */
/* "Sportsmens in Championships1" : Table of Sportsmens in Championships1                     */
/* 	"ID_Sportsmena" : ID_Sportsmena identifies Sportsmens in Championships1                   */
/* 	"ID_Championship" : ID_Championship partly identifies Sportsmens in Championships1        */  
create table "Sportsmens_in_Championships" ( 
	"ID_Sportsmena" smallint not null,
	"ID_Championship" smallint not null)  

go

alter table "Sportsmens_in_Championships"
	add constraint "Sportsmens in Championships_PK" primary key ("ID_Sportsmena", "ID_Championship")   


go

/* Create new table "Championship".                                                          */
/* "Championship1" : Table of Championship1                                                   */
/* 	"ID_Championship" : ID_Championship identifies Championship1                              */
/* 	"Data" : Data is of Championship1                                                         */
/* 	"ID_Sportu" : ID_Sportu is of Championship1                                               */  
create table "Championship" ( 
	"ID_Championship" smallint not null,
	"Data" smalldatetime null,
	"ID_Sportu" smallint null)  

go

alter table "Championship"
	add constraint "Championship_PK" primary key ("ID_Championship")   


go

/* Create new table "Sport type1".                                                            */
/* "Sport type1" : Table of Sport type1                                                       */
/* 	"ID_Sportu" : ID_Sportu identifies Sport type1                                            */
/* 	"Typ" : Typ is of Sport type1                                                             */  

create table "Sport_type" ( 
	"ID_Sportu" smallint not null,
	"Typ" varchar(10) null)  

go

alter table "Sport_type"
	add constraint "Sport type_PK" primary key ("ID_Sportu")   


go

/* Create new table "Medal".                                                                 */
/* "Medal1" : Table of Medal1                                                                 */
/* 	"ID_medali" : ID_medali identifies Medal1                                                 */
/* 	"Typ" : Typ is of Medal1                                                                  */  
create table "Medal" ( 
	"ID_medali" smallint not null,
	"Typ" char(1) null,
	"ID_Sportsmena" smallint,
	ID_Championship smallint
	)  

go

alter table "Medal"
	add constraint "Medal_PK" primary key ("ID_medali")   


go




/* Create new table "Country".                                                               */
/* "Country1" : Table of Country1                                                             */
/* 	"ID_kraju" : ID_kraju identifies Country1                                                 */
/* 	"Kraj" : Kraj is of Country1                                                              */  
create table "Country" ( 
	"ID_kraju" smallint not null,
	"Kraj" varchar(10) null)  

go

alter table "Country"
	add constraint "Country_PK" primary key ("ID_kraju")   


go

/* Add foreign key constraints to table "Sportsmen1".                                         */
alter table "Sportsmen"
	add constraint "Country_Sportsmen_FK1" foreign key (
		"ID_kraju")
	 references "Country" (
		"ID_kraju") on update no action on delete no action  

go

alter table "Sportsmen"
	add constraint "Sport_type_Sportsmen_FK1" foreign key (
		"ID_Sportu")
	 references "Sport_type" (
		"ID_Sportu") on update no action on delete no action  

go

/* Add foreign key constraints to table "Sportsmens in Championships1".                       */
alter table "Sportsmens_in_Championships"
	add constraint "Sportsmen_Sportsmens in Championships_FK1" foreign key (
		"ID_Sportsmena")
	 references "Sportsmen" (
		"ID_Sportsmena") on update no action on delete no action  

go

alter table "Sportsmens_in_Championships"
	add constraint "Championship_Sportsmens in Championships_FK1" foreign key (
		"ID_Championship")
	 references "Championship" (
		"ID_Championship") on update no action on delete no action  

go

/* Add foreign key constraints to table "Championship1".                                      */
alter table "Championship"
	add constraint "Sport_type_Championship_FK1" foreign key (
		"ID_Sportu")
	 references "Sport_type" (
		"ID_Sportu") on update no action on delete no action  

go


/* Add foreign key constraints to table "Medal".                            */
alter table "Medal"
	add constraint "Medal_Sportsmen_FK1" foreign key (
		"ID_Sportsmena")
	 references "Sportsmen" (
		"ID_Sportsmena") on update no action on delete no action  

go

alter table "Medal"
	add constraint "Championship_Medal_FK1" foreign key (
		"ID_Championship")
	 references "Championship" (
		"ID_Championship") on update no action on delete no action  

go


/* This is the end of the Microsoft Visual Studio generated SQL DDL script.                   */

