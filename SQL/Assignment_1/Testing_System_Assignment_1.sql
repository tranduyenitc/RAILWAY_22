-- CREATE DATABASE 
CREATE DATABASE IF NOT EXISTS manage_exams;

-- XOA DATABASE
-- DROP DATABASE IF EXISTS manage_exams;

-- CAU LENH DUNG DATABASE
USE manage_exams;

-- XOA TABLES
-- DROP TABLE IF EXISTS 
-- 	department,
--     `position`,
--     `account`,
--     `group`,
--     group_account,
--     type_question,
--     category_question,
--     question,
--     answer,
--     exam,
--     exam_question;

-- TAO TABLES
CREATE TABLE IF NOT EXISTS department(
	department_id	INT AUTO_INCREMENT PRIMARY KEY,
    department_name	VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS `position`(
	position_id		INT AUTO_INCREMENT PRIMARY KEY,
    position_name	ENUM("Dev","Test","Scrum Master","PM")
);

CREATE TABLE IF NOT EXISTS `account`(
	account_id		INT AUTO_INCREMENT PRIMARY KEY,
    email			VARCHAR(50),
    username		VARCHAR(100),
    fullname 		VARCHAR(100),
    department_id 	INT,
    position_id 	INT,
    create_date 	DATE
);

CREATE TABLE IF NOT EXISTS `group`(
	group_id 		INT AUTO_INCREMENT PRIMARY KEY,
    group_name 		VARCHAR(100),
    creator_id 		INT,
    create_date 	DATE
);

CREATE TABLE IF NOT EXISTS group_account(
	group_id	INT,
    account_id	INT,
    join_date	DATE,
    PRIMARY KEY (group_id,account_id)
);

CREATE TABLE IF NOT EXISTS type_question(
	type_id		INT AUTO_INCREMENT PRIMARY KEY,
    type_name	ENUM("Essay","Multiple-Choice")
);

CREATE TABLE IF NOT EXISTS category_question(
	catagory_id 	INT AUTO_INCREMENT PRIMARY KEY,
    catagory_name	VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS question(
	question_id	INT AUTO_INCREMENT PRIMARY KEY,
    content			TEXT,
    category_id		INT,
    type_id			INT,
    creator_id 		INT,
    create_date 	DATE
);

CREATE TABLE IF NOT EXISTS answer(
	answer_id 		INT AUTO_INCREMENT PRIMARY KEY,
	content 		TEXT,
    question_id 	INT,
    iscorrect 		BINARY
);

CREATE TABLE IF NOT EXISTS exam(
	exam_id 		INT AUTO_INCREMENT PRIMARY KEY,
    `code`			CHAR(10),
    title 			VARCHAR(200),
    category_id		INT,
    duration 		INT,
    creator_id 		INT,
    create_date 	DATE
);

CREATE TABLE IF NOT EXISTS exam_question(
	exam_id 		INT ,
	question_id		INT,
    primary key(exam_id,question_id)
);

