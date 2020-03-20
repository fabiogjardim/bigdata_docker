CREATE DATABASE IF NOT EXISTS hue;
grant all on hue.* to 'hue'@'172.27.1.13' identified by 'secretpassword';
grant all on hue.* to 'root'@'172.27.1.13' identified by 'secret';
flush privileges; 
use hue;
CREATE TABLE MyGuests (id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,firstname VARCHAR(30) NOT NULL,lastname VARCHAR(30) NOT NULL,email VARCHAR(50));