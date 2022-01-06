
<?php
if(!isset($id)) {

}
if(!isset($db)) {
    $db = new stdClass();
}
if(!isset($comment)) {
    $comment = [];
}
?>

<div>
       Post by:  <?php echo $comment['username'];
       ?>,
        <?php echo date("d.m.Y", strtotime($comment['created_at'])); ?>
    <div>
        <p><?php echo $comment['content']; ?></p>
    </div>
        <div class="d-flex justify-content-between"></div>
    <button><a href="delete_post_comment.php?comment-id=<?php echo $comment['id'];?>&post-id=<?php echo $id; ?>">Delete</a></button>
    <button><a href="update_post_comment.php?comment-id=<?php echo $comment['id'];?>&post-id=<?php echo $id; ?>">Update </a></button>
    <hr>
</div>