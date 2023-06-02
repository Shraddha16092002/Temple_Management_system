<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%

    String driverName = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String dbName = "temple";
    String userId = "root";
    String password = "";

    try {
        Class.forName(driverName);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style2.css">
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
        <title>Admin Dashboard</title> 
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");//Proxies
            if (session.getAttribute("admin") == null) {
                response.sendRedirect("AdminLogin.jsp");
            }
        %>
        <nav>
            <div class="logo-name">
                <div class="logo-image">
                    <img src="images/logo.png" alt="">
                </div>

                <span class="logo_name">Welcome Admin!</span>
            </div>

            <div class="menu-items">
                <ul class="nav-links">
                    <li><a href="Admin.jsp">
                            <i class="uil uil-estate"></i>
                            <span class="link-name">Dashboard</span>
                        </a></li>
                    <li><a href="ViewRegister.jsp">
                            <i class="bi-table"></i>
                            <span class="link-name">View Registrations</span>
                        </a></li>
                    <li><a href="ViewDonations.jsp">
                            <i class="bi-table"></i>
                            <span class="link-name">View Donations</span>
                        </a></li>
                </ul>

                <ul class="logout-mode">
                    <li><a href="AdminLogout">
                            <i class="uil uil-signout"></i>
                            <span class="link-name">Logout</span>
                        </a></li>

                    <li class="mode">
                        <a href="#">
                            <i class="uil uil-moon"></i>
                            <span class="link-name">Dark Mode</span>
                        </a>

                        <div class="mode-toggle">
                            <span class="switch"></span>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>

        <section class="dashboard">    
            <div class="top">
                <i class="uil uil-bars sidebar-toggle"></i>           
                <img src="images/profile.jpg" alt="">
            </div>

            <div class="dash-content">
                <div class="overview">
                    <div class="title">
                        <!--<i class="bi bi-speedometer2"></i>-->
                        <i class="uil uil-tachometer-fast-alt"></i>
                        <span class="text">Dashboard</span>
                    </div>
                    <%
                        Date dNow = new Date();
                        SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
                        String cdate = ft.format(dNow);
                        try {
                            connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                            statement = connection.createStatement();
                            String query1 = "select count(devotees1.srno) from devotees1,darshan where darshan.date_of_visit='" + cdate + "' and devotees1.srno = darshan.srno";
                            int tr, tra, tc, tca;
                            statement = connection.createStatement();
                            ResultSet rs1 = statement.executeQuery(query1);
                            if (rs1.next()) {
                                tr = rs1.getInt(1);
                    %>

                    <div class="boxes">
                        <div class="box box1">
                            <i class="uil uil-chart"></i>
                            <span class="text">Total Registrations Made(Current Date)</span>
                            <span class="number"><%= tr%></span>
                        </div>
                        <%
                            }
                            String query2 = "select count(devotees1.srno) from devotees1,charity where charity.date_of_donation='" + cdate + "' and devotees1.srno = charity.srno";
                            statement = connection.createStatement();
                            ResultSet rs2 = statement.executeQuery(query2);
                            if (rs2.next()) {
                                tc = rs2.getInt(1);
                        %>
                        <div class="box box2">
                            <i class="uil uil-chart"></i>
                            <span class="text">Total Donations Made(Current Date)</span>
                            <span class="number"><%= tc%></span>
                        </div>
                    </div>
                    <br><br><br>
                    <%
                        }
                        String query3 = "select sum(payment) from darshan";
                        statement = connection.createStatement();
                        ResultSet rs3 = statement.executeQuery(query3);
                        if (rs3.next()) {
                            tra = rs3.getInt(1);
                    %>
                    <div class="boxes">
                        <div class="box box1">
                            <i class="uil uil-chart"></i>
                            <span class="text">Total Registration Fund</span>
                            <span class="number"><%= tra%></span>
                        </div>
                        <%
                            }
                            //                    String query4 = "select sum(amount) from charity where date_of_donation='"+cdate+"'";
                            String query4 = "select sum(amount) from charity";
                            statement = connection.createStatement();
                            ResultSet rs4 = statement.executeQuery(query4);
                            if (rs4.next()) {
                                tca = rs4.getInt(1);
                        %>
                        <div class="box box2">
                            <i class="uil uil-chart"></i>
                            <span class="text">Total Donation Fund</span>
                            <span class="number"><%= tca%></span>
                        </div>
                    </div>
                </div>
            </div>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>  
        </section>
        <script src="script.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    </body>
</html>
