CREATE TABLE employees (
  emp_no int,
  birth_date date,
  first_name varchar(100),
  last_name varchar(100),
  gender varchar(100),
  hire_date date,
  PRIMARY KEY (emp_no)
);

CREATE TABLE departments (
  dept_no varchar(100),
  dept_name varchar(100),
  PRIMARY KEY (dept_no)
);

CREATE TABLE dept_emp (
  emp_no int,
  dept_no varchar(100) ,
  from_date date,
  to_date date,
  Foreign KEY (emp_no) references employees (emp_no),
  Foreign KEY (dept_no) references departments (dept_no),
  PRIMARY KEY (emp_no,dept_no)
);

--CREATE INDEX PK FK ON  dept_emp (emp_no, dept_no);

CREATE TABLE dept_manager (
  dept_no varchar(100),
  emp_no int,
  from_date date,
  to_date date,
  Foreign KEY (emp_no) references employees (emp_no),
  Foreign KEY (dept_no) references departments (dept_no),
  PRIMARY KEY (emp_no,dept_no)
);

--CREATE INDEX PK FK ON  dept_manager (emp_no, dept_no);

CREATE TABLE salaries (
  emp_no int,
  salary int,
  from_date date,
  to_date date,
  Foreign KEY (emp_no) references employees (emp_no),
  PRIMARY KEY (emp_no,from_date)
);

--CREATE INDEX PK FK ON  salaries (emp_no);

CREATE TABLE titles (
  emp_no int,
  title varchar(100),
  from_date date,
  to_date date,
  Foreign KEY (emp_no) references employees (emp_no),
  PRIMARY KEY (emp_no, title, from_date)
);

--CREATE INDEX PK FK ON  titles (emp_no);

select  emp.emp_no, last_name, first_name, gender, salary
	from employees emp left join salaries s 
	on emp.emp_no=s.emp_no;

select emp_no,first_name,last_name from employees
	where hire_date between '1986-01-01' and '1986-12-31';

select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
	from dept_manager dm inner join departments d
	on dm.dept_no = d.dept_no
	inner join employees e
	on dm.emp_no = e.emp_no;

select e.emp_no, last_name, first_name, dept_name
	from employees e inner join dept_emp de
	on e.emp_no = de.emp_no
	inner join departments d
	on de.dept_no = d.dept_no
	order by dept_name;

select emp_no, first_name, last_name
	from employees
	where first_name = 'Hercules'and last_name like 'B%';

select e.emp_no, last_name, first_name, dept_name
	from employees e inner join dept_emp de
	on e.emp_no = de.emp_no
	inner join departments d
	on de.dept_no = d.dept_no
	where dept_name = 'Sales';
	
select e.emp_no, last_name, first_name, dept_name
	from employees e inner join dept_emp de
	on e.emp_no = de.emp_no
	inner join departments d
	on de.dept_no = d.dept_no
	where dept_name = 'Sales' or dept_name = 'Development'
	order by dept_name;
	
select count(*), last_name from employees
	group by last_name 
	order by last_name desc;
	
select * from employees where emp_no = 499942;

	