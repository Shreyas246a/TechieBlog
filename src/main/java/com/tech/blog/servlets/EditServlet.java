
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.FileHelper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author shrey
 */
@MultipartConfig
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String password = request.getParameter("pass");
        String about = request.getParameter("about");
        Part part = request.getPart("image");
        String imageName = part.getSubmittedFileName();
        
        HttpSession s = request.getSession();
        
        User user=(User)s.getAttribute("currentUser");
        user.setEmail(email);
        user.setAbout(about);
        user.setName(name);
        user.setPassword(password);
        String oldimg = user.getProfile();
        user.setProfile(imageName);
        
        UserDao dao= new UserDao(ConnectionProvider.getConnection());
        
        boolean answer = dao.updateUser(user);
        if(answer){
     
            String oldPath = request.getRealPath("/")+"pics"+File.separator+oldimg;
            String path = request.getRealPath("/")+"pics"+File.separator+user.getProfile();
            
            if(!oldPath.equals("Default.png")){
            FileHelper.deletefile(oldPath);
            }
                if(FileHelper.saveFile(part.getInputStream(), path)){
		Message msg = new Message("Profile updated", "success", "alert-success");
                s.setAttribute("msg", msg);
		response.sendRedirect("profile_page.jsp");
                }else{
                Message msg = new Message("Something went Wrong! try again", "error", "alert-danger");
		s.setAttribute("msg", msg);
                response.sendRedirect("profile_page.jsp");
                }
                
        }else{
            	Message msg = new Message("Something went Wrong! try again", "error", "alert-danger");
		response.sendRedirect("profile_page.jsp");
        }
    }



}
