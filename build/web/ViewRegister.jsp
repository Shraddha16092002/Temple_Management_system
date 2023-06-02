<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0
    response.setHeader("Expires", "0");//Proxies
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("AdminLogin.jsp");
    }

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
    Statement statement2 = null;
    ResultSet resultSet = null;
%>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Darshan Registration Details</title>
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    </head>

    <body id="page-top">
        <!-- Page Wrapper -->
        <div id="wrapper">
            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">
                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <!-- Sidebar Toggle (Topbar) -->
                        <form class="form-inline">
                            <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                                <i class="fa fa-bars"></i>
                            </button>
                        </form>

                        <!-- Topbar Search -->
                        <form
                            class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                            <div class="input-group">
                                <button type="button" class="btn btn-warning"><a href="Admin.jsp" style="text-decoration:none; color:black">Back</a></button>
                            </div>
                        </form>
                        <!--<input type="date" id="rdate" name="rdate" style="width:15%; height: 60%">-->

                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">
                            <!--<div class="topbar-divider d-none d-sm-block"></div>-->

                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <div class="nav-link dropdown-toggle" id="userDropdown"
                                     data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">ADMIN</span>
                                    <img class="img-profile rounded-circle"
                                         src="img/undraw_profile.svg">
                                </div>
                            </li>

                        </ul>

                    </nav>
                    <!-- End of Topbar -->


                    <!-- Begin Page Content -->
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <div class="card-header py-3">
                            <h2 class="m-0 font-weight-bold text-primary">Registration Details</h2>
                        </div>
                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" width="100%" cellspacing="0">
                                        <thead class="m-0 font-weight-bold text-primary">
                                            <tr>
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>Phone1</th>
                                                <th>Phone2</th>
                                                <th>Email</th>
                                                <th>City</th>
                                                <th>State</th>
                                                <th>Visit Date</th>
                                                <th>No. of Members</th>
                                                <th>Total Payment</th>
                                                <th>Transaction ID</th>
                                            </tr>
                                        </thead>

                                        <%
                                            try {
                                                connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                                                statement = connection.createStatement();
                                                statement2 = connection.createStatement();
                //                                String sql ="SELECT * FROM Devotees1,Devotees2,Darshan where Devotees1.SRNO = Devotees2.SRNO and Devotees1.SRNO = Darshan.SRNO";

                                                String sql = "SELECT * FROM Devotees1,Darshan where Devotees1.SRNO = Darshan.SRNO";
                                                resultSet = statement.executeQuery(sql);
                                                while (resultSet.next()) {
                                        %>                     
                                        <tbody>
                                            <tr>
                                                <td><%=resultSet.getString("Aadhar")%></td>
                                                <td><%=resultSet.getString("Name")%></td>
                                                <%
                                                    int sr = resultSet.getInt("srno");
                                                    String sql1 = "SELECT * FROM Devotees1,Devotees2 where Devotees1.SRNO = Devotees2.SRNO and Devotees2.srno=" + sr + "";
                                                    ResultSet resultSet2 = statement2.executeQuery(sql1);
                                                    int n = 0;
                                                    while (resultSet2.next()) {
                                                %>
                                                <td><%=resultSet2.getString("Phone")%></td>
                                                <%
                                                        n = resultSet2.getRow();
                                                    }
                                                    if (n == 1) {
                                                        out.println("<td>---</td>");
                                                    }
                                                %>                   
                                                <td><%=resultSet.getString("Email")%></td>
                                                <td><%=resultSet.getString("City")%></td>
                                                <td><%=resultSet.getString("State")%></td>
                                                <td><%=resultSet.getString("Date_of_Visit")%></td>
                                                <td><%=resultSet.getString("No_Members")%></td>
                                                <td><%=resultSet.getString("Payment")%></td>
                                                <td><%=resultSet.getString("Transaction_Id")%></td>
                                            </tr>
                                            <%
                                                    }
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>        
                                        </tbody>
                                        <tfoot>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Phone1</th>
                                        <th>Phone2</th>
                                        <th>Email</th>
                                        <th>City</th>
                                        <th>State</th>
                                        <th>Visit Date</th>
                                        <th>No. of Members</th>
                                        <th>Total Payment</th>
                                        <th>Transaction ID</th>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                        </div>
                    </div>
                </footer>

            </div>
        </div>

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="js/demo/datatables-demo.js"></script>

    </body>

</html>

