<?php 
session_start();

if (!isset($_SESSION['user'])) {
    header('Location: /View/Public/AccessDenied.php');
    exit();
}
else {
    $CURRENT_NAME = $_SESSION['user']['name'] ?? '';
}
?>

<title><?php echo $CURRENT_NAME ?></title>