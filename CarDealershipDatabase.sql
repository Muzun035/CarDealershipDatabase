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

CREATE TABLE inventory (
    dealership_id INT,
    vin VARCHAR(17),
    PRIMARY KEY (dealership_id, vin),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id) ON DELETE CASCADE,
    FOREIGN KEY (vin) REFERENCES vehicles(vin) ON DELETE CASCADE
);

CREATE TABLE sales_contracts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17),
    customer_name VARCHAR(50),
    sale_date DATE,
    sale_price DECIMAL(10, 2),
    SALES_TAX_RATE DECIMAL(4, 2),
    RECORDING_FEE DECIMAL(10, 2),
    processingFee DECIMAL(10, 2),
    financeOption BOOLEAN,
    salesTaxAmount DECIMAL(10, 2),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

