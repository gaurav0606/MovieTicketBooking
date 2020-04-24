import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;
import java.sql.*;
import p1.*;


public class AddScreen extends HttpServlet
{
    public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
         PrintWriter pw=res.getWriter();
        try
        {
       
        int sno=Integer.parseInt(req.getParameter("txtsno").trim());
        int sofa=Integer.parseInt(req.getParameter("txtnosofa").trim());
        int premium=Integer.parseInt(req.getParameter("txtnopremium").trim());
        int exec=Integer.parseInt(req.getParameter("txtnoexec").trim());
       
        Connection con=DB_Connection.get_DBConnection();
        PreparedStatement pst1=con.prepareStatement("insert into screen values(?,?,?,?)");
        pst1.setInt(1, sno);
        pst1.setInt(2, sofa);
        pst1.setInt(3, premium);
        pst1.setInt(4, exec);
       
       
        pst1.executeUpdate();
        req.setAttribute("msg", "$('#modal-msg').modal('show');");
        RequestDispatcher rd=req.getRequestDispatcher("addscreen.jsp");
        rd.forward(req, res);
        }
        catch(Exception e)
        {
            pw.println(e);
        }
    }
        
}