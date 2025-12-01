<?php
// Database configuration (Please adjust these settings as needed)
$HOST = "localhost";
$USER = "root";
$PASSWORD = "TKS12345678";
$DBNAME = "2entral";

// Create connection
$conn = new mysqli($HOST, $USER, $PASSWORD, $DBNAME);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}