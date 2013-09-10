DROP TABLE IF EXISTS `topic_data`;

CREATE TABLE `topic_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic` varchar(50) DEFAULT NULL,
  `votes` int(5) DEFAULT NULL,
  `answers` int(5) DEFAULT NULL,
  `accepted_answers` int(5) DEFAULT NULL,
  `views` int(5) DEFAULT NULL,
  `hotViews` int(5) DEFAULT NULL,
  `warmViews` int(5) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1437 DEFAULT CHARSET=latin1;


