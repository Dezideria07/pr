<!DOCTYPE html>
<html lang="en">

<?php include_once "parts/header.php";

if(!isset($db)) {

    $db = new stdClass();
}

$articles = $db->getAllArticles();
?>

<body>

<!-- NAV BAR -->
	<?php include_once "parts/nav.php"
    ?>
    <div id="section1">
        <header id="header-area" class="intro-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 text-center">
                        <div class="header-content">
                            <h1>Blog o cestovaní</h1>
                        </div>
                    </div>
                </div>
            </div>
        </header>
    </div>
<!-- End NAV BAR -->

<!-- ABOUT -->
	<div id="section2">
		<?php include_once "about.php" ?>
<br><br><br>
    </div>
<!-- End ABOUT -->

<!-- LATEST POSTS -->
    <div id="section3">
<section class="services-section">
    <div class="container service">
        <h1 style="text-align: center; margin-top: 100px; color: #5e5e5e">Najnovšie Príspevky</h1>
		<section id="blog-area " >

				<div class="row text-center inner" style="margin-bottom: 100px">
                    <?php

                        foreach ($articles as $id => $article) {
                if($article["id"]<3) {
                            include "parts/article.php";
                        }}
                        ?>
                </div>
            </div>
        </section>
    </div>
<!-- End LATEST POSTS -->

<!-- POSTS -->
			<div id="section4">
                <div class="container ">
                    <h1 style="text-align: center; margin-top: 100px; color: #5e5e5e">Príspevky</h1>
                </div>
    <div >
                            <?php

                            foreach ($articles as $id => $article) {

                                    include "parts/article-posts.php";
                                }
                            ?>


				</div>
<!-- End POSTS -->

<!-- Start Contact Area -->
    <div id="section5" style="margin-top: 400px">
        <?php include_once "contact.php" ?>
    </div>
<!-- End Contact Area -->

<!-- Start Footer Area -->
    <?php include_once "parts/footer.php" ?>
<!-- End Footer Area -->

</body>
</html>