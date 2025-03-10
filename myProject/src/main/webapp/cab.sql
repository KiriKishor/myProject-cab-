CREATE DATABASE cab;

USE cab;
CREATE TABLE users (
    username VARCHAR(50) PRIMARY KEY,
    address VARCHAR(100) NOT NULL,
    nic_no VARCHAR(15) UNIQUE NOT NULL,
    mobile_no VARCHAR(15) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);
    
USE cab;
select * from users;

use cab;
CREATE TABLE bookings (
    booking_number INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    mobile_no VARCHAR(15) NOT NULL,
    starting_point VARCHAR(255) NOT NULL,
    finishing_point VARCHAR(255) NOT NULL,
    distance DOUBLE NOT NULL
);

USE cab;
select * from bookings;

USE cab;
CREATE TABLE admin (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);
INSERT INTO admin (username, password) VALUES ('admin', '123456789');

USE cab;
select * from admin;

SELECT * FROM bookings;

USE cab;
CREATE TABLE drivers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address TEXT NOT NULL,
    nic_no VARCHAR(20) NOT NULL,
    image VARCHAR(255) NOT NULL
);

CREATE TABLE cabs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    model VARCHAR(255) NOT NULL,
    cab_number VARCHAR(50) NOT NULL,
    seats INT NOT NULL,
    image VARCHAR(255) NOT NULL
);

USE cab;
SELECT * FROM drivers;

USE cab;
SELECT * FROM cabs;

USE cab;
UPDATE drivers SET image = 'images/d1.jpg' WHERE id = 1;

USE cab;
CREATE TABLE help_messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    message TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


USE cab;
SELECT * FROM help_messages;

USE cab;
CREATE TABLE newdrivers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    license_number VARCHAR(255) NOT NULL UNIQUE,
    mobile_number VARCHAR(15) NOT NULL
);

USE cab;
SELECT * FROM newdrivers;


