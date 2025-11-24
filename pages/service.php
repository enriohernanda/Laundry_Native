<?php
$q_services = mysqli_query($config, "SELECT  * FROM services");
$services = mysqli_fetch_all($q_services, MYSQLI_ASSOC);
// var_dump($services);

if (isset($_GET['delete'])) {
    $id = $_GET['delete'];
    $q_delete = mysqli_query($config, "DELETE FROM services WHERE id = $id");

    header("location:?page=service");
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
                        <h3 class="card-title">Data Services</h3>
                    </div>
                    <div class="card-body">
                        <div class="d-flex mb-3 justify-content-end">
                            <a href="?page=tambah-service" class="btn btn-primary">
                                <i class="bi bi-plus-circle"></i> Add Services
                            </a>
                        </div>
                        <table class="table table-bordered">
                            <tr>
                                <th>No</th>
                                <th>Service Name</th>
                                <th>Price</th>
                                <th>Actions</th>
                            </tr>
                            <?php
                            foreach ($services as $key => $service) {
                            ?>
                            <tr>
                                <td><?php echo $key + 1 ?></td>
                                <td><?php echo $service['name'] ?></td>
                                <td>Rp. <?php echo $service['price'] ?></td>
                                <td>
                                    <a class="btn btn-success btn-sm"
                                        href="?page=tambah-service&edit=<?= $service['id'] ?>">
                                        <i class="bi bi-pencil"></i>
                                    </a>
                                    <form class="d-inline" action="?page=service&delete=<?= $service['id'] ?>"
                                        method="post" onclick="return confirm('Are you sure you want to delete?')">
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