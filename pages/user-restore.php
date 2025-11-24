<?php
// include
// include_once
// require_once
// require

$query = mysqli_query($koneksi, "SELECT r.name AS role_name, u.* FROM users u LEFT JOIN roles AS r ON r.id = u.role_id WHERE u.deleted_at IS NOT NULL ORDER BY u.id DESC");
$users = mysqli_fetch_all($query, MYSQLI_ASSOC);

// disini parameter delete
// $_GET
// isset, empty
if (isset($_GET['delete'])) {
    $id = $_GET['delete'];
    $delete = mysqli_query($koneksi, "DELETE FROM users WHERE id='$id'");

    // redirect
    header("location:?page=user&hapus=berhasil");
}

if (isset($_GET['restore'])) {
    $id = $_GET['restore'];
    $restore = mysqli_query($koneksi, "UPDATE users SET deleted_at=null WHERE id='$id'");
    header("location:?page=user");
}

?>

<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-body">
                <h1 class="card-title">Data User Restore</h1>
                <div class="mb-3" align="right">
                    <a class="btn btn-primary" href="?page=user">
                        <i class="bi bi-skip-backward"></i> Back
                    </a>
                </div>
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Role</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($users as $key => $value): ?>
                            <tr>
                                <td><?php echo $key += 1 ?></td>
                                <td><?php echo $value['name'] ?></td>
                                <td><?php echo $value['email'] ?></td>
                                <td><?php echo $value['role_name'] ?></td>
                                <td>
                                    <a class="btn btn-success btn-sm"
                                        onclick="return confirm('Are you sure you want to restore?')"
                                        href="?page=user-restore&restore=<?php echo $value['id'] ?>"><i
                                            class="bi bi-arrow-clockwise">
                                        </i>
                                    </a>
                                    <a class="btn btn-warning btn-sm"
                                        onclick="return confirm('Are you sure you want to delete this data?')"
                                        href="?page=user-restore&delete=<?php echo $value['id'] ?>">
                                        <i class="bi bi-trash"></i>
                                    </a>
                                </td>
                            </tr>
                        <?php endforeach ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>