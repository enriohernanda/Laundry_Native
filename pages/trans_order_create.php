<?php
include "../config/config.php";
?>

<h2>Transaksi Laundry</h2>

<form action="../process/trans_order_store.php" method="POST">

    <label>Customer</label><br>
    <select name="customer_id" required>
        <option value="">-- pilih customer --</option>
        <?php
        $query = mysqli_query($conn, "SELECT * FROM customers ORDER BY name ASC");
        while ($c = mysqli_fetch_assoc($query)) {
            echo "<option value='".$c['id']."'>".$c['name']."</option>";
        }
        ?>
    </select>
    <br><br>

    <table id="serviceTable" border="1" cellpadding="6">
        <tr>
            <th>Service</th>
            <th>Qty</th>
        </tr>

        <tr>
            <td>
                <select name="service_id[]" required>
                    <?php
                    $s = mysqli_query($conn, "SELECT * FROM services ORDER BY name ASC");
                    while ($row = mysqli_fetch_assoc($s)) {
                        echo "<option value='".$row['id']."'>".$row['name']." (Rp ".$row['price'].")</option>";
                    }
                    ?>
                </select>
            </td>
            <td>
                <input type="number" name="qty[]" min="1" required>
            </td>
        </tr>

    </table>

    <button type="button" onclick="addRow()">Tambah Service</button>
    <br><br>

    <label>Pembayaran (uang diterima)</label><br>
    <input type="number" name="order_pay" required>
    <br><br>

    <label>Tax (%)</label>
    <input type="number" name="order_tax" value="0" required>
    <br><br>

    <button type="submit">Simpan Transaksi</button>

</form>

<script>
function addRow() {
    let table = document.getElementById("serviceTable");
    let row = table.rows[1].cloneNode(true);
    table.appendChild(row);
}
</script>