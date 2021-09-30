/* Part One */

USE elmasri_company;

/* Part 1a */
SELECT Fname, Minit, Lname FROM employee WHERE salary > 27000;

/* Part 1b */
SELECT Fname, Lname, Address FROM employee WHERE Ssn = ANY (SELECT Essn FROM dependent WHERE Relationship = "Son");

/* Part 1c */
SELECT concat(e.Fname, ' ', e.Minit, '. ', e.Lname) AS Employee,
	IFNULL(concat(m.Fname, ' ', m.Minit, '. ', m.Lname), 'Top Supervisor') AS Supervisor
    FROM employee e
    LEFT JOIN employee m ON
    m.Ssn = e.Super_ssn
    ORDER BY e.Lname;
    
/* Part 1d */
SELECT DISTINCT pname, sum(hours) FROM project p 
	RIGHT JOIN works_on w 
    ON p.pnumber = w.pno 
    GROUP BY pname;

/*
d. List the name and total working hours for all projects based in Houston that have more than two employees working on them. 

e. List the SSN, first name, middle initial, and last name of all employees who work in the department that has the employee with 
	the highest salary among all employees. 

f. List the project name and the department that manages that project for all projects that have supervisors working on them for at least 20 hours. 

g. List the name of the department whose employees have the greatest total of dependents. 

h. List the location(s) of the department that worksthe fewest number of hours on projects. 
*/

 