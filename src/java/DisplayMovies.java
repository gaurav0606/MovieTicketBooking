import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

import java.text.*;
import p1.*;


public class DisplayMovies extends HttpServlet
{
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        res.setContentType("text/html");
        HttpSession hs=req.getSession(true);
    
        try
        {
         
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date date = new java.util.Date();
            String today=dateFormat.format(date);

            Connection con=DB_Connection.get_DBConnection();
            ResultSet rs1=null;
            
           
            
            PreparedStatement pst2=con.prepareStatement("select * from movies where mcode in (select mcode from movie_screen where start_date in(select max(start_date) from movie_screen where start_date<=? group by sno))");
            pst2.setString(1,today);
            rs1=pst2.executeQuery();
           String t="";
            if(rs1.next())
            {
                
                do
                {                  

                t=t+"<div class='col-md-3'  > <div class='panel panel-danger'>  <div class='panel-body'>";
                t=t+"<img src='GetMovieImage?mcode="+rs1.getString("mcode")+"'style='width:100%;height:200px' alt='Offer 1' class='img-responsive'></div>";
                t=t+"<div class='panel-footer' style='font-weight:bold;font-size:18px'>"+rs1.getString("mname");                
                t=t+"<p style='font-weight:lighter;font-size:16px;textTransform:capitalize'>"+rs1.getString("language");
                t=t+"<br/><br/><a class='btn btn-danger' href='selectmovie.jsp?mcode="+rs1.getString("mcode")+"'  style=';cursor: pointer;width:100%;'> Book Now</a>";
                t=t+"</div></div></div>";
               
                
               
                }
                while(rs1.next());
                 pw.println(t);
            }
            else
            {
                
           pw.println("<p style='font-weight:bolder;color:red;font-size:20px'><i style='font-weight:bolder;color:red;font-size:25px' class='fa fa-frown-o'></i> Oopsss....No Movies to Display </style> ");

            }
                

        
       
       
      
        
       }    
         
        catch(Exception e)
        {
            pw.println(e);
        }

              
        
    }
}