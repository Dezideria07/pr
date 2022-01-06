<?php
if(!isset($article)) {
    $article = [];
    $id=1;
}

if(!isset($db)) {
        $db = new stdClass();
    }
?>

<article class="col-sm-6">
    <div class="blog-content ">
       <img style="height: 430px" src="<?php
        echo $article["image"]; ?>" alt="Image">
        <h2><?php echo $article["name"]; ?></h2>
        <p><?php echo $article["perex"];
        ?></p>
        <hr>
        <div class="col-sm-4">
            <div><?php echo $article["username"]; ?></div>
            <div ><?php echo $article["created_at"]; ?></div>
        </div>
        <div class="col-sm-4">
            <div ><?php echo $article["category"]; ?></div>
            <div><?php echo $article["numComments"];?> Comments</div>
        </div>
        <div class="col-sm-12" style="margin-left: 50px; margin-top: -30px">
            <span><a href="post.php?id=<?php echo $article["id"];?>">Otvoriť článok</a></span>

        </div>
        <br><br><br>
    </div>
</article>