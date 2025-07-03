/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;
import java.sql.*;
/**
 *
 * @author shrey
 */

public class LikeDao {
    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }
    
    
    
    
    public boolean insertLike(int pid, int userId){
        boolean f = false;
        try{
            String s= "insert into likes(pid,userid) values(?,?)";
            PreparedStatement p = con.prepareStatement(s);
            p.setInt(1, pid);
            p.setInt(2, userId);
            p.executeUpdate();
            f=true;
            
        }catch(Exception e){
        e.printStackTrace();
        }
        
        return f;
    }
    public int countLikeOnPost(int pid){
    int count = 0;
    try{
    String q = "Select count(*) from likes where pid=?";
    PreparedStatement p = con.prepareStatement(q);
    p.setInt(1, pid);
    ResultSet rs = p.executeQuery();
    if(rs.next()){
    count = rs.getInt(1);
    }
    
    }catch(Exception e){
    e.printStackTrace();
    }
    
    
    return count;
    
    }
    public boolean isLikedByUser(int pid,int uid){
    boolean f =false;
        try{
        PreparedStatement p = con.prepareStatement("select * from likes where userid = ? and pid= ?");
        p.setInt(1, uid);
        p.setInt(2,pid);
        ResultSet rs = p.executeQuery();
        if(rs.next()){
          f=true;
        }
        }catch(Exception e){
            e.printStackTrace();
        }
    
    return f;
    }
    public boolean deleteLike(int pid,int userId){
    boolean f =false;
        try{
        PreparedStatement p = con.prepareStatement("delete from likes where pid=? and userid=?");
        p.setInt(1,pid);
        p.setInt(2,userId);
        p.executeUpdate();
        f=true;
        }catch(Exception e){
        e.printStackTrace();
        }
        
    
    return f;
    }
}
