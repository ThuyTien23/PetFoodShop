/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

/**
 *
 * @author min
 */
public class User {
    public String userID;
    public String fullName;
    public String password;
    public String roleID;
    
    public User() {
    }
    
    public User(String userID, String fullName, String password, String roleID) {
        this.userID = userID;
        this.fullName = fullName;
        this.password = password;
        this.roleID = roleID;
    }
    
    public String getUserID() {
        return userID;
    }
    
    public String getFullName() {
        return fullName;
    }
    
    public String getPassword() {
        return password;
    }
    
    public String getRoleID() {
        return roleID;
    }
    
    public void setUserID(String userID) {
        this.userID = userID;
    }
    
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }
}
