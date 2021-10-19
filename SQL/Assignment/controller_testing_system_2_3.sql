USE sql_assignment;

SELECT * FROM departments;
SELECT * FROM positions;
SELECT * FROM type_questions;
SELECT * FROM category_questions;
SELECT * FROM `accounts`;
SELECT * FROM `groups`;
SELECT * FROM questions;
SELECT * FROM answers;
SELECT * FROM exams;
SELECT * FROM exam_questions;
SELECT * FROM `group_accounts`;

-- Exercise 1: Tiếp tục với Database Testing System --
-- Question 1: Thêm ít nhất 10 record vào mỗi table -> -- Done --
-- Question 2: lấy ra tất cả các phòng ban
SELECT * 
FROM departments;

-- Question 3: lấy ra id của phòng ban "Sale"
SELECT	department_id
FROM	departments
WHERE	department_name = "Sale";

-- Question 4: lấy ra thông tin account có full name dài nhất
-- 0000
SELECT MAX(length(fullname))
FROM	`accounts`; 

-- C1
SELECT		*,
			length(fullname)
FROM 		`accounts`
GROUP BY 	length(fullname)
ORDER BY 	length(fullname) DESC
LIMIT 		1;

-- C2
SELECT	*,
		length(fullname)
FROM	`accounts`
WHERE length(fullname)=	(
							SELECT	length(fullname)
							FROM	`accounts`
							GROUP BY	length(fullname)
							ORDER BY	length(fullname) DESC
							LIMIT	1
						);

-- C3
SELECT	*
FROM	`accounts`
WHERE	length(fullname)	=	(
									SELECT MAX(length(fullname))
                                    FROM	`accounts`
                                );

-- --   lấy ra thông tin account có full name dài nhất của từng phòng ban
-- --   lấy ra thông tin account có full name dài nhất của từng chức vụ

-- Question 4: lấy ra thông tin account có full name ngắn nhất
-- 0000
SELECT	Min(length(fullname))
FROM	`accounts`;
 
-- C1 -- chua toi uu 
SELECT	*,
        length(fullname)
FROM	`accounts`
ORDER BY length(fullname) ASC
LIMIT	1; 

-- C2
SELECT	*
FROM	`accounts`
WHERE	length(fullname)	=	(
									SELECT	length(fullname)
                                    FROM	`accounts`
                                    GROUP BY	length(fullname)
                                    ORDER BY	length(fullname) ASC
                                    LIMIT	1
                                );
                                
-- C3
SELECT	*
FROM	`accounts`
WHERE	length(fullname)	=	(
									SELECT	MIN(length(fullname))
                                    FROM	`accounts`
                                );

-- --   lấy ra thông tin account có full name ngắn nhất của từng phòng ban
-- --   lấy ra thông tin account có full name ngắn nhất của từng chức vụ

-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id 
--  = 3
-- C1 
SELECT	*
FROM	`accounts`
GROUP BY	length(fullname)
	HAVING	department_id = 3 AND MAX(length(fullname))
    ORDER BY	length(fullname) DESC
    LIMIT	1
;
-- C2
SELECT	*
FROM	`accounts`
WHERE	department_id =3
ORDER BY	length(fullname) DESC
LIMIT 1
;

-- Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019

SELECT	g.group_name
FROM	`groups` g
INNER JOIN	group_accounts ag
	ON	g.group_id = ag.group_id
WHERE	join_date < '20191220';

-- Question 7: Lấy ra ID của question có >= 4 câu trả lời

SELECT	q.question_id,
		COUNT(an.question_id)
FROM	questions q
INNER JOIN	answers an
	ON q.question_id = an.question_id
GROUP BY an.question_id
HAVING	COUNT(an.question_id) >= 4;

-- lấy ra ID của question có ngày tạo trước ngày 2019-12-12 và có >=3 câu trả lời

SELECT		*
		-- q.create_date,
--         q.question_id,
--         COUNT(an.question_id)
FROM	questions q
INNER JOIN	answers an
	ON q.question_id = an.question_id
GROUP BY an.question_id
HAVING	COUNT(an.question_id) >= 3 AND q.create_date < "20201212";

-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 
--  20/12/2019
SELECT	code
FROM	exams
WHERE	duration >= 60 && createdate < '20191220';

-- Question 9: Lấy ra 5 group được tạo gần đây nhất
SELECT	*
FROM	`groups`
GROUP BY	create_date
ORDER BY	create_date DESC
LIMIT	5;

-- Question 10: Đếm số nhân viên thuộc department có id = 2
SELECT *
FROM accounts
ORDER BY department_id;

-- C1 
SELECT COUNT(department_id) "So_NVPB_id_2"
FROM accounts
WHERE department_id = 2;

-- C2
SELECT	COUNT(dp.department_id) "So_NVPB_id_2"
FROM	accounts a
INNER JOIN	departments dp
	ON a.department_id = dp.department_id
GROUP BY dp.department_id
HAVING	dp.department_id = 2;

-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
SELECT	*
FROM	`accounts`
WHERE	fullname LIKE("D%o");

-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
-- exam_questions -> exams
SELECT	*
FROM exams e
INNER JOIN	exam_questions eq
	ON	e.exam_id = eq.exam_id
WHERE	e.createdate < '20191220';

SELECT *
FROM exams
WHERE	createdate < '20191220';

DELETE eq
      FROM exam_questions eq
      INNER JOIN exams e 
		ON eq.exam_id = e.exam_id
 WHERE e.createdate < '20191220';
 

DELETE FROM exams
WHERE	createdate < '20191220';
 
-- C1
-- DELETE 	exams.*,
-- 		exam_questions.*
-- FROM	exams
-- INNER JOIN	exam_questions
-- 	ON	exams.exam_id = exam_questions.exam_id
-- WHERE	exams.createdate < '20191220';

-- C2 
-- DELETE 	exams.*,
-- 		exam_questions.*
-- FROM	exams,
-- 		exam_questions
-- WHERE	exams.exam_id = exam_questions.exam_id AND exams.createdate < '20191220';
-- -- 

-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
--  exam_questions =>  answers => questions 
--  DELETE dexam_questions
SELECT	*
FROM	exam_questions e
INNER JOIN	questions qs
	ON	e.question_id = qs.question_id
WHERE	qs.content LIKE('câu hỏi%');

SELECT	*
FROM	answers a
INNER JOIN	questions qs
	ON	a.question_id = qs.question_id
WHERE	qs.content LIKE('câu hỏi%');

SELECT	*
FROM	questions
WHERE	content LIKE('câu hỏi%');

DELETE	e
FROM	exam_questions e
INNER JOIN	questions qs
	ON	e.question_id = qs.question_id
WHERE	qs.content LIKE('câu hỏi%');

--  DELETE answers
DELETE a
FROM	answers a
INNER JOIN	questions qs
	ON	a.question_id = qs.question_id
WHERE	qs.content LIKE('câu hỏi%');

--  DELETE questions 
DELETE FROM	questions
WHERE	content LIKE('câu hỏi%');

SELECT	*
FROM	questions
WHERE	content LIKE('câu hỏi%');

--  exam_questions =>  answers => questions
-- C1 
-- DELETE 	questions.*,
-- 		answers.*,
-- 		exam_questions.*
-- FROM	questions
-- INNER JOIN	answers
-- 	ON	questions.question_id = answers.question_id
-- INNER JOIN	exam_questions
-- 	ON	answers.question_id = exam_questions.question_id
-- WHERE	questions.content LIKE('câu hỏi%');

-- C2
-- DELETE 	questions.*,
-- 		answers.*,
--         exam_questions.*
-- FROM	questions,
-- 		answers,
--         exam_questions
-- WHERE	(
-- 			questions.question_id = answers.question_id
--             OR questions.question_id = exam_questions.question_id)
-- AND questions.content LIKE('câu hỏi%');

-- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và 
--  email thành loc.nguyenba@vti.com.vn
SELECT	*
FROM	`accounts`
WHERE	account_id = 5;

UPDATE	`accounts`
SET		fullname = 'Nguyễn Bá Lộc',
		email = 'loc.nguyenba@vti.com.vn'
WHERE 	account_id = 5;

-- Question 15: update account có id = 5 sẽ thuộc group có id = 4 

-- SELECT	a.account_id,
-- 		g.group_id
-- FROM	`accounts` a
-- INNER JOIN `groups` g
-- 	ON	a.account_id = g.creator_id
-- WHERE	a.account_id = 5
-- ;

SELECT *
FROM	group_accounts
WHERE	account_id = 5;

UPDATE	group_accounts
SET		group_id = 4
WHERE	account_id = 5;