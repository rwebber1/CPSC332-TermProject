<html>

<style>
body{
height: 100%;
background-image: url("csuf.jpg");
background-size: cover;
background-repeat: no-repeat;
text-align:center;
}
div.queries{
background-color: lightblue;
padding: 10px 10px 10px 10px;
text-align:right;
border: 4px black solid;
border-radius: 10px;
display:inline-block;
line-height:30px;
font-size: 130%;
}
h1{
color: white;
font-size:250%;
background-color:black;
display:inline-block;
border-radius:20px;
width:60%;
padding:10px 10px 10px 10px;
}
h2{
background-color: lightgray;
border: 3px black solid;
font-size: 200%;
text-align:center;
display:inline;
width:40%;
border-radius: 20px;
padding: 10px 10px 10px 10px;
margin-bottom:100px;
}
input[type=text]{
padding:5px;
}
input[type=submit]{
margin-top: 8px;
width: 100px;
height: 30px;
background-color: gray;
color: white;
border-style: outset;
border-color:black;
font: bold 15px arial,sans-serif;
text-shadow: none;
}
input[type=submit]:hover{
border-color:white;
}
table{
background-color: lightblue;
border-collapse: collapse;
width: 50%;
}
td{
border:1px black solid;
text-align:center;
}
th{
background-color:gray;
border:1px black solid;
height: 30px;
text-align: center;
}
tr:hover{
background-color:lightgray;
}
</style>

<body>
<h1>University Database</h1>
<br><br><br>

<h2>Professor Section</h2>
<br><br>
<form action="p_ssn_query.php" method="POST">
<div class="queries">
Enter Professor's SSN: <input type= "text" name="p_ssn">
<br>
<input type ="submit" value = "Submit">
</div>
<br><br>
</form>

<form action="grades_query.php" method ="POST">
<div class="queries">
Enter Course Number: <input type = "text" name = "p_course">
<br>
Enter Section Number: <input type ="text" name = "section">
<br>
<input type ="submit" value = "Submit">
</div>
<br><br>
</form>

<h2>Student Section</h2>
<br><br>
<form action ="sections_query.php" method ="POST">
<div class="queries">
Enter Course Number: <input type = "text" name = "s_course">
<br>
<input type = "submit" value = "Submit">
</div>
<br><br>
</form>

<form action="student_cwid_query.php" method="POST">
<div class="queries">
Enter Student CWID: <input type = "text" name = "cwid">
<br>
<input type = "submit" value = "Submit">
</div>
</form>
<br><br>

<?php

$CWID = $_POST["cwid"];
$dbServer = "mariadb";
$dbUser = "cs332f40";
$dbPass = "iuw1Guud";

$conn = new mysqli($dbServer, $dbUser, $dbPass, $dbUser);

if($conn->connect_error){
        die("Connection failed: " . $conn->connect_error);
}

$query4 = "SELECT enrolled_course, grade FROM Enrollment WHERE enrolled_cwid = $CWID;";
$result = $conn->query($query4);

if($result->num_rows > 0){

	echo '<table border="0" align="center" cellspacing="2" cellpadding="2">
        <tr>
          <th> <font face="Arial">Class</font> </td>
          <th> <font face="Arial">Grade</font> </td>
        </tr>';

        while($row = $result->fetch_assoc()){

		echo '<tr>
                  <td>'.$row["enrolled_course"].'</td>
                  <td>'.$row["grade"].'</td>
                </tr>';

        }

}else{
        echo "0 results";
}

?>
</body>
</html>



