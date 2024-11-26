-- Question 1.  Get all dealerships
SELECT * FROM dealerships;

-- Question 2. Find all vehicles for a specific dealership
SELECT v.*
FROM vehicles v
JOIN inventory i ON v.VIN = i.VIN
WHERE i.dealership_id = 1;

-- Question 3. Find a car by VIN
SELECT * FROM vehicles
WHERE VIN = '1HGBH41JXMN109186';

-- Question 4. Find the dealership where a certain car is located, by VIN
SELECT d.*
FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealership_id
WHERE i.VIN = '1HGBH41JXMN109186';

-- Question 5. Find all dealerships that have a certain car type 
SELECT DISTINCT d.*
FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealership_id
JOIN vehicles v ON i.VIN = v.VIN
WHERE v.make = 'Toyota' AND v.model = 'Camry' AND v.color = 'White';

-- Question 6. Get all sales information for a specific dealer for a specific date range
SELECT s.*, d.name AS dealership_name
FROM sales_contracts s
JOIN inventory i ON s.VIN = i.VIN
JOIN dealerships d ON i.dealership_id = d.dealership_id
WHERE i.dealership_id = 1 AND s.sale_date BETWEEN '2024-01-01' AND '2024-12-31';


