/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class PostDao {
    Connection con;
    
    public PostDao(Connection con){
        this.con = con;
    }
    public ArrayList<Category> getAllCategories(){
        ArrayList<Category> list = new ArrayList<>();
        
        try{
           String q = "Select * from categories";
           Statement st = con.createStatement();
           ResultSet rs = st.executeQuery(q);
           
           while(rs.next()){
               int cid = rs.getInt("cid");
               String cname = rs.getString("cname");
               String cdes = rs.getString("cdescription");
               Category c = new Category(cid, cname, cdes);
               list.add(c);
           }
        }catch(Exception e){
            e.printStackTrace();
         
        }
        return list;
    }
    
    public boolean savePost(Post p){
    boolean f = false;
    
    try{
    String q = "insert into post(ptitle,pcontent,pcode,ppic,cid,userid)values(?,?,?,?,?,?)";
    PreparedStatement pstm = con.prepareStatement(q);
    pstm.setString(1,p.getpTitle());
    pstm.setString(2,p.getpContent());
    pstm.setString(3,p.getpCode());
    pstm.setString(4, p.getpPic());
    pstm.setInt(5, p.getCid());
    pstm.setInt(6, p.getUserId());
    pstm.executeUpdate();
    f=true;
    }
    catch(Exception e){
    e.printStackTrace();
    
    }
    return f;
    }
    
    public List<Post> getAllPosts(){
    
        List<Post> list = new ArrayList<>();
        try{
        
            String q = "Select * from post";
            Statement s = con.createStatement();
            ResultSet rs = s.executeQuery(q);
            while(rs.next()){
             int pid = rs.getInt("pid");
             String ptitle = rs.getString("pTitle");
             String pcode =  rs.getString("pcode");
             String ppic = rs.getString("ppic");
             Timestamp pdate = rs.getTimestamp("pdate");
             int cid = rs.getInt("cid");
             int userid = rs.getInt("userid");   
             Post p = new Post(pid, ptitle, pcode, pcode, ppic, pdate, cid, userid);
             list.add(p);
            }
        
        }catch(Exception e){
          e.printStackTrace();
        }
        return list;
    }
    
     public List<Post> getPostsByCat(int cid){
    
        List<Post> list = new ArrayList<>();
        try{
        
            String q = "Select * from post where cid = ?";
            PreparedStatement pstm = con.prepareStatement(q);
            pstm.setInt(1,cid );
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
             int pid = rs.getInt("pid");
             String ptitle = rs.getString("pTitle");
             String pcode =  rs.getString("pcode");
             String ppic = rs.getString("ppic");
             Timestamp pdate = rs.getTimestamp("pdate");
             int userid = rs.getInt("userid");   
             Post p = new Post(pid, ptitle, pcode, pcode, ppic, pdate, cid, userid);
             list.add(p);
            }
        
        }catch(Exception e){
          e.printStackTrace();
        }
        return list;
    }
    
    
}
