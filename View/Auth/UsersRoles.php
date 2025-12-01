<?php
session_start();

// Access control: only allow logged-in users with Manager role
if (!isset($_SESSION['user'])) {
    header('Location: ../Public/AccessDenied.php');
    exit();
}

if ($_SESSION['user']['role'] !== "Manager") {
    header('Location: ../Public/AccessDenied.php');
    exit();
}
?>

<title>Users and Roles</title>