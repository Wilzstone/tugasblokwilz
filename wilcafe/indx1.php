<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Coffee Wilz | Login</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fontawesome/css/all.css">
</head>

<body class="bg-dark">
    <div class="info-data" data-infodata="<?php if (isset($_SESSION['info'])) {
                                                echo $_SESSION['info'];
                                            }
                                            unset($_SESSION['info']); ?>"></div>
    <div class="container">
        <div class="row justify-content-center mt-5">
            <div class="col-lg-5">
                <div class="card o-hidden border-1 my-5">
                    <div class="card-body p-0">
                        <div class="row">
                            <div class="col-lg">
                                <div class="p-5">
                                    <div class="text-center mb-4">
                                        <h4>Welcome to MyApp</h4>
                                    </div>
                                    <form action="proses.php" method="post">
                                        <div class="input-group mb-3">

                                            <span class="input-group-text" id="basic-addon1"><i class="fas fa-user"></i></span>
                                            <input type="text" name="username" class="form-control form-control-sm" placeholder="Username" autofocus autocomplete="off" required>
                                        </div>
                                        <div class="input-group mb-3">

                                            <span class="input-group-text" id="basic-addon1"><i class="fas fa-lock"></i></span>

                                            <input type="password" name="password" class="form-control form-control-sm" placeholder="Password" autocomplete="off" required>
                                        </div>
                                        <div class="input-group mb-3">
                                            <button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-lock"><i>LOGIN</i></button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
                                        </div>
</body>

</html>