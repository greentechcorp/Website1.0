CREATE TABLE team (
    id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    pathToPic varchar(255) NOT NULL,
    name varchar(100) NOT NULL,
    position varchar(100) NOT NULL,
    descr text NOT NULL
);

--TEAM MEMBRES:
INSERT INTO `team` (`pathToPic`,`name`,`position`,`descr`) VALUES ('/static/img/team/Clara.jpg','Clara','CEO','Our expert in bringing our bin to the market. She has academical experiences in Business Administration and Environmental Sustainability. Her hobbies are sports and exploring the planet.');  
INSERT INTO `team` (`pathToPic`,`name`,`position`,`descr`) VALUES ('/static/img/team/jonathan.jpg','Jonathan','CTO','Pursuing a PhD in AI, with a focus on safe and efficient modeling and a MSc in Engineering makes him the right person to oversee the entire technological process from hardware to software.');  
INSERT INTO `team` (`pathToPic`,`name`,`position`,`descr`) VALUES ('/static/img/team/marcin.png','Marcin','Lead AI','Specialising in machine learning and multi-agent systems, pursuing an MSc in Artificial Intelligence. Hobbies: analog photography, literature');  
INSERT INTO `team` (`pathToPic`,`name`,`position`,`descr`) VALUES ('/static/img/team/javi.jpg','Javi','Developer','Undergrad student in Computer Science and Mathematics. Enjoys reading about philosophy and knitting.');  
INSERT INTO `team` (`pathToPic`,`name`,`position`,`descr`) VALUES ('/static/img/team/sam.jpeg','Sam','Lead Embedded Systems','Masters student interested in the intersection of IoT technologies and artificial intelligence. Experienced in embedded development and systems programming.');  
INSERT INTO `team` (`pathToPic`,`name`,`position`,`descr`) VALUES ('/static/img/team/killian.jpg','Killian','Developer','Undergraduate student in Mathematics at the University of Edinburgh.');  

INSERT INTO `team` (`pathToPic`,`name`,`position`,`descr`) VALUES ('/static/img/team/sam.jpeg','Jose Maria','Puto amo','Masters student interested in the intersection of IoT technologies and artificial intelligence. Experienced in embedded development and systems programming.');  
