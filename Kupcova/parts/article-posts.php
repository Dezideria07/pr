<?php
if(!isset($article)) {
    $article = [];
    $id=1;
}

if(!isset($db)) {
        $db = new stdClass();
    }
?>

<article class="text-center col-lg-4 " >
    <div class="row inner blog-content col-sm-12"style="margin-left: 20px; " >

        <img style="height: 200px" src="<?php
        echo $article["image"]; ?>" alt="Image">
        <h2><?php echo $article["name"]; ?></h2>
        <button><a href="post.php?id=<?php echo $article["id"];?>">Otvoriť článok</button>
</div>



</article>
