USE test_1;

SELECT *
FROM customer;

SELECT *
FROM car;

SELECT *
FROM car_orders;

-- 2. Viết lệnh lấy ra thông tin của khách hàng: tên, số lượng oto khách hàng đã
-- mua và sắp sếp tăng dần theo số lượng oto đã mua.
SELECT 	c.customer_id,
		c.`name`,
        SUM(ro.amount) total_car
FROM customer c
INNER JOIN car_orders ro
	ON c.customer_id = ro.customer_id
WHERE ro.`status` = '1' 
GROUP BY ro.customer_id
ORDER BY SUM(ro.amount) ASC;

-- 3. Viết hàm (không có parameter) trả về tên hãng sản xuất đã bán được nhiều
-- oto nhất trong năm nay.
DROP PROCEDURE IF EXISTS car_vend;

DELIMITER $$
	CREATE PROCEDURE car_vend()
		BEGIN
-- 			SELECT SUM(co.amount) dk
-- 			FROM car_orders co
-- 			INNER JOIN car c
-- 				ON co.car_id = c.car_id
-- 			WHERE (co.`status` = '1') 	AND (year(co.order_date) = year(now()))
-- 			GROUP BY c.maker
-- 			ORDER BY SUM(co.amount) DESC
-- 			LIMIT 1;

			SELECT 	c.maker,
					SUM(co.amount) total_car_vend_now_year
            FROM car_orders co
            INNER JOIN car c
				ON co.car_id = c.car_id
			WHERE (co.`status` = '1') 	AND (year(co.order_date) = year(now()))
			GROUP BY c.maker 
            HAVING SUM(co.amount) = 	(	SELECT SUM(co.amount) dk
											FROM car_orders co
											INNER JOIN car c
												ON co.car_id = c.car_id
											WHERE (co.`status` = '1') 	AND (year(co.order_date) = year(now()))
											GROUP BY c.maker
											ORDER BY SUM(co.amount) DESC
											LIMIT 1)
			ORDER BY SUM(co.amount) DESC;
        END $$
DELIMITER ;

CALL car_vend;

-- 4. Viết 1 thủ tục (không có parameter) để xóa các đơn hàng đã bị hủy của
-- những năm trước. In ra số lượng bản ghi đã bị xóa.
DROP PROCEDURE IF EXISTS delete_order_canceled;

DELIMITER $$
CREATE PROCEDURE delete_order_canceled() 
BEGIN
	SELECT COUNT(*) number_row_deleted
    FROM car_orders co
    WHERE co.`status`= '2' AND YEAR(co.order_date) < YEAR(NOW());
	
    DELETE co 
	FROM car_orders co
    WHERE co.`status`= '2' AND YEAR(co.order_date) < YEAR(NOW());
    
END $$ 
DELIMITER ;

CALL delete_order_canceled;

-- 5. Viết 1 thủ tục (có CustomerID parameter) để in ra thông tin của các đơn
-- hàng đã đặt hàng bao gồm: tên của khách hàng, mã đơn hàng, số lượng oto
-- và tên hãng sản xuất.
DROP PROCEDURE IF EXISTS print_information_orders;

DELIMITER $$
CREATE PROCEDURE print_information_orders(IN customer_id TINYINT)
BEGIN
	SELECT 	-- * ,
			customer_id,
			c.name,
            co.order_id,
            co.amount,
            cr.maker
            -- ,co.`status`
    FROM car_orders co
    INNER JOIN customer c
		ON co.customer_id = c.customer_id
	INNER JOIN car cr
		ON co.car_id = cr.car_id
	WHERE co.`status` = '0' AND c.customer_id = customer_id ;
END $$ 
DELIMITER ;

CALL print_information_orders(2);
