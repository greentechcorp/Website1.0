CREATE DATABASE websitedb;

USE websitedb;

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

INSERT INTO `blog_posts` (`postOwnerID`,`postOwnerName`,`postTitle`,`postContent`,`pahtToPic`) VALUES ('2','Michael Pierce','Hey guys!','<strong>Lorem ipsum dolor</strong> sit amet, consectetur adipiscing elit. Proin nec interdum magna. Vivamus id pretium libero, vehicula commodo est. Maecenas pharetra venenatis ornare. Aliquam non massa vel libero sagittis malesuada sed in nibh. Mauris eleifend in augue tincidunt condimentum. Quisque aliquet a lacus in vehicula. In non ante purus. Sed cursus laoreet mi vel vulputate. Proin consequat luctus nulla, sed aliquam tellus mattis vitae. Nam vel justo dui.<br><br>Proin eget porttitor erat. Aliquam elit massa, tristique ac scelerisque id, tempor eget enim. Etiam rhoncus auctor euismod. Nullam nec vulputate odio, in ornare lacus. Ut quis dictum erat. Vestibulum at sem ligula. Praesent ex nulla, venenatis non tempus eleifend, ultrices sit amet sem. Cras vehicula, nunc eu blandit feugiat, felis urna porta leo, vitae molestie urna diam at leo. Proin ornare libero tellus, at cursus diam rhoncus vel. Fusce laoreet vulputate arcu, vitae egestas nisl pretium a. Vestibulum mauris ex, eleifend non lectus vitae, auctor scelerisque lorem. Praesent efficitur, erat eu euismod lacinia, felis risus malesuada nibh, sit amet pretium leo odio quis dui. Cras eleifend, enim accumsan porttitor interdum, augue diam finibus purus, sit amet suscipit lacus tortor a erat.<br><br>In placerat aliquet posuere. Quisque sem lorem, volutpat eget facilisis imperdiet, volutpat a diam. Duis dapibus id ligula a pellentesque. Morbi et ligula eget enim gravida interdum et at sem. In hac habitasse platea dictumst. Morbi sed augue eget augue posuere lacinia eget nec nisi. Etiam eget diam tortor. Duis cursus eros vel sapien varius, ut porta nunc venenatis. Nulla commodo faucibus neque, non vehicula urna accumsan eu. Donec lacinia porttitor leo, sit amet dapibus ipsum blandit eget. Nam bibendum egestas augue id auctor. Duis efficitur non mauris accumsan vulputate.<br><br>Morbi augue leo, scelerisque congue semper ac, posuere vitae metus. Proin nec diam augue. Sed ut purus dui. Morbi cursus tempor vulputate. Vivamus lobortis sollicitudin urna ac scelerisque. In hac habitasse platea dictumst. Aenean lobortis ligula eu sem facilisis, sed convallis orci ornare.<br><br>Praesent sed malesuada leo, a tempus lectus. Integer nulla justo, varius ut lobortis a, malesuada non nisl. Phasellus a ipsum sit amet mauris sagittis auctor ac vitae tellus. Pellentesque rhoncus in est in bibendum. Vivamus ac elit quis mi aliquam mollis quis quis mauris. Maecenas fringilla tristique tortor. Nam porta tellus a est convallis viverra. Maecenas a augue dictum, finibus massa ac, congue ligula. ','sample.jpg');

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

CREATE TABLE team (
    id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    pathToPic varchar(255) NOT NULL,
    name varchar(100) NOT NULL,
    position varchar(100) NOT NULL,
    descr text NOT NULL
);

INSERT INTO `team` (`pathToPic`,`name`,`position`,`descr`) VALUES ('/static/img/team/Clara.jpg','Clara','CEO','Our expert in bringing our bin to the market. She has academical experiences in Business Administration and Environmental Sustainability. Her hobbies are sports and exploring the planet.');  
INSERT INTO `team` (`pathToPic`,`name`,`position`,`descr`) VALUES ('/static/img/team/jonathan.jpg','Jonathan','CTO','Pursuing a PhD in AI, with a focus on safe and efficient modeling and a MSc in Engineering makes him the right person to oversee the entire technological process from hardware to software.');  
INSERT INTO `team` (`pathToPic`,`name`,`position`,`descr`) VALUES ('/static/img/team/javi.jpg','Javi','Developer','Undergrad student in Computer Science and Mathematics. Enjoys reading about philosophy and knitting.');  
INSERT INTO `team` (`pathToPic`,`name`,`position`,`descr`) VALUES ('/static/img/team/sam.jpeg','Sam','Lead Embedded Systems','Masters student interested in the intersection of IoT technologies and artificial intelligence. Experienced in embedded development and systems programming.');  

CREATE TABLE user_login (
    id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username varchar(255) NOT NULL UNIQUE,
    psswrd varchar(100) NOT NULL,
    rnk tinyint(1) DEFAULT '0' NOT NULL,
    name varchar(255) NOT NULL
);

INSERT INTO `user_login` (`username`,`psswrd`,`rnk`,`name`) VALUES ('admin','5701c07ed34466d25217ff366186d9bdf72301edf5e3cbb5c780a1e1be9e4c60','2','Administrator');  
