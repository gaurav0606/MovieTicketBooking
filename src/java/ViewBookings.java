import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import p1.*;


public class ViewBookings    extends HttpServlet
{
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        res.setContentType("text/html");
        HttpSession hs=req.getSession(false);
        PreparedStatement pst2;
        try
        {
         
       
            Connection con=DB_Connection.get_DBConnection();
            
            if(hs.getAttribute("A1").toString().equalsIgnoreCase("admin@movie.com")==false)
            {
                pst2=con.prepareStatement("select * from bookings where emailid=?");
                pst2.setString(1, hs.getAttribute("A1").toString());
            }
            else
            {
              pst2=con.prepareStatement("select * from bookings");
               
            }
       
                       
            ResultSet rs1=pst2.executeQuery();
            
            String t="";
            if(rs1.next())
            {
                
                do
                {
               
                               
                t=t+"<tr class='info'>";
                t=t+"<td>"+rs1.getString(1);
                t=t+"<td>"+rs1.getString(2);
                t=t+"<td>"+rs1.getString(3);
                t=t+"<td>"+rs1.getString(4);
                t=t+"<td>"+rs1.getString(5);
                t=t+"<td>"+rs1.getString(6);
                t=t+"<td>"+rs1.getString(7);
                t=t+"<td>"+rs1.getString(8);
                t=t+"<td>"+rs1.getString(9);
                t=t+"<td>"+rs1.getString(10);
                t=t+"<td>"+rs1.getString(11);
               
                
                t=t+"</tr>";
                
               
               
                }
                while(rs1.next());
                 pw.println(t);
            }
            else
            {
                
           pw.println("<p style='font-weight:bolder;color:red;font-size:20px'><i style='font-weight:bolder;color:red;font-size:25px' class='fa fa-frown-o'></i> Oopsss....No Bookings to Display </style> ");

            }
                

        
       
       
      
        
       }    
         
        catch(Exception e)
        {
            pw.println(e);
        }

              
        
    }
}