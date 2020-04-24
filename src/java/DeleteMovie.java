import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;
import java.sql.*;
import p1.*;


public class DeleteMovie extends HttpServlet
{
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        String pid=req.getParameter("mcode");
        try
        {
       
            Connection con=DB_Connection.get_DBConnection();


            PreparedStatement pst=con.prepareStatement("delete from movies where mcode=?");
            pst.setString(1, pid);
            pst.executeUpdate();
            pst.close();
      
            RequestDispatcher rd=req.getRequestDispatcher("ViewMovies");
            rd.forward(req,res);
         
           
        }
        catch(Exception e)
        {
            pw.println(e);
        }
    }
        
}