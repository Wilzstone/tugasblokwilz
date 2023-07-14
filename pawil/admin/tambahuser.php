<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Tambah Data User Login</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
</head>

<body>
    <div class="container">
        <div class="row mt-3">
            <div class="col-4">
                <h3>Tambah Data User Login</h3>
                <form action="koneksi.php" method="POST">
                    <div class="form-group">
                        <label for="id">ID</label>

                        <input type="text" class="form-control mb-3" name="id" placeholder="ID">

                    </div>
                    <div class="form-group">
                        <label for="username">Username</label>

                        <input type="text" class="form-control mb-3" name="username" placeholder="Username">

                    </div>
                    <div class="form-group">
                    <label for="password">Password</label>

                    <input type="text" class="form-control mb-3" name="password" placeholder="Password">
            </div>

            <div class="form-group mt-3">
                <div class="form-group">
                    <label for="level">Level</label>
                    <div class="form-check">

                        <input type="radio" class="form-check-input" name="level" value="manager"> Manager

                    </div>

                    <div class="form-check">

                        <input type="radio" class="form-check-input" name="level" value="admin"> Admin

                    </div>
                    <div class="form-check">

                        <input type="radio" class="form-check-input" name="level" value="user"> User

                    </div>
                    <div class="form-group mt-3">
                        <input type="submit" name="simpanuser" value="Simpan" class="form-control btn btn-primary">
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
</body>

</html>