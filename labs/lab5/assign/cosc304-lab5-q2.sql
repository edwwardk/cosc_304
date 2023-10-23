drop database if exists onlinestore;

create database if not exists onlinestore;

use onlinestore;

drop table if exists PaymentMethod;
drop table if exists Customer;
drop table if exists OrderSummary;
drop table if exists Shipment;
drop table if exists Review;
drop table if exists InCart;
drop table if exists OrderProduct;
drop table if exists Warehouse;
drop table if exists Category;
drop table if exists Product;
drop table if exists ProductInventory;

create table PaymentMethod(
paymentMethodid int not null auto_increment,
paymentType varchar(20),
paymentnumber int,
paymentExpiryDate date,
primary key (paymentMethodid)
) ENGINE = Innodb;

create table Customer(
customerid int not null auto_increment,
firstName varchar(20),
lastName varchar(20),
email varchar(50),
phoneNum varchar(20),
address varchar (50), 
city varchar(20),
state varchar(20),
postalcode varchar(6),
country varchar(20),
userid varchar(50),
password varchar(50),
primary key (customerid)
);


create table OrderSummary(
orderid int not null auto_increment,
orderDate datetime,
totalAmount float,
shipToAddress varchar(50),
shipToCity varchar(20),
shipToState varchar(20),
shipToCountry varchar(20),
shipToPostalCode varchar(6),
primary key (orderid)
);

create table Shipment(
shipmentid int not null auto_increment,
shipmentDate date,
shipmentDesc varchar(400),
primary key (shipmentid)
);

create table Review(
reviewid int auto_increment,
reviewRating int,
reviewComment varchar(400),
reviewDate datetime, 
primary key (reviewid)
);

create table InCart(
inCartQuantity int,
inCartPrice float
);

create table OrderProduct(
orderProductQuantity int,
orderProductPrice float
);

create table Warehouse(
warehouseid int auto_increment,
warehouseName varchar(50),
primary key (warehouseid)
);

create table Category(
categoryid int auto_increment,
categoryName varchar(50),
primary key (categoryid)
);

create table Product(
productid int auto_increment,
productName varchar(50),
productPrice float,
productImageURL varchar(50),
productImage blob, 
productDesc varchar(400),
primary key (productid)
);

create table ProductInventory(
inventoryQuantity int 
);
