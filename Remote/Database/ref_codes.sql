USE scoring2016;

CREATE TABLE `ref_codes` (
  `domain` varchar(30) NOT NULL,
  `abbreviation` varchar(30) NOT NULL,
  `Meaning` varchar(100) NOT NULL,
  PRIMARY KEY (`domain`,`abbreviation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


insert into `ref_codes`(`domain`,`abbreviation`,`Meaning`) values ('1TO5','1','1 - Not at all');
insert into `ref_codes`(`domain`,`abbreviation`,`Meaning`) values ('1TO5','2','2 - Very little');
insert into `ref_codes`(`domain`,`abbreviation`,`Meaning`) values ('1TO5','3','3 - We need them to get a really good score');
insert into `ref_codes`(`domain`,`abbreviation`,`Meaning`) values ('1TO5','4','4 - We need them to score most of our points');
insert into `ref_codes`(`domain`,`abbreviation`,`Meaning`) values ('1TO5','5','5 - We can''t score');
insert into `ref_codes`(`domain`,`abbreviation`,`Meaning`) values ('1TO7','1','1 - Really Bad');
insert into `ref_codes`(`domain`,`abbreviation`,`Meaning`) values ('1TO7','2','2 - Bad');
insert into `ref_codes`(`domain`,`abbreviation`,`Meaning`) values ('1TO7','3','3 - Not Good');
insert into `ref_codes`(`domain`,`abbreviation`,`Meaning`) values ('1TO7','4','4 - OK');
insert into `ref_codes`(`domain`,`abbreviation`,`Meaning`) values ('1TO7','5','5 - Good');
insert into `ref_codes`(`domain`,`abbreviation`,`Meaning`) values ('1TO7','6','6 - Really Good');
insert into `ref_codes`(`domain`,`abbreviation`,`Meaning`) values ('1TO7','7','7 - Great');
insert into `ref_codes`(`domain`,`abbreviation`,`Meaning`) values ('AUTO_TEL','AUTO','Autonomous');
insert into `ref_codes`(`domain`,`abbreviation`,`Meaning`) values ('AUTO_TEL','TELI','Telioperated');
insert into `ref_codes`(`domain`,`abbreviation`,`Meaning`) values ('DRIVE_TYPE','MECANUM','Mecanum');
insert into `ref_codes`(`domain`,`abbreviation`,`Meaning`) values ('DRIVE_TYPE','OTHER','Other');
insert into `ref_codes`(`domain`,`abbreviation`,`Meaning`) values ('DRIVE_TYPE','TANK','Tank');
insert into `ref_codes`(`domain`,`abbreviation`,`Meaning`) values ('HIMEDLO','HI','High');
insert into `ref_codes`(`domain`,`abbreviation`,`Meaning`) values ('HIMEDLO','LO','Low');
insert into `ref_codes`(`domain`,`abbreviation`,`Meaning`) values ('HIMEDLO','MED','Medium');
insert into `ref_codes`(`domain`,`abbreviation`,`Meaning`) values ('STACK','1','1');
insert into `ref_codes`(`domain`,`abbreviation`,`Meaning`) values ('STACK','2','2');
insert into `ref_codes`(`domain`,`abbreviation`,`Meaning`) values ('STACK','3','3');
insert into `ref_codes`(`domain`,`abbreviation`,`Meaning`) values ('STACK','4','4');
insert into `ref_codes`(`domain`,`abbreviation`,`Meaning`) values ('STACK','5','5');
insert into `ref_codes`(`domain`,`abbreviation`,`Meaning`) values ('STACK','6','6');
insert into `ref_codes`(`domain`,`abbreviation`,`Meaning`) values ('TIME','FAST','Fast= < 1min');
insert into `ref_codes`(`domain`,`abbreviation`,`Meaning`) values ('TIME','MED','Medium= About 1min to 1 1/2min');
insert into `ref_codes`(`domain`,`abbreviation`,`Meaning`) values ('TIME','SLOW','Slow= > 1 1/2min');
insert into `ref_codes`(`domain`,`abbreviation`,`Meaning`) values ('TRANSMISSION','BELT','Belt');
insert into `ref_codes`(`domain`,`abbreviation`,`Meaning`) values ('TRANSMISSION','CHAIN','Chain');
insert into `ref_codes`(`domain`,`abbreviation`,`Meaning`) values ('TRANSMISSION','DIRECT','Direct Drive');
insert into `ref_codes`(`domain`,`abbreviation`,`Meaning`) values ('YES_NO','NO','No');
insert into `ref_codes`(`domain`,`abbreviation`,`Meaning`) values ('YES_NO','YES','Yes');

insert into `ref_codes`(`domain`,`abbreviation`,`Meaning`) values ('DRIVE_TYPE','SWERVE','Swerve');
