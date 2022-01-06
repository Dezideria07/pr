<!DOCTYPE html>
<html lang="en">

<?php include_once "parts/header.php";?>

<body>

<?php
include_once "parts/nav.php";

if(!isset($db)) {
    $db = new stdClass();
}
$postId = $_GET["id"];
$postDetail = $db->getPostDetail($postId);
$comments = $db->getComments($postId);
?>

<header id="header-area" class="intro-section">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 text-center">
                <div class="header-content">
                    <h1>TRAVEL BLOG</h1>
                </div>
            </div>
        </div>
    </div>
</header>


<div id="section2">
    <div id="testimornial-area">
        <div class="container">
            <div class="row">
                <div class="tm-box">
                    <img src="<?php echo $postDetail["image"];?>" alt="Image" class="img-responsive">
                    <div class="tm-box-description">
                        <h2><?php echo $postDetail["post_name"]; ?></h2>
                        <p class="tm-box-p"><?php echo $postDetail["content"]; ?></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <section id="contact-area" class="contact-section">

        <div class="row">
            <div class=" text-center inner">
                <div class="contact-content">
                    <form action="add_post_comment.php" method="post" >
                        <div class="col-sm-12" >
                            <div class="form-group">
                                <div>
                                    <h2 class="tm-color-primary tm-post-title">Komentáre</h2>
                                    <hr class="tm-hr-primary tm-mb-45">
                                    <?php
                                    if(count($comments) > 0) {
                                        foreach ($comments as $comment) {
                                            include "parts/comment.php";
                                        }
                                    } else {
                                        echo "Ziadne komentare";
                                    }
                                    ?>
                                </div>
                            </div>
                        </div>
                        <div class="container">
                            <div class="col-sm-12 "  style="position: page">
                                <h2 class="tm-color-primary tm-post-title">Add a comment</h2>
                                <hr class="tm-hr-primary tm-mb-45">
                                <div class="form-group">
                                    <input name="name" type="text" class="form-control" id="name" placeholder="Name">
                                    <input type="email" name="email" class="form-control" id="mail" placeholder="E-mail">
                                    <textarea name="content" rows="5" class="form-control" id="content" placeholder="Your comment here..."></textarea>
                                    <div class="text-right">
                                        <input type="hidden" name="post_id" value="<?php echo $postId; ?>">
                                        <input type="submit" name="submit" class="btn btn-default" value="Submit">
                                    </div>
                                </div>
                            </div>
                    </form>

                </div>
            </div>
        </div>
</div>
</section>

</div>










<?php include_once "parts/footer.php" ?>


</body>
</html>

