<?php
session_start();

$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);

switch ($uri) {
    case '/auth/googleLogin':
        require 'Controller/PublicController.php';
        $controller = new PublicController();
        $controller->googleLogin();
        exit();

   case '/auth/callback':
        require 'Controller/PublicController.php';
        $controller = new PublicController();
        $controller->callback();
        exit();
}
?>  

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="Assets/Icon/2ENTRALIcon.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <title>2ENTRAL</title>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            height: 100vh;
            margin: 0;
            background: linear-gradient(to bottom right, #F8FBFD, #4BA3C3);
        }

        section {
            background: #F8FBFD;
            box-shadow: 8px 8px 10px rgba(0, 0, 0, 0.5);
            padding: 40px;
            padding-top: 20px;
            border-radius: 15px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: space-evenly;
            gap: 30px;
            width: 60%;
            max-width: 650px;
            height: 50%;
        }

        span {
            color: #1E2A35;
            text-align: center;
        }

        .shadow-image-wrapper {
            display: inline-block;
            position: relative;
        }

        .shadow-image-wrapper img {
            display: block;
            width: 180px;
            height: 180px;
            animation: float 3s ease-in-out infinite;
        }

        .shadow-image-wrapper::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            width: 50%;
            transform: translateX(-50%);
            height: 8px;
            background: #a0a0a033;
            border-radius: 100%;
            z-index: 999;
        }

        .gsi-material-button {
            background: #F8FBFD;
            border: 2px solid #afafafff;
            border-radius: 25px;
            padding: 10px 30px;
            transition: box-shadow 0.2s ease;
        }

        .gsi-material-button-content-wrapper {
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 16px;
            font-family:Arial, Helvetica, sans-serif;
            gap: 5px;
        }

        .gsi-material-button svg {
            width: 20px;
            height: 20px;
            margin-right: 10px;
        }

        .gsi-material-button:hover {
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.2);
            cursor: pointer;
        }

        .gsi-material-button-contents {
            color: #000000;
        }

        @keyframes float {
            0%   { transform: translateY(0px); }
            50%  { transform: translateY(-6px); }
            100% { transform: translateY(0px); }
        }
    </style>
</head>
<body>
    <section>
        <div class="shadow-image-wrapper">
            <img src="Assets/Icon/2ENTRAL-1.png">
        </div>
        <span>Access restricted to <b>2ENTRAL</b> staff members only.</span>
        <button type="button" class="gsi-material-button" onclick="window.location.href='/auth/googleLogin'">
            <div class="gsi-material-button-content-wrapper">
                <div class="gsi-material-button-icon">
                    <svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" xmlns:xlink="http://www.w3.org/1999/xlink" style="display: block;">
                        <path fill="#EA4335" d="M24 9.5c3.54 0 6.71 1.22 9.21 3.6l6.85-6.85C35.9 2.38 30.47 0 24 0 14.62 0 6.51 5.38 2.56 13.22l7.98 6.19C12.43 13.72 17.74 9.5 24 9.5z"></path>
                        <path fill="#4285F4" d="M46.98 24.55c0-1.57-.15-3.09-.38-4.55H24v9.02h12.94c-.58 2.96-2.26 5.48-4.78 7.18l7.73 6c4.51-4.18 7.09-10.36 7.09-17.65z"></path>
                        <path fill="#FBBC05" d="M10.53 28.59c-.48-1.45-.76-2.99-.76-4.59s.27-3.14.76-4.59l-7.98-6.19C.92 16.46 0 20.12 0 24c0 3.88.92 7.54 2.56 10.78l7.97-6.19z"></path>
                        <path fill="#34A853" d="M24 48c6.48 0 11.93-2.13 15.89-5.81l-7.73-6c-2.15 1.45-4.92 2.3-8.16 2.3-6.26 0-11.57-4.22-13.47-9.91l-7.98 6.19C6.51 42.62 14.62 48 24 48z"></path>
                        <path fill="none" d="M0 0h48v48H0z"></path>
                    </svg>
                </div>
                <span class="gsi-material-button-contents">Sign in with Google</span>
            </div>
        </button>
    </section>
</body>
</html>