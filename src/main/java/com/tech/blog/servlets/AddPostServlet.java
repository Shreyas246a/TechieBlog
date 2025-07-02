/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.FileHelper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
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
public class AddPostServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int cid = Integer.parseInt(request.getParameter("cid"));
        String ptitle = request.getParameter("ptitle");
        String pcontent = request.getParameter("pcontent");
        String pcode = request.getParameter("pcode");
        Part ppic = request.getPart("pimage");
        
        PrintWriter out = response.getWriter();
        HttpSession s = request.getSession();
        User u = (User)s.getAttribute("currentUser");
        int userId = u.getId();
       
        Post p = new Post(ptitle, pcontent, pcode, ppic.getSubmittedFileName(), cid, userId);
        PostDao dao = new PostDao(ConnectionProvider.getConnection());
        if(dao.savePost(p)){
            String path = request.getRealPath("/") + "blog_pics" + File.separator + ppic.getSubmittedFileName();
            FileHelper.saveFile(ppic.getInputStream(),path);
            out.print("Done");
        System.out.println("Successfull");
        
        }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
