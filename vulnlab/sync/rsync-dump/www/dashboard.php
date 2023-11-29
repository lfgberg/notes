<?php
session_start();

if (!isset($_SESSION['username'])) {
    header('Location: index.php');
    exit();
}

$load = sys_getloadavg();

?>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">
        <h1 class="mt-5">Dashboard</h1>
        <p class="mt-3">Welcome, <?php echo $_SESSION['username']; ?>!</p>
        <h2 class="mt-5">System Information</h2>
        <div class="row mt-3">
            <div class="col-sm-4">
                <p>CPU load:</p>
                <p>1 minute load average:</p>
                <p>5 minute load average:</p>
            </div>
            <div class="col-sm-8">
                <p><?php echo $load[0]; ?></p>
                <p><?php echo $load[1]; ?></p>
                <p><?php echo $load[2]; ?></p>
            </div>
        </div>
        <form class="mt-5" method="post" action="logout.php">
            <button type="submit" class="btn btn-primary">Logout</button>
        </form>
    </div>
</body>
</html>

