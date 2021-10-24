DROP DATABASE IF EXISTS extra_assignment_6;
CREATE DATABASE IF NOT EXISTS extra_assignment_6
	CHARACTER SET "utf8"
    COLLATE "utf8_unicode_ci";

USE extra_assignment_6;

CREATE TABLE IF NOT EXISTS employee(
	employee_id					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    employee_last_name			NVARCHAR(50),
    employee_fist_name			NVARCHAR(50),
    employee_hire_date			DATE,
    employee_status				BIT DEFAULT 1,
    supervisor_id				TINYINT UNSIGNED,
    social_security_number		VARCHAR(10) UNIQUE,
    
    FOREIGN KEY(supervisor_id) REFERENCES employee(employee_id) -- ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS projects(
	project_id				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    manager_id				TINYINT UNSIGNED NOT NULL,
    project_name			NVARCHAR(50),
    project_star_date		DATE,
    project_description		NVARCHAR(100),
    project_detailt			TEXT,
    project_completed_on	DATE,
    
    FOREIGN KEY(manager_id) REFERENCES employee(employee_id) -- ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS project_modules(
	module_id						TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    project_id						TINYINT UNSIGNED,
    employee_id						TINYINT UNSIGNED,
    project_modules_date			DATE,
    project_modules_compled_on		DATE,
    project_modules_description		NVARCHAR(100),
     
    FOREIGN KEY(project_id) REFERENCES projects(project_id) ,-- ON DELETE CASCADE,
	FOREIGN KEY(employee_id) REFERENCES employee(employee_id) -- ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS work_done(
	work_done_id			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    employee_id				TINYINT UNSIGNED,
    module_id				TINYINT UNSIGNED,
    work_done_date			DATE,
    work_done_description	NVARCHAR(100),
    work_done_satatus		ENUM('0','1','2') DEFAULT '0', 	-- 0: đang thực hiện
															-- 1: đã hoàn thành
                                                            -- 2: hủy bỏ
    
    FOREIGN KEY(employee_id) REFERENCES employee(employee_id) ,-- ON DELETE CASCADE,
    FOREIGN KEY(module_id) REFERENCES project_modules(module_id) -- ON DELETE CASCADE
);



