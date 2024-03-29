-- UC1 Ability to create a Address Book Service DB
create database addressbookdb;
USE AddressBookDB;

-- UC2  Ability to create a Address Book Table with first and last names, address, city, state, zip, phone number and email as its attributes
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

-- UC3 Ability to insert new Contacts to Address Book
INSERT INTO AddressBook (FirstName, LastName, adress, city, state, zip, phone, email)
VALUES ('Rihal', 'Shaikh', 'Mumbai', 'Mumbai', 'MH', '416416', '+918830540511', 'rihalshaikh999@gmail.com'),
('Javed', 'Tadavi', 'Pune', 'Pune', 'MH', '411045', '+919850344191', 'jth999@gmail.com'),
('Husen', 'pirjade', 'Sangli', 'Sangli', 'MH', '416416', '+9850713145', 'hp999@gmail.com'),
('Av', 'Ek', 'kolhapur', 'Kolhapur', 'MH', '415415', '+80805050', 'ae@gmail.com');
select  * from AddressBook;

-- UC4 Ability to edit existing contact person using their name
UPDATE AddressBook
SET adress = 'Mumbai', 
city = 'Mumbai', 
state = 'MH', 
zip = '415417', 
phone = '80808080', 
email = 'updated.email@email.com'
WHERE FirstName = 'Rihal';

SET SQL_SAFE_UPDATES = 0;

-- UC5 Ability to delete a person using person's name
DELETE FROM AddressBook
WHERE FirstName = 'Husen';
select  * from AddressBook;


-- UC6 Ability to Retrieve Person belonging to a City or State from the Address Book
SELECT * FROM AddressBook WHERE city = 'Mumbai';
-- TRUNCATE table AddressBook;

-- UC7 Ability to understand the size of address book by City and State - Here size indicates the count
SELECT city, COUNT(*) AS city_size FROM AddressBook GROUP BY city;
SELECT state, COUNT(*) AS state_size FROM AddressBook GROUP BY state;

-- UC8 Retrieve entries sorted alphabetically by Person’s name for a given city 
SELECT FirstName, LastName, City FROM AddressBook WHERE city = 'Mumbai' ORDER BY FirstName;


-- UC9 Identify each Address Book with name and Type.
ALTER TABLE AddressBook
ADD COLUMN Type VARCHAR(50);
UPDATE AddressBook SET Type = 'Family' WHERE FirstName = 'Rihal';
UPDATE AddressBook SET Type = 'Family' WHERE FirstName = 'Javed';
UPDATE AddressBook SET Type = 'Friends' WHERE FirstName = 'Husen';
UPDATE AddressBook SET Type = 'Profession' WHERE FirstName = 'Av';
select * from AddressBook;

-- UC10 get number of contact persons i.e. count by type
SELECT Type, COUNT(*) AS AddressBookSize
FROM AddressBook
GROUP BY Type;


-- UC11 add person to both Friend and Family
insert into Addressbook(FirstName, LastName, adress, city, state, zip, phone, email, Type) 
values('Rihal', 'Shaikh', 'Mumbai', 'Vashi', 'MH', 411045, 8830540511, 'rs999@gmail.com ','Friends');
select * from Addressbook;

-- UC12 Draw the ER Diagram for Address Book Service DB
-- 1st drop column 
ALTER TABLE Addressbook DROP COLUMN Type; 
select * from Addressbook;
-- 2nd part
create table AddressbookType(id int primary key AUTO_INCREMENT, Type varchar(100));
desc Addressbooktype;
select * from AddressbookType;
-- 
INSERT INTO AddressbookType (type)
VALUES('family'),('friends'),('Professional');

-- add foreign key
ALTER TABLE Addressbook
ADD COLUMN type_id INT;

ALTER TABLE Addressbook
ADD CONSTRAINT FK_AddressbookType
FOREIGN KEY (type_id) REFERENCES AddressbookType(id);