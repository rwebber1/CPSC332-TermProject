# CPSC332-TermProject
*Final Project for Databases and File Systems course at CSUF
Project Description: MySQL database website application using PHP*
#### Tools Used:
* PuTTY
* PHP
* MySQL
* HTML/CSS

## Queries:
Several areas for user input are setup on website application. Each is connected to a PHP file to query the database automatically when user input is entered. Screenshots of example inputs can be found in 'Screenshots' folder.
#### Professor Queries:
* Enter Professor SSN       -> List Courses he/her teaches
* Enter Course and Section  -> List Students and Grades
#### Student Queries
* Enter Course              -> List Section Details
* Enter Student ID          -> List Enrolled Courses

______________________________________________________________________________________________________________________
## Website URL:
http://ecs.fullerton.edu/~cs332f40/

______________________________________________________________________________________________________________________
### MySQL Server:
Server is hosted through CSUF
To Access: Enter ssh cs332t32@shell.ecs.fullerton.edu into terminal (PuTTY was used in this project) 
  * Login: cs332f40
  * Password: iuw1Guud
  
To Enter Database (Mariadb): Enter mysql -h mariadb -u cs332t32 -p

(Will be prompted for password, same as shell password)
  
______________________________________________________________________________________________________________________
### Homepage:
Website hosted through CSUF and can be found through URL above
![Homepage](https://github.com/rwebber1/CPSC332-TermProject/blob/main/Screenshots/homepage.jpeg?raw=true)
#### Professor Query Example:
*Input entered: 123456789*
![examplequery](https://github.com/rwebber1/CPSC332-TermProject/blob/main/Screenshots/p_ssn_query_result.jpeg?raw=true)
