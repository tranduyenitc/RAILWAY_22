USE extra_assignment_6;

INSERT INTO employee ( employee_last_name	,employee_fist_name		,employee_hire_date	,employee_status,supervisor_id	,social_security_number	)
VALUES 				(N'Đỗ'					,N'Thanh Huy'			,'2020-03-15'		,		1		,		1		,		'NV000011'		),	
                    (N'Vũ'					,N'Nam Đàn'				,'2020-03-16'		,		0		,		1		,		'NV000012'		),	
                    (N'Lưu'					,N'Thị Mỹ Diễm'			,'2020-03-17'		,		0		,		3		,		'NV000013'		),	
                    (N'Trần'				,N'Trần Thị Hằng'		,'2020-03-20'		,		1		,		3		,		'NV000014'		),	
                    (N'Nguyễn'				,N'Thị Minh Thi'		,'2020-03-21'		,		1		,		4		,		'NV000015'		),	
                    (N'Đặng'				,N'Văn Hiếu'			,'2020-04-22'		,		0		,		2		,		'NV000016'		),	
                    (N'Hồ'					,N'Thị Diễm Tâm'		,'2020-04-24'		,		1		,		1		,		'NV000017'		),	
                    (N'Nguyễn'				,N'Phi Học'				,'2020-04-27'		,		1		,		2		,		'NV000018'		),	
                    (N'Trần'				,N'Đăng Khoa'			,'2020-04-04'		,		0		,		5		,		'NV000019'		),	
                    (N'Lâm'					,N'Hữu Duy'				,'2020-04-04'		,		1		,		2		,		'NV000020'		);	
                    
INSERT INTO projects 	( manager_id,project_name	,project_star_date	,project_description,project_detailt		,project_completed_on	)
VALUES					(	1		,N'Dự án 1'		,'2020-03-15'		,N'mô tả dự án 1'	,N'chi tiết dự án 1'	,'2020-05-15'			),
                        (	5		,N'Dự án a'		,'2020-03-16'		,N'mô tả dự án 2'	,N'chi tiết dự án 2'	,'2020-04-16'			),
                        (	4		,N'Dự án 2'		,'2020-03-17'		,N'mô tả dự án 3'	,N'chi tiết dự án 3'	,'2020-10-17'			),
                        (	3		,N'Dự án b'		,'2020-03-20'		,N'mô tả dự án 4'	,N'chi tiết dự án 4'	,'2020-12-20'			),
                        (	2		,N'Dự án r'		,'2021-03-21'		,N'mô tả dự án 5'	,N'chi tiết dự án 5'	,'2021-06-21'			),
                        (	2		,N'Dự án n'		,'2021-04-22'		,N'mô tả dự án 6'	,N'chi tiết dự án 6'	,'2021-08-22'			),
                        (	1		,N'Dự án e'		,'2021-06-24'		,N'mô tả dự án 7'	,N'chi tiết dự án 7'	,'2021-09-24'			),
                        (	5		,N'Dự án 5'		,'2021-04-27'		,N'mô tả dự án 8'	,N'chi tiết dự án 8'	,'2021-10-27'			),
                        (	3		,N'Dự án 4'		,'2021-04-04'		,N'mô tả dự án 9'	,N'chi tiết dự án 9'	,'2021-10-04'			),
                        (	2		,N'Dự án 7'		,'2021-04-04'		,N'mô tả dự án 10'	,N'chi tiết dự án 10'	,'2021-10-04'			);
                        
INSERT INTO project_modules 	( project_id,employee_id	,project_modules_date	,project_modules_compled_on	,project_modules_description	)
VALUES							(	1		,		2		,'2020-03-15'			,NULL						,'mô tả module dự án 1'			),
								(	2		,		2		,'2020-03-16'			,NULL						,'mô tả module dự án 2'			),
								(	3		,		3		,'2020-03-17'			,'2020-10-17'				,'mô tả module dự án 3'			),
								(	4		,		4		,'2020-03-20'			,NULL						,'mô tả module dự án 4'			),
								(	3		,		1		,'2021-03-21'			,'2021-06-21'				,'mô tả module dự án 5'			),
								(	2		,		1		,'2021-04-22'			,'2021-08-22'				,'mô tả module dự án 6'			),
								(	2		,		8		,'2021-06-24'			,'2021-09-24'				,'mô tả module dự án 7'			),
								(	1		,		6		,'2021-04-27'			,NULL						,'mô tả module dự án 8'			),
								(	8		,		7		,'2021-04-04'			,'2021-10-04'				,'mô tả module dự án 9'			),
								(	6		,		7		,'2021-04-04'			,'2021-10-04'				,'mô tả module dự án 10'		);

INSERT INTO work_done 	( employee_id	,module_id	,work_done_date	,work_done_description							,work_done_satatus	)
VALUES					(		1		,	2		,NULL			,'mô tả công việc 1 đã hoàn thành'				,	'0'				),
						(		1		,	2		,'2020-01-16'	,'mô tả công việc 2 đã hoàn thành'				,	'1'				),
						(		5		,	3		,'2020-10-17'	,'mô tả công việc 3 đã hoàn thành'				,	'1'				),
						(		3		,	4		,'2020-12-20'	,'mô tả công việc 4 đã hoàn thành'				,	'1'				),
						(		6		,	4		,NULL			,'mô tả công việc 5 đã hoàn thành'				,	'0'				),
						(		4		,	1		,NULL			,'mô tả công việc 6 đã hoàn thành'				,	'0'				),
						(		5		,	2		,'2021-09-24'	,'mô tả công việc 7 đã hoàn thành'				,	'1'				),
						(		2		,	1		,NULL			,'mô tả công việc 8 đã hoàn thành'				,	'0'				),
						(		2		,	6		,'2021-10-04'	,'mô tả công việc 9 đã hoàn thành'				,	'1'				),
						(		9		,	3		,'2021-10-04'	,'mô tả công việc 10 đã hoàn thành'				,	'1'				);