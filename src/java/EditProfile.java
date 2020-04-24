import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import p1.*;

public class EditProfile extends HttpServlet
{
    public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        res.setContentType("text/html");
        try
        {
            HttpSession hs=req.getSession(false);
        String fname=req.getParameter("txtfname").trim();
        String lname=req.getParameter("txtlname").trim();
        String mobile=req.getParameter("txtmobile").trim();
        String question=req.getParameter("txtsecretquestion").trim();
        String answer=req.getParameter("txtanswer").trim();
       
        Connection con=DB_Connection.get_DBConnection();
                       
            
        PreparedStatement pst=con.prepareStatement("update users set fname=?, lname=? ,mobile=?, secret_question=?, answer=? where emailid=?");
        pst.setString(1,fname);
        pst.setString(2,lname);
        pst.setString(3,mobile);
        pst.setString(4,question);
        pst.setString(5,answer);
        pst.setString(6,(String)hs.getAttribute("A1"));
        pst.executeUpdate();
        pst.close();


        req.setAttribute("msg", "$('#modal-msg').modal('show');");
      

        RequestDispatcher rd=req.getRequestDispatcher("editprofile.jsp");
        rd.forward(req, res);
           
        }
        catch(Exception e)
        {
            pw.println(e);
        }
   }
}