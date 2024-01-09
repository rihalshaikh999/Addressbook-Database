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
