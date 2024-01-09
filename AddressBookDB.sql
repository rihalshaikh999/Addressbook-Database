-- UC1
create database addressbookdb;
USE AddressBookDB;

-- UC2 
create table AddressBook(
id int PRIMARY KEY AUTO_INCREMENT,
FirstName varchar(40) not null,
LastName varchar(40) not null,
adress varchar(100),
city varchar(40),
state varchar(40),
zip varchar(6),
phone varchar(20),
email varchar(50)
);
DESC addressbook;
select  * from AddressBook;

-- UC3
INSERT INTO AddressBook (FirstName, LastName, adress, city, state, zip, phone, email)
VALUES ('Rihal', 'Shaikh', 'Mumbai', 'Mumbai', 'MH', '416416', '+918830540511', 'rihalshaikh999@gmail.com'),
('Javed', 'Tadavi', 'Pune', 'Pune', 'MH', '411045', '+919850344191', 'jth999@gmail.com'),
('Husen', 'pirjade', 'Sangli', 'Sangli', 'MH', '416416', '+9850713145', 'hp999@gmail.com');
select  * from AddressBook;

-- UC4
UPDATE AddressBook
SET adress = 'mumbai', 
city = 'mumbai', 
state = 'mh', 
zip = '415417', 
phone = '80808080', 
email = 'updated.email@email.com'
WHERE FirstName = 'Rihal';

SET SQL_SAFE_UPDATES = 0;

-- UC5
DELETE FROM AddressBook
WHERE FirstName = 'Husen';
select  * from AddressBook;

