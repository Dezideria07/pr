<?php
if(!isset($menu)) {
    $menu = [];
}
?>
<nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="single-page-nav sticky-wrapper" id="tmNavbar">
            <ul class="nav navbar-nav">
                <?php  foreach ($menu as $item) {
                      ?>
                    <li><a href="<?php echo $item["path"];?>"> <?php echo $item["menu_name"]  ?></a></li>
                <?php
                }
                ?>
            </ul>
        </div>
    </div>
</nav>
