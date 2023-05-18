 \sql
Switching to SQL mode... Commands end with ;
 MySQL  SQL > \connect root@localhost
Creating a session to 'root@localhost'
Fetching global names for auto-completion... Press ^C to stop.
Your MySQL connection id is 19 (X protocol)
Server version: 8.0.33 MySQL Community Server - GPL
No default schema selected; type \use <schema> to set one.
 MySQL  localhost:33060+ ssl  SQL > USE phone;
Default schema set to `phone`.
Fetching global names, object names from `phone` for auto-completion... Press ^C to stop.
 MySQL  localhost:33060+ ssl  phone  SQL > SELECT * FROM phone;
+----------------------------+-------+--------+-------------+-------------------+----+
| PRODUCT                    | Price | rating | category    | brand             | id |
+----------------------------+-------+--------+-------------+-------------------+----+
| iPhone 9                   |   549 |   4.69 | smsrtphones | Apple             |  1 |
| iPhone X                   |   899 |   4.44 | smsrtphones | Apple             |  2 |
| Samsyng Universe 9         |  1249 |   4.09 | smsrtphones | Samsung           |  3 |
| OPPO F19                   |   280 |   4.30 | smsrtphones | OPPO              |  4 |
| Huawei P30                 |   499 |   4.09 | smsrtphones | Huawei            |  5 |
| MacBook Pro                |  1149 |   4.57 | leptops     | Apple             |  6 |
| Samsyng Galaxy Book        |  1499 |   4.25 | leptops     | Samsung           |  7 |
| Microsoft Surface Laptop 4 |  1499 |   4.43 | leptops     | Microsoft Surface |  8 |
| Infinix INBOOK             |  1099 |   4.43 | leptops     | Infinix           |  9 |
| HP Pavilion 15-DK1056WM    |  1099 |   4.54 | leptops     | HP Pavilion       | 10 |
| iPhone 12                  |  1100 |   4.69 | smartphones | Apple             | 11 |
| iPhone 11                  |   979 |   4.69 | smartphones | Apple             | 12 |
+----------------------------+-------+--------+-------------+-------------------+----+
12 rows in set (0.0015 sec)
 MySQL  localhost:33060+ ssl  phone  SQL > INSERT INTO phone(PRODUCT, price, rating, category, brand) VALUES('MacBook Air,','1300','4.72','laptops', 'Apple');
Query OK, 1 row affected (0.0077 sec
 MySQL  localhost:33060+ ssl  phone  SQL > INSERT INTO phone(PRODUCT, price, rating, category, brand) VALUES('iPhone 14','1549','4.69','smartphones', 'Apple');
Query OK, 1 row affected (0.0077 sec)
 MySQL  localhost:33060+ ssl  phone  SQL > INSERT INTO phone(PRODUCT, price, rating, category, brand) VALUES('iPhone 13,','1349','4.69','smartphones', 'Apple');
Query OK, 1 row affected (0.0090 sec)
 MySQL  localhost:33060+ ssl  phone  SQL > INSERT INTO phone(PRODUCT, price, rating, category, brand) VALUES('MacBook','950','4.69','laptops', 'Apple');
Query OK, 1 row affected (0.0082 sec)
 
MySQL  localhost:33060+ ssl  phone  SQL > CREATE TABLE customer (id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, name VARCHAR(128), productID MEDIUMINT UNSIGNED);
Query OK, 0 rows affected (0.0696 sec)
 MySQL  localhost:33060+ ssl  phone  SQL > INSERT INTO customer(name, productID) VALUES('Mike','9');
Query OK, 1 row affected (0.0123 sec)
 MySQL  localhost:33060+ ssl  phone  SQL > INSERT INTO customer(name, productID) VALUES('Bob','5');
Query OK, 1 row affected (0.0079 sec)
 MySQL  localhost:33060+ ssl  phone  SQL > INSERT INTO customer(name, productID) VALUES('Nikola','11');
Query OK, 1 row affected (0.0073 sec)
 MySQL  localhost:33060+ ssl  phone  SQL > INSERT INTO customer(name, productID) VALUES('Mike','14');
Query OK, 1 row affected (0.0025 sec)
 MySQL  localhost:33060+ ssl  phone  SQL > INSERT INTO customer(name, productID) VALUES('Nikola','3');
Query OK, 1 row affected (0.0074 sec)
 MySQL  localhost:33060+ ssl  phone  SQL > INSERT INTO customer(name, productID) VALUES('Mike','8');
Query OK, 1 row affected (0.0079 sec)
 MySQL  localhost:33060+ ssl  phone  SQL > INSERT INTO customer(name, productID) VALUES('Mike','9');
Query OK, 1 row affected (0.0022 sec)
 MySQL  localhost:33060+ ssl  phone  SQL > SELECT * FROM customer;
+----+--------+-----------+
| id | name   | productID |
+----+--------+-----------+
|  1 | Mike   |         9 |
|  2 | Bob    |         5 |
|  3 | Nikola |        11 |
|  4 | Mike   |        14 |
|  5 | Nikola |         3 |
|  6 | Mike   |         8 |
|  7 | Mike   |         9 |
+----+--------+-----------+
7 rows in set (0.0010 sec)
--  //// task 2
MySQL  localhost:33060+ ssl  phone  SQL > SELECT category, COUNT(product) FROM phone GROUP BY category;
+-------------+----------------+
| category    | COUNT(product) |
+-------------+----------------+
| smsrtphones |              9 |
| leptops     |              6 |
+-------------+----------------+
2 rows in set (0.0011 sec)

--  //// task 3
 MySQL  localhost:33060+ ssl  phone  SQL > SELECT category, COUNT(DISTINCT brand) AS unique_brands FROM phone GROUP BY category;
+-------------+---------------+
| category    | unique_brands |
+-------------+---------------+
| leptops     |             5 |
| smsrtphones |             4 |
+-------------+---------------+
2 rows in set (0.0083 sec)

--  //// task 4
 MySQL  localhost:33060+ ssl  phone  SQL > SELECT name, COUNT(*) AS purchase_count FROM customer GROUP BY name;
+--------+----------------+
| name   | purchase_count |
+--------+----------------+
| Mike   |              4 |
| Bob    |              1 |
| Nikola |              2 |
+--------+----------------+
3 rows in set (0.0013 sec)

 --  //// task 5
 MySQL  localhost:33060+ ssl  phone  SQL > SELECT name, COUNT(*) AS Quantity FROM customer GROUP BY name ORDER BY Quantity DESC;
+--------+----------+
| name   | Quantity |
+--------+----------+
| Mike   |        4 |
| Nikola |        2 |
| Bob    |        1 |
+--------+----------+
3 rows in set (0.0012 sec)

--  //// task 6
 MySQL  localhost:33060+ ssl  phone  SQL > SELECT category, product, price FROM customer JOIN phone ON customer.productID=phone.id ORDER BY category, price DESC;
+-------------+----------------------------+-------+
| category    | product                    | price |
+-------------+----------------------------+-------+
| leptops     | Microsoft Surface Laptop 4 |  1499 |
| leptops     | Infinix INBOOK             |  1099 |
| leptops     | Infinix INBOOK             |  1099 |
| smsrtphones | iPhone 13,                 |  1349 |
| smsrtphones | Samsyng Universe 9         |  1249 |
| smsrtphones | iPhone 12                  |  1100 |
| smsrtphones | Huawei P30                 |   499 |
+-------------+----------------------------+-------+
7 rows in set (0.0016 sec)
