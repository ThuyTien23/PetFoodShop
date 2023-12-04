/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.DBUtils;

/**
 *
 * @author min
 */
public class UserDAO {
    Connection conn = null;
    PreparedStatement pre = null;
    ResultSet rs = null;
    
    private static final String SEARCH = "SELECT userID, fullName, roleID FROM tblUsers WHERE fullName like ?";
    
    public User login(String userID, String password) throws ClassNotFoundException, SQLException {
        String query = "SELECT userID, fullName, password, roleID FROM tblUsers WHERE userID = ? AND password = ?";
        try {
            conn = new DBUtils().getConnection();
            pre = conn.prepareStatement(query);
            pre.setString(1, userID);
            pre.setString(2, password);
            rs = pre.executeQuery();
            while (rs.next()) {
                return new User(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4));
            }
        } catch (Exception e) {
            
        }
        return null;
    }
    
    public void insert(User u) {
        String sql = "INSERT INTO [dbo].[tblUsers]\n"
                + "           ([userID]\n"
                + "           ,[fullName]\n"
                + "           ,[roleID]\n"
                + "           ,[password])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            conn = DBUtils.getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, u.getUserID());
            pre.setString(2, u.getFullName());
            pre.setString(3, u.getRoleID());
            pre.setString(4, u.getPassword());            
            pre.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public User getUserID(String userID) {
        String sql = "select * from tblUsers where userID =?";
        try {
            conn = DBUtils.getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, userID);
            rs = pre.executeQuery();
            if (rs.next()) {
                User fash = new User(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4));
                return fash;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;        
    }
    
       public List<User> getListUser() {
           String query = "SELECT userID, fullName, roleID, password \n"
                + "From tblUsers";
        try {
            conn = new DBUtils().getConnection();
            pre = conn.prepareStatement(query);
            rs = pre.executeQuery();
            List<User> list = new ArrayList<>();
            while (rs.next()) {
                User fash = new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
                list.add(fash);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
       }
  
}
