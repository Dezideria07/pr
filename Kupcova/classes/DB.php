<?php

namespace Classes;

class DB {
    private $connection;

    public function __construct($host, $username, $pass, $dbName,$port)
    {
        try {
            $this->connection = new \PDO("mysql:host=" . $host . ";dbname=" . $dbName . ";port=" . $port, $username, $pass);
            $this->connection->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
        } catch (\PDOException $e) {
            echo "Connection failed: " . $e->getMessage();
        }
    }

    public function getMenu()
    {
        $sql = "SELECT * FROM menu ORDER BY id ASC";
        $stm = $this->connection->prepare($sql);
        $stm->execute();
        $result = $stm->fetchAll(\PDO::FETCH_ASSOC);

        return $result;
    }

    public function getAllArticles()
    {
        $sql = "SELECT p.id, p.post_name, p.perex, p.created_at, p.image, u.username, c.cat_name 
FROM posts AS p
INNER JOIN users AS u ON p.users_id = u.id
INNER JOIN categories_has_posts AS cp ON p.id = cp.posts_id
INNER JOIN categories AS c ON cp.categories_id = c.id";
        $stm = $this->connection->prepare($sql);
        $stm->execute();
        $result = $stm->fetchAll(\PDO::FETCH_ASSOC);
        $response = [];
        $i =0;

        foreach ($result as $item) {
            if(isset($response[$item["id"]])) {
                $response[$item["id"]]["category"] .= ". ".$item["cat_name"];
            } else {
                $response[$item["id"]] = [
                    "name" => $item["post_name"],
                    "perex" => $item["perex"],
                    "created_at" => date("d.m.Y", strtotime($item["created_at"])),
                    "image" => $item["image"],
                    "username" => $item["username"],
                    "category" => $item["cat_name"],
                    "numComments" => $this->getNumberOfComments($item["id"]),
                    "id" => $item["id"]
                ];
                if($i === 0) {
                    $response[$item["id"]]["new"] = true;
                } else {
                    $response[$item["id"]]["new"] = false;
                }
            }
            $i++;
        }

        return $response;
    }

    public function getNumberOfComments($postId) {
        $sql = "SELECT COUNT(id)  FROM comments WHERE posts_id = :post_id";
        $stm = $this->connection->prepare($sql);
        $stm->bindValue(":post_id", $postId);
        $stm->execute();
        $count = $stm->fetchColumn();


        return $count;
    }

    public function getPostDetail($postId) {
        $sql = "SELECT p.id, p.post_name, p.content, p.created_at, p.image, u.username  AS category 
FROM posts as p 
INNER JOIN users AS u ON p.users_id = u.id
WHERE p.id = :post_id
ORDER BY p.created_at DESC";
        $stm = $this->connection->prepare($sql);
        $stm->bindValue(":post_id", $postId);
        $stm->execute();
        $result = $stm->fetch(\PDO::FETCH_ASSOC);

        return $result;
    }



    public function getComments($postId)
    {
        $sql = "SELECT u.username, co.created_at, co.content  
                FROM comments AS co
                INNER JOIN users AS u ON co.users_id = u.id
                WHERE posts_id = :post_id
                ORDER BY co.created_at ASC";
        $stm = $this->connection->prepare($sql);
        $stm->bindValue('post_id', $postId);
        $stm->execute();
        $result = $stm->fetchAll(\PDO::FETCH_ASSOC);

        return $result;
    }

    public function insertPostComment($postId, $userName, $content)
    {
        $dateTime = date("Y-m-d H:i:s", time());

        $sqlUser = "SELECT id FROM users WHERE username = :username";
        $stmUser = $this->connection->prepare($sqlUser);
        $stmUser->bindValue(":username", $userName);
        $stmUser->execute();
        $userId = $stmUser->fetchColumn();

        $sql = "INSERT INTO comments(content, created_at, posts_id, users_id) VALUE(:content, '".$dateTime."', :post_id, :user_id)";
        $stm = $this->connection->prepare($sql);
        $stm->bindValue(':content', $content);
        $stm->bindValue(':post_id', $postId);
        $stm->bindValue(':user_id', $userId);
        $result = $stm->execute();

        return $result;

    }

    public function deletePostComment($commentId)
    {
        $sql = "DELETE FROM comments WHERE id = :id";
        $stm = $this->connection->prepare($sql);
        $stm->bindValue(":comment_id", $commentId);
        $result = $stm->execute();

        return $result;
    }

    public function updatePostComment($commentId, $userId, $content)
    {
        $sql = "UPDATE comments SET content = '".$content."', users_id = '".$userId."' WHERE id = '".$commentId."'";
        $stm = $this->connection->prepare($sql);
        $result = $stm->execute();

        return $result;
    }

    public function getComment($commentId)
    {
        $sql = "SELECT * FROM comments WHERE id = ".$commentId;
        $stm = $this->connection->prepare($sql);
        $stm->execute();
        $comment = $stm->fetch(\PDO::FETCH_ASSOC);

        return $comment;
    }

}