\c northwind

DROP TABLE if exists regions;
CREATE TABLE regions(
  regionID INT,
  regionDescription VARCHAR(30)
);

\copy regions FROM '/Users/justusweissmuller/Desktop/spiced/week5/northwind_data/northwind_data_clean-master/data/regions.csv' DELIMITER ',' CSV HEADER;

---DROP TABLE if exists categories;

DROP TABLE if exists categories;
CREATE TABLE categories(
-- column_name datatype constraint
  category_id INT,
  category_name VARCHAR(100),
  description VARCHAR(100),
  picture bytea
);

\copy categories FROM '/Users/justusweissmuller/Desktop/spiced/week5/northwind_data/northwind_data_clean-master/data/categories.csv' DELIMITER ',' CSV HEADER;


DROP TABLE if exists customers;
CREATE TABLE customers(
-- column_name datatype constraint
  customer_id VARCHAR(100) NOT NULL,
  company_name VARCHAR(100) NOT NULL,
  contact_name VARCHAR(100) NOT NULL,
  contact_title VARCHAR(100) NOT NULL,
  address VARCHAR(100) NOT NULL,
  city VARCHAR(100) NOT NULL,
  region VARCHAR(100) NOT NULL,
  postal_code VARCHAR(100) NOT NULL,
  country VARCHAR(100) NOT NULL,
  phone VARCHAR(100) NOT NULL,
  fax VARCHAR(100) NOT NULL
);

\copy customers FROM '/Users/justusweissmuller/Desktop/spiced/week5/northwind_data/northwind_data_clean-master/data/customers.csv' DELIMITER ',' CSV HEADER;


DROP TABLE if exists employee_territories;
CREATE TABLE employee_territories(
  employee_id INT,
  territory_id INT
);

\copy employee_territories FROM '/Users/justusweissmuller/Desktop/spiced/week5/northwind_data/northwind_data_clean-master/data/employee_territories.csv' DELIMITER ',' CSV HEADER;

---- employeeID,lastName,firstName,title,titleOfCourtesy,birthDate,hireDate,address,city,region,postalCode,country,homePhone,extension,photo,notes,reportsTo,photoPath

DROP TABLE if exists employees;
CREATE TABLE employees(
  employee_id INT,
  lastname VARCHAR(100),
  firtname VARCHAR(100),
  title VARCHAR(100),
  titleOfCourtesy VARCHAR(100),
  birthDate TIMESTAMP,
  hireDate TIMESTAMP,
  address VARCHAR(100),
  city VARCHAR(100),
  region VARCHAR(100),
  postalCode VARCHAR(100),
  country VARCHAR(100),
  homePhone VARCHAR(100),
  extension INT,
  photo bytea,
  notes TEXT,
  reportsTo INT,
  photoPath VARCHAR(100)
);

\copy employees FROM '/Users/justusweissmuller/Desktop/spiced/week5/northwind_data/northwind_data_clean-master/data/employees.csv' DELIMITER ',' CSV HEADER NULL AS 'NULL';

DROP TABLE if exists order_details;
CREATE TABLE order_details(
  orderID INT,
  productID INT,
  unitPrice FLOAT,
  quantity INT,
  discount FLOAT,


);

\copy order_details FROM '/Users/justusweissmuller/Desktop/spiced/week5/northwind_data/northwind_data_clean-master/data/order_details.csv' DELIMITER ',' CSV HEADER NULL AS 'NULL';


SELECT productID, unitPrice*quantity*discount AS revenue
FROM order_details
GROUP BY productID;
--- SELECT revenue FROM order_details;


--- orderID,customerID,employeeID,orderDate,requiredDate,shippedDate,shipVia,freight,shipName,shipAddress,shipCity,shipRegion,shipPostalCode,shipCountry
DROP TABLE if exists orders;
CREATE TABLE orders(
  orderID INT,
  customerID TEXT,
  employeeID INT,
  orderDate TIMESTAMP,
  requiredDate TIMESTAMP,
  shippedDate TIMESTAMP,
  shipVia INT,
  freight FLOAT,
  shipName TEXT,
  shipAddress TEXT,
  shipCity TEXT,
  shipRegion TEXT,
  shipPostalCode TEXT,
  shipCountry TEXT
);

\copy orders FROM '/Users/justusweissmuller/Desktop/spiced/week5/northwind_data/northwind_data_clean-master/data/orders.csv' DELIMITER ',' CSV HEADER NULL AS 'NULL';


----productID,productName,supplierID,categoryID,quantityPerUnit,unitPrice,unitsInStock,unitsOnOrder,reorderLevel,discontinued

DROP TABLE if exists products;
CREATE TABLE products(
  productID INT,
  productName TEXT,
  supplierID INT,
  categoryID INT,
  quantityPerUnit TEXT,
  unitPrice FLOAT,
  unitsInStock INT,
  unitsOnOrder INT,
  reorderLevel INT,
  discontinued INT
);

\copy products FROM '/Users/justusweissmuller/Desktop/spiced/week5/northwind_data/northwind_data_clean-master/data/products.csv' DELIMITER ',' CSV HEADER NULL AS 'NULL';



DROP TABLE if exists shippers;
CREATE TABLE shippers(
  shipperID INT,
  companyName TEXT,
  phone text
);

\copy shippers FROM '/Users/justusweissmuller/Desktop/spiced/week5/northwind_data/northwind_data_clean-master/data/shippers.csv' DELIMITER ',' CSV HEADER NULL AS 'NULL';

DROP TABLE if exists territories;
CREATE TABLE territories(
  territoryID INT,
  territoryDescription TEXT,
  regionID INT
);

\copy territories FROM '/Users/justusweissmuller/Desktop/spiced/week5/northwind_data/northwind_data_clean-master/data/territories.csv' DELIMITER ',' CSV HEADER NULL AS 'NULL';


DROP TABLE if exists suppliers;
CREATE TABLE suppliers(
  supplierID INT,
  companyName TEXT,
  contactName TEXT,
  contactTitle TEXT,
  address TEXT,
  city TEXT,
  region TEXT,
  postalCode TEXT,
  country TEXT,
  phone TEXT,
  fax TEXT,
  homePage TEXT
);

\copy suppliers FROM '/Users/justusweissmuller/Desktop/spiced/week5/northwind_data/northwind_data_clean-master/data/suppliers.csv' DELIMITER ',' CSV HEADER NULL AS 'NULL';


---SELECT * FROM suppliers;
