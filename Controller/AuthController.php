<?php
$controller = new AuthController();

if (isset($_GET['action'])) {
    $action = $_GET['action'];

    if (is_string($action) && method_exists($controller, $action)){
        $controller->$action();
    }
}

class AuthController {
    public function logout() {
        if (session_status() == PHP_SESSION_NONE) {
            session_start();
        }

        session_unset();
        session_destroy();

        header("Location: /index.php");
        exit();
    }
}