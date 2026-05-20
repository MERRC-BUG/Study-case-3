<?php
$conn = new mysqli("localhost", "root", "", "blogphim");

if ($conn->connect_errno) {
    die("Kết nối thất bại: " . $conn->connect_error);
}

// đặt charset ngay sau khi kết nối
$conn->set_charset("utf8mb4");

echo "Kết nối thành công!";
?>

