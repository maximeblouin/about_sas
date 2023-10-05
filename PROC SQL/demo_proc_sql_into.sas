/**
*
* \brief SAS program demonstrating the use of the INTO keyword in PROC SQL.
*
* This SAS program illustrates two use cases of the INTO keyword in PROC SQL.
* - Use Case 1: Select into single macro variable
* - Use Case 2: Select into two different macro variable
*
* \author Maxime Blouin
* \date 2023-10-05
*/

data Employee;
    input EmployeeID FirstName $ LastName $ Salary;
    datalines;
1 John Smith 50000
2 Jane Doe 60000
3 Bob Johnson 55000
4 Alice Brown 62000
5 Michael Davis 58000
;
run;

%let avg_salary = ;

/* Use Case 1: Select into single macro variable */
proc sql;
    select avg(Salary) into :avg_salary from Employee;
quit;

%put Average Salary: &avg_salary;

/* Use Case 2: Select into two different macro variable */

%let max_salary = ;
%let min_salary = ;
proc sql;
    select max(Salary), min(Salary) into :max_salary, :min_salary from Employee;
quit;

%put Maximum Salary: &max_salary;
%put Minimum Salary: &min_salary;
