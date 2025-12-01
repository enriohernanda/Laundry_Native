<?php
// Total order
$total_order = mysqli_fetch_assoc(
    mysqli_query($config, "SELECT COUNT(*) AS total FROM trans_orders")
)['total'];

// Sedang diproses (Belum diambil)
$proses = mysqli_fetch_assoc(
    mysqli_query($config, "SELECT COUNT(*) AS total FROM trans_orders WHERE order_status = 0")
)['total'];

// Selesai (Sudah diambil)
$pickUp = mysqli_fetch_assoc(
    mysqli_query($config, "SELECT COUNT(*) AS total FROM trans_orders WHERE order_status = 1")
)['total'];
?>


<div class="pagetitle">
    <h1>Dashboard Laundry</h1>
</div>
<!-- End Page Title -->

<section class="section dashboard">

    <div class="row">

        <!-- Left side columns -->
        <div class="col-lg-12">
            <div class="row">

                <!-- Pesanan Masuk -->
                <div class="col-xxl-3 col-md-6">
                    <div class="card info-card sales-card">

                        <div class="card-body">
                            <h5 class="card-title">Order Total</span></h5>

                            <div class="d-flex align-items-center">
                                <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                    <i class="bi bi-bag-plus"></i>
                                </div>
                                <div class="ps-3">
                                    <h6><?= $total_order ?></h6>
                                </div>
                            </div>
                        </div>

                    </div>
                </div><!-- End Pesanan Masuk -->

                <!-- Proses -->
                <div class="col-xxl-3 col-md-6">
                    <div class="card info-card revenue-card">

                        <div class="card-body">
                            <h5 class="card-title">Processing</span></h5>

                            <div class="d-flex align-items-center">
                                <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                    <i class="bi bi-repeat"></i>
                                </div>
                                <div class="ps-3">
                                    <h6><?= $proses ?></h6>
                                </div>
                            </div>
                        </div>

                    </div>
                </div><!-- End Proses -->

                <!-- pickUp -->
                <div class="col-xxl-3 col-xl-3 col-md-6">
                    <div class="card info-card customers-card">

                        <div class="card-body">
                            <h5 class="card-title">Picked Up</h5>

                            <div class="d-flex align-items-center">
                                <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                    <i class="bi bi-check-circle"></i>
                                </div>
                                <div class="ps-3">
                                    <h6><?= $pickUp ?></h6>
                                </div>
                            </div>
                        </div>

                    </div>
                </div><!-- End Selesai -->

            </div>
        </div><!-- End Left side -->

    </div>
</section>