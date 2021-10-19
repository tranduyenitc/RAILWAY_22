-- Database --  
DROP DATABASE IF EXISTS sql_assignment;
CREATE DATABASE IF NOT EXISTS sql_assignment
    CHARACTER SET "utf8"
    COLLATE "utf8_unicode_ci";

USE sql_assignment;

-- Table --  
DROP TABLE IF EXISTS	departments,
						positions,
                        `accounts`,
                        `groups`,
                        `group_accounts`,
                        type_questions,
                        category_questions,
                        questions,
                        answers,
                        exams,
                        exam_questions;

CREATE TABLE IF NOT EXISTS departments(
	department_id		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    department_name		NVARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS positions(
	position_id		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    position_name	ENUM("Dev","Test","Scrum Master","PM") DEFAULT "Dev"
);

CREATE TABLE IF NOT EXISTS `accounts`(
	account_id		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,	
    email			NVARCHAR(100) UNIQUE NOT NULL,
    username		NVARCHAR(50) NOT NULL,
    fullname		NVARCHAR(200) NOT NULL,
    gender			BIT DEFAULT 1,
    department_id	TINYINT UNSIGNED,
    position_id		TINYINT UNSIGNED,
    create_date		DATE,
    
    FOREIGN KEY(department_id) REFERENCES departments(department_id),
    FOREIGN KEY(position_id) REFERENCES positions(position_id)
);

CREATE TABLE IF NOT EXISTS `groups`(
	group_id		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    group_name		NVARCHAR(100),
    creator_id		INT UNSIGNED NOT NULL,
    create_date		DATE,
    
    FOREIGN KEY(creator_id) REFERENCES `accounts`(account_id)
);

CREATE TABLE IF NOT EXISTS group_accounts(
	group_id	TINYINT UNSIGNED,
    account_id	INT UNSIGNED,
    join_date	DATE,
    
    PRIMARY KEY(group_id,account_id),
    FOREIGN KEY(group_id) REFERENCES `groups`(group_id),
    FOREIGN KEY(account_id) REFERENCES `accounts`(account_id)
);

CREATE TABLE IF NOT EXISTS type_questions(
	type_id		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    type_name	ENUM("Essay","Multiple-Choice") DEFAULT "Multiple-Choice"
);

CREATE TABLE IF NOT EXISTS category_questions(
	category_id		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    category_name	NVARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS questions(
	question_id	INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    content		TEXT,
    category_id	TINYINT UNSIGNED,
    type_id		TINYINT UNSIGNED,
    creator_id	INT UNSIGNED,
    create_date	DATE,
    
    FOREIGN KEY(category_id) REFERENCES category_questions(category_id),
    FOREIGN KEY(type_id) REFERENCES type_questions(type_id),
    FOREIGN KEY(creator_id) REFERENCES `accounts`(account_id)
);

CREATE TABLE IF NOT EXISTS answers(
	answer_id	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    content		TEXT,
    question_id	INT UNSIGNED,
    iscorrect	BIT DEFAULT 1,
    
    FOREIGN KEY(question_id) REFERENCES questions(question_id)
);

CREATE TABLE IF NOT EXISTS exams(
	exam_id		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `code`		VARCHAR(10) UNIQUE NOT NULL,
    title		NVARCHAR(100) NOT NULL,
    category_id	TINYINT UNSIGNED,
    duration	INT UNSIGNED NOT NULL,
    creator_id	INT UNSIGNED,
    createdate	DATE,
    
    -- FOREIGN KEY(category_id) REFERENCES category_questions(category_id),
    FOREIGN KEY(creator_id) REFERENCES `accounts`(account_id)
);

CREATE TABLE IF NOT EXISTS exam_questions(
	exam_id		TINYINT UNSIGNED,
    question_id	INT UNSIGNED,
    
    PRIMARY KEY(exam_id,question_id),
    FOREIGN KEY(exam_id) REFERENCES exams(exam_id),
    FOREIGN KEY(question_id) REFERENCES questions(question_id)
);
