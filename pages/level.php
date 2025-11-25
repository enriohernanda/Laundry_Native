<?php
$q_levels = mysqli_query($config, "SELECT  * FROM levels ORDER BY id DESC");
$levels = mysqli_fetch_all($q_levels, MYSQLI_ASSOC);
// var_dump($levels);

if (isset($_GET['delete'])) {
    $id = $_GET['delete'];
    $q_delete = mysqli_query($config, "DELETE FROM levels WHERE id = $id");

    header("location:?page=level");
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
                        <h3 class="card-title">Data levels</h3>
                    </div>
                    <div class="card-body">
                        <div class="d-flex mb-3 justify-content-end">
                            <a href="?page=tambah-level" class="btn btn-primary">
                                <i class="bi bi-plus-circle"></i> Add levels
                            </a>
                        </div>
                        <table class="table table-bordered">
                            <tr>
                                <th>No</th>
                                <th>Level Name</th>
                                <th>Actions</th>
                            </tr>
                            <?php
                            foreach ($levels as $key => $level) {
                            ?>
                                <tr>
                                    <td><?php echo $key + 1 ?></td>
                                    <td><?php echo $level['name'] ?></td>
                                    <td>
                                        <a class="btn btn-danger btn-sm"
                                            href="?page=add-role-menu&edit=<?= $level['id'] ?>">
                                            <i class="bi bi-plus"></i>
                                        </a>
                                        <a class="btn btn-success btn-sm"
                                            href="?page=tambah-level&edit=<?= $level['id'] ?>">
                                            <i class="bi bi-pencil"></i>
                                        </a>
                                        <form class="d-inline" action="?page=level&delete=<?= $level['id'] ?>" method="post"
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