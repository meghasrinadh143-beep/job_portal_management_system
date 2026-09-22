
# Job Portal Management System - MySQL

A MySQL database project for managing candidates, employers, job postings, applications, and interviews.

## 📌 Project Overview

The Job Portal Management System is a relational database project designed to manage the complete lifecycle of recruitment. It stores candidate profiles, employer details, job postings, applications, and interview records.

The project also demonstrates practical SQL concepts including:

- SELECT queries
- INSERT, UPDATE, and DELETE operations
- String and date functions
- Aggregate functions
- GROUP BY and HAVING
- JOINs
- Subqueries
- Views
- Transactions

## 🎯 Problem Statement

Create a database to manage:

- Candidates
- Employers
- Jobs
- Applications
- Interviews

The expected outcome is to track applications, generate shortlists, and monitor interview results.

## 🗂️ Database Modules

The database contains five main modules:

1. Candidates
2. Employers
3. Jobs
4. Applications
5. Interviews

## 🏗️ Database Structure

### Candidates

Stores candidate information.

| Column | Description |
|--------|-------------|
| candidate_id | Primary key |
| full_name | Candidate name |
| phone | Phone number (UNIQUE) |
| email | Email address (UNIQUE) |
| city | Candidate city |

### Employers

Stores employer/company information.

| Column | Description |
|--------|-------------|
| employer_id | Primary key |
| company_name | Company name |
| industry | Industry type |

### Jobs

Stores job postings by employers.

| Column | Description |
|--------|-------------|
| job_id | Primary key |
| employer_id | Foreign key referencing Employers |
| title | Job title |
| location | Job location |
| salary | Salary offered |

### Applications

Connects candidates with jobs.

| Column | Description |
|--------|-------------|
| application_id | Primary key |
| candidate_id | Foreign key referencing Candidates |
| job_id | Foreign key referencing Jobs |
| application_date | Date of application |
| status | Applied / Shortlisted / Interview / Selected / Rejected |

### Interviews

Stores interview details for applications.

| Column | Description |
|--------|-------------|
| interview_id | Primary key |
| application_id | Foreign key referencing Applications |
| interview_date | Interview date |
| mode | Online / Offline |
| result | Pending / Selected / Rejected |

## 📊 Sample Data

The project includes sample data for:

- 10 Candidates
- 5 Employers
- 6 Jobs
- 10 Applications
- 6 Interviews

Sample jobs include Python Developer, SQL Developer, Data Analyst, Cloud Engineer, BI Developer, and ML Engineer.
Sample employers include TechNova (IT), DataWave (Analytics), CloudEdge (Cloud), FinCore (Finance), HealthSoft (Healthcare).

## 🔍 SQL Concepts Covered

The project contains 40 SQL tasks covering different levels of database querying.

### Basic Queries

- List all jobs
- Show applications with candidate names
- Find jobs in Hyderabad
- Applications in last 7 days

### String Functions

- Convert employer names to uppercase/lowercase
- Extract first five characters of company names
- Concatenate candidate name and city
- Replace Engineer with Specialist in job titles
- Find jobs where title contains Developer

### Date Functions

- Format application dates as Mon-Jul-26
- Find interviews scheduled today
- Calculate days since application submitted

### Aggregate Functions

- Find highest and lowest salary
- Total salary budget per company
- Count applications by status
- Average salary by company
- Count jobs company-wise

### GROUP BY and HAVING

- Companies with more than one job
- Locations having more than two job openings
- Employer with most jobs
- Candidate with most applications

### JOINs

The project demonstrates relationships between:

- Candidates and Jobs via Applications
- Employers and Jobs
- Applications and Interviews
- Candidates, Companies, and Job titles

It also includes LEFT JOIN scenarios to display candidates even when they do not have applications.

### Subqueries

Examples include:

- Candidates who applied for the highest-paying job
- Candidates who have never attended an interview
- Selected / Rejected applications filtering

### Views

Two views are required:

- Selected_Candidates – selected candidates with company and job details
- Active_Job_Postings – all active job postings

### Transactions

The project demonstrates:

- START TRANSACTION
- Updating application status to Interview Scheduled
- COMMIT
- ROLLBACK after accidental delete

## 🛠️ Technologies Used

- MySQL
- SQL
- Relational Database Concepts
- Views
- Transactions
