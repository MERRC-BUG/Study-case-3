<?php
include 'connect.php';
$sql = "SELECT * FROM movies";
$result = $conn->query($sql);
?>
<!DOCTYPE html>
<html>
<head>
    <title>Blog Review Phim</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
    <h1>Danh sách phim</h1>
    <table class="table table-striped">
        <tr>
            <th>ID</th>
            <th>Tên phim</th>
            <th>Thể loại</th>
            <th>Năm</th>
        </tr>
        <?php while($row = $result->fetch_assoc()) { ?>
        <tr>
            <td><?= $row['id'] ?></td>
            <td><?= $row['title'] ?></td>
            <td><?= $row['genre'] ?></td>
            <td><?= $row['year'] ?></td>
        </tr>
        <?php } ?>
    </table>
</body>
</html>
