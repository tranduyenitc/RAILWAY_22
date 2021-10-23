DROP DATABASE IF EXISTS test_1;
CREATE DATABASE IF NOT EXISTS test_1
	CHARACTER SET "utf8"
    COLLATE "utf8_unicode_ci";
USE test_1;

DROP TABLE IF EXISTS	customer,
						car,
                        orders;

CREATE TABLE IF NOT EXISTS customer(
	customer_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name`		NVARCHAR(50)  UNIQUE NOT NULL,
    phone		VARCHAR(11) NOT NULL,
    email		NVARCHAR(50) UNIQUE NOT NULL,
    address		NVARCHAR(100),
    note		NVARCHAR(200)
);

CREATE TABLE IF NOT EXISTS car(
	car_id	VARCHAR(10) UNIQUE NOT NULL PRIMARY KEY,
    maker	ENUM("HONDA","TOYOTA","NISSAN") DEFAULT "HONDA",
    model	NVARCHAR(50) NOT NULL,
    `year`	DATE NOT NULL,
    color	NVARCHAR(50),
    note	NVARCHAR(200)
);

CREATE TABLE IF NOT EXISTS car_orders(
	order_id			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    customer_id			TINYINT UNSIGNED NOT NULL,
    car_id				VARCHAR(10)  NOT NULL,
    amount				INT DEFAULT 1,
    sale_price			INT NOT NULL,
    order_date			DATE NOT NULL,
    delivery_date		DATE,
    delivery_address	NVARCHAR(100),
    `status`			ENUM('0','1','2') DEFAULT '0',
    note				NVARCHAR(200),
    
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY(car_id) REFERENCES car(car_id)
);
