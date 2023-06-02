import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            HttpSession session=request.getSession();
            response.setContentType("text/html");
            PrintWriter out=response.getWriter();
            String Username=request.getParameter("uname");
            String Password=request.getParameter("password");
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
                try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/temple","root","")) {
                    Statement stm =con.createStatement();
                    ResultSet rs = stm.executeQuery("select * from admin where Username='"+Username+"' and Password ='"+Password+"'");
                    if(rs.next()){
                        response.sendRedirect("Admin.jsp");
                        session.setAttribute("admin",Username); 
                    }
                    else{
                        out.println("Wrong Username and Password. Try Again :)");
                    }
                }
            }catch(IOException | ClassNotFoundException | SQLException e){
                System.out.println(e.getMessage());
            }
            
    }

    
   
}
