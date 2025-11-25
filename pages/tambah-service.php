<?php

$id = isset($_GET['edit']) ? $_GET['edit'] : '';
$selectService = mysqli_query($config, "SELECT name, price FROM services WHERE id = '$id'");
$service = mysqli_fetch_assoc($selectService);
// var_dump($service);

if (isset($_POST['save'])) {
    $name = $_POST['name'];
    $price = $_POST['price'];
    $Insert = mysqli_query($config, "INSERT INTO services (name, price) VALUES ('$name', '$price')");

    header("location:?page=service");
}

if (isset($_POST['update'])) {
    $name = $_POST['name'];
    $price = $_POST['price'];
    $update = mysqli_query($config, "UPDATE services SET name='$name', price='$price' WHERE id = $id");

    header('location:?page=service');
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
                    <h1><?= isset($_GET['edit']) ? 'Update' : 'Add' ?> Service</h1>
                </div>
                <div class="card-body">
                    <form action="" method="post">
                        <label for="" class="form-label">Service Name</label> <br>
                        <input type="text" class="form-control w-50" name="name"
                            value="<?php echo $service['name'] ?? '' ?>" required>
                        <label for="" class="form-label">Price</label> <br>
                        <input type="text" class="form-control w-50 mb-3" name="price"
                            value="<?php echo $service['price'] ?? '' ?>" required>
                        <button type="submit" class="btn btn-primary"
                            name="<?= isset($_GET['edit']) ? 'update' : 'save' ?>"><?= isset($_GET['edit']) ? 'edit' : 'create' ?></button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>

</html>