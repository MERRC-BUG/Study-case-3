<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blog Phim - Trang chủ</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f4f4f4; }
        h1 { color: #333; text-align: center; }
        .container { max-width: 800px; margin: 0 auto; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        a { color: #007bff; text-decoration: none; }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Chào mừng đến với Blog Phim</h1>
        <p>Khám phá danh sách phim và chia sẻ đánh giá của bạn!</p>
        <p><a href="<%= request.getContextPath() %>/movies">Xem danh sách phim</a></p>
    </div>

   <%@ page import="java.sql.*, com.blogphim.DBConnection" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Chi tiết phim</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">🎬 Blog Review Phim</a>
  </div>
</nav>

<div class="container mt-4">
<%
    String movieId = request.getParameter("id");
    Connection conn = DBConnection.getConnection();

    
    PreparedStatement psMovie = conn.prepareStatement("SELECT * FROM movies WHERE id=?");
    psMovie.setInt(1, Integer.parseInt(movieId));
    ResultSet rsMovie = psMovie.executeQuery();
    if (rsMovie.next()) {
%>
    <h2><%= rsMovie.getString("title") %> (<%= rsMovie.getInt("year") %>)</h2>
    <p>🎭 Thể loại: <%= rsMovie.getString("genre") %></p>
    <img src="images/<%= rsMovie.getString("poster") %>" class="img-fluid mb-3" alt="Poster">
    <hr>
<%
    }

    
    PreparedStatement psReview = conn.prepareStatement("SELECT * FROM reviews WHERE movie_id=?");
    psReview.setInt(1, Integer.parseInt(movieId));
    ResultSet rsReview = psReview.executeQuery();
%>
    <h4>Danh sách review</h4>
    <div class="list-group mb-3">
    <%
        while (rsReview.next()) {
    %>
        <div class="list-group-item"><%= rsReview.getString("content") %></div>
    <%
        }
    %>
    </div>

    <h4>Thêm review mới</h4>
    <form action="addReview" method="post">
      <input type="hidden" name="movie_id" value="<%= movieId %>">
      <textarea name="content" class="form-control" rows="3"></textarea>
      <button type="submit" class="btn btn-success mt-2">Gửi review</button>
    </form>
<%
    conn.close();
%>
</div>
</body>
</html>



</body>
</html>