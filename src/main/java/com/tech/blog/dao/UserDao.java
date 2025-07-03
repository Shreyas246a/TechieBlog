package com.tech.blog.dao;
import java.sql.*;

import com.tech.blog.entities.User;
public class UserDao {
	private Connection con;
	boolean f = false;
	
	public UserDao(Connection con) {
		this.con = con;
	}	
	public boolean saveUser(User user) {
		try {
			String query ="insert into user(name,email,password,gender,about) value(?,?,?,?,?)";	
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getAbout());
			pstmt.executeUpdate();
			f = true;
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
			
	}
//get user by email and password
	
	public User getUserByEmailAndPassword(String email,String password) {
		User user = null;
		
		try {
			
			String query = "select * from user where email = ? and password = ? ";
			PreparedStatement ptsmt = con.prepareStatement(query);
			ptsmt.setString(1, email);
			ptsmt.setString(2, password);
			
			ResultSet rs = ptsmt.executeQuery();
			if(rs.next()) {
				user = new User();
				String name = rs.getString("name");
				user.setName(name);
				user.setId(rs.getInt("userid"));
				user.setGender(rs.getString("gender"));
				user.setAbout(rs.getString("about"));
				user.setPassword(rs.getString("password"));
				user.setDatetime(rs.getTimestamp("rdate"));
				user.setProfile(rs.getString("profile"));
				user.setEmail(email);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return user;	
	}
	
	public boolean updateUser(User user){
            boolean f=false;
            try{
                String query = "Update user set name = ?, email = ?, password = ?, about = ?, profile = ? Where userid = ?";
                PreparedStatement pstmt = con.prepareStatement(query);
                pstmt.setString(1, user.getName());
                pstmt.setString(2, user.getEmail());
                pstmt.setString(3, user.getPassword());
                pstmt.setString(4, user.getAbout());
                pstmt.setString(5, user.getProfile());
                pstmt.setInt(6, user.getId());
                pstmt.executeUpdate();
                f = true;
           
            }
            catch(Exception e){
                e.printStackTrace();
            }
            return f;
        }
        public User getUserByUsertId(int UserId){
        User user = null;
        try{
        String q = "Select * from user where userId=?";
        PreparedStatement ps=con.prepareStatement(q);
        ps.setInt(1, UserId);
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            			user = new User();
				String name = rs.getString("name");
				user.setName(name);
				user.setId(rs.getInt("userid"));
				user.setGender(rs.getString("gender"));
				user.setAbout(rs.getString("about"));
				user.setPassword(rs.getString("password"));
				user.setDatetime(rs.getTimestamp("rdate"));
				user.setProfile(rs.getString("profile"));
				user.setEmail(rs.getString("email"));
        }
        
        
        }catch(Exception e ){
            e.printStackTrace();
        }
        
        
        
        return user;
        
        }
}
