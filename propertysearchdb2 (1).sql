create database PropertySearchDB2;

use PropertySearchDB2;

CREATE TABLE Users (
user_id VARCHAR(255) Primary Key NOT NULL,   -- U001-U100
name_ VARCHAR(255),
email VARCHAR(255) UNIQUE,
phone_number VARCHAR(255) UNIQUE,
user_type ENUM('Customer', 'Admin', 'Agent', 'Owner'),
address TEXT,
index (email),
registered_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

Create table Agents( 
agent_id Varchar(255) Primary key not null, -- A001-A100
agent_name Varchar(255) ,
agent_contact Varchar(255) ,
agent_email Varchar(255) UNIQUE,
agency_name Varchar(255) ,
registered_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Properties (
property_id varchar(255) PRIMARY KEY NOT NULL , -- P001-P100
owner_id varchar(255),  -- O001-O100
title VARCHAR(255),
description_ TEXT,
price DECIMAL(10,2),
area DECIMAL(10,2),
agent_id varchar(255),
property_type ENUM('House', 'Apartment', 'Commercial'),
location VARCHAR(255),
status_ ENUM('Available', 'Rented', 'Sold', 'Leased'),
listed_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
images BLOB,
Foreign Key (owner_id) REFERENCES Users(user_id),
Foreign Key (agent_id) REFERENCES Agents(agent_id)
);

CREATE TABLE Inquiries (
inquiry_id VARCHAR(50) PRIMARY KEY not null,  -- I001-I100 
property_id VARCHAR(50),
user_id VARCHAR(50),      
inquiry_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
message TEXT,
status_ ENUM('Pending', 'Responded', 'Closed'),
foreign key (user_id) references Users(user_id),
foreign key(property_id) references Properties(property_id));
 
Create table Bookings (
booking_id varchar(255) PRIMARY KEY not null, -- B001-B100
user_id VARCHAR(255) ,            
property_id VARCHAR(255),        
booking_status ENUM('Pending', 'Confirmed', 'Cancelled', 'Completed'),
booking_date DATETIME DEFAULT CURRENT_TIMESTAMP,
start_date DATETIME,
end_date DATETIME,
foreign key (user_id) references Users(user_id),
foreign key (property_id) references Properties(property_id));    

create table Payments (
Payment_id varchar(255) primary key not null,  -- PY001-PY100
property_id varchar(255),
user_id varchar(255),
Booking_id varchar(255),
Amount decimal(10,2),
Payment_Date datetime ,
Payment_Method enum('Credit Note','Debit Note','Wallet','Cash'),
Payment_Status enum('Pending','Completed','Refunded'),
index (Payment_Date),
foreign key (user_id) references Users(user_id),
foreign key (booking_id) references Bookings(booking_id),
foreign key(property_id) references Properties(property_id)
);

Create table Feedback
(
feedback_id varchar (255) Primary Key  NOT NULL,  -- F001-F100
booking_id varchar (255),
user_id varchar (255),
rating int,
comments varchar(255),
foreign key (booking_id) references Bookings(booking_id),
foreign key (user_id) references Users(user_id)
); 


    
create table Coupons (
coupon_id Varchar(255) primary key,  -- C001-C100
code_ Varchar(255) UNIQUE,
discount decimal(10,2) ,
expiry_date DATETIME,
status_ ENUM('valid', 'used', 'expired'),
booking_id varchar(255),
foreign key (booking_id) references Bookings(booking_id)
);

CREATE TABLE Operation_Logs 
(
log_id VARCHAR(255) PRIMARY KEY NOT NULL,  -- L001-L100
operation_type VARCHAR(255),
table_name_ VARCHAR(255),
operation_time TIMESTAMP,
changed_data JSON
);




