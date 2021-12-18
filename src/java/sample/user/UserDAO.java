/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;

/**
 *
 * @author USER
 */
public class UserDAO {
    private static final String LOGIN=" SELECT fullName, roleID FROM tblUsers WHERE userID=? AND password=? AND status=? ";
    private static final String SEARCH=" SELECT userID,fullName, roleID, status FROM tblUsers WHERE fullName like ? ";
    private static final String DELETE=" UPDATE tblIUsers SET status=? WHERE userID=? ";
    private static final String UPDATE=" UPDATE tblIUsers SET fullName=?, roleID=? WHERE userID=? ";
    private static final String USER_INFOR=" SELECT fullName, roleID FROM tblUsers WHERE userID=?";

    public UserDTO checkLogin(String userID, String password) throws SQLException{
        UserDTO user=null;
        Connection conn=null;
        PreparedStatement stm=null;
        ResultSet rs=null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(LOGIN);
                stm.setString(1, userID);
                stm.setString(2, password);
                stm.setBoolean(3, true);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String fullName=rs.getString("fullName");
                    String roleID=rs.getString("roleID");
                    user= new UserDTO(userID, fullName, roleID, "", true);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs!=null) rs.close();
            if(stm!=null) stm.close();
            if(conn!=null) conn.close();
        }
        return user;
    }
    public List<UserDTO> getListUser(String search) throws SQLException{
        List<UserDTO> list=new ArrayList<>();
        Connection conn=null;
        PreparedStatement stm=null;
        ResultSet rs=null;
        try {
            conn= DBUtils.getConnection();
            if(conn!=null){
                stm=conn.prepareStatement(SEARCH);
                stm.setString(1, "%"+ search+ "%");
                rs=stm.executeQuery();
                while(rs.next()){
                    String userID = rs.getString("userID");
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    String password = "***";
                    boolean status = rs.getBoolean("status");
                    list.add(new UserDTO(userID, fullName, roleID, password, status));
                }
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if (rs != null) 
                rs.close();
            
            if (stm != null) 
                stm.close();
            
            if (conn != null) 
                conn.close();
            
            
        }
        return list;
    }
    public boolean deleteUser(String userID) throws SQLException{
        boolean check= false;
        Connection conn= null;
        PreparedStatement stm= null;
        try{
            conn= DBUtils.getConnection();
            if(conn!= null){
                stm= conn.prepareStatement(DELETE);
                stm.setBoolean(1, false);
                stm.setString(2, userID);
                check= stm.executeUpdate()>0?true:false;
            }
            
        }catch (Exception e){
            e.printStackTrace();
        }finally{
            if(stm!=null ) stm.close();
            if(conn!=null ) conn.close();
        }
        return check;
    } 
    public boolean updateUser(UserDTO user) throws SQLException{
        boolean check= false;
        Connection conn= null;
        PreparedStatement stm= null;
        try{
            conn= DBUtils.getConnection();
            if(conn!= null){
                stm= conn.prepareStatement(UPDATE);
                stm.setString(1, user.getFullName());
                stm.setString(2, user.getRoleID());
                stm.setString(3, user.getUserID());
                check= stm.executeUpdate()>0?true:false;
                
            }
            
        }catch(Exception e){
        
        }finally{
            if(stm!= null) stm.close();
            if(conn!= null) conn.close();
            
        }
        return check;
    }
    public UserDTO getUserInfor(String userID) throws SQLException{
        UserDTO user=null;
        Connection conn=null;
        PreparedStatement stm=null;
        ResultSet rs=null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(USER_INFOR);
                stm.setString(1, userID);
                
                rs = stm.executeQuery();
                if (rs.next()) {
                    String fullName=rs.getString("fullName");
                    String roleID=rs.getString("roleID");
                    user= new UserDTO(userID, fullName, roleID, "", true);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs!=null) rs.close();
            if(stm!=null) stm.close();
            if(conn!=null) conn.close();
        }
        return user;
    }

}
