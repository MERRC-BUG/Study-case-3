@WebServlet("/addReview")
public class ReviewServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String movieId = request.getParameter("movie_id");
        String content = request.getParameter("content");

        try (Connection conn = DBConnection.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO reviews(movie_id, content) VALUES(?, ?)");
            ps.setInt(1, Integer.parseInt(movieId));
            ps.setString(2, content);
            ps.executeUpdate();
            response.sendRedirect("detail.jsp?id=" + movieId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
