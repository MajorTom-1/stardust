-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
SELECT employees.employee_name, salary_3.monthly_salary FROM employees
JOIN employee_salary_3
ON employees.id = employee_salary_3.employee_id
JOIN salary_3
ON employee_salary_3.salary_id = salary_3.id;

--2. Вывести всех работников у которых ЗП меньше 2000.
SELECT employees.employee_name, salary_3.monthly_salary FROM employees
JOIN employee_salary_3
ON employees.id = employee_salary_3.employee_id
JOIN salary_3
ON employee_salary_3.salary_id = salary_3.id
WHERE monthly_salary <2000;

--3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
-- см. HW2 п.6 там где 10 безимянных id
SELECT employees.employee_name, salary_3.monthly_salary FROM employees
RIGHT JOIN employee_salary_3
ON employees.id = employee_salary_3.employee_id
JOIN salary_3
ON employee_salary_3.salary_id = salary_3.id
WHERE employee_salary_3.employee_id >70;

--4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
SELECT employees.employee_name, salary_3.monthly_salary FROM employees
RIGHT JOIN employee_salary_3
ON employees.id = employee_salary_3.employee_id
JOIN salary_3
ON employee_salary_3.salary_id = salary_3.id
WHERE employee_salary_3.employee_id >70 AND monthly_salary <2000;

--5. Найти всех работников кому не начислена ЗП.
SELECT employees.employee_name, salary_3.monthly_salary FROM employees
LEFT JOIN employee_salary_3
ON employees.id = employee_salary_3.employee_id
LEFT JOIN salary_3
ON employee_salary_3.salary_id = salary_3.id
WHERE employee_id IS NULL;

--6. Вывести всех работников с названиями их должности.
SELECT employees.employee_name, roles_3.role_name FROM employees
JOIN roles_employee
ON employees.id = roles_employee.employee_id
JOIN roles_3
ON roles_employee.role_id = roles_3.id;

--7. Вывести имена и должность только Java разработчиков.
SELECT employees.employee_name, roles_3.role_name FROM employees
JOIN roles_employee
ON employees.id = roles_employee.employee_id
JOIN roles_3
ON roles_employee.role_id = roles_3.id
WHERE role_name LIKE '% Java %'; 

--8. Вывести имена и должность только Python разработчиков.
SELECT employees.employee_name, roles_3.role_name FROM employees
JOIN roles_employee
ON employees.id = roles_employee.employee_id
JOIN roles_3
ON roles_employee.role_id = roles_3.id
WHERE role_name LIKE '% Python %';

--9. Вывести имена и должность всех QA инженеров.
SELECT employees.employee_name, roles_3.role_name FROM employees
JOIN roles_employee
ON employees.id = roles_employee.employee_id
JOIN roles_3
ON roles_employee.role_id = roles_3.id
WHERE role_name LIKE '% QA %';

--10. Вывести имена и должность ручных QA инженеров.
SELECT employees.employee_name, roles_3.role_name FROM employees
JOIN roles_employee
ON employees.id = roles_employee.employee_id
JOIN roles_3
ON roles_employee.role_id = roles_3.id
WHERE role_name LIKE '% Manual QA %';

--11. Вывести имена и должность автоматизаторов QA
SELECT employees.employee_name, roles_3.role_name FROM employees
JOIN roles_employee
ON employees.id = roles_employee.employee_id
JOIN roles_3
ON roles_employee.role_id = roles_3.id
WHERE role_name LIKE '% Automation QA %';

--12. Вывести имена и зарплаты Junior специалистов
SELECT employees.employee_name, salary_3.monthly_salary, roles_3.role_name FROM employees
JOIN employee_salary_3
ON employees.id = employee_salary_3.employee_id
JOIN salary_3
ON employee_salary_3.salary_id = salary_3.id
JOIN roles_employee
ON roles_employee.employee_id = employees.id
RIGHT JOIN roles_3
ON roles_employee.role_id = roles_3.id
WHERE role_name LIKE 'Junior%';

--13. Вывести имена и зарплаты Middle специалистов
SELECT employees.employee_name, salary_3.monthly_salary, roles_3.role_name FROM employees
JOIN employee_salary_3
ON employees.id = employee_salary_3.employee_id
JOIN salary_3
ON employee_salary_3.salary_id = salary_3.id
JOIN roles_employee
ON roles_employee.employee_id = employees.id
RIGHT JOIN roles_3
ON roles_employee.role_id = roles_3.id
WHERE role_name LIKE 'Middle%';

--14. Вывести имена и зарплаты Senior специалистов
SELECT employees.employee_name, salary_3.monthly_salary, roles_3.role_name FROM employees
JOIN employee_salary_3
ON employees.id = employee_salary_3.employee_id
JOIN salary_3
ON employee_salary_3.salary_id = salary_3.id
JOIN roles_employee
ON roles_employee.employee_id = employees.id
RIGHT JOIN roles_3
ON roles_employee.role_id = roles_3.id
WHERE role_name LIKE 'Senior%';

--15. Вывести зарплаты Java разработчиков
create table salary3_roles3 (
id serial primary key,
id_role int not null,
id_salary int not null, 
foreign key (id_role)
references roles_3(id),
foreign key (id_salary)
references salary_3(id) 
)

SELECT * FROM salary3_roles3

insert into salary3_roles3(id_role, id_salary)
values (1, 5),
       (2, 4),
        (3, 6),
       (4, 7),
       (5, 8),
       (6, 9),
       (7, 6),
       (8, 7),
       (9, 8),
       (10, 9),
       (11, 16),
       (12, 15),
       (13, 14),
       (14, 13),
       (15, 12),
       (16, 11),
       (17, 10),
       (18, 1),
       (19, 2),
       (20, 3);
      
SELECT salary_3.monthly_salary, roles_3.role_name FROM roles_3
JOIN salary3_roles3
ON roles_3.id = salary3_roles3.id_role
JOIN salary_3
ON salary3_roles3.id_salary = salary_3.id
WHERE role_name LIKE '% Java %';

--16. Вывести зарплаты Python разработчиков
SELECT salary_3.monthly_salary, roles_3.role_name FROM roles_3
JOIN salary3_roles3
ON roles_3.id = salary3_roles3.id_role
JOIN salary_3
ON salary3_roles3.id_salary = salary_3.id
WHERE role_name LIKE '% Python %';

--17. Вывести имена и зарплаты Junior Python разработчиков
SELECT employees.employee_name, salary_3.monthly_salary, roles_3.role_name FROM employees
JOIN employee_salary_3
ON employees.id = employee_salary_3.employee_id
JOIN salary_3
ON employee_salary_3.salary_id = salary_3.id
JOIN roles_employee
ON roles_employee.employee_id = employees.id
JOIN roles_3
ON roles_employee.role_id = roles_3.id
WHERE role_name LIKE 'Junior Python developer';

--18. Вывести имена и зарплаты Middle JS разработчиков
SELECT employees.employee_name, salary_3.monthly_salary, roles_3.role_name FROM employees
JOIN employee_salary_3
ON employees.id = employee_salary_3.employee_id
JOIN salary_3
ON employee_salary_3.salary_id = salary_3.id
JOIN roles_employee
ON roles_employee.employee_id = employees.id
RIGHT JOIN roles_3
ON roles_employee.role_id = roles_3.id
WHERE role_name LIKE 'Middle JavaScript developer';

--19. Вывести имена и зарплаты Senior Java разработчиков
SELECT employees.employee_name, salary_3.monthly_salary, roles_3.role_name FROM employees
JOIN employee_salary_3
ON employees.id = employee_salary_3.employee_id
JOIN salary_3
ON employee_salary_3.salary_id = salary_3.id
JOIN roles_employee
ON roles_employee.employee_id = employees.id
JOIN roles_3
ON roles_employee.role_id = roles_3.id
WHERE role_name LIKE 'Senior Java developer';

--20. Вывести зарплаты Junior QA инженеров
SELECT salary_3.monthly_salary, roles_3.role_name FROM roles_3
JOIN salary3_roles3
ON roles_3.id = salary3_roles3.id_role
JOIN salary_3
ON salary3_roles3.id_salary = salary_3.id
WHERE role_name LIKE 'Junior %' AND role_name LIKE '% QA engineer';

--21. Вывести среднюю зарплату всех Junior специалистов
SELECT AVG(monthly_salary) FROM salary_3
JOIN salary3_roles3
ON salary_3.id = salary3_roles3.id_role
JOIN roles_3
ON salary3_roles3.id_role = roles_3.id
WHERE role_name LIKE 'Junior %';

--22. Вывести сумму зарплат JS разработчиков
SELECT SUM(monthly_salary) FROM salary_3
JOIN salary3_roles3
ON salary_3.id = salary3_roles3.id_role
JOIN roles_3
ON salary3_roles3.id_role = roles_3.id
WHERE role_name LIKE '% JavaScript %';

--23. Вывести минимальную ЗП QA инженеров
SELECT MIN(monthly_salary) FROM salary_3
JOIN salary3_roles3
ON salary_3.id = salary3_roles3.id_role
JOIN roles_3
ON salary3_roles3.id_role = roles_3.id
WHERE role_name LIKE '% QA engineer';

--24. Вывести максимальную ЗП QA инженеров
SELECT MAX(monthly_salary) FROM salary_3
JOIN salary3_roles3
ON salary_3.id = salary3_roles3.id_role
JOIN roles_3
ON salary3_roles3.id_role = roles_3.id
WHERE role_name LIKE '% QA engineer';

--25. Вывести количество QA инженеров
SELECT COUNT(role_name) FROM roles_3
WHERE role_name LIKE '% QA engineer';

--26. Вывести количество Middle специалистов.
SELECT COUNT(role_name) FROM roles_3
WHERE role_name LIKE 'Middle %';

--27. Вывести количество разработчиков
SELECT COUNT(role_name) FROM roles_3
WHERE role_name LIKE '% developer';

--28. Вывести фонд (сумму) зарплаты разработчиков.
SELECT SUM(monthly_salary) FROM salary_3
JOIN salary3_roles3
ON salary_3.id = salary3_roles3.id_role
JOIN roles_3
ON salary3_roles3.id_role = roles_3.id
WHERE role_name LIKE '% developer';

--29. Вывести имена, должности и ЗП всех специалистов по возрастанию
SELECT employees.employee_name, salary_3.monthly_salary, roles_3.role_name FROM employees
JOIN employee_salary_3
ON employees.id = employee_salary_3.employee_id
JOIN salary_3
ON employee_salary_3.salary_id = salary_3.id
JOIN roles_employee
ON roles_employee.employee_id = employees.id
JOIN roles_3
ON roles_employee.role_id = roles_3.id
ORDER BY monthly_salary;

--30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
SELECT employees.employee_name, salary_3.monthly_salary, roles_3.role_name FROM employees
JOIN employee_salary_3
ON employees.id = employee_salary_3.employee_id
JOIN salary_3
ON employee_salary_3.salary_id = salary_3.id
JOIN roles_employee
ON roles_employee.employee_id = employees.id
JOIN roles_3
ON roles_employee.role_id = roles_3.id
WHERE monthly_salary BETWEEN 1700 AND 2300
ORDER BY monthly_salary;

--31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
SELECT employees.employee_name, salary_3.monthly_salary, roles_3.role_name FROM employees
JOIN employee_salary_3
ON employees.id = employee_salary_3.employee_id
JOIN salary_3
ON employee_salary_3.salary_id = salary_3.id
JOIN roles_employee
ON roles_employee.employee_id = employees.id
JOIN roles_3
ON roles_employee.role_id = roles_3.id
WHERE monthly_salary < 2300
ORDER BY monthly_salary;

--32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
SELECT employees.employee_name, salary_3.monthly_salary, roles_3.role_name FROM employees
JOIN employee_salary_3
ON employees.id = employee_salary_3.employee_id
JOIN salary_3
ON employee_salary_3.salary_id = salary_3.id
JOIN roles_employee
ON roles_employee.employee_id = employees.id
JOIN roles_3
ON roles_employee.role_id = roles_3.id
WHERE monthly_salary IN (1100, 1500, 2000)
ORDER BY monthly_salary;