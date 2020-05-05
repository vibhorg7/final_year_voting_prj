



<?php
$servername = "localhost";
$username=$_POST['uname'];
$password=$_POST['pass'];

$dbname = "login";

// Create connection
$conn = new mysqli($servername, "root", "", $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "select * from user where username='$username' and password='$password'";
$result = $conn->query($sql);

$row=$result->fetch_assoc();

if($row['username']==$username && $row['password']==$password){
header("Location:/election/index.html");
}
else{
echo "failed to login";
}

$conn->close();
?>
