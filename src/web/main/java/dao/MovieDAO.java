package web.main.java.dao;

import web.main.java.DBConnection;
import web.main.java.model.Movie;
import web.main.java.model.Review;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MovieDAO {

    public List<Movie> getAllMovies() throws Exception {
        List<Movie> movies = new ArrayList<>();
        String sql = "SELECT id, title, genre, year FROM movies";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Movie movie = new Movie();
                movie.setId(rs.getInt("id"));
                movie.setTitle(rs.getString("title"));
                movie.setGenre(rs.getString("genre"));
                movie.setYear(rs.getInt("year"));
                movies.add(movie);
            }
        }
        return movies;
    }

    public Movie getMovieById(int id) throws Exception {
        String sql = "SELECT id, title, genre, year FROM movies WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Movie movie = new Movie();
                    movie.setId(rs.getInt("id"));
                    movie.setTitle(rs.getString("title"));
                    movie.setGenre(rs.getString("genre"));
                    movie.setYear(rs.getInt("year"));
                    return movie;
                }
            }
        }
        return null;
    }

    public List<Review> getReviewsByMovieId(int movieId) throws Exception {
        List<Review> reviews = new ArrayList<>();
        String sql = "SELECT id, movie_id, content, created_at FROM reviews WHERE movie_id = ? ORDER BY created_at DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, movieId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Review review = new Review();
                    review.setId(rs.getInt("id"));
                    review.setMovieId(rs.getInt("movie_id"));
                    review.setContent(rs.getString("content"));
                    review.setCreatedAt(rs.getTimestamp("created_at"));
                    reviews.add(review);
                }
            }
        }
        return reviews;
    }

    public void addReview(int movieId, String content) throws Exception {
        String sql = "INSERT INTO reviews (movie_id, content) VALUES (?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, movieId);
            ps.setString(2, content);
            ps.executeUpdate();
        }
    }

    public Review getReviewById(int reviewId) throws Exception {
        String sql = "SELECT id, movie_id, content, created_at FROM reviews WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, reviewId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Review review = new Review();
                    review.setId(rs.getInt("id"));
                    review.setMovieId(rs.getInt("movie_id"));
                    review.setContent(rs.getString("content"));
                    review.setCreatedAt(rs.getTimestamp("created_at"));
                    return review;
                }
            }
        }
        return null;
    }

    public void updateReview(int reviewId, String content) throws Exception {
        String sql = "UPDATE reviews SET content = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, content);
            ps.setInt(2, reviewId);
            ps.executeUpdate();
        }
    }

    public void deleteReview(int reviewId) throws Exception {
        String sql = "DELETE FROM reviews WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, reviewId);
            ps.executeUpdate();
        }
    }
}