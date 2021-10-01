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
SELECT DISTINCT pname, sum(hours) AS Hours FROM project p 
	RIGHT JOIN works_on w 
    ON p.pnumber = w.pno 
    GROUP BY pname;
    
/* Part 1e */
SELECT ssn, fname, minit, lname FROM employee 
	WHERE dno = (SELECT dno FROM employee 
				WHERE salary = (SELECT max(salary) FROM employee)
                );

/* Part 1f INCOMPLETE*/
SELECT pname, dname FROM project p INNER JOIN department d ON p.dnum = d.dnumber AND d.mgr_ssn = ANY ((SELECT essn FROM works_on GROUP BY essn HAVING hours >=20));
SELECT mgr_ssn, sum(w.hours) FROM department d LEFT JOIN works_on w ON d.mgr_ssn = w.essn GROUP BY mgr_ssn HAVING sum(w.hours) > 20;

SELECT essn FROM works_on GROUP BY essn HAVING sum(hours) >20;
SELECT pname, pnumber, dname, dnum FROM project p JOIN department d ON p.dnum = d.dnumber AND d.mgr_ssn = ANY (SELECT pno FROM works_on GROUP BY pno HAVING hours >= 20);
SELECT essn, hours FROM works_on Group by essn having hours >= 20;

/* Part 1g */
SELECT dname FROM department LEFT JOIN employee ON ;
SELECT fname, dno, dependent_name FROM employee LEFT JOIN dependent ON ;

/* Part 1h */
SELECT plocation FROM project WHERE department.dnumber = (SELECT min(SELECT hours FROM works_on GROUP BY essn ) FROM works_on);
SELECT * FROM department JOIN works_on JOIN project;
SELECT * FROM works_on WHERE hours IN (SELECT pno, hours from works_on GROUP BY pno) ;

/*
f. List the project name and the department that manages that project for all projects that have supervisors working on them for at least 20 hours. 

g. List the name of the department whose employees have the greatest total of dependents. 

h. List the location(s) of the department that worksthe fewest number of hours on projects. 
*/

 