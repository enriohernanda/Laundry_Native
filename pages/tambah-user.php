<?php
//isset: tidak kosong
$id = isset($_GET['edit']) ? $_GET['edit'] : '';
$queryEdit = mysqli_query($config, "SELECT * FROM users WHERE id='$id'");
$rowEdit = mysqli_fetch_assoc($queryEdit);

if (isset($_POST['update'])) {
    //$_POST ambil simbol inputan
    $name = $_POST['name'];
    $email = $_POST['email'];
    $password = sha1($_POST['password']);

    if ($password) {
        $query = mysqli_query($config, "UPDATE users SET name='$name', email='$email', password='$password' WHERE id='$id'");
    } else {
        $query = mysqli_query($config, "UPDATE users SET name='$name', email='$email' WHERE id='$id'");
    }
    if ($query) {
        header("location:?page=user&ubah=berhasil");
    }
}

if (isset($_POST["save"])) {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $password = sha1($_POST['password']);

    $query = mysqli_query($config, "INSERT INTO users (name, email, password) VALUES('$name', '$email', '$password')");

    if ($query) {
        header("location:?page=user&tambah=berhasil");
    }
}

?>

<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-body">
                <h3 class="card-title">
                    <?php echo isset($_GET['edit']) ? 'Edit' : "Add" ?> User
                </h3>
                <form action="" method="post">
                    <div class="mb-3">
                        <label for="" class="form-label fw-bold">Name</label>
                        <input class="form-control" type="text" name="name" placeholder="Enter Your Name" required
                            value="<?php echo $rowEdit['name'] ?? '' ?>">
                    </div>
                    <div class="mb-3">
                        <label for="" class="form-label fw-bold">Email</label>
                        <input class="form-control" type="email" name="email" class="" placeholder="Enter Your Email"
                            required value="<?php echo $rowEdit['email'] ?? '' ?>">
                    </div>
                    <div class="mb-3">
                        <label for="" class="form-label fw-bold">Password * <small>Leave blank if you don't want to
                                change</small></label>
                        <input class="form-control" type="password" name="password" placeholder="Enter Your Password">
                    </div>
                    <div class="mb-3">
                        <button class="btn btn-primary" type="submit" name="<?php echo ($id) ? 'update' : 'save' ?>">
                            <?php echo ($id) ? "Save Changes" : "Save" ?>
                        </button>
                        <a href="?page=user" class="btn btn-secondary">Back</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>