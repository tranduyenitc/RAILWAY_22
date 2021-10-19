USE sql_assignment;
-- Exercise 1: Tiếp tục với Database Testing System
-- (Sử dụng subquery hoặc CTE)
-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
CREATE  VIEW ds_nv_sale AS
SELECT a.*
FROM accounts a 
INNER JOIN departments d 
	ON	a.department_id	= d.department_id
WHERE d.department_name = "Sale";

SELECT *
FROM	ds_nv_sale;

-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
CREATE  VIEW account_joins_many_groups AS 
SELECT 	a.*,
		COUNT(g.account_id) number_groups_joined
FROM accounts a 
INNER JOIN group_accounts g 
	ON a.account_id = g.account_id
GROUP BY a.account_id
HAVING COUNT(g.account_id) = (	SELECT 	COUNT(g.account_id)
								FROM group_accounts g  
								GROUP BY g.account_id
                                ORDER BY COUNT(g.account_id) DESC
                                LIMIT 1
								);

SELECT *
FROM account_joins_many_groups;

-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 30 kí tự
--  được coi là quá dài) và xóa nó đi

CREATE  VIEW  questions_length30_content AS 

SELECT *,
		length(q.content) length_content
FROM questions q
WHERE length(q.content) > 30;

SELECT * 
FROM questions_length30_content;

DROP VIEW IF EXISTS questions_length30_content;

-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
CREATE  VIEW department_many_accounts AS

SELECT d.*
FROM departments d
INNER JOIN accounts a 
	ON d.department_id = a.department_id
GROUP BY d.department_id
HAVING COUNT(a.account_id) = (	SELECT COUNT(a.account_id)
								FROM departments d
								INNER JOIN accounts a 
									ON d.department_id = a.department_id
								GROUP BY d.department_id
                                ORDER BY COUNT(a.account_id) DESC
                                LIMIT 1
								);
SELECT * FROM department_many_accounts;

-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
CREATE  VIEW questions_by_creator_nguyen AS (	SELECT q.*
												FROM questions q
												INNER JOIN accounts a
													ON	q.creator_id = a.account_id
												WHERE a.fullname LIKE "Nguyễn%" ||"Nguyen%");
SELECT q.*
FROM questions q
INNER JOIN accounts a
	ON	q.creator_id = a.account_id
WHERE a.fullname LIKE "Nguyễn%" ||"Nguyen%" ;

SELECT *
FROM questions_by_creator_nguyen;
