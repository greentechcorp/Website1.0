CREATE TABLE user_login (
    id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username varchar(255) NOT NULL UNIQUE,
    psswrd varchar(100) NOT NULL,
    rnk tinyint(1) DEFAULT '0' NOT NULL,
    name varchar(255) NOT NULL
);

INSERT INTO `user_login` (`username`,`psswrd`,`rnk`,`name`) VALUES ('admin','admin','2','Leonard Hofstadter');  
INSERT INTO `user_login` (`username`,`psswrd`,`rnk`,`name`) VALUES ('javi','f29b38f160f87ae86df31cee1982066f','2','Javier Bosch');  


UPDATE `user_login` SET `psswrd` = '21232f297a57a5a743894a0e4a801fc3' WHERE id = 1;
UPDATE `user_login` SET `psswrd` = '18126e7bd3f84b3f3e4df094def5b7de' WHERE id = 2;




SELECT psswrd FROM user_login WHERE username = X

CREATE TABLE blog_posts (
    postID int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    postOwnerID int(11) NOT NULL,
    postOwnerName varchar(255) NOT NULL,
    postTitle varchar(255) NOT NULL,
    postDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    postContent text NOT NULL,
    public tinyint(1) DEFAULT '1' NOT NULL,
    edited tinyint(1) DEFAULT '0' NOT NULL
);

INSERT INTO `blog_posts` (`postOwnerID`,`postOwnerName`,`postTitle`,`postContent`) VALUES ('1','Leonard Hofstadter','Hello there!','General Kenobi');  
INSERT INTO `blog_posts` (`postOwnerID`,`postOwnerName`,`postTitle`,`postContent`) VALUES ('2','Michael Pierce','Hey guys!','This is a fkcn test');  
