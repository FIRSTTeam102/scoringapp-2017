CREATE TABLE `answers` (
  `question_id` int(11) NOT NULL,
  `team_number` int(11) NOT NULL,
  `answer` varchar(2046) DEFAULT NULL,
  PRIMARY KEY (`question_id`,`team_number`),
  KEY `answer_team_fk` (`team_number`),
  CONSTRAINT `answer_team_fk` FOREIGN KEY (`team_number`) REFERENCES `teams` (`number`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(1000) NOT NULL,
  `seq_no` double unsigned NOT NULL DEFAULT '1' COMMENT 'The sequence order for this question.',
  `active` varchar(1) NOT NULL DEFAULT 'Y' COMMENT 'Is this question still active?',
  `q_type` varchar(20) NOT NULL DEFAULT 'SHORT' COMMENT 'The type of question: separator, short answer, multiple choice, long answer.',
  `domain` varchar(50) DEFAULT NULL COMMENT 'For multiple choice questions, the domain in ref_codes from which the choices will come.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

CREATE TABLE `ref_codes` (
  `domain` varchar(30) NOT NULL,
  `abbreviation` varchar(30) NOT NULL,
  `Meaning` varchar(100) NOT NULL,
  PRIMARY KEY (`domain`,`abbreviation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

