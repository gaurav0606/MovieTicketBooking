import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;
import p1.*;

public class GetScreenNo extends HttpServlet
{
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
       
        try
        {
           
        int sno;
        Connection con=DB_Connection.get_DBConnection();
        Calendar cl=Calendar.getInstance();
       
        PreparedStatement pst=con.prepareStatement("select max(sno) from screen");
        ResultSet rs=pst.executeQuery();
        rs.next();
        String v=rs.getString(1);
        if(v!=null)
        {
               
                        int v1=Integer.parseInt(v);
                        v1=v1+1;
                        sno=v1;
               
        }
        else
        {

                sno=1;
        }
        pst.close();
        pw.println(sno);
        }
        catch(Exception e)
        {
            pw.println(e);
        }
    }
        
}