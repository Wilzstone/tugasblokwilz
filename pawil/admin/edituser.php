<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Edit Data User Login</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
</head>

<body>
    <div class="container">
        <div class="row mt-3">
            <div class="col-4">
                <h3>Edit Data User Login</h3>
                <?php
                include 'koneksi.php';
                $panggil = $koneksi->query("SELECT * FROM user where id='$_GET[edituser]'");
                ?>
                <?php
                while ($row = $panggil->fetch_assoc()) {
                ?>
                    <form action="koneksi.php" method="POST">
                        <div class="form-group">
                            <label for="id">ID</label>

                            <input type="text" class="form-control mb-3" name="id" value="<?= $row['id'] ?>" readonly>

                        </div>

                        <div class="form-group">
                            <label for="username">Username</label>

                            <input type="text" class="form-control mb-3" name="username" value="<?= $row['username'] ?>">

                        </div>
                        <div class="form-group mt-3">
                            <label for="password">Password</label>

                            <input type="text" class="form-control mb-3" name="password" value="<?= $row['password'] ?>">
                        </div>

                        <div class="form-group mt-3">
                            <div class="form-group">

                                <label for="level">Level</label>
                                <div class="form-check">

                                    <input type="radio" class="form-check-input" name="level" value="manager" <?php if (($row['level']) === "manager") {
                                                                                                                    echo "checked";
                                                                                                                } ?>> Manager
                                </div>

                                <div class="form-check">

                                    <input type="radio" class="form-check-input" name="level" value="admin" <?php if (($row['level']) === "admin") {
                                                                                                                    echo "checked";
                                                                                                                } ?>> Admin
                                </div>
                                <div class="form-check">

                                    <input type="radio" class="form-check-input" name="level" value="user" <?php if (($row['level']) === "user") {
                                                                                                                    echo "user";
                                                                                                                } ?>> User
                                </div>



                                <input type="submit" name="edituser" value="Edit" class="form-control btn btn-primary">
                            </div>
                        </div>
                    </form>
                <?php } ?>
            </div>
        </div>
    </div>
</body>

</html>