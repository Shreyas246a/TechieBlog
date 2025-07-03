
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if(user==null){
    response.sendRedirect("login-page.jsp");
    return;
    }
%>

<%
   int pid = Integer.parseInt(request.getParameter("post_id")); 
   PostDao d = new PostDao(ConnectionProvider.getConnection());
   Post p = d.getPostsByPid(pid);
%>


<!DOCTYPE html>
<html>
    <head>
        <%@include file="LinksandScripts.jsp" %>
        <link href="css/style.css" rel="stylesheet"/>
        
        <title><%= p.getpTitle() %></title>
    </head>
     <!-- Navbar -->
     <%@include file="profile_navbar.jsp"%>
        <!-- End of Navbar -->
    
        

    <body>
        <main>
            <div class="container">
                <div class="row my-4">
                    <div class="col-md-8 offset-md-2">
                        <div class="card">
                            <div class="card-header bg-primary text-white text-center">
                                <h4 class="post-title"><%= p.getpTitle()%></h4>
                            </div>
                            <div class="card-body">
                                <img class="card-img-top" src="/blog_pics/<%=p.getpPic()%>" />
                                
                                <div class="row my-2 row-user">
                                    <div class="col-md-8">
                                        <% UserDao dao = new UserDao(ConnectionProvider.getConnection());
                                            User u = dao.getUserByUsertId(p.getUserId());
                                        %>
                                        <p class="post-user-info"><a href="#"><%= u.getName() %></a> Posted this : </p>
                                    </div>
                                    <div class="col-md-4">
                                        <p class="post-date"><%= p.getpDate().toLocaleString() %></p>
                                    </div>
                                </div>
                                
                                
                                <p class="post-content"><%= p.getpContent() %></p>
                                <%if(p.getpCode().length()!=0){%>
                                <br> 
                                <br>
                                <pre class="post-code"><%= p.getpCode() %></pre>
                                <%}%>
                            </div>
                            <%
                            LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                            %>
                            <div class="card-footer text-center">
                                <a data-liked="<%=ld.isLikedByUser(p.getPid(),user.getId())%>" onclick="doLike(<%= p.getPid() %>,<%= user.getId()%>,<%=ld.isLikedByUser(p.getPid(),user.getId())%>)" class="btn btn-outline-primary <%= ld.isLikedByUser(p.getPid(), user.getId())?"bg-primary":""%> btn-sm like-btn"><i class='fa fa-thumbs-o-up fa-2x'><span class="like-counter">  <%= ld.countLikeOnPost(p.getPid())%></span></i></a>
                            <a href='#!' class="btn btn-outline-primary btn-sm"><i class='fa fa-commenting-o fa-2x'> 20</i></a>   
                            </div>
                        </div>  
                    </div>
                </div>
            </div>
        </main>
        <script src="js/myjs.js"></script>
    </body>
</html>
