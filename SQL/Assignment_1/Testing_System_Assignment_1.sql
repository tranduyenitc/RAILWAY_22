-- DELETE DATABASE
DROP DATABASE IF EXISTS manage_exams;

-- CREATE DATABASE 
CREATE DATABASE IF NOT EXISTS manage_exams;

-- CAU LENH DUNG DATABASE
USE manage_exams;

-- DELETE TABLES
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

-- CREATE TABLES
CREATE TABLE IF NOT EXISTS department(
	department_id	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    department_name	NVARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS `position`(
	position_id		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    position_name	ENUM("Dev","Test","Scrum Master","PM") DEFAULT "Dev"
);

CREATE TABLE IF NOT EXISTS `account`(
	account_id		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    email			VARCHAR(50) UNIQUE NOT NULL,
    username		VARCHAR(100) UNIQUE NOT NULL,
    fullname 		NVARCHAR(100) NOT NULL,
    gender			BIT DEFAULT 1,
    department_id 	TINYINT UNSIGNED,
    position_id 	TINYINT UNSIGNED,
    create_date 	DATE,
    FOREIGN KEY(department_id) REFERENCES department(department_id),
    FOREIGN KEY(position_id) REFERENCES `position`(position_id)
);

CREATE TABLE IF NOT EXISTS `group`(
	group_id 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    group_name 		NVARCHAR(100) NOT NULL,
    creator_id 		INT UNSIGNED,
    create_date 	DATE,
    FOREIGN KEY(creator_id) REFERENCES `account`(account_id)
);

CREATE TABLE IF NOT EXISTS group_account(
	group_id	TINYINT UNSIGNED,
    account_id	INT UNSIGNED,
    join_date	DATE,
    PRIMARY KEY (group_id,account_id),
    FOREIGN KEY(group_id) REFERENCES `group`(group_id),
    FOREIGN KEY(account_id) REFERENCES `account`(account_id)
);

CREATE TABLE IF NOT EXISTS type_question(
	type_id		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    type_name	ENUM("Essay","Multiple-Choice") DEFAULT "Multiple-Choice"
);

CREATE TABLE IF NOT EXISTS category_question(
	catagory_id 	TINYINT UNSIGNED AUTO_INCREMENT KEY,
    catagory_name	VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS question(
	question_id		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    content			TEXT,
    category_id		TINYINT UNSIGNED,
    type_id			TINYINT UNSIGNED,
    creator_id 		INT UNSIGNED,
    create_date 	DATE,
    FOREIGN KEY (category_id) REFERENCES category_question(catagory_id),
    FOREIGN KEY (type_id) REFERENCES type_question(type_id),
    FOREIGN KEY (creator_id) REFERENCES `account`(account_id)
);

CREATE TABLE IF NOT EXISTS answer(
	answer_id 		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	content 		TEXT,
    question_id 	INT UNSIGNED,
    iscorrect 		BIT DEFAULT 1,
    FOREIGN KEY(question_id) REFERENCES question(question_id)
);

CREATE TABLE IF NOT EXISTS exam(
	exam_id 		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `code`			CHAR(10) UNIQUE NULL,
    title 			VARCHAR(100) NOT NULL,
    category_id		TINYINT UNSIGNED,
    duration 		TINYINT UNSIGNED,
    creator_id 		INT UNSIGNED,
    create_date 	DATE,
    -- FOREIGN KEY(category_id) REFERENCES category_question(category_id),  xem lai * neu khong tao lien ket khoa phu vay sao co the lay duoc du lieu cot category?*
    FOREIGN KEY(creator_id) REFERENCES `account`(account_id)
);

CREATE TABLE IF NOT EXISTS exam_question(
	exam_id 		INT UNSIGNED ,
	question_id		INT UNSIGNED,
    primary key(exam_id,question_id),
    FOREIGN KEY(exam_id) REFERENCES exam(exam_id),
    FOREIGN KEY(question_id) REFERENCES question(question_id)
);

