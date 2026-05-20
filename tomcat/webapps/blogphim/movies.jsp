<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List, web.main.java.model.Movie, web.main.java.model.Review, web.main.java.dao.MovieDAO" %>
<%
    List<Movie> movies = (List<Movie>) request.getAttribute("movies");
    MovieDAO dao = new MovieDAO();
    Review editReview = (Review) request.getAttribute("editReview");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách phim</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f4f4f4; }
        .container { max-width: 1000px; margin: 0 auto; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        h1 { color: #333; text-align: center; }
        table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }
        th, td { padding: 10px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #f2f2f2; }
        form { display: inline; }
        textarea { width: 200px; height: 60px; }
        button { background-color: #007bff; color: white; border: none; padding: 5px 10px; cursor: pointer; }
        button:hover { background-color: #0056b3; }
        .reviews { margin-top: 10px; }
        .review { background-color: #f9f9f9; padding: 5px; margin-bottom: 5px; border-radius: 4px; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Danh sách phim</h1>
        <table>
            <tr>
                <th>ID</th>
                <th>Tiêu đề</th>
                <th>Thể loại</th>
                <th>Năm</th>
                <th>Đánh giá</th>
            </tr>
            <% for (Movie movie : movies) { %>
            <tr>
                <td><%= movie.getId() %></td>
                <td><%= movie.getTitle() %></td>
                <td><%= movie.getGenre() %></td>
                <td><%= movie.getYear() %></td>
                <td>
                    <form action="<%= request.getContextPath() %>/movies" method="post">
                        <input type="hidden" name="movieId" value="<%= movie.getId() %>">
                        <textarea name="content" placeholder="Viết đánh giá..." required></textarea><br>
                        <button type="submit">Gửi</button>
                    </form>
                    <div class="reviews">
                        <% List<Review> reviews = dao.getReviewsByMovieId(movie.getId()); %>
                        <% for (Review review : reviews) { %>
                        <div class="review">
                            <strong><%= review.getCreatedAt() %></strong>: 
                            <% if (editReview != null && editReview.getId() == review.getId()) { %>
                                <form action="<%= request.getContextPath() %>/movies" method="post" style="margin-top: 10px;">
                                    <input type="hidden" name="action" value="updateReview">
                                    <input type="hidden" name="reviewId" value="<%= review.getId() %>">
                                    <textarea name="content" required style="width:100%; height:80px;"><%= review.getContent() %></textarea><br>
                                    <button type="submit">Cập nhật</button>
                                    <a href="<%= request.getContextPath() %>/movies">Hủy</a>
                                </form>
                            <% } else { %>
                                <span><%= review.getContent() %></span>
                                <div style="margin-top: 8px;">
                                    <a href="<%= request.getContextPath() %>/movies?action=editReview&reviewId=<%= review.getId() %>">Sửa</a>
                                    <form action="<%= request.getContextPath() %>/movies" method="post" style="display:inline; margin-left: 8px;">
                                        <input type="hidden" name="action" value="deleteReview">
                                        <input type="hidden" name="reviewId" value="<%= review.getId() %>">
                                        <button type="submit" onclick="return confirm('Bạn có chắc muốn xóa đánh giá này?');">Xóa</button>
                                    </form>
                                </div>
                            <% } %>
                        </div>
                        <% } %>
                    </div>
                </td>
            </tr>
            <% } %>
        </table>
        <p><a href="<%= request.getContextPath() %>/">Quay lại trang chủ</a></p>
    </div>
</body>
</html>