<?php
$q_menus = mysqli_query($config, "SELECT  * FROM menus ORDER BY id DESC");
$menus = mysqli_fetch_all($q_menus, MYSQLI_ASSOC);
// var_dump($menus);

if (isset($_GET['delete'])) {
    $id = $_GET['delete'];
    $q_delete = mysqli_query($config, "DELETE FROM menus WHERE id = $id");

    header("location:?page=menu");
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
                    <div class="card-body">
                        <h3 class="card-title">Data Menus</h3>
                    </div>
                    <div class="card-body">
                        <div class="d-flex mb-3 justify-content-end">
                            <a href="?page=tambah-menu" class="btn btn-primary">
                                <i class="bi bi-plus-circle"></i> Add Menus
                            </a>
                        </div>
                        <table class="table table-bordered">
                            <tr>
                                <th>No</th>
                                <th>Name</th>
                                <th>Icon</th>
                                <th>Link</th>
                                <th>Actions</th>
                            </tr>
                            <?php
                            foreach ($menus as $key => $menu) {
                            ?>
                                <tr>
                                    <td><?php echo $key + 1 ?></td>
                                    <td><?php echo $menu['name'] ?></td>
                                    <!-- <td class="text-center">
                                    <img class="rounded" src="<?php echo $menu['icon'] ?>" width="115" alt="">
                                </td> -->
                                    <td><?php echo $menu['icon'] ?></td>
                                    <td><?php echo $menu['link'] ?></td>
                                    <td>
                                        <a class="btn btn-success btn-sm" href="?page=tambah-menu&edit=<?= $menu['id'] ?>">
                                            <i class="bi bi-pencil"></i>
                                        </a>
                                        <form class="d-inline" action="?page=menu&delete=<?= $menu['id'] ?>" method="post"
                                            onclick="return confirm('Are you sure you want to delete?')">
                                            <button type="submit" class="btn btn-warning btn-sm">
                                                <i class="bi bi-trash"></i>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            <?php
                            }
                            ?>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>