CREATE DATABASE mydb;
USE mydb;
CREATE TABLE authors (id INT, name VARCHAR(20), email VARCHAR(20));
INSERT INTO authors (id,name,email) VALUES(1,"Vivek","xuz@abc.com");
INSERT INTO authors (id,name,email) VALUES(2,"Priya","p@gmail.com");
INSERT INTO authors (id,name,email) VALUES(3,"Tom","tom@yahoo.com");

# Create Sha2Based user
CREATE USER 'sha2user'@'%'
IDENTIFIED WITH caching_sha2_password BY 'password';
GRANT ALL ON mydb.* TO 'sha2user'@'%';
FLUSH PRIVILEGES;
