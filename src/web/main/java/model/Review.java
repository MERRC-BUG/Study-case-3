package web.main.java.model;

import java.sql.Timestamp;

public class Review {
    private int id;
    private int movieId;
    private String content;
    private Timestamp createdAt;

    public Review() {}

    public Review(int id, int movieId, String content, Timestamp createdAt) {
        this.id = id;
        this.movieId = movieId;
        this.content = content;
        this.createdAt = createdAt;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getMovieId() { return movieId; }
    public void setMovieId(int movieId) { this.movieId = movieId; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
}