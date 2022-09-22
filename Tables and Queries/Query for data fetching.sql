
create view Songsinfo as select Songs.Title "Song Title", Songs.Record_Date "Date performed", (select Employe.Name from Employe inner join Job on Employe.job_ID = Job.Job_ID where  Employe.Job_ID  = 3)"Author" , Employe.Name "Artist", Songs.season_num"Season number" from Songs inner join Employe on Employe.Employe_ID = Songs.Song_ID  where Employe.job_id = 1;
select * from songsinfo;


select distinct Employe.Name "Artist", Genre.type, Performer_Ident, count(Performer_Ident)"Number_of_Appearance" from Employe ee,genre, Songs inner join employe on Employe.employe_ID = Genre.Genre_ID where Employe.job_id = 1; 


select distinct Employe.name Musician, Melody.Inst_name, Employe.Cell_number, Employe.Landline_number from Melody mm,Employe inner join Melody on Melody.Melody_ID = Employe.Employe_ID ;


SELECT (STUFF((
        SELECT ', ' + Inst_name
        FROM Melody
        WHERE Melody_ID = MKey_Ident AND employe_ID = 7  
        FOR XML PATH('')
        ), 1,2, '')
    ) AS Instrument_Name, count(melody.employe_ID)"Number of Musicians" from melody where melody.employe_ID =7 
	
	UNION

	SELECT (STUFF((
        SELECT ', ' + Inst_name
        FROM Melody
        WHERE Melody_ID = MKey_Ident AND Melody.employe_ID = 8 
        FOR XML PATH('')
        ), 1, 2, '')
    ) AS Instrument_Name, count(melody.employe_ID)"Number of Musicians" from melody where melody.employe_ID =8 order by count(melody.employe_ID) desc;


select Songs.Title,(STUFF((SELECT ', ' + Employe.Name FROM Employe WHERE Employe_ID = (select top 1 Employe_ID from Songs inner join Performer on (Songs.Performer_Ident = Performer.Performer_ID) where Performer.Solo_Ident IS NOT NULL AND Performer.Band_Ident IS NOT NULL) FOR XML PATH('')), 1,2, '')) AS Musician
 ,(select Employe.Name from Employe inner join Job on Employe.job_ID = Job.Job_ID where  Employe.Job_ID  = 3)"Author"  from Songs inner join Performer on Songs.Performer_Ident = Performer.Performer_ID where Performer.Solo_Ident IS NOT NULL AND Performer.Band_Ident IS NOT NULL;


select Melody.Inst_name, Musical_key.key_type from Musical_key inner join Melody on Melody.MKey_Ident = Musical_key.Melody_Ident;


(select top 1 count(melody_Ident) "Number of Instruments used", (STUFF((
        SELECT ', ' + Instrument_name
        FROM Instrument
        WHERE Melody_Ident = (select top 1 Melody_ident from Instrument group by melody_ident having count(melody_Ident) >= 3)
        FOR XML PATH('')
        ), 1, 2, '')
    ) AS Instrument_Name  from Instrument group by melody_Ident having count(melody_Ident) >= 3 )
	
	UNION

select top 1 count(melody_Ident) "Number of Instruments used", (STUFF((
        SELECT ', ' + Instrument_name
        FROM Instrument
        WHERE Melody_Ident = (select top 1 Melody_ident from Instrument group by melody_ident having count(melody_Ident) >= 3 order by Melody_Ident desc)
        FOR XML PATH('')
        ), 1, 2, '')
    ) AS Instrument_Name  from Instrument group by melody_Ident having count(melody_Ident) = 3;


select songs.title "Song title", Employe.Name Band_Members from songs,Employe where songs.band_id = (select top 1 band_id from songs group by band_id order by band_id desc) and employe.band_id = (select top 1 band_id from songs group by band_id order by band_id desc);


select top 3 title "Song Title", count(title) "Number of Musical Keys used", (select Musical_key.key_type from Musical_key where Musical_key.Mkey_ID = (select top 1 count(title) from songs inner join Musical_key on songs.Song_ID = Musical_key.Melody_Ident group by title order by count(title) desc)) "Musical Keys" from songs inner join Musical_key on songs.Song_ID = Musical_key.Melody_Ident group by title order by count(title) desc;


select Employe.Name "Artist", Genre.type, (select top 1 Season_num from Season order by Season_num desc) "Season number" from Employe inner join Genre on Employe.Employe_ID = Genre.Song_Ident where Employe.job_ID =1  group by Employe.Name, Genre.type ;
