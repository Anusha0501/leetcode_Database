#1965. Employees With Missing Information

(SELECT E.employee_id
FROM Employees E
LEFT JOIN Salaries S on E.employee_id = S.employee_id
WHERE S.salary IS NULL
UNION

SELECT S.employee_id
FROM Employees E
RIGHT JOIN Salaries S on E.employee_id = S.employee_id
WHERE E.name IS NULL)
ORDER BY employee_id
