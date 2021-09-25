CREATE OR REPLACE PROCEDURE HR.GET_EMPINFO(po_empInfo OUT SYS_REFCURSOR) AS
BEGIN
    OPEN po_empInfo FOR
        SELECT 
            emp.first_name ||' '||emp.last_name emp_name,
            mng.first_name ||' '||mng.last_name mngr_name,
        dpt.department_name
        FROM 
            employees emp
            ,employees mng
            ,departments dpt
        WHERE 
            emp.manager_id=mng.employee_id
            AND emp.department_id=dpt.department_id;
END GET_EMPINFO;
/