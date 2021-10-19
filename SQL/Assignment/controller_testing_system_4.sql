USE sql_assignment;
-- Exercise 1: Join
-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT	account_id TT,
		fullname,
		username,
        email,
        gender,
        department_name 'phong_ban',
        create_date
FROM accounts a 
LEFT JOIN departments d
	ON	a.department_id = d.department_id;


-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010 
SELECT *
FROM accounts
WHERE create_date > '2010/12/20';

-- Question 3: Viết lệnh để lấy ra tất cả các developer 
-- C1
SELECT 	account_id TT,
		fullname,
		username,
        email,
        gender,
        position_name 'chuc_vu',
        create_date
FROM accounts a
INNER JOIN positions p
	ON a.position_id = p.position_id
WHERE p.position_name = 'Dev';

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT 	d.department_name,
		COUNT(a.department_id) total_accounts
FROM accounts a
INNER JOIN departments d
	ON a.department_id = d.department_id
GROUP BY d.department_id
	HAVING COUNT(d.department_id) > 3;

-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều 
--  nhất
SELECT	q.content
FROM	questions q
INNER JOIN	exam_questions eq
	ON	q.question_id = eq.question_id
GROUP BY q.question_id
	HAVING COUNT(q.question_id) = 	(	SELECT COUNT(question_id)
                                        FROM exam_questions 
                                        GROUP BY question_id
                                        ORDER BY COUNT(question_id) DESC
                                        LIMIT 1
									);
                                    
-- -- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi ít 
--  nhất
SELECT	q.content
FROM	questions q
INNER JOIN	exam_questions eq
	ON	q.question_id = eq.question_id
GROUP BY q.question_id
	HAVING COUNT(q.question_id) = 	(
										SELECT COUNT(q.question_id)
                                        FROM questions q
                                        GROUP BY q.question_id
                                        ORDER BY COUNT(q.question_id) ASC
                                        LIMIT 1
									);

-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question

SELECT 	cq.category_id TT,
		cq.category_name,
		COUNT(cq.category_id) statistical_question
FROM category_questions cq
LEFT JOIN questions q
	ON	cq.category_id = q.category_id
GROUP BY cq.category_id;

-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu exam 
SELECT *
FROM exam_questions;

SELECT 	q.content,
        COUNT(eq.question_id) statistical_Exam
FROM questions q
LEFT JOIN exam_questions eq
	ON	q.question_id = eq.question_id
GROUP BY eq.question_id;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất
SELECT	q.content,
		COUNT(a.question_id) total_answers
FROM questions q
LEFT JOIN answers a
	ON q.question_id = a.question_id
GROUP BY a.question_id
	HAVING COUNT(a.question_id) = 	(
										SELECT	COUNT(a.question_id)
                                        FROM answers a
                                        GROUP BY a.question_id
                                        ORDER BY COUNT(a.question_id) DESC
                                        LIMIT 1
                                    );

-- Question 8: Lấy ra Question có ít câu trả lời nhất
SELECT	q.content,
		COUNT(a.question_id) total_answers
FROM questions q
LEFT JOIN answers a
	ON q.question_id = a.question_id
GROUP BY a.question_id
	HAVING COUNT(a.question_id) = 	(
										SELECT	COUNT(a.question_id)
                                        FROM answers a
                                        GROUP BY a.question_id
                                        ORDER BY COUNT(a.question_id) ASC
                                        LIMIT 1
                                    );

-- Question 9: Thống kê số lượng account trong mỗi group
SELECT 	*, 
		COUNT(account_id) total_accounts
FROM group_accounts
GROUP BY group_id;

SELECT *
FROM	`groups`;

SELECT 	-- ga.group_id,
		g.group_name,
        COUNT(ga.account_id) total_accounts
FROM group_accounts ga
RIGHT JOIN	`groups` g
	ON ga.group_id = g.group_id
GROUP BY ga.group_id;

-- Question 10: Tìm chức vụ có ít người nhất
SELECT	position_name
		-- COUNT(p.position_id) total_account
FROM positions p 
LEFT JOIN accounts a 
	ON p.position_id = a.position_id
GROUP BY	p.position_id
	HAVING COUNT(p.position_id) =	(
										SELECT	COUNT(a.position_id)
                                        FROM accounts a 
                                        GROUP BY	a.position_id
                                        ORDER BY	COUNT(a.position_id) ASC
                                        LIMIT 1
                                    );

-- Question 10: Tìm chức vụ có nhiều người nhất
SELECT *
FROM accounts;

SELECT	position_name
		-- COUNT(p.position_id) total_account
FROM positions p 
LEFT JOIN accounts a 
	ON p.position_id = a.position_id
GROUP BY	p.position_id
	HAVING COUNT(p.position_id) =	(
										SELECT	COUNT(a.position_id)
                                        FROM accounts a 
                                        GROUP BY	a.position_id
                                        ORDER BY	COUNT(a.position_id) DESC
                                        LIMIT 1
                                    );

SELECT *
FROM accounts;

SELECT	position_name
		-- COUNT(p.position_id) total_account
FROM positions p 
LEFT JOIN accounts a 
	ON p.position_id = a.position_id
GROUP BY	p.position_id
	HAVING COUNT(p.position_id) =	(
										SELECT	COUNT(a.position_id)
                                        FROM accounts a 
                                        GROUP BY	a.position_id
                                        ORDER BY	COUNT(a.position_id) DESC
                                        LIMIT 1
                                    );

-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
-- -- 1 department ==> n accounts ==> 	Dev				
-- 										Test
-- 										Scrum Master
--                                      PM

SELECT	*
FROM accounts;

SELECT	-- a.account_id,
		-- a.fullname,
        -- d.department_id,
        d.department_name,
        -- a.position_id,
        p.position_name,
        COUNT(a.position_id) total_accounts_position_id_department_id
FROM	accounts a
RIGHT JOIN departments d
	ON	a.department_id = d.department_id
LEFT JOIN positions p 
	ON	a.position_id = p.position_id
GROUP BY d.department_id , a.position_id
ORDER BY d.department_id ;



-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của 
--  question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, …
SELECT *
FROM	questions;

SELECT	q.content,
        cq.category_name,
        tq.type_name,
        ac.fullname creator,
        an.content answers
FROM	questions q
LEFT JOIN	category_questions cq
	ON	q.category_id = cq.category_id
LEFT JOIN	type_questions tq
	ON	q.type_id = tq.type_id
LEFT JOIN	accounts ac
	ON	q.creator_id = ac.account_id
LEFT JOIN	answers an
	ON	q.question_id = an.question_id;
-- GROUP BY q.question_id;        
        

-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT *
FROM type_questions;

SELECT	tq.type_name,
		COUNT(tq.type_id) total_questions
FROM	questions q
INNER JOIN	type_questions tq
	ON	q.type_id = tq.type_id
GROUP BY tq.type_id;

-- Question 14:Lấy ra group không có account nào
SELECT *
FROM `groups`;

SELECT *
FROM group_accounts
GROUP BY group_id;

SELECT	-- *,
		-- g.group_id,
		group_name
FROM	`groups` g
LEFT JOIN	group_accounts ga
	ON	g.group_id = ga.group_id
WHERE ga.group_id IS NULL;
-- GROUP BY g.group_id;

-- Question 15: Lấy ra question không có answer nào
SELECT q.content
FROM	questions q
LEFT JOIN answers a
	ON q.question_id = a.question_id
WHERE	a.question_id IS NULL;

--  Exercise 2: Union
-- Question 17: 
SELECT *
FROM accounts;

SELECT *
FROM group_accounts;
-- a) Lấy các account thuộc nhóm thứ 1
SELECT 	a.account_id,
		a.fullname,
        g.group_id
FROM	accounts a
INNER JOIN	group_accounts g
	ON	a.account_id =g.account_id
GROUP BY g.account_id
	HAVING  g.group_id = 1;

-- b) Lấy các account thuộc nhóm thứ 2
SELECT 	a.account_id,
		a.fullname,
        g.group_id
FROM	accounts a
INNER JOIN	group_accounts g
	ON	a.account_id =g.account_id
GROUP BY g.account_id
	HAVING  g.group_id = 3;

-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
SELECT 	a.account_id,
		a.fullname,
        g.group_id
FROM	accounts a
INNER JOIN	group_accounts g
	ON	a.account_id =g.account_id
GROUP BY g.account_id
	HAVING  g.group_id = 1
UNION
SELECT 	a.account_id,
		a.fullname,
        g.group_id
FROM	accounts a
INNER JOIN	group_accounts g
	ON	a.account_id =g.account_id
GROUP BY g.account_id
	HAVING  g.group_id = 3;
    

-- Question 18: 
-- a) Lấy các group có lớn hơn 5 thành viên
SELECT 	*,
		COUNT(ga.account_id)
FROM accounts a 
INNER JOIN	group_accounts ga
	ON a.account_id = ga.account_id
GROUP BY ga.group_id
	HAVING COUNT(ga.account_id) > 5;
    
-- b) Lấy các group có nhỏ hơn 7 thành viên
SELECT 	*,
		COUNT(ga.account_id)
FROM accounts a 
INNER JOIN	group_accounts ga
	ON a.account_id = ga.account_id
GROUP BY ga.group_id
	HAVING COUNT(ga.account_id) < 7;
    
-- c) Ghép 2 kết quả từ câu a) và câu b)
SELECT 	*
FROM accounts a 
INNER JOIN	group_accounts ga
	ON a.account_id = ga.account_id
GROUP BY ga.group_id
	HAVING COUNT(ga.account_id) > 5
UNION ALL
SELECT 	*
FROM accounts a 
INNER JOIN	group_accounts ga
	ON a.account_id = ga.account_id
GROUP BY ga.group_id
	HAVING COUNT(ga.account_id) < 7;