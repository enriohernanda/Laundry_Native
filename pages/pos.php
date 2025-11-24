<?php
$query = mysqli_query($koneksi, "SELECT * FROM orders ORDER BY id DESC");
$rows = mysqli_fetch_all($query, MYSQLI_ASSOC);

if (isset($_GET['delete'])) {
    $id = $_GET['delete'];

    $s_photo = mysqli_query($koneksi, "SELECT product_photo FROM products WHERE id = $id");
    $row = mysqli_fetch_assoc($s_photo);
    $filePath = $row['product_photo'];
    if (file_exists($filePath)) {
        unlink($filePath);
    }

    $delete = mysqli_query($koneksi, "DELETE FROM products WHERE id = $id");
    if ($delete) {
        header("location:?page=product");
    }
}

?>

<body>
    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">Data Products</h3>
                </div>
                <div class="card-body">
                    <div class="d-flex justify-content-end mb-3 mt-2">
                        <a class="btn btn-primary" href="pos/add-pos.php"><i class="bi bi-plus-circle"></i> Add
                            POS</a>
                    </div>
                    <table class="table table-bordered">
                        <tr class="text-center">
                            <th>No</th>
                            <th>Order Code</th>
                            <th>Order Date</th>
                            <th>Order Amount</th>
                            <th>Order Change</th>
                            <th>Status</th>
                            <th>Subtotal</th>
                            <th>Actions</th>
                        </tr>
                        <?php foreach ($rows as $key => $v) {
                        ?>
                            <tr>
                                <td class="text-center"><?php echo $key + 1 ?></td>
                                <td><?php echo $v['order_code'] ?></td>
                                <td><?php echo $v['order_date'] ?></td>
                                <td><?php echo $v['order_amount'] ?></td>
                                <td><?php echo $v['order_change'] ?></td>
                                <td class="text-center"><?php echo $v['order_status'] ?></td>
                                <td class="text-center"><?php echo $v['order_subtotal'] ?></td>
                                <td class="text-center">
                                    <a href="?page=tambah-product&edit=<?php echo $v['id'] ?>"
                                        class="btn btn-success btn-sm"><i class="bi bi-pencil"></i></a>
                                    <a href="?page=product&delete=<?php echo $v['id'] ?>"
                                        onclick="return confirm('Are you sure you want to delete this data?')"
                                        class="btn btn-warning btn-sm"><i class="bi bi-trash"></i></a>
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
</body>