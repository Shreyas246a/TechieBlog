<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login-page.jsp");
        return;
    }
%>    

<!DOCTYPE html>
<html>
    <head>
        <%@include file="LinksandScripts.jsp" %>
        <meta charset="UTF-8">
        <title>Profile page</title>
    </head>
    <body>

        <!-- Navbar -->
        <%@include file="profile_navbar.jsp" %>
        <!-- End of Navbar -->

        <%
            Message msg = (Message) session.getAttribute("msg");
            if (msg != null) {
        %>	
        <div class="alert <%=msg.getCssClass()%>" role="alert">
            <%= msg.getContent()%>
        </div>		
        <%
                session.removeAttribute("msg");
            }
        %>
        <main>
            <div class="container">
                <div class="row mt-4">
                    <div class="col-md-4">
                           <div class="list-group">
                               <a onclick="getPosts(0,this)" id="all-posts" class="c-link list-group-item list-group-item-action active" aria-current="true">
                                All Posts
                            </a>
                            <%
                            PostDao dao = new PostDao(ConnectionProvider.getConnection());
                            ArrayList<Category> list = dao.getAllCategories();
                            for(Category c : list){
                            %>   
                            <a id="cat-posts" onclick="getPosts(<%=c.getCid()%>,this)" class="c-link list-group-item list-group-item-action"><%=c.getName()%></a>
                            <%
                                }
                            %>
                           </div>    
                    </div>
                    <div class="col-md-8" >
                        <div class="container text-center"id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h3 class="mt-3">Loading...</h3>
                        </div>
                        <div class="container-fluid" id="post-container">
                            
                            
                        </div>
                    </div>    
                </div>
            </div>
 
        </main>
        
    
        <!-- Profile Modal -->
        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header primary-background">
                        <h5 class="modal-title" id="exampleModalLabel"><%=user.getName()%></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img height="auto" width="auto" src="pics/<%=user.getProfile()%>" class="img-fluid" style="border-radius: 50%; max-width: 150px"> <br>

                            <h5 class="modal-title" id="exampleModalLabel"><%=user.getName()%></h5>
                            <div id="profile-details">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row"> ID :</th>
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"> Email :</th>
                                            <td><%=user.getEmail()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Gender</th>
                                            <td><%= user.getGender()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">About</th>
                                            <td><%= user.getAbout()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"> Registered on:</th>
                                            <td><%= user.getDatetime().toString()%></td>
                                        </tr>
                                    </tbody>	
                                </table>
                            </div>
                        </div>
                        <div id="profile-edit" style="display: none;">
                            <h3 class="mt-2">Please Edit Carefully</h3>
                            <form action="/EditServlet" method="POST" enctype="multipart/form-data">
                                <table class ="table">  
                                    <tr>
                                        <td>ID :</td>
                                        <td><%= user.getId()%></td>
                                    </tr>
                                    <tr>
                                        <td>Email :</td>
                                        <td><input type="email" class="form-control" name="email" value="<%=user.getEmail()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Name :</td>
                                        <td><input type="text" class="form-control" name="name" value="<%=user.getName()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Password :</td>
                                        <td><input type="password" class="form-control" name="pass" value="<%=user.getPassword()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Gender :</td>
                                        <td><%=user.getGender().toUpperCase()%></td>
                                    </tr>
                                    <tr> 
                                        <td>About :</td>
                                        <td><textarea class="form-control" name="about" rows="5"><%=user.getAbout()%></textarea></td>
                                    </tr>
                                    <tr>
                                        <td>New Profile:</td>
                                        <td><input type="file" name="image" class="form-control"></td>

                                    </tr>
                                </table>
                                <div class="container">
                                    <button type="submit" class="btn btn-outline-primary">Save</button>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" id="edit-profile-button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- End of Profile Modal -->


        <!-- Add post modal -->



        <!-- Button trigger modal -->
        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide the post details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="AddPostServlet" method="post" id="addpost">
                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled="disabled">Select category</option>
                                    <%
                                        for (Category c : list) {
                                    %>    
                                    <option value="<%= c.getCid()%>"><%= c.getName()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" name="ptitle" required="required" placeholder="Enter post title"/>    
                            </div>
                            <div class="form-group">
                                <textarea name='pcontent' rows="3" class="form-control" name="pcontent" required="required" placeholder="Enter post content"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea  rows="3" class="form-control" name="pcode" placeholder="Enter code if available"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Select image if available</label>
                                <input type="file" class="form-control" name="pimage"/>    
                            </div>

                            <div class='container text-center'>

                                <button type='submit' class="btn btn-outline-primary">Post</button>
                            </div>

                        </form>


                    </div>

                </div>
            </div>
        </div>







        <!-- End add post modal -->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script type="text/javascript">

            $(document).ready(function(){

            let editStatus = false;
                    $("#edit-profile-button").click(function(){

            if (editStatus === false){
            $("#profile-edit").show();
                    $('#profile-details').hide();
                    $(this).text("Back");
                    editStatus = true;
            }
            else{
            $("#profile-edit").hide();
                    $('#profile-details').show();
            }


            })
            })
        </script>

            <script type="text/javascript">
        <!-- add Post -->
                $(document).ready(function(e)
            {

                    $("#addpost").on('submit', function(event){
            event.preventDefault();
                    console.log("Submitted")
                    let form = new FormData(this);
                    $.ajax({
                    url: "AddPostServlet",
                            type: 'POST',
                            data: form,
                            success: function (data, textStatus, jqXHR) {
                            if (data.trim() === "Done"){
                            swal("Posted succesfully").then(
                                    (val) => {
                            window.location = "profile_page.jsp"
                            }
                            )
                            }
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                            swal("Something went wrong try again", errorThrown)
                            },
                            processData: false,
                            contentType: false,
                    })
            })
            })
        </script>
        <script>
            function getPosts(cid,temp){
            $("#loader").show();
            $("#post-container").hide();
            $(".c-link").removeClass('active')
            $.ajax({
                url: "load_posts.jsp",
                data : {cid:cid},
                success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        $("#post-container").show();
                        $("#post-container").html(data);
                        $(temp).addClass('active')
                    }
                
                
            })
            }
            
            $(document).ready(function (e){
                
            let allgetRef = $(".c-link")[0]
            getPosts(0,allgetRef);
            })
        </script>        
    </body>

</html>