<?php
$level_id = $_SESSION['LEVEL_ID'] ?? '';

$querylevelMenu = mysqli_query($config, "SELECT * FROM menus JOIN level_menus ON menus.id = level_menus.menu_id WHERE level_id = '$level_id' ORDER BY menus.id DESC");

$rowLevelMenus = mysqli_fetch_all($querylevelMenu, MYSQLI_ASSOC);
?>

<aside id="sidebar" class="sidebar">
    <ul class="sidebar-nav" id="sidebar-nav">
        <?php foreach ($rowLevelMenus as $rowLevelMenu): ?>
            <li class="nav-item">
                <a class="nav-link collapsed" href="<?= $rowLevelMenu['link'] ?>">
                    <i class="<?= $rowLevelMenu['icon'] ?>"></i>
                    <span><?= $rowLevelMenu['name'] ?></span>
                </a>
            </li>
        <?php endforeach ?>

        <!-- <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-menu-button-wide"></i><span>Master Data</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                <li>
                    <a href="?page=user">
                        <i class="bi bi-circle"></i><span>Users</span>
                    </a>
                </li>
                <li>
                    <a href="?page=level">
                        <i class="bi bi-circle"></i><span>Levels</span>
                    </a>
                </li>
                <li>
                    <a href="?page=service">
                        <i class="bi bi-circle"></i><span>Services</span>
                    </a>
                </li>
                <li>
                    <a href="?page=customer">
                        <i class="bi bi-circle"></i><span>Customers</span>
                    </a>
                </li>
            </ul> -->
</aside>