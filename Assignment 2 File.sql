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

/* Part 1f */
SELECT pname, dname 
	FROM project JOIN department 
    ON project.dnum = department.dnumber 
    AND 
    project.pnumber = ANY 
		(SELECT Temp.pno 
			FROM (SELECT pno, sum(hours) 
				FROM works_on JOIN department 
                ON department.mgr_ssn = works_on.essn 
                GROUP BY pno HAVING sum(hours) >= 20)
			AS Temp);

/* Part 1g */
SELECT dname FROM department 
	WHERE dnumber = (SELECT temp.dno 
					FROM (SELECT essn, dno, count(*) AS amount 
							FROM employee 
                            JOIN dependent 
                            ON employee.ssn = dependent.essn 
                            GROUP BY dno) 
					AS Temp 
                    WHERE temp.amount = (SELECT max(temp.amount) 
											FROM (SELECT essn, dno, count(*) AS amount 
												FROM employee 
                                                JOIN dependent 
                                                ON employee.ssn = dependent.essn 
                                                GROUP BY dno)
											AS Temp
										)
					);

/* Part 1h */
SELECT dlocation FROM dept_locations 
	WHERE dnumber = 
		(SELECT dnum FROM project 
        WHERE pnumber = 
			(SELECT temp2.pno 
            FROM (SELECT temp1.pno, min(temp1.amount) 
				FROM (SELECT pno, sum(hours) AS amount FROM works_on 
                GROUP BY pno)
				AS temp1) 
			AS temp2)
		);
        
/* Part Two */

USE premiere_products;

/* Part 2a */
CREATE TABLE WarehouseDetail
(
	WarehouseNum INT NOT NULL,
    Location VARCHAR(255),
    
    PRIMARY KEY(WarehouseNum)
);

/* Part 2b */
INSERT INTO WarehouseDetail VALUES (1, 'New Haven, CT');
INSERT INTO WarehouseDetail VALUES(2, 'Boston, MA');
INSERT INTO WarehouseDetail VALUES(3, 'White Plains, NY');

/* Part 2c */
ALTER TABLE Part
ADD FOREIGN KEY (Warehouse) REFERENCES WarehouseDetail(WarehouseNum);

/* Part 2d */
CREATE TABLE PartInWarehouse
(
	MyPartNum2 char(4) NOT NULL,
    MyWarehouseNum2 INT,
    
    PRIMARY KEY (MyPartNum2),
    FOREIGN KEY (MyPartNum2) REFERENCES Part(PartNum),
    FOREIGN KEY (MyWarehouseNum2) REFERENCES WarehouseDetail(WarehouseNum)
);

/* Part 2e */
INSERT INTO PartInWarehouse VALUES ('FD21', 3);
INSERT INTO PartInWarehouse VALUES ('KV29', 2);
INSERT INTO PartInWarehouse VALUES ('AT94', 3);

/* Part 2f */
INSERT INTO PartInWarehouse VALUES('KV29', 1);

/* Part 2g */
INSERT INTO PartInWarehouse VALUES('DW11', 5);

/*
g. Show how the foreign key constraint is being correctly enforced in the PartInWarehouse table by trying to add the following record to that table: 
	i. MyPartNum2 = DW11, MyWarehouseNum = 5 
    
h. Use the Export Data function in MySQL Workbench to export a self-contained dump file (.sql file) of your database. 
	Please name your dump file as follows: [your UNH username]_HW1Q4.sql. For example, a student with the UNH username jsmith2 would name the file jsmith2_HW1Q4.sql. 
*/

 