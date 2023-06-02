<%@ page import="java.sql.*" %>
<%

    String pname = request.getParameter("pname");
    String email = request.getParameter("email");
    String city = request.getParameter("city");
    String state = request.getParameter("state");
    String adhar = request.getParameter("adhar");
    String phone1 = request.getParameter("phone1");
    String phone2 = request.getParameter("phone2");
    String visit = request.getParameter("visit");
    String members = request.getParameter("members");
    String transid = request.getParameter("transid");

    String numval;
    int val = Integer.parseInt(members);
    val = val * 100;
    String reval = Integer.toString(val);
    String query1 = "insert into devotees1(aadhar,name,email,city,state) values(?,?,?,?,?)";
    String query2 = "insert into darshan(date_of_visit,no_members,payment,transaction_id,srno) values(?,?,?,?,?)";
    String query3 = "insert into devotees2(srno,phone) values(?,?)";
    String query4 = "insert into devotees2(srno,phone) values(?,?)";

    String num1 = "";
//String query2="insert into devotees2 values(?,?)";

    try {

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/temple", "root", "");
        PreparedStatement ps = con.prepareStatement(query1, Statement.RETURN_GENERATED_KEYS);
        ps.setString(1, adhar);
        ps.setString(2, pname);
        ps.setString(3, email);
        ps.setString(4, city);
        ps.setString(5, state);
        int i = ps.executeUpdate();

        ResultSet rs = ps.getGeneratedKeys();
        while (rs.next()) {
            num1 = rs.getString(1);
//    numval=rs.getInt(1);
        };

        PreparedStatement ps2 = con.prepareStatement(query2);
        ps2.setString(1, visit);
        ps2.setString(2, members);
        ps2.setString(3, reval);
        ps2.setString(4, transid);
        ps2.setString(5, num1);
        int j = ps2.executeUpdate();

//PreparedStatement ps2=con.prepareStatement(query2);
//ps2.setInt(1,num);
//ps2.setString(2,phone1);
//int j=ps.executeUpdate();
        if (phone2.equals("")) {
            PreparedStatement ps3 = con.prepareStatement(query3);
            ps3.setString(1, num1);
            ps3.setString(2, phone1);
            int k = ps3.executeUpdate();
        } else {

            PreparedStatement ps3 = con.prepareStatement(query3);
            ps3.setString(1, num1);
            ps3.setString(2, phone1);
            PreparedStatement ps4 = con.prepareStatement(query4);
            ps4.setString(1, num1);
            ps4.setString(2, phone2);
            int k = ps3.executeUpdate();
            int k2 = ps4.executeUpdate();
        }

    } catch (Exception e) {
        out.print(e);
    }

    session.setAttribute("name", pname);
    session.setAttribute("mem", members);
    session.setAttribute("date", visit);
    session.setAttribute("val", val);
    session.setAttribute("trans", transid);
%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>Registration Successful Message Example</title>
        <meta name="author" content="Codeconvey" />
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/demo.css" />

    </head>
    <body>
        <section>
            <div class="rt-container">
                <div class="col-rt-12">
                    <div class="Scriptcontent">

                        <!-- partial:index.partial.html -->
                        <div id='card' class="animated fadeIn">
                            <div id='upper-side'>
                                <?xml version="1.0" encoding="utf-8"?>
                                <!-- Generator: Adobe Illustrator 17.1.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
                                <!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
                                <svg version="1.1" id="checkmark" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" xml:space="preserve">
                                <path d="M131.583,92.152l-0.026-0.041c-0.713-1.118-2.197-1.447-3.316-0.734l-31.782,20.257l-4.74-12.65
                                      c-0.483-1.29-1.882-1.958-3.124-1.493l-0.045,0.017c-1.242,0.465-1.857,1.888-1.374,3.178l5.763,15.382
                                      c0.131,0.351,0.334,0.65,0.579,0.898c0.028,0.029,0.06,0.052,0.089,0.08c0.08,0.073,0.159,0.147,0.246,0.209
                                      c0.071,0.051,0.147,0.091,0.222,0.133c0.058,0.033,0.115,0.069,0.175,0.097c0.081,0.037,0.165,0.063,0.249,0.091
                                      c0.065,0.022,0.128,0.047,0.195,0.063c0.079,0.019,0.159,0.026,0.239,0.037c0.074,0.01,0.147,0.024,0.221,0.027
                                      c0.097,0.004,0.194-0.006,0.292-0.014c0.055-0.005,0.109-0.003,0.163-0.012c0.323-0.048,0.641-0.16,0.933-0.346l34.305-21.865
                                      C131.967,94.755,132.296,93.271,131.583,92.152z" />
                                <circle fill="none" stroke="#ffffff" stroke-width="5" stroke-miterlimit="10" cx="109.486" cy="104.353" r="32.53" />
                                </svg>
                                <h3 id='status'>
                                    Success
                                </h3>
                            </div>
                            <div id='lower-side'>
                                <p id='message'>
                                    Congratulations, your darshan has been booked successfully!
                                </p>
                                <a href="DarshanReceipt.jsp" id="contBtn">Download Receipt</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>