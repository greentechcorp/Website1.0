CREATE TABLE user_login (
    id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username varchar(255) NOT NULL UNIQUE,
    psswrd varchar(100) NOT NULL,
    rnk tinyint(1) DEFAULT '0' NOT NULL,
    name varchar(255) NOT NULL
);
INSERT INTO `user_login` (`username`,`psswrd`,`rnk`,`name`) VALUES ('admin','D3992660AEA344678F84C7DBB3191001E0BCD7A06E8DB4D232C3CA2671281B51','2','Administrator');  
INSERT INTO `user_login` (`username`,`psswrd`,`rnk`,`name`) VALUES ('javi','48DE5D926938D291454BBAB74B6F16B3843143BCC8D03DE6951E047FE768C976','2','Javier Bosch');  
INSERT INTO `user_login` (`username`,`psswrd`,`rnk`,`name`) VALUES ('sam','064B1B60FA96DC5A7A49F461F1CEB7A0DB34D38405F4FB9DEA9241AD408A00F6','0','Samuel Knight');  

CREATE TABLE blog_posts (
    postID int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    postOwnerID int(11) NOT NULL,
    postOwnerName varchar(255) NOT NULL,
    postTitle varchar(255) NOT NULL,
    postDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    postContent text NOT NULL,
    pathToPic varchar(255),
    public tinyint(1) DEFAULT '1' NOT NULL,
    edited tinyint(1) DEFAULT '0' NOT NULL
);
INSERT INTO `blog_posts` (`postOwnerID`,`postOwnerName`,`postTitle`,`postContent`) VALUES ('2','Michael Pierce','Hey guys!','This is a fkcn test');  

CREATE TABLE team (
    id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    pathToPic varchar(255) NOT NULL,
    name varchar(100) NOT NULL,
    position varchar(100) NOT NULL,
    descr text NOT NULL
);
INSERT INTO `team` (`pathToPic`,`name`,`position`,`descr`) VALUES ('/static/img/team/Clara.jpg','Clara','CEO','Our expert in bringing our bin to the market. She has academical experiences in Business Administration and Environmental Sustainability. Her hobbies are sports and exploring the planet.');  
INSERT INTO `team` (`pathToPic`,`name`,`position`,`descr`) VALUES ('/static/img/team/jonathan.jpg','Jonathan','CTO','Pursuing a PhD in AI, with a focus on safe and efficient modeling and a MSc in Engineering makes him the right person to oversee the entire technological process from hardware to software.');  
INSERT INTO `team` (`pathToPic`,`name`,`position`,`descr`) VALUES ('/static/img/team/marcin.png','Marcin','Lead AI','Specialising in machine learning and multi-agent systems, pursuing an MSc in Artificial Intelligence. Hobbies: analog photography, literature');  
INSERT INTO `team` (`pathToPic`,`name`,`position`,`descr`) VALUES ('/static/img/team/javi.jpg','Javi','Developer','Undergrad student in Computer Science and Mathematics. Enjoys reading about philosophy and knitting.');  
INSERT INTO `team` (`pathToPic`,`name`,`position`,`descr`) VALUES ('/static/img/team/sam.jpeg','Sam','Lead Embedded Systems','Masters student interested in the intersection of IoT technologies and artificial intelligence. Experienced in embedded development and systems programming.');  
INSERT INTO `team` (`pathToPic`,`name`,`position`,`descr`) VALUES ('/static/img/team/killian.jpg','Killian','Developer','Undergraduate student in Mathematics at the University of Edinburgh.');  

CREATE TABLE ourValues (
    id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title varchar(255) NOT NULL,
    subtitle varchar(255) NOT NULL,
    descr text NOT NULL
);
INSERT INTO `ourValues` (`id`,`title`, `subtitle`, `descr`) VALUES ('1','Be yourself','Difference is valued','We believe that diverse ideas, perspectives and backgrounds fuel innovation andbring about a more powerful and creative work environment yielding greater results. We seek to form an inclusive workforce that embraces the diverse communities weserve and in which each person feels confident and enabled to be their true authenticself. Be yourself at work, because that is your best version.');
INSERT INTO `ourValues` (`id`,`title`, `subtitle`, `descr`) VALUES ('2','Be transparent','Open collaboration for truth','We believe that integrity is the foundation for our company on which coworkers buildrelationships, trust, honesty and effective interpersonal relationships. We strive toalways act just and right, work truthfully and honourably, thus maintaining high ethicalstandards, even when no one is watching. We hold ourselves accountable for choiceand outcomes, good as well as bad ones.');
INSERT INTO `ourValues` (`id`,`title`, `subtitle`, `descr`) VALUES ('3','Be customer-centric','Encourage them','We believe in the engagement of customers as a way to create the most efficientsolutions together. We want to build customer relations by creating awareness andresponsible choices that respect the earth and the environment. In partnering withour customers and putting ourselves in their shoes, we can understand their needsand thus deliver the best experience. In doing so we are always open to challengeour ideas of what’s possible.');
INSERT INTO `ourValues` (`id`,`title`, `subtitle`, `descr`) VALUES ('4','Be curious and bold','Strive for excellence','We believe in challenging the status quo. We are passionate about learning and seekto constantly improve and innovate. We are not afraid to make mistakes. Weproactively use them as an opportunity to share and learn. We work to challenge oneanother to push boundaries and think beyond the box to have an impact in thisextraordinary world. Thus, we value original thinking, the passion to attack difficultchallenges, and thoughtful feedback.');
INSERT INTO `ourValues` (`id`,`title`, `subtitle`, `descr`) VALUES ('5','Be sustainable','Embrace it','We believe in the power of technology to enable sustainable progress and minimiseour impact on the environment for the benefit of current and future generations. Westrive for passionate collaborators, who are dedicated to act as environmentaladvocates and to improve the health and happiness of the world. We are committedto incorporate recyclable materials and renewable energy from local sourceswhenever possible. We actively consider the environment in the choices we makeand work towards a more circular economy.');
