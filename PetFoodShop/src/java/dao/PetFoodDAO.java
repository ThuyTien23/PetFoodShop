/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.PetFood;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.DBUtils;

/**
 *
 * @author min
 */
public class PetFoodDAO {
    Connection conn = null; //connect DB
    PreparedStatement pre = null; //chuyển câu lệnh query sang sql
    ResultSet rs = null; //xử lí kết quả trả về
    
    public List<PetFood> getlistFood() {
        String query = "SELECT id, name, description, price, quantity \n"
                + "From tblFoods";
        try {
            conn = new DBUtils().getConnection();
            pre = conn.prepareStatement(query);
            rs = pre.executeQuery();
            List<PetFood> list = new ArrayList<>();
            while (rs.next()) {
                PetFood food = new PetFood(rs.getString(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getInt(5));
                list.add(food);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }
    
    public PetFood checkPetFoodByID(String id) {
        try {
            String query = "select * from tblFoods where id = ?";
            pre = DBUtils.getConnection().prepareStatement(query);
            pre.setString(1, id);
            rs = pre.executeQuery();
            while (rs.next()) {
                return new PetFood(rs.getString(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getInt(5));
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PetFoodDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(PetFoodDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public PetFood checkPetFoodByName(String name) {
        try {
            String query = "select * from tblFoods where name = ?";
            pre = DBUtils.getConnection().prepareStatement(query);
            pre.setString(1, name);
            rs = pre.executeQuery();
            while (rs.next()) {
                return new PetFood(rs.getString(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getInt(5));
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PetFoodDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(PetFoodDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<PetFood> searchByName(String name) {
        List<PetFood> list = new ArrayList<>();
        String query = "select id, name, description, price, quantity\n"
                + "from tblFoods\n"
                + "WHere name LIKE ?";
        try {
            conn = new DBUtils().getConnection();
            pre = conn.prepareStatement(query);
            pre.setString(1, "%" + name + "%");
            rs = pre.executeQuery();
            while (rs.next()) {
                PetFood com = new PetFood(rs.getString(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getInt(5));
                list.add(com);
            }

        } catch (Exception e) {
        }
        return list;
    }

    public void InsertPetFood(String ID, String name, String des, float price, int quantity) {
        try {
            String query = "Insert into tblFoods(id, name, description, price, quantity) Values (?, ?, ?, ?, ?)";
            conn = new DBUtils().getConnection();
            pre = conn.prepareStatement(query);
            pre.setString(1, ID);
            pre.setString(2, name);
            pre.setString(3, des);
            pre.setFloat(4, price);
            pre.setInt(5, quantity);
            pre.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public void DeletePetFood(String fID) {
        try {
            String query = "DELETE from tblFoods where id = ?";
            conn = new DBUtils().getConnection();
            pre = conn.prepareStatement(query);
            pre.setString(1, fID);
            pre.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

        public boolean updateInsertToCart(String id) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            conn = new DBUtils().getConnection();
            if(con!=null) {
                String sql = "UPDATE tblFoods "
                        + "SET quantity = quantity - 1 "
                        + "WHERE id = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, id);
                int row = stm.executeUpdate();
                if(row>0) {
                    return true;
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }finally {
            if(stm!=null) {
                stm.close();
            }
            if(con!=null) {
                con.close();
            }
        }
        return false;
    }
    
    public boolean updateRemoveFromCart(String ID, int x) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if(con!=null) {
                String sql = "UPDATE tblFoods "
                        + "SET quantity = quantity + ? "
                        + "WHERE id = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, x);
                stm.setString(2, ID);
                int row = stm.executeUpdate();
                if(row>0) {
                    return true;
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }finally {
            if(stm!=null) {
                stm.close();
            }
            if(con!=null) {
                con.close();
            }
        }
        return false;
    }
    
}
