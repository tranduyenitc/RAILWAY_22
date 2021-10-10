-- INSERT DATA TO TABLE department

INSERT INTO department(department_name)
VALUES
	(N'Marketing'),
    (N'Sale'),
    (N'Bảo vệ'),
    (N'Nhân sự'),
    (N'Kỹ thuật'),
    (N'Tài chính'),
    (N'Phó giám đốc'),
    (N'Giám đốc'),
    (N'Thư kí'),
    (N'Bán hàng');
    
-- INSERT DATA TO TABLE position
INSERT INTO `position`(position_name) 
VALUES
	('Dev'),
    ('Test'),
    ('Scrum Master'),
    ('PM'); 

-- INSERT DATA TO TABLE type_question
INSERT INTO type_question(type_name) 
VALUES
	('Essay'),
    ('Multiple-Choice'); 

-- INSERT DATA TO TABLE category_question
INSERT INTO category_question(catagory_name)
VALUES
	('Java'),
    ('.Net'),
    ('SQL'),
    ('Postman'),
    ('Ruby'),
    ('Photoshop'),
    ('C#'),
    ('C/C++'),
    ('Php'	),
    ('Objective-C');

-- INSERT DATA TO TABLE account
INSERT INTO `account`
	(email								, username			, fullname				, department_id	, position_id, create_date)
VALUES
	('haidang29productions@gmail.com'	, 'dangblack'		,'Nguyễn hải Đăng'		,   '5'			,   '1'		,'2020-03-05'),
    ('account1@gmail.com'				, 'quanganh'		,'Nguyen Chien Thang2'	,   '1'			,   '2'		,'2020-03-05'),
    ('account2@gmail.com'				, 'vanchien'		,'Nguyen Van Chien'		,   '2'			,   '3'		,'2020-03-07'),
    ('account3@gmail.com'				, 'cocoduongqua'	,'Duong Do'				,   '3'			,   '4'		,'2020-03-08'),
    ('account4@gmail.com'				, 'doccocaubai'		,'Nguyen Chien Thang1'	,   '4'			,   '4'		,'2020-03-10'),
    ('dapphatchetngay@gmail.com'		, 'khabanh'			,'Ngo Ba Kha'			,   '6'			,   '3'		,'2020-04-05'),
    ('songcodaoly@gmail.com'			, 'huanhoahong'		,'Bui Xuan Huan'		,   '7'			,   '2'		, NULL		),
    ('sontungmtp@gmail.com'				, 'tungnui'			,'Nguyen Thanh Tung'	,   '8'			,   '1'		,'2020-04-07'),
    ('duongghuu@gmail.com'				, 'duongghuu'		,'Duong Van Huu'		,   '9'			,   '2'		,'2020-04-07'),
    ('vtiaccademy@gmail.com'			, 'vtiaccademy'		,'Vi Ti Ai'				,   '10'		,   '1'		,'2020-04-09');

-- INSERT DATA TO TABLE group
INSERT INTO `group`
	(group_name				, creator_id	, create_date)
VALUES
	('Railway-22'			,  '1'			,'2020-03-05'),
    ('Rockect'				,  '2'			,'2020-03-05'),
    ('Photoshop'			,  '3'			,'2020-03-07'),
    ('Front End Developer'	,  '4'			,'2020-03-08'),
    ('Tester'				,  '4'			,'2020-03-10'),
    ('AWS Developer'		,  '3'			,'2020-04-05'),
    ('Intern Php'			,  '2'			, NULL		),
    ('Intern Ruby'			,  '1'			,'2020-04-07'),
    ('Intern Backend'		,  '2'			,'2020-04-07'),
    ('Senior Sales '		,  '1'			,'2020-04-09');
    
-- INSERT DATA TO TABLE question
INSERT INTO question
	(content									, category_id	, type_id	, creator_id	, create_date	)
VALUES
	(N'SQL là gì?'								,    1			,	1		,		4		,'2020-03-01'	),
    (N'Các data type ?'							,    4			,	2		,		1		,'2020-05-05'	),
    (N'Câu lệnh tạo database ?'					,    1			,	1		,		2		,'2020-07-08'	),
    (N'Câu lệnh xóa database ?'					,    4			,	1		,		8		,'2020-09-08'	),
    (N'Câu lệnh tạo bảng ?'						,    5			,	2		,		6		,'2020-10-03'	),
    (N'Câu lệnh xóa bảng ?'						,    3			,	1		,		1		,'2021-04-05'	),
    (N'Câu lệnh select ?'						,    2			,	2		,		2		,'2021-06-07'	),
    (N'Câu lệnh Update database ?'				,    7			,	1		,		3		,'2021-06-07'	),
    (N'Câu lệnh insert database ?'				,    8			,	1		,		4		,'2021-07-11'	),
    (N'Kể tên các constraints (ràng buộc) ? '	,    7			,	2		,		3		,'2021-09-21'	);
    
-- INSERT DATA TO TABLE answer
INSERT INTO answer
	(content																		, question_id	, iscorrect		)
VALUES
	('SQL (Structured Query Language ) là ngôn ngữ truy vấn có cấu trúc '			,    1			,	1			),
	('SQL (Structured Query Language ) là ngôn ngữ truy vấn '						,    1			,	0			),
    ('UPDATE database_name SET ten_cotgan="giatrigan" WHERE ten_cotdk= "gitridk"; '	,    8			,	1			),
    ('UPDATE database_name SET ten_cotdk= "gitridk WHERE "ten_cotgan="giatrigan"; '	,    8			,	0			),
    ('SELECT* FROM tenbang;'														,    7			,	1			),
    ('INSERT INTO tenbang(cot1,cot2) VALUES (giatri1, gia tri2);'					,    9			,	1			),
    ('INSERT INTO tenbang(cot1,cot2); VALUES (giatri1, gia tri2);'					,    9			,	0			),
    ('DELETE FROM tenbang WHERE cot1=giatridk;'										,    6			,	0			),
    ('DROP TABLE IF EXISTS tenbang;'												,    6			,	1			),
    ('DROP BATABASE IF EXISTS tendatabase '											,    4			,	1			);
    
-- INSERT DATA TO TABLE exam
INSERT INTO exam
	(`code`	, title			, category_id	, duration	, creator_id, create_date)
VALUES
	('015'	, 'abhdg'		,	1			,   50		,   1		,'2020-03-05'),
    ('070'	, 'fvnlgj'		,	4			,   60		,   2		,'2020-03-05'),
    ('008'	, 'fbdfhth'		,	2			,   90		,   3		,'2020-03-07'),
    ('009'	, 'tehtedgnrf'	,	1			,   60		,   4		,'2020-03-08'),
    ('421'	, 'tntrh'		,	3			,   15		,   4		,'2020-03-10'),
    ('621'	, 'tehnetj'		,	1			,   11		,   3		,'2020-04-05'),
    ('415'	, 'tjnryjry'	,	5			,   05		,   2		, NULL		),
    ('209'	, 'hfdsrydy'	,	3			,   90		,   1		,'2020-04-07'),
    ('801'	, 'ynmetwu4u'	,	2			,   15		,   2		,'2020-04-07'),
    ('674'	, 'jye46uw'		,	1			,   17		,   1		,'2020-04-09');
