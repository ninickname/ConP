package sitePackage;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Article {

    private int id;
    private String title;
    private String content;
    private User created_by;
    private Date created_at;

    static Connection connection = null;
    static ResultSet rs = null;

    public Article() {
        this.id = 0;
        this.title = null;
        this.content = null;
        this.created_by = null;
        this.created_at = null;
    }

    public Article(int id, String title, String content, User created_by, Date created_at) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.created_by = created_by;
        this.created_at = created_at;
    }

    /**
     * Save new Article
     *
     * @param article
     */
    public static void saveArticle(Article article) {
        Statement stmt = null;
        PreparedStatement psmtp = null;

        connection = ConnectionManager.getConnection();
        try {
            stmt = connection.createStatement();

            String sqlQuery = "INSERT INTO articles (title,content,created_by) VALUES (?,?,?)";

            psmtp = connection.prepareStatement(sqlQuery);

            psmtp.setString(1, article.getTitle());

            psmtp.setString(2, article.getTitle());

            psmtp.setInt(3, (int) article.getCreated_by().getId());

            psmtp.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * Update existing Article
     *
     * @param article
     */
    public static void updateArticle(Article article) {
        Statement stmt = null;
        PreparedStatement psmtp = null;

        connection = ConnectionManager.getConnection();
        try {

            String sqlQuery = "UPDATE articles SET title = ? , content = ? ,created_by = ?  WHERE id= ?";

            System.out.println(sqlQuery);

            psmtp = connection.prepareStatement(sqlQuery);

            psmtp.setString(1, article.getTitle());
            psmtp.setString(2, article.getContent());
            psmtp.setInt(3, (int) article.getCreated_by().getId());
            psmtp.setInt(4, article.getId());

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * Delete existing Article
     *
     * @param article
     */
    public static void deleteArticle(Article article) {
        Statement stmt = null;
        PreparedStatement psmtp = null;

        connection = ConnectionManager.getConnection();
        try {
            stmt = connection.createStatement();

            String sqlQuery = "DELETE FROM articles WHERE id = ?";


            psmtp = connection.prepareStatement(sqlQuery);

            psmtp.setInt(1, article.getId());

            psmtp.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * Get Articles
     *
     * @return List<Articles>
     */
    public static List<Article> getArticles() {

        List<Article> sessions = new ArrayList<Article>();
        Statement stmt = null;

        connection = ConnectionManager.getConnection();

        try {

            stmt = connection.createStatement();

            String searchQuery = "select * from articles";

            rs = stmt.executeQuery(searchQuery);

            while (rs.next()) {

                Article sob = new Article(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("content"),
                        UserDAO.getUserById(rs.getInt("created_by")),
                        rs.getDate("created_at"));

                sessions.add(sob);
            }
        } catch (Exception ex) {
            System.out.println("Log In failed: An Exception has occurred! " + ex);
        }

        return sessions;
    }

    /***
     * Get Articles By Id
     * @param id
     * @return List<Article>
     */
    public static Article getArticleById(int id) {

        Article article = new Article();
        Statement stmt = null;

        connection = ConnectionManager.getConnection();

        try {

            stmt = connection.createStatement();

            String searchQuery = "select * from articles where id = "+id;

            rs = stmt.executeQuery(searchQuery);

            if (rs.next()) {
                article.setId(rs.getInt("id"));
                article.setTitle(rs.getString("title"));
                article.setContent(rs.getString("content"));
                article.setCreated_by(UserDAO.getUserById(rs.getInt("created_by")));
                article.setCreated_at(rs.getDate("created_at"));
            }
            else{
                return null;
            }
        } catch (Exception ex) {
            System.out.println("Log In failed: An Exception has occurred! " + ex);
        }

        return article;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public User getCreated_by() {
        return created_by;
    }

    public void setCreated_by(User created_by) {
        this.created_by = created_by;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }
}
