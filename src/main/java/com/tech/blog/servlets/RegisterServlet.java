package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class RegisterServlet
 */
@MultipartConfig
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String check = request.getParameter("check");
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		if(check == null) {
			out.print("Check the box");
		}
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("pass");
		String gender = request.getParameter("gender");
		String about = request.getParameter("about");
		
		User user = dao.getUserByEmailAndPassword(email, password);
		user.setName(username);
		user.setAbout(about);
		user.setPassword(password);
		user.setEmail(email);
		user.setGender(gender);
	
		if(dao.saveUser(user)) {
			out.print("Done");
		}
		else {
			out.print("Error");
		}
		
	}

}
