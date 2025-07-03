<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Post" %>


<div class="row">
<%
 User user = (User)session.getAttribute("currentUser");
PostDao d = new PostDao(ConnectionProvider.getConnection());
int cid = Integer.parseInt(request.getParameter("cid"));
List<Post> post=null;
LikeDao dao = new LikeDao(ConnectionProvider.getConnection());
if(cid==0){
    post=  d.getAllPosts();
    }
    else{
    post=d.getPostsByCat(cid);
    }
    for (Post p : post){
 
%>
<div class="col-md-6 mt-2">
    <div class="card">
        <img class="card-img-top" src="blog_pics/<%= p.getpPic() %>" alt="">
        <div class="card-body">
            <b><%=p.getpTitle()%></b>
            <p><%= ((p.getpContent().length() > 70 )? p.getpContent().substring(0,70) : p.getpContent())+"....." %></p>
            <pre><%=p.getpCode()%></pre>
        </div>
        <div class='card-footer bg-primary text-center'> 
            <a href='show_blog.jsp?post_id=<%= p.getPid()%>' class="btn btn-outline-light btn-sm">Read More....</a>
            <a href='' onclick="doLike(<%= p.getPid() %>,<%= user.getId()%>,<%=dao.isLikedByUser(p.getPid(),user.getId())%>)"  class="btn btn-outline-light btn-sm"><i class='fa fa-thumbs-o-up'></i> <span><%= dao.countLikeOnPost(p.getPid())%></span> </a>
            <a href='#!' class="btn btn-outline-light btn-sm"><i class='fa fa-commenting-o'> 20</i></a>   
        </div>
    </div>
</div>
    <%
        } 
    %>

</div>