/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Post;
import util.DateTimeHelper;

public class PostDBContext extends DBContext<Post> {

    static DateTimeHelper dth = new DateTimeHelper();

    public List<Post> getPost() {
        List<Post> list = new ArrayList<>();
        try {
            connection.setAutoCommit(false);
            String sql = "select post_id,post_title,post_text,account_id,create_date from Post";
            try ( PreparedStatement stm = connection.prepareStatement(sql)) {
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    list.add(new Post(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getInt(4),
                            rs.getDate(5)));
                }
                connection.commit();
                stm.close();
            }

//            String sql = "select * from Post";
//            PreparedStatement stm = connection.prepareStatement(sql);
////            stm.setInt(1, model.getPost_id());
////            stm.setString(2, model.getPost_title());
////            stm.setString(3, model.getPost_text());
////            stm.setInt(4, model.getAccount_id());
//            ResultSet rs = stm.executeQuery();
//            rs.next();
//            post.setPost_id(rs.getInt(1));
//            post.setPost_title(rs.getString(2));
//            post.setPost_text(rs.getString(3));
//            post.setAccount_id(rs.getInt(4));
//            post.setCreate_date(rs.getDate(5));
//            connection.commit();
//            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return list;
    }

    @Override
    public void insert(Post model) {
        try {
            connection.setAutoCommit(false);
            String sql = "insert into Post"
                    + "values (?, ?, ?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, model.getPost_id());
            stm.setString(2, model.getPost_title());
            stm.setString(3, model.getPost_text());
            stm.setInt(4, model.getAccount_id());
            stm.setDate(5, model.getCreate_date());
            stm.executeUpdate();
            connection.commit();
            stm.close();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void delete(String post_id, String account_id) {
        try {
            connection.setAutoCommit(false);
            String sql = "delete from Post \n"
                    + "where post_id = ? and account_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, post_id);
            stm.setString(4, account_id);
            stm.executeUpdate();
            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(PostDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(PostDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public void update(Post model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Post model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Post fill(String post_title) {
        try {
            String sql = "select * from post";
            PreparedStatement stm = connection.prepareStatement(sql);
            //stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Post posts = new Post();
                posts.setPost_id(rs.getInt("post_id"));
                posts.setPost_title(rs.getString("post_title"));
                posts.setPost_text(rs.getString("post_text"));
                posts.setAccount_id(rs.getInt("account_id"));
                posts.setCreate_date(rs.getDate("create_date"));
                return posts;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountInformationDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    //Lay thong tin tu database
    public Post viewPost(int post_id) {
        List<Post> list = new ArrayList<>();
        try {
            connection.setAutoCommit(false);
            String sql = "select post_id, post_title, post_text, account_id, create_date"
                    + "from post";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Post ps = new Post();
                ps.setPost_id(rs.getInt("post_id"));
                ps.setPost_title(rs.getString("post_tittle"));
                ps.setPost_text(rs.getString("post_text"));
                ps.setAccount_id(rs.getInt("account_id"));
                ps.setCreate_date(rs.getDate("create_date"));
                connection.commit();
                stm.close();
                return ps;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountInformationDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(AccountInformationDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

    public int getTotalPost() {
        try {
            connection.setAutoCommit(false);
            String sql = "select COUNT (*) \n"
                    + "from Post";
            try ( PreparedStatement stm = connection.prepareStatement(sql)) {
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);// vì câu lệnh count chỉ cho ra 1 record
                }
                connection.commit();
                stm.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 0;
    }

//    public static void main(String[] args) {
//        PostDBContext postDBContext = new PostDBContext();
//        int count = postDBContext.getTotalPost();
//        System.out.println(count);
//    }

    @Override
    public Post get(Post model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
