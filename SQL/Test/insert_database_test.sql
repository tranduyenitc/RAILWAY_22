USE test_1;

INSERT INTO customer	(	name				,	phone		,email						,address								,note					)
VALUES 					('Do Thanh Huy'			,'0336728006'	,'duyentran8006@gmail.com'	,'District 9 Ho Chi Minh City, Vietnam'	,	NULL				),
						('Luu Thi My Diem'		,'0336758006'	,'tranduyen120@gmail.com'	,'District 7 Ho Chi Minh City, Vietnam'	,'atha5q3hy5es5y'		),
						('Tran Thi Hang'		,'0336728886'	,'tranhang94@gmail.com'		,'District 9 Ho Chi Minh City, Vietnam'	,'tahateh3Jfys'			),
						('Nguyen Thi Kim Hoa'	,'0336728045'	,'kimhoanguen@gmail.com'	,'Japan	'								,'ntyekukeduw4'			),
						('Nguyen Thi Minh Thi'	,'0336721306'	,'thithi9420@gmail.com'		,'Japan	'								,'bvsiothquahqwiorhoeu'	);

INSERT INTO car	( car_id	,maker		,model		,`year`			,color		,note			)
VALUES 			('HD0001'	,'HONDA'	,'HonDa 1'	, '2015-01-15'	, 'black'	,'fbviahgbahoi'	),
				('TYT001'	,'TOYOTA'	,'ToYoTa 1'	, '2019-03-21'	, 'white'	,'fbahtha'		),
				('HD0002'	,'HONDA'	,'HonDa 2'	, '2019-01-15'	, 'black'	,	NULL		),
				('NS0001'	,'NISSAN'	,'Nissan 1'	, '2020-04-11'	, 'yellow'	,'dstgawe'		),
				('HD0003'	,'HONDA'	,'Honda 3'	, '2021-06-15'	, 'white'	,'zdfna'		);

INSERT INTO car_orders	(customer_id,car_id		,amount	,sale_price	,order_date		,delivery_date		,delivery_address							,`status`	,note		)
VALUES 					(	1		,'HD0001'	,	8	,	151454	,'2021-01-15'	,	'2015-01-15'	,'District 9 Ho Chi Minh City, Vietnam'		,	'1'		,'gfsjym'	),
						(	4		,'NS0001'	,	5	,	8516446	,'2019-03-21'	,	'2019-03-21'	,'Japan'									,	'2'		,'synsety'	),
						(	2		,'TYT001'	,	7	,	24664	,'2019-01-15'	,	'2019-01-15'	,'District 7 Ho Chi Minh City, Vietnam'		,	'0'		,'ynmetw'	),
						(	3		,'HD0003'	,	3	,	154545	,'2020-04-11'	,	'2020-04-11'	,'District 9 Ho Chi Minh City, Vietnam'		,	'1'		,'nymets5u'	),
						(	1		,'TYT001'	,	8	,	504215	,'2021-06-15'	,	'2021-06-15'	,'District 7 Ho Chi Minh City, Vietnam'		,	'1'		,NULL		);
