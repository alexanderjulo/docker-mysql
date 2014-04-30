# disable configure some stuff for security
DELETE FROM mysql.user WHERE User='';
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test_%';
UPDATE mysql.user SET Password=PASSWORD('insecure') WHERE User='root';

# now let's make it worse than it was in the beginning and enable remote access
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'insecure';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' WITH GRANT OPTION;
CREATE USER 'admin'@'%' IDENTIFIED BY 'insecure';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;

# flush that shit
FLUSH PRIVILEGES;
