<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

        <style>
            body {
                margin: 0;
                font-family: Arial, Helvetica, sans-serif;
            }
            .container {
                align-items: center;
                justify-content: center;
            }

            .header {
                overflow: hidden;
                background-color: #f1f1f1;
                padding: 20px 10px;
            }

            .header a {
                float: left;
                color: black;
                text-align: center;
                padding: 14px;
                text-decoration: none;
                font-size: 18px;
                line-height: 25px;
                border-radius: 4px;
            }

            .header a.logo {
                font-size: 25px;
                font-weight: bold;
            }

            .header a:hover {
                background-color: #ddd;
                color: black;
            }

            .header a.active {
                background-color:   #FFA500;
                color: white;
            }
            img {
                max-width: 35%;
                max-height:25%;
                float: left;
            }
            .text {
                font-size: 20px;
                padding-left: 20px;
                padding-top: 20%;
                float: left;

            }
            .header-right {
                float: right;
            }

            @media screen and (max-width: 500px) {
                .header a {
                    float: none;
                    display: block;
                    text-align: left;
                }

                .header-right {
                    float: none;
                    font-size: 50px;
                }
            }
            .responsive {
                width: 100%;
                max-width: 800px;
                height: auto;
            }

            /* Responsive layout - makes a one column-layout instead of a two-column layout */
            @media (max-width: 800px) {
                .flex-item-right, .flex-item-left {
                    flex: 100%;
                }
            }
        </style>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store"); 
            response.setHeader("Pragma", "no-cache"); 
%>
        <div class="header">
            <img style="height:52px ; width: 60px;" src="logo.png">
            <a href="#default" class="logo" >IskconTemple</a>
            <div class="header-right">
                <a class="active" href="index.html">Home</a>
                <a href="card.html">Photo Gallery</a>
                <a href="about.html">About</a>
                <a href="contact.html">Contact</a>     
                <a href="AdminLogin.jsp">Admin Login</a>

            </div>
        </div>
        <br><br><br>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card mt-3">
                        <div class="card-header ">
                            <h3>Admin Login</h3>
                        </div>

                        <div class="card-body">
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Username</label>
                                    <input name="uname" type="text" class="form-control" id="uname" aria-describedby="emailHelp">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="password" type="password" class="form-control" id="exampleInputPassword1">
                                </div>

                                <div class="container text-center">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                    <button type="reset" class="btn btn-primary">Reset</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
