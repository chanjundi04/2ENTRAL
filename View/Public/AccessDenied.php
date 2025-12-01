<?php
session_start();
$email = $_SESSION['user']['email'] ?? '';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="/Assets/Icon/2ENTRALIcon.png">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <title>Access Denied...</title>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            height: 100vh;
            margin: auto;
            background: #F8FBFD;
        }

        section {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 15px;
        }

        .block-icon {
            font-size: 150px;
            color: #E53935;
        }

        h1 {
            color: #1E2A35;
            margin: 5px;
            margin-bottom: 40px;
            font-size: 36px;
        }

        span {
            color: #5F7383;
            font-size: 16px;
            text-align: center;
        }
    </style>
</head>
<body>
    <section>
        <span class="material-icons block-icon">block</span> 
        <h1>Access Denied</h1>
        <span>You do not have permission to access this page.</span>
        <span>Redirecting to login page in <b><span id="countdown"></span></b>...</span>
    </section>
    
    
    <script>
        let countdownTime = 5;

        function updateCountdown() {
            if (countdownTime <= 0) {
                clearInterval(countdownInterval);
                window.location.href = "/index.php";
            } else {
                document.getElementById("countdown").innerText = countdownTime + " Second(s)";
                countdownTime--;
            }
        }
        updateCountdown();
        const countdownInterval = setInterval(updateCountdown, 1000);
    </script>
</body>
</html>