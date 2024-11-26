DROP DATABASE cardealershipdatabase;

CREATE DATABASE cardealershipdatabase;

USE cardealershipdatabase;

CREATE TABLE dealerships (
    dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(100) NOT NULL,
    phone VARCHAR(12) NOT NULL
);

CREATE TABLE vehicles (
    VIN VARCHAR(17) PRIMARY KEY,
    year INT,
    make VARCHAR(50),
    model VARCHAR(50),
    vehicleType VARCHAR(50),
    color VARCHAR(20),
    odometer INT,
    price DECIMAL(10, 2),
    SOLD BOOLEAN DEFAULT FALSE
);
