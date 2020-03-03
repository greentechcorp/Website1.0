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

--Sample post:
INSERT INTO `blog_posts` (`postOwnerID`,`postOwnerName`,`postTitle`,`postContent`) VALUES ('2','Michael Pierce','Hey guys!','This is a bloody test'); 