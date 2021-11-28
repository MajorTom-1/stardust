-- 1)  Создать таблицу employees 
-- - id. serial,  primary key,  
-- - employee_name. Varchar(50), not null
create table employees (
id serial primary key,
employee_name varchar(50) not null
)

select * from employees;

-- 2)	Наполнить таблицу employee 70 строками  (ФИО можно отсюда взять: https://randomus.ru/name?type=101&sex=10&count=70  а потом в excel формулой протянуть ="('"&B3:B3&"')," )
insert into employees(employee_name)
values ('Thomas Stone'),
('Sandra Luna'),
('Alan Carter'),
('Fernando Garcia'),
('David White'),
('Lisa Alvarez'),
('Gloria Baker'),
('Julie Clark'),
('Phyllis Lloyd'),
('Robin Baker'),
('Kristin White'),
('Amy Ingram'),
('Martha Jones'),
('Joe Myers'),
('Melvin Daniels'),
('Carl Simmons'),
('Carol Cox'),
('Robert Moore'),
('John Davis'),
('Kevin Scott'),
('Kevin Moore'),
('Eleanor Taylor'),
('Nina Taylor'),
('Mary Paul'),
('Teresa Miller'),
('Carl Crawford'),
('Tamara Fowler'),
('Marie Edwards'),
('James Klein'),
('Donald Coleman'),
('David Daniels'),
('Adam Miller'),
('Kristen Jones'),
('Angel Smith'),
('Ruth Williams'),
('Clarence Moran'),
('Carol Hill'),
('Frances Mitchell'),
('Mary Cortez'),
('Willie Murphy'),
('Martin Barker'),
('Harold Miller'),
('Joy Stewart'),
('Mark Allen'),
('Jason Bryant'),
('John Nelson'),
('Frank Anderson'),
('Duane Lewis'),
('Karen Cohen'),
('Denise Adams'),
('Betty Smith'),
('Johnny Wilson'),
('Chad Mitchell'),
('Patricia Robinson'),
('Clifford Glover'),
('Guy Ramirez'),
('Dwayne Martin'),
('Wesley Smith'),
('John Williamson'),
('Brandy Walker'),
('Gertrude Miller'),
('Eleanor Gutierrez'),
('James Allen'),
('Sergio Webb'),
('Olga King'),
('Dorothy Davis'),
('Patricia Neal'),
('Victor Adams'),
('Brian Williams'),
('George Schneider');

-- 3)	Создать таблицу salary
-- - id. Serial  primary key,
-- - monthly_salary. Int, not null
create table salary_3 (
id serial primary key,
monthly_salary int not null
)

select * from salary_3;

-- 4)	Наполнить таблицу salary 15 строками:
insert into salary_3(monthly_salary)
values (1000),
(1100),
(1200),
(1300),
(1400),
(1500),
(1600),
(1700),
(1800),
(1900),
(2000),
(2100),
(2200),
(2300),
(2400),
(2500);

-- 5)	Создать таблицу employee_salary
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique
-- - salary_id. Int, not null
create table employee_salary_3 (
id serial primary key,
employee_id Int unique not null,
salary_id Int not null
)

select * from employee_salary_3;

-- 6)	Наполнить таблицу employee_salary 40 строками:
-- - в 10 строк из 40 вставить несуществующие employee_id
insert into employee_salary_3(employee_id, salary_id)
values (3, 7),
(1,	4),
(5,	9),
(40, 13),
(23, 4),
(11, 2),
(52, 10),
(15, 13),
(26, 4),
(16, 1),
(33, 7),
(41,8),
(42,11),
(43,12),
(44,13),
(45,14),
(46,15),
(47,16),
(48,1),
(49,2),
(50,3),
(51,4),
(53,5),
(54,6),
(55,7),
(56,8),
(57,9),
(58,10),
(59,11),
(60,12),
(61,13),
(71,14),
(72,15),
(73,1),
(74,2),
(75,3),
(76,6),
(77,5),
(78,4),
(80,8); 

-- 7) Создать таблицу roles
-- - id. Serial  primary key,
-- - role_name. int, not null, unique

create table roles_3 (
id serial primary key,
role_name int unique not null
)

select * from roles_3;

-- 8)	Поменять тип столба role_name с int на varchar(30)
alter table roles_3 
alter column role_name type varchar(30);

-- 9)	Наполнить таблицу roles 20 строками:
insert into roles_3 (role_name)
values ('Junior Python developer'),
('Middle Python developer'),
('Senior Python developer'),
('Junior Java developer'),
('Middle Java developer'),
('Senior Java developer'),
('Junior JavaScript developer'),
('Middle JavaScript developer'),
('Senior JavaScript developer'),
('Junior Manual QA engineer'),
('Middle Manual QA engineer'),
('Senior Manual QA engineer'),
('Project Manager'),
('Designer'),
('HR'),
('CEO'),
('Sales manager'),
('Junior Automation QA engineer'),
('Middle Automation QA engineer'),
('Senior Automation QA engineer');

-- 10)	Создать таблицу roles_employee
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
-- - role_id. Int, not null (внешний ключ для таблицы roles, поле id)
create table roles_employee (
id serial primary key,
employee_id int unique not null
role_id int not null
FOREIGN KEY (employee_id)
references employees (id)
FOREIGN KEY (role_id)
references roles_3 (id)
)

select * from roles_employee;

-- 11)	Наполнить таблицу roles_employee 40 строками:
insert into roles_employee (employee_id, role_id)
values (7, 2),
(20, 4),
(3,	9),
(5,	13),
(23, 4),
(11, 2),
(10, 9),
(22, 13),
(21, 3),
(34, 4),
(6,	7),
(4, 8),
(8, 14),
(9, 15),
(12, 16),
(13, 17),
(14, 18),
(15, 19),
(16, 20),
(17, 1),
(18, 2),
(19, 3),
(24, 4),
(25, 5),
(26, 6),
(27, 7),
(28, 8),
(29, 9),
(30, 10),
(31, 11),
(32, 12),
(33, 13),
(35, 14),
(36, 15),
(37, 16),
(38, 17),
(39, 18),
(40, 19),
(41, 20),
(42, 1);