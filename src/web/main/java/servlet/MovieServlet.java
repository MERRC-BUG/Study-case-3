package web.main.java.servlet;

import web.main.java.dao.MovieDAO;
import web.main.java.model.Movie;
import web.main.java.model.Review;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class MovieServlet extends HttpServlet {
    private MovieDAO movieDAO = new MovieDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String action = req.getParameter("action");
            if ("editReview".equals(action)) {
                String reviewIdParam = req.getParameter("reviewId");
                if (reviewIdParam != null && !reviewIdParam.isEmpty()) {
                    int reviewId = Integer.parseInt(reviewIdParam);
                    Review editReview = movieDAO.getReviewById(reviewId);
                    if (editReview != null) {
                        req.setAttribute("editReview", editReview);
                    }
                }
            }
            List<Movie> movies = movieDAO.getAllMovies();
            req.setAttribute("movies", movies);
            req.getRequestDispatcher("/movies.jsp").forward(req, resp);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String action = req.getParameter("action");
            if ("addReview".equals(action)) {
                int movieId = Integer.parseInt(req.getParameter("movieId"));
                String content = req.getParameter("content");
                if (content != null && !content.trim().isEmpty()) {
                    movieDAO.addReview(movieId, content.trim());
                }
            } else if ("updateReview".equals(action)) {
                int reviewId = Integer.parseInt(req.getParameter("reviewId"));
                String content = req.getParameter("content");
                if (content != null && !content.trim().isEmpty()) {
                    movieDAO.updateReview(reviewId, content.trim());
                }
            } else if ("deleteReview".equals(action)) {
                int reviewId = Integer.parseInt(req.getParameter("reviewId"));
                movieDAO.deleteReview(reviewId);
            }
            resp.sendRedirect(req.getContextPath() + "/movies");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
