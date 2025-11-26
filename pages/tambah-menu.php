<?php
$id = isset($_GET['edit']) ? $_GET['edit'] : '';
$selectMenu = mysqli_query($config, "SELECT name, icon, link FROM menus WHERE id = '$id'");
$menu = mysqli_fetch_assoc($selectMenu);
// var_dump($menu);

if (isset($_POST['save'])) {
    $name = $_POST['name'];
    $icon = $_POST['icon'];
    $link = $_POST['link'];
    $order = $_POST['order'];
    $Insert = mysqli_query($config, "INSERT INTO menus (name, icon, link, `order`) VALUES ('$name', '$icon', '$link', '$order')");

    header("location:?page=menu");
}

if (isset($_POST['update'])) {
    $name = $_POST['name'];
    $icon = $_POST['icon'];
    $link = $_POST['link'];
    $order = $_POST['order'];
    $update = mysqli_query($config, "UPDATE menus SET name='$name', icon='$icon', link='$link', `order`='$order' WHERE id = $id");

    header('location:?page=menu');
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
                    <h1><?= isset($_GET['edit']) ? 'Update' : 'Add' ?> menu</h1>
                </div>
                <div class="card-body">
                    <form action="" method="post">
                        <label for="" class="form-label">Menu Name</label> <br>
                        <input type="text" class="form-control mb-3" name="name"
                            value="<?php echo $menu['name'] ?? '' ?>" placeholder="Enter Name" required>
                        <label for="" class="form-label">Icon</label> <br>
                        <input type="text" class="form-control mb-3" name="icon"
                            value="<?php echo $menu['icon'] ?? '' ?>" placeholder="Enter Icon" required>
                        <label for="" class="form-label">Link</label> <br>
                        <input type="text" class="form-control mb-3" name="link"
                            value="<?php echo $menu['link'] ?? '' ?>" placeholder="Enter Link" required>
                        <label for="" class="form-label">Order</label> <br>
                        <input type="text" class="form-control mb-3" name="order"
                            value="<?php echo $menu[`order`] ?? '' ?>" placeholder="Enter Order" required>
                        <button type="submit" class="btn btn-primary"
                            name="<?= isset($_GET['edit']) ? 'update' : 'save' ?>"><?= isset($_GET['edit']) ? 'edit' : 'create' ?></button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>

</html>