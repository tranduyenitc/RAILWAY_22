USE extra_assignment_6;

SELECT *
FROM employee;

SELECT *
FROM project_modules;

SELECT *
FROM projects;

SELECT *
FROM work_done;

-- Questions
-- a) Tạo table với các ràng buộc và kiểu dữ liệu và thêm ít nhất 3 bản ghi vào 
-- mỗi table trên
-- b) Viết stored procedure (không có parameter) để Remove tất cả thông tin 
-- project đã hoàn thành sau 3 tháng kể từ ngày hiện. In số lượng record đã 
-- remove từ các table liên quan trong khi removing (dùng lệnh print)

-- Dùng khi khóa phụ có ON DELETE CASCADE 
DROP PROCEDURE IF EXISTS remove_project_done_3month;

DELIMITER $$
CREATE PROCEDURE remove_project_done_3month()
	BEGIN
		
        DECLARE record_deleted_work_done INT;
        DECLARE record_deleted_project_modules INT;
        DECLARE record_deleted_project INT;
        
        SELECT 	-- *,
				COUNT(wd.module_id) INTO record_deleted_work_done
        FROM projects p
        INNER JOIN project_modules pm
			ON p.project_id = pm.project_id
		 INNER JOIN work_done wd
			ON pm.module_id = wd.module_id
        WHERE (month(p.project_completed_on)-month(p.project_star_date))> 3;
        
        SELECT 	-- *,
				COUNT(*) INTO record_deleted_project_modules
        FROM projects p
        INNER JOIN project_modules pm
			ON p.project_id = pm.project_id
        WHERE (month(p.project_completed_on)-month(p.project_star_date))> 3;
        
		SELECT 	-- *,
				COUNT(*) INTO record_deleted_project
        FROM projects p
        WHERE (month(p.project_completed_on)-month(p.project_star_date))> 3;
        
        SELECT 	record_deleted_work_done,
				record_deleted_project_modules,
                record_deleted_project;
        
        DELETE p
        FROM projects p
        WHERE (month(p.project_completed_on)-month(p.project_star_date))> 3;
	END $$ 
DELIMITER ;

CALL remove_project_done_3month;

-- Dùng khi khóa phụ không có ON DELETE CASCADE 
DROP PROCEDURE IF EXISTS remove_project_done_3month;

DELIMITER $$
CREATE PROCEDURE remove_project_done_3month()
	BEGIN
		
        DECLARE record_deleted_work_done INT;
        DECLARE record_deleted_project_modules INT;
        DECLARE record_deleted_project INT;
        
        SELECT 	-- *,
				COUNT(wd.module_id) INTO record_deleted_work_done
        FROM projects p
        INNER JOIN project_modules pm
			ON p.project_id = pm.project_id
		 INNER JOIN work_done wd
			ON pm.module_id = wd.module_id
        WHERE (month(p.project_completed_on)-month(p.project_star_date))> 3;
        
        SELECT 	-- *,
				COUNT(*) INTO record_deleted_project_modules
        FROM projects p
        INNER JOIN project_modules pm
			ON p.project_id = pm.project_id
        WHERE (month(p.project_completed_on)-month(p.project_star_date))> 3;
        
		SELECT 	-- *,
				COUNT(*) INTO record_deleted_project
        FROM projects p
        WHERE (month(p.project_completed_on)-month(p.project_star_date))> 3;
        
        SELECT 	record_deleted_work_done,
				record_deleted_project_modules,
                record_deleted_project;
                
		DELETE wd
        FROM projects p
        INNER JOIN project_modules pm
			ON p.project_id = pm.project_id
		 INNER JOIN work_done wd
			ON pm.module_id = wd.module_id
        WHERE (month(p.project_completed_on)-month(p.project_star_date))> 3;
        
        DELETE pm
        FROM projects p
        INNER JOIN project_modules pm
			ON p.project_id = pm.project_id
        WHERE (month(p.project_completed_on)-month(p.project_star_date))> 3;
        
		DELETE p
        FROM projects p
        WHERE (month(p.project_completed_on)-month(p.project_star_date))> 3;
        
	END $$ 
DELIMITER ;

CALL remove_project_done_3month;

-- c) Viết stored procedure (có parameter) để in ra các module đang được thực 
-- hiện)
DROP PROCEDURE IF EXISTS print_modules;
DELIMITER $$
CREATE PROCEDURE print_modules(IN project_modules_id INT)
	BEGIN
		SELECT 	pm.*,
				wd.work_done_date,
                wd.work_done_description,
                wd.work_done_satatus
        FROM project_modules pm
        INNER JOIN work_done wd
			ON pm.module_id = wd.module_id
		WHERE wd.work_done_satatus = '0' AND wd.module_id = project_modules_id;
	END $$ 
DELIMITER ;

CALL print_modules(2);
