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

CREATE TABLE lease_contracts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17),
    lessee_name VARCHAR(50),
    lease_start_date DATE,
    lease_end_date DATE,
    LEASE_FEE_RATE DECIMAL(4, 2),
    LEASE_INTEREST_RATE DECIMAL(4, 2),
    LEASE_TERM INT,
    expectedEndingValue DECIMAL(10, 2),
    leaseFee DECIMAL(10, 2),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

INSERT INTO dealerships (name, address, phone) VALUES
('City Motors', '123 Main St', '123-456-7890'),
('Highway Autos', '456 Elm St', '987-654-3210');

INSERT INTO vehicles (VIN, year, make, model, vehicleType, color, odometer, price, SOLD) VALUES
('1HGBH41JXMN109186', 2020, 'Toyota', 'Camry', 'Sedan', 'White', 30000, 24000.00, FALSE),
('2G1WF52E759379203', 2019, 'Honda', 'Civic', 'Sedan', 'Black', 25000, 20000.00, FALSE),
('3N1CN7AP9HL811512', 2021, 'Nissan', 'Sentra', 'Sedan', 'Blue', 15000, 22000.00, TRUE),
('5NPEB4AC8CH305982', 2022, 'Hyundai', 'Sonata', 'Sedan', 'Gray', 18000, 25000.00, FALSE),
('WDBUF56J76A856529', 2018, 'Mercedes-Benz', 'C-Class', 'Sedan', 'Red', 40000, 30000.00, FALSE),
('4T1BF1FK7FU059876', 2020, 'Toyota', 'Corolla', 'Sedan', 'Green', 20000, 18000.00, TRUE),
('1J4FF48S7YL214632', 2021, 'Jeep', 'Cherokee', 'SUV', 'Yellow', 10000, 35000.00, FALSE),
('WAUFFAFM6AA018570', 2019, 'Audi', 'A4', 'Sedan', 'Black', 22000, 32000.00, FALSE),
('1C4RJFAG0FC641352', 2022, 'Dodge', 'Durango', 'SUV', 'Silver', 12000, 40000.00, TRUE),
('2C3KA53G47H743215', 2021, 'Chrysler', '300', 'Sedan', 'Blue', 13000, 28000.00, FALSE);

INSERT INTO inventory (dealership_id, VIN) VALUES
(1, '1HGBH41JXMN109186'),
(1, '2G1WF52E759379203'),
(1, '3N1CN7AP9HL811512'),
(1, '5NPEB4AC8CH305982'),
(2, 'WDBUF56J76A856529'),
(2, '4T1BF1FK7FU059876'),
(2, '1J4FF48S7YL214632'),
(2, 'WAUFFAFM6AA018570'),
(1, '1C4RJFAG0FC641352'),
(2, '2C3KA53G47H743215');

INSERT INTO sales_contracts (VIN, customer_name, sale_date, sale_price, SALES_TAX_RATE, RECORDING_FEE, processingFee, financeOption, salesTaxAmount) VALUES
('1HGBH41JXMN109186', 'John Doe', '2024-01-01', 23000.00, 0.08, 300.00, 200.00, TRUE, 1840.00),
('2G1WF52E759379203', 'Jane Smith', '2024-01-05', 19500.00, 0.07, 200.00, 150.00, FALSE, 1365.00);



