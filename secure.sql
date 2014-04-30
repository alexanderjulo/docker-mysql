DELETE FROM mysql.user WHERE User='';
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test_%';
UPDATE mysql.user SET Password=PASSWORD('insecure') WHERE User='root';
CREATE USER 'admin'@'%' IDENTIFIED BY 'insecure';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%';
FLUSH PRIVILEGES;
