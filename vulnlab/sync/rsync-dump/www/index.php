<?php
session_start();
$secure = "6c4972f3717a5e881e282ad3105de01e";

if (isset($_SESSION['username'])) {
    header('Location: dashboard.php');
    exit();
}

if (isset($_POST['username']) && isset($_POST['password'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $hash = md5("$secure|$username|$password");
    $db = new SQLite3('../db/site.db');
    $result = $db->query("SELECT * FROM users WHERE username = '$username' AND password= '$hash'");
    $row = $result->fetchArray(SQLITE3_ASSOC);
    if ($row) {
        $_SESSION['username'] = $row['username'];
        header('Location: dashboard.php');
        exit();
    } else {
        $error_message = 'Invalid username or password.';
    }
}

?>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">
        <h1 class="mt-5">Login</h1>
        <?php if (isset($error_message)) { ?>
            <div class="alert alert-danger mt-3" role="alert">
                <?php echo $error_message; ?>
            </div>
        <?php } ?>
        <form class="mt-3" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">Username:</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password:</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary">Login</button>
        </form>
    </div>
</body>
</html>
