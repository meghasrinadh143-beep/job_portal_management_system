create database job_portal ;
use job_portal;

create table candidates(candidate_id int Primary key, full_name varchar(100), phone varchar(15) UNIQUE, email varchar(100) UNIQUE, city varchar(50));
desc candidates;
create table employers(employer_id int primary key, company_name varchar(75), industry varchar(50));
desc employers;
create table jobs(job_id int primary key, employer_id int, title varchar(100), location varchar(75), 
salary decimal(10,2), foreign key(employer_id) references employers(employer_id));
desc jobs;
create table applications(application_id int Primary key, candidate_id int, job_id int, application_date date, status varchar(30), 
foreign key(candidate_id) references candidates(candidate_id), foreign key (job_id) references jobs(job_id));
desc applications;
create table interviews(interview_id int Primary key, application_id int, interview_date date, mode varchar(30), result varchar(30), 
foreign key (application_id) references applications(application_id));
desc interviews;
#Sample Data
#-- Candidates
INSERT INTO Candidates VALUES
(1,'Aarav','900000001','c1@mail.com','Hyderabad'),(2,'Bhavya','900000002','c2@mail.com','Vijayawada'),(3,'Charan','900000003','c3@mail.com','Vizag'),
(4,'Divya','900000004','c4@mail.com','Guntur'),(5,'Esha','900000005','c5@mail.com','Warangal'),(6,'Farhan','900000006','c6@mail.com','Nellore'),
(7,'Gopi','900000007','c7@mail.com','Kurnool'),(8,'Hari','900000008','c8@mail.com','Tirupati'),(9,'Isha','900000009','c9@mail.com','Chennai'),
(10,'John','900000010','c10@mail.com','Bengaluru');

select * from candidates;

#-- Employers
INSERT INTO Employers VALUES
(101,'TechNova','IT'),(102,'DataWave','Analytics'),(103,'CloudEdge','Cloud'),(104,'FinCore','Finance'),(105,'HealthSoft','Healthcare');

select * from employers;

#-- Jobs
INSERT INTO Jobs VALUES
(1001,101,'Python Developer','Hyderabad',650000),(1002,101,'SQL Developer','Hyderabad',550000),(1003,102,'Data Analyst','Vizag',600000),
(1004,103,'Cloud Engineer','Bengaluru',850000),(1005,104,'BI Developer','Chennai',700000),(1006,105,'ML Engineer','Hyderabad',950000);

select * from jobs;

#-- Applications
INSERT INTO Applications VALUES
(1,1,1001,'2026-07-01','Applied'),(2,2,1003,'2026-07-02','Shortlisted'),(3,3,1002,'2026-07-02','Rejected'),(4,4,1004,'2026-07-03','Interview'),
(5,5,1005,'2026-07-03','Selected'),(6,6,1006,'2026-07-04','Applied'),(7,7,1001,'2026-07-05','Interview'),(8,8,1002,'2026-07-06','Shortlisted'),
(9,9,1004,'2026-07-07','Applied'),(10,10,1006,'2026-07-08','Selected');

select * from applications;

#-- Interviews
INSERT INTO Interviews VALUES
(201,2,'2026-07-05','Online','Pending'),(202,4,'2026-07-06','Offline','Pending'),(203,5,'2026-07-07','Online','Selected'),
(204,7,'2026-07-08','Offline','Rejected'),(205,8,'2026-07-09','Online','Pending'),(206,10,'2026-07-10','Offline','Selected');

select * from interviews;

#yuvaraj part of query's 
#1. List all jobs.
select title from jobs;
select * from jobs;

#2.Show applications with candidate names.
select a.application_id, a.job_id , a.application_date, a.status, c.full_name from applications a join candidates c on a.candidate_id = c.candidate_id;

#3.Display employer names in uppercase/lowercase.
select company_name, upper(company_name) as upper_name, lower(company_name) as lower_name from employers;

#5	Show the first five characters of every company name.
select left(company_name, 5) as first_five from employers;

#6	Concatenate the candidate's name and city.
select concat(full_name, ' - ', city) as concatenate from candidates;

#7	Replace the word Engineer with Specialist in job titles.
select title, replace(title, 'Engineer', 'Specialist') as new_title from jobs;

#8	Find all jobs where the title contains the word Developer.
select * from jobs where title like '%developer%';

#9	Find jobs in Hyderabad.
select title, location from jobs where location = 'hyderabad';

#siddarth part of query's 
#10. Applications in last 7 days. 
select application_date from applications order by application_date desc limit 7;

#11. Count jobs company-wise. 
select e.company_name, count(job_id) as job_count from employers e join jobs j on e.employer_id=j.employer_id group by 1;

#12. Format application dates in the format: Mon-Jul-26 
select date_format(application_date, "%a-%b-%y") from applications ;

#13. Find candidates whose interviews are scheduled today. 
select c.full_name,a.application_date from candidates c join applications a on c.candidate_id=a.candidate_id
join interviews i on a.application_id=i.application_id where i.interview_date=curdate();

#14. Show the number of days since each application was submitted.
select application_id,datediff(curdate(),application_date) as no_of_days from applications;

#15. Display the highest and lowest salary offered. 
select max(salary)  as highest_salary, min(salary)  as lowest_salary from jobs;

#16. Calculate the total salary budget offered by each company.
select e.company_name,sum(j.salary) as salary_budget from employers e join jobs j on e.employer_id =j.employer_id group by 1;

#17. Count applications by status. 
select status, count(*) as application_counnt from applications group by status;

#18. Employer with most jobs. 
select e.company_name,count(j.job_id) as job_count from jobs j join employers e on e.employer_id =j.employer_id group by e.company_name order by  job_count desc limit 1 ;

#19. Candidate with most applications.
select c.full_name,count(a.application_id)  as most_application from applications a join candidates c on a.candidate_id = c.candidate_id group by 1 order by most_application limit 1;

#20. Selected candidates. 
select c.full_name, i.result from candidates c join applications a on  c.candidate_id = a.candidate_id join interviews i on i.application_id = a.application_id where i.result = "selected";




#21. Rejected applications. 
select * from applications where status = "rejected";

#22. Companies with more than one job  (need to check how to add job title)
select e.company_name,count(j.job_id) as job_count from employers e join jobs j on e.employer_id = j.employer_id group by e.company_name having count(j.job_id)>1 ;

#23. Show locations having more than two job openings. 
select location,count(job_id) as openeing from jobs group by location having count(job_id);

#24. Average salary by company.
select avg(j.salary) as avg_salary,e.company_name from jobs j join employers e on e.employer_id = j.employer_id group by 2;

#25. Top 5 latest jobs. 
select j.title,a.application_date from jobs j join applications a on j.job_id = a.job_id limit 5;

#26. Jobs in IT industry.
select j.title,e.industry from jobs j join employers e on j.employer_id = e.employer_id where e.industry = "it";

#27. Display candidate name, company name, and job title for every application. 
select c.full_name as candidate_name , e.company_name , j.title from candidates c 
join applications a on 	c.candidate_id = a.candidate_id 
join jobs j on j.job_id = a.job_id 
join employers e on e.employer_id = j.employer_id;

#28. Display interview details along with candidate and company information. 
select i.interview_id , i.application_id , i.interview_date , i.mode , i.result , c.full_name as candidate_name , e.company_name from interviews i 
join applications a on a.application_id = i.application_id 
join candidates c on c.candidate_id = a.candidate_id
join jobs j on a.job_id = j.job_id
join employers e on e.employer_id = j.employer_id ;

#29. Display company names with the total number of applications received.
select e.company_name , count(a.application_id) as total_application from employers e 
join jobs j on e.employer_id = j.employer_id
join applications a on a.job_id = j.job_id group by 1;

#30. Candidates without applications. 
select c.full_name as candidate_name, a.application_id from applications a left join candidates c on c.candidate_id = a.candidate_id
where a.application_id is null ;

#31.	Find candidates who applied for the highest-paying job.
select c.full_name, j.title, j.salary from candidates c join applications a on c.candidate_id = a.candidate_id join jobs j on j.job_id = a.job_id
where j.salary = (select max(salary) from jobs);
 
#33.	Display candidates who have never attended an interview.
select c.candidate_id, c.full_name from candidates c left join applications a on a.candidate_id = c.candidate_id left join interviews i on i.application_id = a.application_id
where i.interview_id is null;

#34.Create a view named Selected_Candidates showing selected candidates with company and job details. 
create view Selected_candidates as select c.candidate_id,c.full_name,e.company_name,j.title,j.location,j.salary from candidates c 
join applications a on c.candidate_id = a.candidate_id 
join jobs j on a.job_id = j.job_id 
join employers e on j.employer_id=e.employer_id
where a.status = "selected";

#35. Create a view to display all active job postings. 
create view active_jobs as select e.company_name,j.job_id,j.title,j.location,j.salary from jobs j join employers e on j.employer_id = e.employer_id;

#36. Retrieve data from the created views. 
select * from Selected_candidates;
select * from active_jobs;

select * from applications;

#stored procedures
#Create a stored procedure to display all jobs offered by a particular employer. 
# Input: employer_id  
# Display job title, location, and salary.

call job_details(101);

#38. Roll back a transaction after deleting an application accidentally. 
begin;
delete from applications where application_id = 1;
rollback;

#37. Start a transaction and update application status to Interview Scheduled. 
begin ;
update applications set status = "interview" where application_id = 6;
savepoint sp1;
rollback;
commit;
select * from applications