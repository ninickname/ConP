package sitePackage;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Article {

    private int id;
    private String title;
    private String content;
    private String img_url;
    private User created_by;
    private Date created_at;

    static Connection connection = null;
    static ResultSet rs = null;

    public Article() {
        this.id = 0;
        this.title = null;
        this.content = null;
        this.img_url = null;
        this.created_by = null;
        this.created_at = null;
    }

    public Article(int id, String title, String content,String img_url, User created_by, Date created_at) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.img_url = img_url;
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

            String sqlQuery = "INSERT INTO articles (title,content,img_url,created_by) VALUES (?,?,?,?)";

            psmtp = connection.prepareStatement(sqlQuery);

            psmtp.setString(1, article.getTitle());

            psmtp.setString(2, article.getContent());

            psmtp.setString(3, article.getImg_url());
            if (article.getImg_url()!= null) {
                psmtp.setString(3, article.getImg_url());
            }
            else {
                psmtp.setNull(3,java.sql.Types.INTEGER);
            }
            psmtp.setInt(4, (int) article.getCreated_by().getId());

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
                        rs.getString("img_url"),
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
                article.setImg_url(rs.getString("img_url"));
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

    public static int getArticleRate(int id)
    {
        double sum = 0;
        int counter = 0;

        Statement stmt = null;

        connection = ConnectionManager.getConnection();

        try {


            stmt = connection.createStatement();

            String searchQuery = "select rate from article_rates where article_id = "+id;

            rs = stmt.executeQuery(searchQuery);

            while (rs.next()) {
                sum += rs.getInt("rate");
                counter++;
            }

        } catch (Exception ex) {
            System.out.println("Log In failed: An Exception has occurred! " + ex);
        }
        return counter != 0 ? (int) (sum / counter) : 0;
    }

    public static void addRate(int articleId,int rate,int userId)
    {
        Statement stmt = null;
        PreparedStatement psmtp = null;

        connection = ConnectionManager.getConnection();
        try {
            stmt = connection.createStatement();

            String sqlQuery = "INSERT INTO article_rates (article_id,user_id,rate) VALUES (?,?,?)";

            psmtp = connection.prepareStatement(sqlQuery);

            psmtp.setInt(1, articleId);

            psmtp.setInt(2, userId);

            psmtp.setInt(3, rate);

            psmtp.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Getters & setters

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

    public String getImg_url() {
        return img_url;
    }

    public void setImg_url(String img_url) {
        this.img_url = img_url;
    }
}
