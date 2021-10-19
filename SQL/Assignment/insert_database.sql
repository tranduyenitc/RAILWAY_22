USE sql_assignment;

-- INSERT DATA TO TABLE departments
INSERT INTO departments	(department_name)
VALUES					(N'Marketing'	),
						(N'Sale'		),
						(N'Bảo vệ'		),
						(N'Nhân sự'		),
						(N'Kỹ thuật'	),
						(N'Tài chính'	),
						(N'Phó giám đốc'),
						(N'Giám đốc'	),
						(N'Thư kí'		),
						(N'Bán hàng'	);
    
-- INSERT DATA TO TABLE positions
INSERT INTO positions	(position_name	) 
VALUES 					('Dev'			),
						('Test'			),
						('Scrum Master'	),
						('PM'			); 

-- INSERT DATA TO TABLE type_questions
INSERT INTO type_questions	(type_name			) 
VALUES						('Essay'			),
							('Multiple-Choice'	); 

-- INSERT DATA TO TABLE category_questions
INSERT INTO category_questions 	(category_name	)
VALUES 							('Java'			),
								('ASP.NET'		),
								('ADO.NET'		),
								('SQL'			),
								('Postman'		),
								('Ruby'			),
								('Python'		),
								('C++'			),
								('C Sharp'		),
								('PHP'			);

-- INSERT DATA TO TABLE accounts
INSERT INTO `accounts`	(email										, username			, fullname				, department_id	, position_id	, create_date	)
VALUES 					('haidang29productions@gmail.com'			, 'dangblack'		,'Nguyễn hải Đăng'		,   '1'			,   '1'			,'2020-03-05'	),
						('account1@gmail.com'						, 'quanganh'		,'Nguyen Chien Thang2'	,   '1'			,   '2'			,'2020-03-05'	),
						('account2@gmail.com'						, 'vanchien'		,'Nguyen Van Chien'		,   '2'			,   '3'			,'2020-03-07'	),
						('account3@gmail.com'						, 'cocoduongqua'	,'Duong Do'				,   '3'			,   '4'			,'2020-03-08'	),
						('account4@gmail.com'						, 'doccocaubai'		,'Nguyen Chien Thang1'	,   '4'			,   '4'			,'2020-03-10'	),
						('dapphatchetngay@gmail.com'				, 'khabanh'			,'Ngo Ba Kha'			,   '6'			,   '3'			,'2020-04-05'	),
						('songcodaoly@gmail.com'					, 'huanhoahong'		,'Bui Xuan Huan'		,   '3'			,   '2'			, NULL			),
						('sontungmtp@gmail.com'						, 'tungnui'			,'Nguyen Thanh Tung'	,   '8'			,   '1'			,'2020-04-07'	),
						('duongghuu@gmail.com'						, 'duongghuu'		,'Duong Van Huu'		,   '1'			,   '2'			,'2020-04-07'	),
						('vtiaccademy@gmail.com'					, 'vtiaccademy'		,'Vi Ti Ai'				,   '10'		,   '1'			,'2020-04-09'	);

-- INSERT DATA TO TABLE groups
INSERT INTO `groups`	( group_name			, creator_id		, create_date	)
VALUES 					(N'Testing System'		,   5				,'2019-03-05'	),
						(N'Development'			,   1				,'2020-03-07'	),
						(N'VTI Sale 01'			,   2				,'2020-03-09'	),
						(N'VTI Sale 02'			,   3				,'2020-03-10'	),
						(N'VTI Sale 03'			,   4				,'2020-03-28'	),
						(N'VTI Creator'			,   6				,'2020-04-06'	),
						(N'VTI Marketing 01'	,   7				,'2020-04-07'	),
						(N'Management'			,   8				,'2020-04-08'	),
						(N'Chat with love'		,   9				,'2020-04-09'	),
						(N'Vi Ti Ai'			,   10				,'2020-04-10'	);

-- INSERT DATA TO TABLE questions
INSERT INTO questions	(content			, category_id	, type_id		, creator_id	, create_date 	)
VALUES 					(N'Câu hỏi về Java'	,	1			,   '1'			,   '2'			,'2020-04-05'	),
						(N'Câu Hỏi về PHP'	,	10			,   '2'			,   '2'			,'2020-04-05'	),
						(N'Hỏi về C#'		,	9			,   '2'			,   '3'			,'2020-04-06'	),
						(N'Hỏi về Ruby'		,	6			,   '1'			,   '4'			,'2020-04-06'	),
						(N'Hỏi về Postman'	,	5			,   '1'			,   '5'			,'2020-04-06'	),
						(N'Hỏi về ADO.NET'	,	3			,   '2'			,   '6'			,'2020-04-06'	),
						(N'Hỏi về ASP.NET'	,	2			,   '1'			,   '7'			,'2020-04-06'	),
						(N'Hỏi về C++'		,	8			,   '1'			,   '8'			,'2020-04-07'	),
						(N'Hỏi về SQL'		,	4			,   '2'			,   '9'			,'2020-04-07'	),
						(N'Hỏi về Python'	,	7			,   '1'			,   '10'		,'2020-04-07'	),
                        (N'Hỏi về PythonCâu hỏi về JavaCâu hỏi về JavaCâu hỏi về JavaCâu hỏi về Java'	,	7			,   '1'			,   '10'		,'2020-04-07'	);
    
-- INSERT DATA TO TABLE answers
INSERT INTO answers	(content		, question_id	, iscorrect	)
VALUES 				(N'Trả lời 01'	,   1			,	0		),
					(N'Trả lời 02'	,   1			,	1		),
                    (N'Trả lời 03'	,   1			,	0		),
                    (N'Trả lời 04'	,   1			,	1		),
                    (N'Trả lời 05'	,   2			,	1		),
                    (N'Trả lời 06'	,   3			,	1		),
                    (N'Trả lời 07'	,   4			,	0		),
                    (N'Trả lời 08'	,   8			,	0		),
                    (N'Trả lời 09'	,   9			,	1		),
                    (N'Trả lời 10'	,   10			,	1		);

-- INSERT DATA TO TABLE exams
INSERT INTO exams	(`code`			, title					, category_id	, duration	, creator_id		, createdate 	)
VALUES 				('VTIQ001'		, N'Đề thi C#'			,	1			,	60		,   '5'				,'2019-04-05'	),
					('VTIQ002'		, N'Đề thi PHP'			,	10			,	60		,   '2'				,'2019-04-05'	),
                    ('VTIQ003'		, N'Đề thi C++'			,	9			,	120		,   '2'				,'2019-04-07'	),
                    ('VTIQ004'		, N'Đề thi Java'		,	6			,	60		,   '3'				,'2020-04-08'	),
                    ('VTIQ005'		, N'Đề thi Ruby'		,	5			,	120		,   '4'				,'2020-04-10'	),
                    ('VTIQ006'		, N'Đề thi Postman'		,	3			,	60		,   '6'				,'2020-04-05'	),
                    ('VTIQ007'		, N'Đề thi SQL'			,	2			,	60		,   '7'				,'2020-04-05'	),
                    ('VTIQ008'		, N'Đề thi Python'		,	8			,	60		,   '8'				,'2020-04-07'	),
                    ('VTIQ009'		, N'Đề thi ADO.NET'		,	4			,	90		,   '9'				,'2020-04-07'	),
                    ('VTIQ010'		, N'Đề thi ASP.NET'		,	7			,	90		,   '10'			,'2020-04-08'	);
                    

-- INSERT DATA TO TABLE exam_questions
INSERT INTO exam_questions	(exam_id	, question_id	) 
VALUES 						(	1		,		5		),
							(	2		,		10		), 
							(	3		,		4		), 
							(	4		,		3		), 
							(	5		,		7		), 
							(	6		,		10		), 
							(	7		,		2		), 
							(	8		,		10		), 
							(	9		,		9		), 
							(	10		,		8		); 

-- INSERT DATA TO TABLE `group_accounts`
INSERT INTO `group_accounts`	(  group_id	, account_id	, join_date	 	)
VALUES 							(	1		,    1			,'2019-03-05'	),
								(	1		,    2			,'2020-03-07'	),
								(	3		,    3			,'2020-03-09'	),
								(	3		,    4			,'2020-03-10'	),
								(	5		,    5			,'2020-03-28'	),
								(	1		,    3			,'2020-04-06'	),
								(	1		,    7			,'2020-04-07'	),
								(	8		,    3			,'2020-04-08'	),
								(	1		,    9			,'2020-04-09'	),
								(	10		,    10			,'2020-04-10'	);

