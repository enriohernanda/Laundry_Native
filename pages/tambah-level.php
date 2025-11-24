<?php

$id = isset($_GET['edit']) ? $_GET['edit'] : '';
$selectLevel = mysqli_query($config, "SELECT name FROM levels WHERE id = '$id'");
$level = mysqli_fetch_assoc($selectLevel);
// var_dump($level);

if (isset($_POST['save'])) {
    $name = $_POST['name'];
    $Insert = mysqli_query($config, "INSERT INTO levels (name) VALUES ('$name')");

    header("location:?page=level");
}

if (isset($_POST['update'])) {
    $name = $_POST['name'];
    $update = mysqli_query($config, "UPDATE levels SET name='$name' WHERE id = $id");

    header('location:?page=level');
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-header">
                    <h1><?= isset($_GET['edit']) ? 'Update' : 'Add' ?> level</h1>
                </div>
                <div class="card-body">
                    <form action="" method="post">
                        <label for="" class="form-label">Level Name</label> <br>
                        <input type="text" class="form-control w-50" name="name"
                            value="<?php echo $level['name'] ?? '' ?>" required>
                        <br><br>
                        <button type="submit" class="btn btn-primary"
                            name="<?= isset($_GET['edit']) ? 'update' : 'save' ?>"><?= isset($_GET['edit']) ? 'edit' : 'create' ?></button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>

</html>