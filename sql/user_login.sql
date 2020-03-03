CREATE TABLE user_login (
    id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username varchar(255) NOT NULL UNIQUE,
    psswrd varchar(100) NOT NULL,
    rnk tinyint(1) DEFAULT '0' NOT NULL,
    name varchar(255) NOT NULL
);

--Sample users:
INSERT INTO `user_login` (`username`,`psswrd`,`rnk`,`name`) VALUES ('admin','D3992660AEA344678F84C7DBB3191001E0BCD7A06E8DB4D232C3CA2671281B51','2','Administrator');  
INSERT INTO `user_login` (`username`,`psswrd`,`rnk`,`name`) VALUES ('javi','48DE5D926938D291454BBAB74B6F16B3843143BCC8D03DE6951E047FE768C976','2','Javier Bosch');  
INSERT INTO `user_login` (`username`,`psswrd`,`rnk`,`name`) VALUES ('sam','064B1B60FA96DC5A7A49F461F1CEB7A0DB34D38405F4FB9DEA9241AD408A00F6','0','Samuel Knight');  
