create table Employe (

Employe_ID int NOT NULL PRIMARY KEY,

Name varchar (20),
C_Address varchar (30),
P_Address varchar (30),
Cell_number varchar(11),	
Landline_number varchar(12)
Job_Ident int, FOREIGN KEY (Job_Ident) REFERENCES Job(Job_ID)
);

create table Job (
Job_ID int not NULL PRIMARY KEY,
Job_title varchar(15),
Emp_ID int, FOREIGN KEY (Emp_ID) REFERENCES Employe(Employe_ID)
)

create table Producer (

Producer_ID int NOT NULL PRIMARY KEY , 

Job_Ident int, FOREIGN KEY (Job_Ident) REFERENCES Job(Job_ID),
Program_Produced int, FOREIGN KEY (Program_Produced) REFERENCES Program(Program_ID)
);

create table Solo (

Solo_ID int NOT NULL PRIMARY KEY ,

Musician_Ident int, FOREIGN KEY (Musician_Ident) REFERENCES Musician(Musician_ID)
/* Songs_Performed int,FOREIGN KEY (Songs_Performed) REFERENCES Album(Album_ID)   */
);

create table Band (

Band_ID int NOT NULL PRIMARY KEY ,

Band_name varchar(20),

Musician_Ident int, FOREIGN KEY (Musician_Ident) REFERENCES Musician(Musician_ID)
/* Songs_Performed int,FOREIGN KEY (Songs_Performed) REFERENCES Album(Album_ID)  */
);

create table Musician (
Musician_ID int NOT NULL PRIMARY KEY,
Solo_Ident int, FOREIGN KEY (Solo_Ident) REFERENCES Solo(Solo_ID),
Band_Ident int, FOREIGN KEY (Band_Ident) REFERENCES Band(Band_ID),
Job_Ident int, FOREIGN KEY (Job_Ident) REFERENCES Job(Job_ID)
);
create table Instrument ( 

Instrument_name varchar (20) NOT NULL PRIMARY KEY ,

characteristics varchar(15),

Melody_Ident int,FOREIGN KEY (Melody_Ident) REFERENCES Melody(Melody_ID) 
);

create table Musical_key (
Mkey_ID int NOT NULL PRIMARY KEY,
key varchar(15),
Emotions varchar(15),

Melody_Ident int,FOREIGN KEY (Melody_Ident) REFERENCES Melody(Melody_ID) 
);

create table Melody(
Melody_ID int NOT NULL PRIMARY KEY,
MKey_Ident int, FOREIGN KEY (MKey_Ident) REFERENCES Musical_key(Mkey_ID),
Inst_name varchar(20), FOREIGN KEY (Inst_name) REFERENCES Instrument (Instrument_name)
);

create table Composer (

Composer_ID int NOT NULL PRIMARY KEY ,

Melodist_Ident int, FOREIGN KEY (Melodist_Ident) REFERENCES Melodist(Melodist_ID),
Melody_Ident int, FOREIGN KEY (Melody_Ident) REFERENCES Melody(Melody_ID),
Songs_Composed int,FOREIGN KEY (Songs_Composed) REFERENCES Album(Album_ID),
Job_Ident int, FOREIGN KEY (Job_Ident) REFERENCES Job(Job_ID)
);

create table Author (

Author_ID int NOT NULL PRIMARY KEY,

Melodist_Ident int, FOREIGN KEY (Melodist_Ident) REFERENCES Melodist(Melodist_ID),
Job_Ident int, FOREIGN KEY (Job_Ident) REFERENCES Job(Job_ID)
/* Songs_Wrote int,FOREIGN KEY (Songs_Wrote) REFERENCES Album(Album_ID) */
);

create table Season (

Season_num int NOT NULL PRIMARY KEY ,

Program_by int,FOREIGN KEY (Program_by) REFERENCES Program(Program_ID),
Broadcast_Ident int,FOREIGN KEY (Broadcast_Ident) REFERENCES Broadcast(Broadcast_ID),
Market_Ident int, FOREIGN KEY (Market_Ident) REFERENCES Social_media(Platform_ID)
);

create table Songs (

Song_ID int NOT NULL PRIMARY KEY ,

Title varchar (15),
Copyright_Date Date,
Record_Date DATE,

Performer_Ident int,FOREIGN KEY (Performer_Ident) REFERENCES Performer(Performer_ID),
Melodist_Ident int,FOREIGN KEY (Melodist_Ident) REFERENCES Melodist(Melodist_ID),
Genre_type int,FOREIGN KEY (Genre_type) REFERENCES Genre(Genre_ID),
Album_Ident int,FOREIGN KEY (Album_Ident) REFERENCES Album(Album_ID) 
);

create table Program (

Program_ID int NOT NULL PRIMARY KEY,
Program_Album_ID int, FOREIGN KEY(Program_Album_ID) REFERENCES Album(Album_ID),
Producer_Ident int,FOREIGN KEY (Producer_Ident) REFERENCES Producer(Producer_ID),  
Season_Number int, FOREIGN KEY(Season_Number) REFERENCES Season(Season_num)
);

create table Performer (

Performer_ID int NOT NULL PRIMARY KEY,

Song_Ident int, FOREIGN KEY (Song_Ident) REFERENCES Songs(Song_ID),
Solo_Ident int, FOREIGN KEY (Solo_Ident) REFERENCES Solo(Solo_ID), 
Band_Ident int,FOREIGN KEY (Band_Ident) REFERENCES Band(Band_ID)
);

create table LiveStudio(
Session_ID int NOT NULL PRIMARY KEY,
Song_Ident int, FOREIGN KEY (Song_Ident) REFERENCES Songs(Song_ID),
Album_Ident int,FOREIGN KEY (Album_Ident) REFERENCES Album(Album_ID) 
);

create table Album (

Album_ID int NOT NULL PRIMARY KEY ,

Album_name varchar(15),
Session_Ident int, FOREIGN KEY (Session_Ident) REFERENCES LiveStudio(Session_ID),
/* Song_Ident int,FOREIGN KEY (Song_Ident) REFERENCES Songs(Song_ID), */
Program_Ident int,FOREIGN KEY (Program_Ident) REFERENCES Program(Program_ID)
);

create table Melodist (

Melodist_ID int NOT NULL PRIMARY KEY ,

Song_Ident int, FOREIGN KEY (Song_Ident) REFERENCES Songs(Song_ID),
Author_Ident int,FOREIGN KEY (Author_Ident) REFERENCES Author(Author_ID),
Composer_Ident int,FOREIGN KEY (Composer_Ident) REFERENCES Composer(Composer_ID)
);

create table Genre (

Genre_ID int NOT NULL PRIMARY KEY ,
type varchar(15),
Song_Ident int, FOREIGN KEY (Song_Ident) REFERENCES Songs (Song_ID)
);

create table Broadcast (

Broadcast_ID int NOT NULL PRIMARY KEY ,
B_Medium varchar(10),
Broadcast_Loc varchar(15), FOREIGN KEY (Broadcast_Loc) REFERENCES Region_Lang(Loc)
/* Season_Number int, FOREIGN KEY(Season_Number) REFERENCES Season(Season_num) */
);

create table Social_media (

Platform_ID int NOT NULL PRIMARY KEY ,
Platform_Name varchar(15),
fans int,
post int,
Market_Loc varchar(15), FOREIGN KEY (Market_Loc) REFERENCES Region_Lang(Loc)
/* Season_Number int, FOREIGN KEY(Season_Number) REFERENCES Season(Season_num) */
);

create table Region_Lang (

Loc varchar(15) NOT NULL PRIMARY KEY ,
Lang varchar(15),
/* Platform_Ident int, FOREIGN KEY (Platform_Ident) REFERENCES Social_media (Platform_ID),
Broadcast_Ident int, FOREIGN KEY (Broadcast_Ident) REFERENCES Broadcast(Broadcast_ID)  */
);