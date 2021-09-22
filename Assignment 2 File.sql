/* Part One */

USE elmasri_company;

/* Part 1a */
SELECT Fname, Minit, Lname FROM employee WHERE salary > 27000;

/* Part 1b */

SELECT Fname, Lname, Address FROM employee WHERE Ssn = ANY (SELECT Essn FROM dependent WHERE Relationship = "Son");


/*
b. List the first name, last name, and address of all employees who have a son as a dependent but do not have a daughter as a dependent.

c. List the full name (first name, middle initial, and last name) of each employee in a single column named “Employee”, 
	sorting the employees in alphabetical order by last name. If the employee has a supervisor, list the full name of the supervisor in a single column named “Supervisor”. 

d. List the name and total working hours for all projects based in Houston that have more than two employees working on them. e. List the SSN, first name, middle initial, 
	and last name of all employees who work in the department that has the employee with the highest salary among all employees. 

f. List the project name and the department that manages that project for all projects that have supervisors working on them for at least 20 hours. 

g. List the name of the department whose employees have the greatest total of dependents. 

h. List the location(s) of the department that worksthe fewest number of hours on projects. 
*/

 